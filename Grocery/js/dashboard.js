function renderDashboard() {
    const user = getCurrentUser();
    const plans = (getData('mealPlans') || []).filter(plan => plan.userId === user.id);
    const plan = plans[plans.length - 1];
    const groceries = (getData('groceryItems') || []).filter(item => item.userId === user.id);
    const requests = (getData('specialMealRequests') || []).filter(item => item.userId === user.id);

    document.querySelector('[data-welcome]').textContent = `Welcome back, ${user.name.split(' ')[0]}!`;
    document.querySelector('#planned-count').textContent = plans.length;
    document.querySelector('#grocery-count').textContent = groceries.length;
    document.querySelector('#request-count').textContent = requests.length;

    // Render Modern Weekly Meal Summary
    renderWeeklySummary(plan);

    document.querySelector('#plan-date').textContent = plan ?
        `Saved for ${plan.week} · ${plan.servings} servings` :
        'No meal plan saved yet';
}

function renderWeeklySummary(currentPlan) {
    const container = document.querySelector('#week-summary-container');
    if (!container) return;

    // Static demo data for design (you can replace this with actual data later)
    const demoMeals = {
        'Monday': { breakfast: 'Poha', lunch: 'Paneer Butter', dinner: 'Palak Paneer' },
        'Tuesday': { breakfast: 'Upma', lunch: 'Dal Tadka', dinner: 'Mixed Veg' },
        'Wednesday': { breakfast: 'Paratha', lunch: 'Rajma Chawal', dinner: 'Chicken Curry' },
        'Thursday': { breakfast: 'Oats', lunch: 'Chole Bhature', dinner: 'Dal Makhani' },
        'Friday': { breakfast: 'Idli Sambar', lunch: 'Veg Biryani', dinner: 'Paneer Tikka' },
        'Saturday': { breakfast: 'Aloo Paratha', lunch: 'Kadhai Paneer', dinner: 'Fish Curry' },
        'Sunday': { breakfast: 'Poori Bhaji', lunch: 'Veg Pulao', dinner: 'Butter Chicken' }
    };

    // Use actual plan data if available, otherwise use demo data
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    const today = new Date();

    let html = '';

    days.forEach((day, index) => {
        const dayDate = new Date(today);
        dayDate.setDate(today.getDate() + index);
        const dateStr = dayDate.toLocaleDateString('en-US', { day: '2-digit', month: 'short' });

        // Get meals from plan or demo data
        const dayMeals = currentPlan?.days?.[day] || demoMeals[day] || {};
        const breakfast = dayMeals.breakfast || 'Not planned';
        const lunch = dayMeals.lunch || 'Not planned';
        const dinner = dayMeals.dinner || 'Not planned';

        // Check if day has meals planned
        const hasMeals = breakfast !== 'Not planned' || lunch !== 'Not planned' || dinner !== 'Not planned';

        html += `
            <div class="week-day-card">
                <div class="day-info">
                    <div class="day-name">${day.substring(0, 3)}</div>
                    <div class="day-date">${dateStr}</div>
                </div>
                
                <div class="meal-slot breakfast">
                    <span class="meal-label">Breakfast</span>
                    <span class="meal-name">${breakfast}</span>
                </div>
                
                <div class="meal-slot lunch">
                    <span class="meal-label">Lunch</span>
                    <span class="meal-name">${lunch}</span>
                </div>
                
                <div class="meal-slot dinner">
                    <span class="meal-label">Dinner</span>
                    <span class="meal-name">${dinner}</span>
                </div>
                
                <div class="check-icon">
                    ${hasMeals ? '<i class="fa-solid fa-check"></i>' : ''}
                </div>
            </div>
        `;
    });

    container.innerHTML = html;
}
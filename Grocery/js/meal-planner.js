const plannerDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
function initMealPlanner() {
    const user = getCurrentUser();
    if (!user) return;
    const plans = getData('mealPlans') || [];
    const previous = plans.filter(plan => plan.userId === user.id).pop();
    if (previous) {
        const ddlPeople = document.getElementById('DropDownList1');
        const txtPeople = document.getElementById('TextBox1');
        if (ddlPeople && previous.servings) {
            ddlPeople.value = previous.servings.toString();
        }
        if (txtPeople && previous.servings) {
            txtPeople.value = previous.servings.toString();
        }
        plannerDays.forEach(day => {
            ['Breakfast', 'Lunch', 'Dinner'].forEach(type => {
                const select = document.getElementById('ddl' + day + type);
                const mealVal = previous.days?.[day]?.[type.toLowerCase()] || previous.days?.[day]?.[type];
                if (select && mealVal) {
                    select.value = mealVal;
                }
            });
        });
    }
}

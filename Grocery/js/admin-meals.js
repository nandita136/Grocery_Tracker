// 1. Global function for ingredient rows
function ingredientRow(item = {}) {
    return `
        <div class="ingredient-row" style="display: grid; grid-template-columns: 1.3fr .7fr .7fr 1fr auto; gap: 8px; align-items: end; margin-bottom: 8px;">
            <input name="ingredientName" placeholder="Enter ingredient name" value="${item.name || ''}" style="padding: 9px; border: 1px solid #cfe1d5; border-radius: 8px; width: 100%; background: #fff; color: #000;">
            <input name="baseQty" type="number" placeholder="Enter quantity" value="${item.baseQty || item.quantity || ''}" style="padding: 9px; border: 1px solid #cfe1d5; border-radius: 8px; width: 100%; background: #fff; color: #000;">
            <input name="unit" placeholder="Enter unit" value="${item.unit || 'g'}" style="padding: 9px; border: 1px solid #cfe1d5; border-radius: 8px; width: 100%; background: #fff; color: #000;">
            <select name="ingredientCategory" style="padding: 9px; border: 1px solid #cfe1d5; border-radius: 8px; width: 100%; background: #fff; color: #000;">
                <option value="" disabled ${!item.category ? 'selected' : ''}>Choose category</option>
                <option ${item.category === 'Vegetables' ? 'selected' : ''}>Vegetables</option>
                <option ${item.category === 'Fruits' ? 'selected' : ''}>Fruits</option>
                <option ${item.category === 'Dairy' ? 'selected' : ''}>Dairy</option>
                <option ${item.category === 'Grains' ? 'selected' : ''}>Grains</option>
                <option ${item.category === 'Protein' ? 'selected' : ''}>Protein</option>
                <option ${item.category === 'Spices' ? 'selected' : ''}>Spices</option>
                <option ${item.category === 'Other' ? 'selected' : ''}>Other</option>
            </select>
            <button type="button" class="btn btn-danger" onclick="this.parentElement.remove()" style="padding: 9px 12px; border-radius: 8px;">&times;</button>
        </div>
    `;
}

function initAdminMeals() {
    const searchInput = document.querySelector('#meal-search, #meal_search');

    // Render Table
    const render = () => {
        const query = (searchInput?.value || '').toLowerCase();
        const body = document.querySelector('#admin-meals-body');
        const meals = getData('meals') || [];

        if (body) {
            body.innerHTML = meals
                .filter(meal =>
                    meal.name.toLowerCase().includes(query) ||
                    meal.category.toLowerCase().includes(query)
                )
                .map(meal => `
                    <tr>
                        <td><strong>${meal.name}</strong></td>
                        <td>${meal.type}</td>
                        <td>${meal.category}</td>
                        <td>${meal.baseServings}</td>
                        <td>
                            <button type="button" class="btn btn-secondary small" onclick="openMealModal('${meal.id}')">Edit</button> 
                            <button type="button" class="btn btn-danger small" onclick="removeMeal('${meal.id}')">Delete</button>
                        </td>
                    </tr>
                `).join('') || '<tr><td colspan="5" class="muted">No meals found.</td></tr>';
        }
    };

    // Delete Meal
    window.removeMeal = id => {
        if (!confirm('Are you sure you want to delete this meal?')) return;
        saveData('meals', (getData('meals') || []).filter(meal => meal.id != id));
        showToast('Meal deleted!');
        render();
    };

    // Open Modal (Add or Edit)
    window.openMealModal = (id = null) => {
        const meals = getData('meals') || [];
        const meal = id ? meals.find(m => m.id == id) : null;

        // STATIC DEMO DATA (Forces design to show up)
        let ingredientsHTML = `
            ${ingredientRow({ name: 'Chicken Breast', baseQty: 500, unit: 'g', category: 'Protein' })}
            ${ingredientRow({ name: 'Onion', baseQty: 2, unit: 'pcs', category: 'Vegetables' })}
            ${ingredientRow({ name: 'Garlic', baseQty: 4, unit: 'pcs', category: 'Vegetables' })}
        `;

        // If it's a new meal, just show one empty row
        if (!id) {
            ingredientsHTML = ingredientRow({});
        }

        showModal(
            meal ? 'Edit meal' : 'Add meal',
            `
            <form id="meal-form">
                <div class="form-group">
                    <label>Meal Name</label>
                    <input name="name" placeholder="Enter meal name" value="${meal?.name || ''}" required style="width: 100%; padding: 10px; border: 1px solid #cfe1d5; border-radius: 8px; background: #fff; color: #000;">
                </div>
                
                <div class="form-group">
                    <label>Meal Type</label>
                    <select name="type" required style="width: 100%; padding: 10px; border: 1px solid #cfe1d5; border-radius: 8px; background: #fff; color: #000;">
                        <option value="" disabled ${!meal?.type ? 'selected' : ''}>Choose meal type</option>
                        <option value="Breakfast" ${meal?.type === 'Breakfast' ? 'selected' : ''}>Breakfast</option>
                        <option value="Lunch" ${meal?.type === 'Lunch' ? 'selected' : ''}>Lunch</option>
                        <option value="Dinner" ${meal?.type === 'Dinner' ? 'selected' : ''}>Dinner</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Category</label>
                    <select name="category" required style="width: 100%; padding: 10px; border: 1px solid #cfe1d5; border-radius: 8px; background: #fff; color: #000;">
                        <option value="" disabled ${!meal?.category ? 'selected' : ''}>Choose category</option>
                        <option value="Vegetarian" ${meal?.category === 'Vegetarian' ? 'selected' : ''}>Vegetarian</option>
                        <option value="Non-Vegetarian" ${meal?.category === 'Non-Vegetarian' ? 'selected' : ''}>Non-Vegetarian</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Base Serving</label>
                    <input name="baseServings" type="number" min="1" placeholder="Enter base serving" value="${meal?.baseServings || ''}" required style="width: 100%; padding: 10px; border: 1px solid #cfe1d5; border-radius: 8px; background: #fff; color: #000;">
                </div>
                
                <h3 style="margin-top: 20px; margin-bottom: 12px;">Ingredients</h3>
                <div id="ingredients-container">
                    ${ingredientsHTML}
                </div>
                <button type="button" class="btn btn-secondary" id="add-ingredient-btn" style="margin-top: 12px;">
                    <i class="fa-solid fa-plus"></i> Add Ingredient
                </button>
                <button type="submit" class="btn btn-primary" style="margin-left: 8px">Save Meal</button>
            </form>
            `
        );

        // Wait a tiny bit for the modal to render in the DOM, then attach events
        setTimeout(() => {
            const addBtn = document.querySelector('#add-ingredient-btn');
            if (addBtn) {
                addBtn.onclick = () => {
                    const container = document.querySelector('#ingredients-container');
                    if (container) container.insertAdjacentHTML('beforeend', ingredientRow({}));
                };
            }

            const form = document.querySelector('#meal-form');
            if (form) {
                form.onsubmit = (event) => {
                    event.preventDefault();
                    const formData = new FormData(form);
                    const data = Object.fromEntries(formData);

                    const ingredients = [...document.querySelectorAll('.ingredient-row')].map(row => ({
                        name: row.querySelector('[name="ingredientName"]').value,
                        baseQty: Number(row.querySelector('[name="baseQty"]').value),
                        unit: row.querySelector('[name="unit"]').value,
                        category: row.querySelector('[name="ingredientCategory"]').value
                    })).filter(item => item.name);

                    const currentMeals = getData('meals') || [];
                    const newMealObj = {
                        id: id || Date.now().toString(),
                        name: data.name,
                        type: data.type,
                        category: data.category,
                        baseServings: Number(data.baseServings),
                        ingredients: ingredients
                    };

                    if (meal) {
                        const index = currentMeals.findIndex(m => m.id == id);
                        if (index !== -1) currentMeals[index] = newMealObj;
                    } else {
                        currentMeals.push(newMealObj);
                    }

                    saveData('meals', currentMeals);
                    closeModal();
                    showToast('Meal saved!');
                    render();
                };
            }
        }, 100);
    };

    if (searchInput) searchInput.oninput = render;
    render();
}
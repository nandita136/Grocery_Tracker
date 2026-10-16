function buildIngredients(mealNames, people) {
    const meals = getData('meals') || [];
    const grouped = {};

    mealNames.filter(Boolean).forEach(mealName => {
        const meal = meals.find(item => item.name === mealName);
        if (!meal) return;

        meal.ingredients.forEach(ingredient => {
            const key = ingredient.name.toLowerCase();
            if (!grouped[key]) grouped[key] = { name: ingredient.name, quantity: 0, unit: ingredient.unit, category: ingredient.category, meals: [] };
            grouped[key].quantity += calculateScaledQuantity(ingredient.baseQty, meal.baseServings, people);
            grouped[key].meals.push(meal.name);
        });
    });

    return Object.values(grouped);
}

function currentSuggestions() {
    const user = getCurrentUser();
    const plan = (getData('mealPlans') || []).find(item => item.userId === user.id);
    const people = plan?.servings || 2;
    const names = plan ? Object.values(plan.days).flatMap(day => Object.values(day)) : [];
    return { items: buildIngredients(names, people), people };
}

function addGroceries(items) {
    const user = getCurrentUser();
    const ownerKey = String(user.email || user.id || user.name || 'unknown').toLowerCase();
    const groceries = getData('groceryItems') || [];

    items.forEach(item => {
        const existing = groceries.find(grocery => (grocery.ownerKey === ownerKey || grocery.userId === user.id) && grocery.itemName.toLowerCase() === item.name.toLowerCase() && grocery.unit === item.unit);
        if (existing) {
            existing.quantity += item.quantity;
            existing.mealNames = [...new Set([...(existing.mealNames || []), ...(item.meals || [])])];
            existing.ownerKey = ownerKey;
        } else {
            groceries.push({ id: generateId(groceries), userId: user.id, ownerKey, itemName: item.name, quantity: item.quantity, unit: item.unit, category: item.category, mealNames: item.meals || [] });
        }
    });

    saveData('groceryItems', groceries);
    showToast('Items added to grocery list!');
}

function initSuggestions() {
    const results = currentSuggestions();
    const countEl = document.querySelector('#suggestion-count');
    if (countEl) countEl.textContent = `${results.items.length} ingredients for ${results.people} people`;

    const searchInput = document.querySelector('#suggestion-search, #suggestion_search');
    const categorySelect = document.querySelector('#suggestion-category, #suggestion_category');
    const manageButton = document.querySelector('#btnManageIngredients');

    const render = () => {
        const search = (searchInput?.value || '').toLowerCase();
        const category = categorySelect?.value || '';
        const visibleItems = results.items.filter(item => (!search || item.name.toLowerCase().includes(search)) && (!category || item.category === category));
        const body = document.querySelector('#suggestion-body');
        if (body) body.innerHTML = visibleItems.map(item => `<tr><td><strong>${item.name}</strong><div class="small muted">${item.meals.join(', ')}</div></td><td>${item.quantity} ${item.unit}</td><td>${item.category}</td></tr>`).join('') || '<tr><td colspan="3" class="muted">No ingredients found. Save a meal plan first.</td></tr>';
    };

    if (searchInput) searchInput.oninput = render;
    if (categorySelect) categorySelect.onchange = render;
    if (manageButton) {
        manageButton.type = 'button';
        manageButton.onclick = event => {
            event.preventDefault();
            addGroceries(results.items);
            window.location.href = new URL('grocery-list.aspx', document.baseURI).href;
        };
    }
    render();
}
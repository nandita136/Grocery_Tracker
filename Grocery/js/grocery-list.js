function initGroceryList() {
    const user = getCurrentUser();
    const ownerKey = String(user.email || user.id || user.name || 'unknown').toLowerCase();
    const ownsItem = item => item.ownerKey ? item.ownerKey === ownerKey : item.userId === user.id;
    const getItems = () => (getData('groceryItems') || []).filter(ownsItem);
    const searchInput = document.querySelector('#grocery-search, #grocery_search');
    const categorySelect = document.querySelector('#grocery-category, #grocery_category');
    const orderBtn = document.querySelector('#order-online, #btnOrderOnline');
    const saveBtn = document.querySelector('#btnSaveGroceryList');

    const render = () => {
        const search = (searchInput?.value || '').toLowerCase();
        const category = categorySelect?.value || '';
        const items = getItems().filter(item => (!search || item.itemName.toLowerCase().includes(search)) && (!category || item.category === category));
        const body = document.querySelector('#grocery-body');
        if (body) body.innerHTML = items.map(item => `<tr><td><strong>${item.itemName}</strong></td><td>${item.quantity} ${item.unit || ''}</td><td>${item.category}</td><td><button type="button" class="btn btn-secondary small" onclick="editGrocery(${item.id})">Edit</button> <button type="button" class="btn btn-danger small" onclick="deleteGrocery(${item.id})">Delete</button></td></tr>`).join('') || '<tr><td colspan="4" class="muted">Your grocery list is empty.</td></tr>';
    };

    window.editGrocery = id => {
        const item = (getData('groceryItems') || []).find(entry => entry.id === id && ownsItem(entry));
        if (item) showGroceryModal(item);
    };

    window.deleteGrocery = id => {
        if (!confirm('Are you sure you want to delete this item?')) return;
        saveData('groceryItems', (getData('groceryItems') || []).filter(item => item.id !== id || !ownsItem(item)));
        showToast('Item deleted!');
        render();
    };

    window.showGroceryModal = (item = null) => {
        showModal(item ? 'Edit grocery item' : 'Add grocery item', `<form id="grocery-form"><div class="form-group"><label>Item Name</label><input name="itemName" value="${item?.itemName || ''}" required></div><div class="form-group"><label>Quantity</label><input name="quantity" type="number" min="0" value="${item?.quantity || 1}" required></div><div class="form-group"><label>Unit</label><input name="unit" value="${item?.unit || 'g'}" required></div><div class="form-group"><label>Category</label><select name="category"><option>Vegetables</option><option>Fruits</option><option>Dairy</option><option>Grains</option><option>Protein</option><option>Spices</option><option>Other</option></select></div><button class="btn btn-primary">Save</button></form>`);
        document.querySelector('#grocery-form').addEventListener('submit', event => {
            event.preventDefault();
            const data = Object.fromEntries(new FormData(event.target));
            const all = getData('groceryItems') || [];
            if (item) Object.assign(all.find(entry => entry.id === item.id && ownsItem(entry)), { ...data, quantity: Number(data.quantity) });
            else all.push({ id: generateId(all), userId: user.id, ownerKey, ...data, quantity: Number(data.quantity), mealNames: [] });
            saveData('groceryItems', all);
            closeModal();
            showToast(item ? 'Item updated!' : 'Item added!');
            render();
        });
    };

    if (searchInput) searchInput.oninput = render;
    if (categorySelect) categorySelect.onchange = render;
    if (saveBtn) saveBtn.onclick = () => {
        const savedLists = getData('savedGroceryLists') || [];
        const existingIndex = savedLists.findIndex(list => list.ownerKey === ownerKey);
        const savedList = {
            id: existingIndex >= 0 ? savedLists[existingIndex].id : generateId(savedLists),
            userId: user.id,
            userName: user.name,
            email: user.email,
            ownerKey,
            savedAt: new Date().toISOString(),
            items: getItems(),
            meals: [...new Set(getItems().flatMap(grocery => grocery.mealNames || []))]
        };
        if (existingIndex >= 0) savedLists[existingIndex] = savedList;
        else savedLists.push(savedList);
        saveData('savedGroceryLists', savedLists);
        showToast('Grocery list saved!');
    };
    if (orderBtn) orderBtn.onclick = () => { location.href = 'https://blinkit.com/'; };
    render();
}
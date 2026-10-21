function initAdminGrocery() {
    // STATIC DATA FOR DESIGN PURPOSES
    const staticGroceryData = [
        {
            userName: "Priyesha Chauhan",
            items: [
                { name: "Paneer", category: "Dairy", quantity: 500, unit: "g", date: "Aug 4" },
                { name: "Basmati Rice", category: "Grains", quantity: 2, unit: "kg", date: "Aug 3" },
                { name: "Butter", category: "Dairy", quantity: 100, unit: "g", date: "Aug 1" }
            ]
        },
        {
            userName: "Rahul Verma",
            items: [
                { name: "Tomatoes", category: "Vegetables", quantity: 1, unit: "kg", date: "Aug 4" },
                { name: "Fresh Cream", category: "Dairy", quantity: 200, unit: "ml", date: "Aug 2" },
                { name: "Onions", category: "Vegetables", quantity: 1, unit: "kg", date: "Jul 31" }
            ]
        }
    ];

    const render = () => {
        const query = document.querySelector('#admin-grocery-search').value.toLowerCase();

        let html = '';

        staticGroceryData.forEach(group => {
            // Filter items based on search (Item Name, Category, or User Name)
            const matchingItems = group.items.filter(item => {
                const nameMatch = (item.name || '').toLowerCase().includes(query);
                const catMatch = (item.category || '').toLowerCase().includes(query);
                const userMatch = group.userName.toLowerCase().includes(query);
                return nameMatch || catMatch || userMatch;
            });

            // Only render user group if they have matching items OR if search is empty
            if (matchingItems.length > 0 || query === '') {
                const initials = group.userName.split(' ').map(n => n[0]).join('').substring(0, 2).toUpperCase();

                html += `
                <div class="user-grocery-group">
                    <!-- User Header -->
                    <div class="user-header">
                        <div class="user-avatar">${initials}</div>
                        <div class="user-info">
                            <strong>${group.userName}</strong>
                            <span class="item-count">${matchingItems.length} items</span>
                        </div>
                    </div>

                    <!-- Items List -->
                    <div class="items-list">
                        ${matchingItems.map((item, index) => `
                            <div class="grocery-item-row">
                                <div class="item-index">${index + 1}</div>
                                <div class="item-icon"><i class="fa-solid fa-leaf"></i></div>
                                <div class="item-details">
                                    <div class="item-name">${item.name}</div>
                                    <div class="item-meta">
                                        <span class="category-badge ${getCategoryClass(item.category)}">${item.category}</span>
                                        <span class="item-date">· ${item.date}</span>
                                    </div>
                                </div>
                                <div class="item-quantity">${item.quantity} ${item.unit}</div>
                            </div>
                        `).join('')}
                    </div>
                </div>`;
            }
        });

        const container = document.querySelector('#admin-grocery-body');
        if (container) {
            container.innerHTML = html || '<div class="muted" style="padding: 40px; text-align: center; background: #fff; border-radius: 12px;">No grocery items found.</div>';
        }
    };

    // Helper: Get CSS class for category color
    function getCategoryClass(cat) {
        if (!cat) return '';
        const c = cat.toLowerCase();
        if (c.includes('dairy')) return 'cat-dairy';
        if (c.includes('grain')) return 'cat-grain';
        if (c.includes('veg')) return 'cat-veg';
        if (c.includes('fruit')) return 'cat-fruit';
        return '';
    }

    const searchInput = document.querySelector('#admin-grocery-search');
    if (searchInput) searchInput.oninput = render;
    render();
}
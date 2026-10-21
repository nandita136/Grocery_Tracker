function adminCounts() {
    const users = getData('users') || [];
    const meals = getData('meals') || [];
    const groceries = getData('groceryItems') || [];
    const requests = getData('specialMealRequests') || [];

    // Count pending requests
    const pendingCount = requests.filter(item => item.status === 'Pending').length;

    // Update KPI cards with IDs
    const usersEl = document.getElementById('total-users');
    const mealsEl = document.getElementById('total-meals');
    const groceryEl = document.getElementById('total-grocery');
    const pendingEl = document.getElementById('pending-requests');

    if (usersEl) usersEl.textContent = users.length;
    if (mealsEl) mealsEl.textContent = meals.length;
    if (groceryEl) groceryEl.textContent = groceries.length;
    if (pendingEl) pendingEl.textContent = pendingCount;

    // Recent Requests Table
    const requestsBody = document.getElementById('recent-requests');
    if (requestsBody) {
        const recentRequests = requests.slice(-5).reverse();
        requestsBody.innerHTML = recentRequests.map(item => `
            <tr>
                <td>${item.userName || 'User'}</td>
                <td>${item.occasion}</td>
                <td>${createStatusBadge(item.status)}</td>
            </tr>
        `).join('') || '<tr><td colspan="3" class="muted">No requests yet.</td></tr>';
    }

    // Recent Users Table
    const usersBody = document.getElementById('recent-users');
    if (usersBody) {
        const recentUsers = users.slice(-5).reverse();
        usersBody.innerHTML = recentUsers.map(item => `
            <tr>
                <td>${item.name}</td>
                <td>${item.email}</td>
                <td>${formatDate(item.createdAt || new Date())}</td>
            </tr>
        `).join('') || '<tr><td colspan="3" class="muted">No users yet.</td></tr>';
    }
}
function renderAdminUsers() {
    const searchInput = document.querySelector('#user-search, #user_search');

    const render = () => {
        const query = (searchInput?.value || '').toLowerCase();
        const body = document.querySelector('#users-body');

        if (body) {
            const users = getData('users') || [];
            const filteredUsers = users.filter(user =>
                user.name.toLowerCase().includes(query) ||
                user.email.toLowerCase().includes(query)
            );

            body.innerHTML = filteredUsers.map(user => {
                // Static total plans for design (you can make this dynamic later)
                const totalPlans = Math.floor(Math.random() * 10) + 1; // Random 1-10 for demo

                return `
                    <tr>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.role || 'user'}</td>
                        <td><strong style="color: var(--green); font-weight: 800;">${totalPlans}</strong></td>
                        <td>${formatDate(user.createdAt || new Date())}</td>
                    </tr>
                `;
            }).join('') || '<tr><td colspan="5" class="muted">No users found.</td></tr>';
        }
    };

    if (searchInput) {
        searchInput.oninput = render;
    }

    render();
}

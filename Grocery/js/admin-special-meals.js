function escapeAdminRequestText(value) {
    return String(value ?? '').replace(/[&<>"']/g, character => ({
        '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;'
    }[character]));
}

function initAdminRequests() {
    const render = () => {
        const filter = document.querySelector('#request-filter').value;
        const requests = getData('specialMealRequests') || [];
        const container = document.querySelector('#admin-request-cards');

        if (!container) return;

        const filteredRequests = requests.filter(item =>
            ['Pending', 'Accepted', 'Rejected'].includes(item.status) &&
            (!filter || item.status === filter)
        );

        if (filteredRequests.length === 0) {
            container.innerHTML = '<div class="muted" style="grid-column: 1 / -1; text-align: center; padding: 40px; background: #fff; border-radius: 12px; border: 1px solid var(--border);">No requests found.</div>';
            return;
        }

        container.innerHTML = filteredRequests.map(item => {
            const meal = item.requestedMeal || ((item.meals || []).join(', '));
            const statusClass = (item.status || 'Pending').toLowerCase();

            let actionsHtml = '';
            let reasonHtml = '';

            if (item.status === 'Pending') {
                actionsHtml = `
                    <div class="admin-card-actions">
                        <button class="btn btn-secondary" onclick="updateRequest('${item.id}', 'Accepted')">
                            <i class="fa-solid fa-check"></i> Accept
                        </button>
                        <button class="btn btn-danger" onclick="rejectRequest('${item.id}')">
                            <i class="fa-solid fa-xmark"></i> Reject
                        </button>
                    </div>
                `;
            } else if (item.status === 'Rejected' && item.rejectionReason) {
                reasonHtml = `
                    <div class="admin-rejection-reason">
                        <strong>Reason:</strong> ${escapeAdminRequestText(item.rejectionReason)}
                    </div>
                `;
            }

            return `
                <div class="admin-request-card">
                    <div class="admin-card-header">
                        <h3>${escapeAdminRequestText(item.userName || 'Unknown User')}</h3>
                        <span class="admin-status-badge ${statusClass}">${escapeAdminRequestText(item.status)}</span>
                    </div>
                    <div class="admin-card-details">
                        <div class="admin-detail-row">
                            <i class="fa-solid fa-calendar-days"></i>
                            <strong>Occasion:</strong>
                            <span>${escapeAdminRequestText(item.occasion)}</span>
                        </div>
                        <div class="admin-detail-row">
                            <i class="fa-solid fa-users"></i>
                            <strong>People:</strong>
                            <span>${escapeAdminRequestText(item.people)}</span>
                        </div>
                        <div class="admin-detail-row">
                            <i class="fa-solid fa-utensils"></i>
                            <strong>Meal:</strong>
                            <span>${escapeAdminRequestText(meal)}</span>
                        </div>
                        ${reasonHtml}
                    </div>
                    ${actionsHtml}
                </div>
            `;
        }).join('');
    };

    window.updateRequest = (id, status) => {
        if (status !== 'Accepted') return;
        const requests = getData('specialMealRequests') || [];
        const request = requests.find(item => item.id == id && item.status === 'Pending');
        if (!request) return;
        Object.assign(request, { status, rejectionReason: '' });
        saveData('specialMealRequests', requests);
        showToast('Request accepted!');
        render();
    };

    window.rejectRequest = id => {
        const requests = getData('specialMealRequests') || [];
        const pending = requests.some(item => item.id == id && item.status === 'Pending');
        if (!pending) return;

        showModal('Reason for rejection', `
            <form id="reject-form">
                <div class="form-group">
                    <label>Reason</label>
                    <textarea name="reason" required style="width: 100%; padding: 10px; border: 1px solid #cfe1d5; border-radius: 8px; min-height: 80px;"></textarea>
                </div>
                <button class="btn btn-danger" style="width: 100%; margin-top: 12px;">Reject Request</button>
            </form>
        `);

        document.querySelector('#reject-form').onsubmit = event => {
            event.preventDefault();
            const reqs = getData('specialMealRequests') || [];
            const req = reqs.find(item => item.id == id && item.status === 'Pending');
            if (!req) return;
            Object.assign(req, {
                status: 'Rejected',
                rejectionReason: new FormData(event.target).get('reason')
            });
            saveData('specialMealRequests', reqs);
            closeModal();
            showToast('Request rejected!', 'warning');
            render();
        };
    };

    document.querySelector('#request-filter').onchange = render;
    render();
}
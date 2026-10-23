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
                // FIXED: Added type="button" and event parameter to prevent accidental form submission
                actionsHtml = `
                    <div class="admin-card-actions">
                        <button type="button" class="btn btn-secondary" onclick="updateRequest('${item.id}', 'Accepted', event); return false;">
                            <i class="fa-solid fa-check"></i> Accept
                        </button>
                        <button type="button" class="btn btn-danger" onclick="rejectRequest('${item.id}', event); return false;">
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

    // FIXED: Added event parameter and preventDefault
    window.updateRequest = (id, status, event) => {
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }

        if (status !== 'Accepted') return;
        const requests = getData('specialMealRequests') || [];
        const request = requests.find(item => item.id == id && item.status === 'Pending');
        if (!request) return;

        Object.assign(request, { status, rejectionReason: '' });
        saveData('specialMealRequests', requests);
        showToast('Request accepted!');
        render();
    };

    // FIXED: Complete rewrite to prevent instant closing and ensure proper modal handling
    window.rejectRequest = (id, event) => {
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }

        const requests = getData('specialMealRequests') || [];
        const pending = requests.some(item => item.id == id && item.status === 'Pending');
        if (!pending) {
            showToast('Request is not pending!', 'warning');
            return;
        }

        // Show modal with a unique form ID based on the request ID
        showModal('Reason for rejection', `
            <form id="reject-form-${id}">
                <div class="form-group">
                    <label>Please provide a reason for rejection:</label>
                    <textarea name="reason" required placeholder="e.g., The requested menu is unavailable for this date." 
                        style="width: 100%; padding: 12px; border: 2px solid var(--border); border-radius: 10px; min-height: 100px; font-family: inherit; font-size: 0.95rem; outline: none;"></textarea>
                </div>
                <div style="display: flex; gap: 12px; margin-top: 16px;">
                    <button type="button" class="btn btn-secondary" onclick="closeModal()" style="flex: 1;">Cancel</button>
                    <button type="submit" class="btn btn-danger" style="flex: 1;">Reject Request</button>
                </div>
            </form>
        `);

        // Wait a tiny bit for the modal to render in the DOM, then attach the submit handler
        setTimeout(() => {
            const form = document.querySelector(`#reject-form-${id}`);
            if (form) {
                form.onsubmit = (submitEvent) => {
                    submitEvent.preventDefault();
                    submitEvent.stopPropagation();

                    const reason = new FormData(form).get('reason');
                    if (!reason || reason.trim() === '') {
                        showToast('Please enter a rejection reason.', 'error');
                        return;
                    }

                    const reqs = getData('specialMealRequests') || [];
                    const req = reqs.find(item => item.id == id && item.status === 'Pending');
                    if (!req) {
                        showToast('Request not found!', 'error');
                        return;
                    }

                    Object.assign(req, {
                        status: 'Rejected',
                        rejectionReason: reason.trim()
                    });

                    saveData('specialMealRequests', reqs);
                    closeModal();
                    showToast('Request rejected!', 'warning');
                    render();
                };
            }
        }, 100);
    };

    document.querySelector('#request-filter').onchange = render;
    render();
}
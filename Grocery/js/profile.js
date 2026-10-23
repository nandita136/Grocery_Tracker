window.startEditProfile = function(event) {
    if (event) {
        event.preventDefault();
        event.stopPropagation();
    }
    const user = getCurrentUser() || {};
    const txtEditName = document.querySelector('#txtEditName');
    const txtEditEmail = document.querySelector('#txtEditEmail');
    const profileViewEl = document.querySelector('#profile-view');
    const profileEditEl = document.querySelector('#profile-edit');

    if (txtEditName) txtEditName.value = user.name || '';
    if (txtEditEmail) txtEditEmail.value = user.email || '';
    if (profileViewEl) profileViewEl.style.display = 'none';
    if (profileEditEl) profileEditEl.style.display = 'block';
    return false;
};

window.cancelEditProfile = function(event) {
    if (event) {
        event.preventDefault();
        event.stopPropagation();
    }
    const user = getCurrentUser() || {};
    const txtEditName = document.querySelector('#txtEditName');
    const txtEditEmail = document.querySelector('#txtEditEmail');
    const profileViewEl = document.querySelector('#profile-view');
    const profileEditEl = document.querySelector('#profile-edit');

    if (txtEditName) txtEditName.value = user.name || '';
    if (txtEditEmail) txtEditEmail.value = user.email || '';
    if (profileEditEl) profileEditEl.style.display = 'none';
    if (profileViewEl) profileViewEl.style.display = 'block';
    return false;
};

window.saveProfile = function(event) {
    if (event) {
        event.preventDefault();
        event.stopPropagation();
    }
    const user = getCurrentUser();
    if (!user) return false;

    const txtEditName = document.querySelector('#txtEditName');
    const txtEditEmail = document.querySelector('#txtEditEmail');
    const profileViewEl = document.querySelector('#profile-view');
    const profileEditEl = document.querySelector('#profile-edit');
    const profileNameEl = document.querySelector('#profile-name');
    const profileEmailEl = document.querySelector('#profile-email');

    const newName = txtEditName ? txtEditName.value.trim() : '';
    const newEmail = txtEditEmail ? txtEditEmail.value.trim() : '';

    if (!newName) {
        showToast('Please enter your name.', 'error');
        return false;
    }
    if (!newEmail) {
        showToast('Please enter your email.', 'error');
        return false;
    }
    if (!/^\S+@\S+\.\S+$/.test(newEmail)) {
        showToast('Enter a valid email address.', 'error');
        return false;
    }

    const users = getData('users') || [];
    const emailTaken = users.some(u => (user.id ? u.id !== user.id : u.email.toLowerCase() !== user.email.toLowerCase()) && u.email.toLowerCase() === newEmail.toLowerCase());
    if (emailTaken) {
        showToast('An account with this email already exists.', 'error');
        return false;
    }

    const record = (user.id ? users.find(u => u.id === user.id) : null) || users.find(u => u.email && user.email && u.email.toLowerCase() === user.email.toLowerCase());
    if (record) {
        record.name = newName;
        record.email = newEmail;
        saveData('users', users);
    }

    user.name = newName;
    user.email = newEmail;
    saveData('currentUser', user);

    if (profileNameEl) profileNameEl.textContent = user.name || '';
    if (profileEmailEl) profileEmailEl.textContent = user.email || '';
    if (typeof updateSidebarUser === 'function') updateSidebarUser();

    if (profileEditEl) profileEditEl.style.display = 'none';
    if (profileViewEl) profileViewEl.style.display = 'block';

    showToast('Profile updated successfully!');
    return false;
};

function initProfile() {
    let user = getCurrentUser();
    if (!user) return;

    const profileNameEl = document.querySelector('#profile-name');
    const profileEmailEl = document.querySelector('#profile-email');
    if (profileNameEl) profileNameEl.textContent = user.name || '';
    if (profileEmailEl) profileEmailEl.textContent = user.email || '';
    if (typeof updateSidebarUser === 'function') updateSidebarUser();

    const userPlans = (getData('mealPlans') || []).filter(item => item.userId === user.id);
    const groceries = (getData('groceryItems') || []).filter(item => item.userId === user.id);
    const requests = (getData('specialMealRequests') || []).filter(item => item.userId === user.id);
    const statsEl = document.querySelector('#profile-stats');
    if (statsEl) {
        statsEl.innerHTML = `<div class="card"><strong>${userPlans.length}</strong><span class="muted">Meal plans</span></div><div class="card"><strong>${groceries.length}</strong><span class="muted">Grocery items</span></div><div class="card"><strong>${requests.length}</strong><span class="muted">Special requests</span></div>`;
    }

    const btnEditProfile = document.querySelector('#btnEditProfile');
    const btnSaveProfile = document.querySelector('#btnSaveProfile');
    const btnCancelEdit = document.querySelector('#btnCancelEdit');

    if (btnEditProfile) {
        btnEditProfile.onclick = window.startEditProfile;
        btnEditProfile.addEventListener('click', window.startEditProfile);
    }
    if (btnCancelEdit) {
        btnCancelEdit.onclick = window.cancelEditProfile;
        btnCancelEdit.addEventListener('click', window.cancelEditProfile);
    }
    if (btnSaveProfile) {
        btnSaveProfile.onclick = window.saveProfile;
        btnSaveProfile.addEventListener('click', window.saveProfile);
    }

    const pwdForm = document.querySelector('#password-form');
    if (pwdForm) {
        pwdForm.addEventListener('submit', event => {
            event.preventDefault();
            const data = Object.fromEntries(new FormData(event.target));
            if (data.current !== user.password) return showToast('Current password is incorrect.', 'error');
            if (data.newPassword.length < 6 || data.newPassword !== data.confirm) return showToast('Check the new password.', 'error');
            const users = getData('users');
            const record = users.find(item => item.id === user.id);
            if (record) {
                record.password = data.newPassword;
                saveData('users', users);
            }
            user.password = data.newPassword;
            saveData('currentUser', user);
            event.target.reset();
            showToast('Password changed successfully!');
        });
    }
}
window.startEditProfile = function (event) {
    if (event) {
        event.preventDefault();
        event.stopPropagation();
    }
    const user = getCurrentUser() || {};
    const txtEditName = document.querySelector('#txtEditName');
    const txtEditEmail = document.querySelector('#txtEditEmail');
    const txtEditMobile = document.querySelector('#txtEditMobile');
    const profileViewEl = document.querySelector('#profile-view');
    const profileEditEl = document.querySelector('#profile-edit');

    if (txtEditName) txtEditName.value = user.name || '';
    if (txtEditEmail) txtEditEmail.value = user.email || '';
    if (txtEditMobile) txtEditMobile.value = user.mobile || '';
    if (profileViewEl) profileViewEl.style.display = 'none';
    if (profileEditEl) profileEditEl.style.display = 'block';
    return false;
};

window.cancelEditProfile = function (event) {
    if (event) {
        event.preventDefault();
        event.stopPropagation();
    }
    const user = getCurrentUser() || {};
    const txtEditName = document.querySelector('#txtEditName');
    const txtEditEmail = document.querySelector('#txtEditEmail');
    const txtEditMobile = document.querySelector('#txtEditMobile');
    const profileViewEl = document.querySelector('#profile-view');
    const profileEditEl = document.querySelector('#profile-edit');

    if (txtEditName) txtEditName.value = user.name || '';
    if (txtEditEmail) txtEditEmail.value = user.email || '';
    if (txtEditMobile) txtEditMobile.value = user.mobile || '';
    if (profileEditEl) profileEditEl.style.display = 'none';
    if (profileViewEl) profileViewEl.style.display = 'block';
    return false;
};

window.saveProfile = function (event) {
    if (event) {
        event.preventDefault();
        event.stopPropagation();
    }
    const user = getCurrentUser();
    if (!user) return false;

    const txtEditName = document.querySelector('#txtEditName');
    const txtEditEmail = document.querySelector('#txtEditEmail');
    const txtEditMobile = document.querySelector('#txtEditMobile');
    const profileViewEl = document.querySelector('#profile-view');
    const profileEditEl = document.querySelector('#profile-edit');
    const profileNameEl = document.querySelector('#profile-name');
    const profileEmailEl = document.querySelector('#profile-email-display');
    const profileMobileEl = document.querySelector('#profile-mobile-display');

    const newName = txtEditName ? txtEditName.value.trim() : '';
    const newEmail = txtEditEmail ? txtEditEmail.value.trim() : '';
    const newMobile = txtEditMobile ? txtEditMobile.value.trim() : '';

    if (!newName) {
        showToast('Please enter your name.', 'error');
        return false;
    }
    if (!newEmail) {
        showToast('Please enter your email.', 'error');
        return false;
    }
    if (!/^\S+@\S+\.\S+$/.test(newEmail)) {
        showToast('Enter a valid email address.', 'error');
        return false;
    }

    const users = getData('users') || [];
    const emailTaken = users.some(u => (user.id ? u.id !== user.id : u.email.toLowerCase() !== user.email.toLowerCase()) && u.email.toLowerCase() === newEmail.toLowerCase());
    if (emailTaken) {
        showToast('An account with this email already exists.', 'error');
        return false;
    }

    const record = (user.id ? users.find(u => u.id === user.id) : null) || users.find(u => u.email && user.email && u.email.toLowerCase() === user.email.toLowerCase());
    if (record) {
        record.name = newName;
        record.email = newEmail;
        record.mobile = newMobile;
        saveData('users', users);
    }

    user.name = newName;
    user.email = newEmail;
    user.mobile = newMobile;
    saveData('currentUser', user);

    if (profileNameEl) profileNameEl.textContent = user.name || '';
    if (profileEmailEl) profileEmailEl.textContent = user.email || '';
    if (profileMobileEl) profileMobileEl.textContent = user.mobile || 'Not added';
    if (typeof updateSidebarUser === 'function') updateSidebarUser();

    if (profileEditEl) profileEditEl.style.display = 'none';
    if (profileViewEl) profileViewEl.style.display = 'block';

    showToast('Profile updated successfully!');
    return false;
};

function initProfile() {
    let user = getCurrentUser();
    if (!user) return;

    const profileNameEl = document.querySelector('#profile-name');
    const profileEmailEl = document.querySelector('#profile-email-display');
    const profileMobileEl = document.querySelector('#profile-mobile-display');
    const profileInitialsEl = document.querySelector('#profile-initials');

    if (profileNameEl) profileNameEl.textContent = user.name || '';
    if (profileEmailEl) profileEmailEl.textContent = user.email || '';
    if (profileMobileEl) profileMobileEl.textContent = user.mobile || 'Not added';

    // Generate initials
    if (profileInitialsEl && user.name) {
        const initials = user.name.split(' ').map(n => n[0]).join('').toUpperCase().substring(0, 2);
        profileInitialsEl.textContent = initials;
    }

    if (typeof updateSidebarUser === 'function') updateSidebarUser();

    // Stats
    const userPlans = (getData('mealPlans') || []).filter(item => item.userId === user.id);
    const groceries = (getData('groceryItems') || []).filter(item => item.userId === user.id);
    const requests = (getData('specialMealRequests') || []).filter(item => item.userId === user.id);

    const statsEl = document.querySelector('#profile-stats');
    if (statsEl) {
        statsEl.innerHTML = `
            <div class="stat-card-modern">
                <strong>${userPlans.length}</strong>
                <span class="muted">Meal plans</span>
            </div>
            <div class="stat-card-modern">
                <strong>${groceries.length}</strong>
                <span class="muted">Grocery items</span>
            </div>
            <div class="stat-card-modern">
                <strong>${requests.length}</strong>
                <span class="muted">Special requests</span>
            </div>
        `;
    }

    // Edit buttons
    const btnEditProfile = document.querySelector('#btnEditProfile');
    const btnSaveProfile = document.querySelector('#btnSaveProfile');
    const btnCancelEdit = document.querySelector('#btnCancelEdit');

    if (btnEditProfile) {
        btnEditProfile.onclick = window.startEditProfile;
    }
    if (btnCancelEdit) {
        btnCancelEdit.onclick = window.cancelEditProfile;
    }
    if (btnSaveProfile) {
        btnSaveProfile.onclick = window.saveProfile;
    }

    // Password form
    const pwdForm = document.querySelector('#password-form');
    if (pwdForm) {
        pwdForm.addEventListener('submit', event => {
            event.preventDefault();
            const data = Object.fromEntries(new FormData(event.target));
            if (data.current !== user.password) return showToast('Current password is incorrect.', 'error');
            if (data.newPassword.length < 6 || data.newPassword !== data.confirm) return showToast('Check the new password.', 'error');
            const users = getData('users');
            const record = users.find(item => item.id === user.id);
            if (record) {
                record.password = data.newPassword;
                saveData('users', users);
            }
            user.password = data.newPassword;
            saveData('currentUser', user);
            event.target.reset();
            showToast('Password changed successfully!');
        });
    }
}
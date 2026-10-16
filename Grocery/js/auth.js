function registerUser() { const form = document.querySelector('#register-form'); if (!form) return; form.addEventListener('submit', event => { event.preventDefault(); const data = Object.fromEntries(new FormData(form)); const error = document.querySelector('#form-error'); const success = document.querySelector('#form-success'); error.style.display = 'none'; const users = getData('users') || []; if (!data.name || !data.email || !data.password || !data.confirmPassword) return showFormMessage(error, 'All fields are required.'); if (!/^\S+@\S+\.\S+$/.test(data.email)) return showFormMessage(error, 'Enter a valid email address.'); if (data.password.length < 6) return showFormMessage(error, 'Password must be at least 6 characters.'); if (data.password !== data.confirmPassword) return showFormMessage(error, 'Passwords do not match.'); if (users.some(user => user.email.toLowerCase() === data.email.toLowerCase())) return showFormMessage(error, 'An account with this email already exists.'); users.push({ id: generateId(users), name: data.name, email: data.email, password: data.password, role: 'user' }); saveData('users', users); success.textContent = 'Registration successful! Redirecting to login...'; success.style.display = 'block'; setTimeout(() => location.href = 'login.aspx', 800) }) }
function showFormMessage(element, message) { element.textContent = message; element.style.display = 'block' }
// function loginUser() { const form = document.querySelector('#login-form'); if (!form) return; form.addEventListener('submit', event => { event.preventDefault(); const data = Object.fromEntries(new FormData(form)); const user = (getData('users') || []).find(item => item.email.toLowerCase() === data.email.toLowerCase() && item.password === data.password); if (!user) return showFormMessage(document.querySelector('#form-error'), 'Incorrect email or password.'); saveData('currentUser', user); if (data.remember) localStorage.setItem('rememberUser', 'true'); showToast('Login successful!'); setTimeout(() => location.href = 'dashboard.aspx', 400) }) }
function loginUser() {
    const form = document.querySelector('#login-form');
    if (!form) return;

    const button = form.querySelector('.btn-primary');

    button.onclick = function () {

        const user = {
            name: 'Test User',
            email: 'test@gmail.com',
            role: 'user'
        };

        saveData('currentUser', user);

        location.href = 'dashboard.aspx';
    };
}
function resetPassword() { const email = document.querySelector('#reset-email')?.value; const user = (getData('users') || []).find(item => item.email.toLowerCase() === email?.toLowerCase()); if (!user) return showToast('Email not found.', 'error'); showModal('Reset password', `<p class="muted">Demo mode: password reset is handled locally.</p><form id="reset-form"><div class="form-group"><label>New Password</label><input name="password" type="password" minlength="6" required></div><button class="btn btn-primary">Update Password</button></form>`); document.querySelector('#reset-form').addEventListener('submit', event => { event.preventDefault(); const password = new FormData(event.target).get('password'); const users = getData('users'); users.find(item => item.id === user.id).password = password; saveData('users', users); closeModal(); showToast('Password reset successfully!') }) }
function logoutUser() { localStorage.removeItem('currentUser'); localStorage.removeItem('rememberUser'); location.href = 'login.aspx' }
function loginAdmin() { const form = document.querySelector('#admin-login-form'); if (!form) return; form.addEventListener('submit', event => { event.preventDefault(); const data = Object.fromEntries(new FormData(form)); if (data.email !== 'admin@grocerytracker.com' || data.password !== 'admin123') return showFormMessage(document.querySelector('#form-error'), 'Invalid admin credentials.'); saveData('currentAdmin', { email: data.email, name: 'Administrator', role: 'admin' }); location.href = 'admin-dashboard.aspx' }) }
function logoutAdmin() { localStorage.removeItem('currentAdmin'); location.href = 'admin-login.aspx' }
function isUserLoggedIn() { return Boolean(getData('currentUser')) }
function isAdminLoggedIn() { return Boolean(getData('currentAdmin')) }
function getCurrentUser() { return getData('currentUser') }
function getCurrentAdmin() { return getData('currentAdmin') }
function protectUserPage() { if (!isUserLoggedIn()) location.href = 'login.aspx' }
function protectAdminPage() { if (!isAdminLoggedIn()) location.href = 'admin-login.aspx' }

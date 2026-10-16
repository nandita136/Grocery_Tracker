function escapeSpecialMealText(value) {
    return String(value ?? '').replace(/[&<>"']/g, character => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[character]);
}

function initSpecialMeals() {
    const user = getCurrentUser();
    const meals = getData('meals') || [];
    const mealOpts = document.querySelector('#meal-options');
    if (mealOpts) mealOpts.innerHTML = meals.map(meal => `<label class="card" style="display:flex;gap:10px;align-items:center;padding:12px"><input type="checkbox" value="${escapeSpecialMealText(meal.name)}"> <span><strong>${escapeSpecialMealText(meal.name)}</strong><small class="muted" style="display:block">${escapeSpecialMealText(meal.type)} · ${escapeSpecialMealText(meal.cookingTime)}</small></span></label>`).join('');

    const peopleInput = document.querySelector('#people');
    const customPeopleInput = document.querySelector('#custom-people, #custom_people, #people-custom');
    if (customPeopleInput) customPeopleInput.style.display = 'none';
    if (peopleInput && customPeopleInput) peopleInput.addEventListener('change', () => { customPeopleInput.style.display = peopleInput.value === 'custom' ? 'block' : 'none'; });

    const occasionInput = document.querySelector('#occasion');
    const requestOccasionInput = document.querySelector('#request_occasion, #request-occasion');
    const requestPeopleInput = document.querySelector('#request_people, #request-people');
    const requestCustomPeopleInput = document.querySelector('#request_custom_people, #request-custom-people');
    if (occasionInput && requestOccasionInput && requestOccasionInput.tagName === 'SELECT') {
        if (!requestOccasionInput.options.length) {
            requestOccasionInput.replaceChildren(...[...occasionInput.options].map(option => option.cloneNode(true)));
        }
    }
    if (peopleInput && requestPeopleInput && requestPeopleInput.tagName === 'SELECT') {
        if (!requestPeopleInput.options.length) {
            requestPeopleInput.replaceChildren(...[...peopleInput.options].map(option => option.cloneNode(true)));
        }
        requestPeopleInput.addEventListener('change', () => {
            if (requestCustomPeopleInput) requestCustomPeopleInput.style.display = requestPeopleInput.value === 'custom' ? 'block' : 'none';
        });
    }

    let generated = null;
    const genBtn = document.querySelector('#generate-special, #generate_special');
    if (genBtn) genBtn.addEventListener('click', () => {
        const names = [...document.querySelectorAll('#meal-options input:checked')].map(input => input.value);
        if (!names.length) return showToast('Select at least one meal.', 'error');

        const people = peopleInput?.value === 'custom' ? Number(customPeopleInput?.value || 2) : Number(peopleInput?.value || 2);
        generated = { names, people, items: buildIngredients(names, people) };
        const occasion = document.querySelector('#occasion')?.value || 'Special Meal';
        const result = document.querySelector('#special-result');
        if (result) result.innerHTML = `<div class="card"><h2>${escapeSpecialMealText(occasion)}</h2><p class="muted">${people} people · ${names.map(escapeSpecialMealText).join(', ')}</p><table class="data-table"><thead><tr><th>Ingredient</th><th>Quantity</th><th>Category</th></tr></thead><tbody>${generated.items.map(item => `<tr><td>${escapeSpecialMealText(item.name)}</td><td>${item.quantity} ${escapeSpecialMealText(item.unit)}</td><td>${escapeSpecialMealText(item.category)}</td></tr>`).join('')}</tbody></table><div class="actions"><button type="button" class="btn btn-secondary" id="special-add">Add to Grocery List</button></div></div>`;

        document.querySelector('#special-add').onclick = () => addGroceries(generated.items);
    });

    const mealRequestInput = document.querySelector('#meal_request');
    const requestButton = document.querySelector('#btnRequestMeal');
    if (requestButton) requestButton.onclick = () => {
        const requestedMeal = mealRequestInput?.value.trim();
        if (!requestedMeal) return showToast('Enter a meal or dish name.', 'error');

        const requestedPeople = requestPeopleInput?.value === 'custom'
            ? Number(requestCustomPeopleInput?.value)
            : Number(requestPeopleInput?.value || 2);
        if (!Number.isInteger(requestedPeople) || requestedPeople <= 0) return showToast('Enter a valid number of people.', 'error');

        const requestedOccasion = (requestOccasionInput?.value || '').trim() || 'Special Meal';

        const requests = getData('specialMealRequests') || [];
        requests.push({ id: generateId(requests), userId: user.id, userName: user.name, occasion: requestedOccasion, people: requestedPeople, meals: [requestedMeal], requestedMeal, status: 'Pending', rejectionReason: '' });
        saveData('specialMealRequests', requests);
        if (mealRequestInput) mealRequestInput.value = '';
        showToast('Meal request submitted!');
        renderRequests();
    };

    function renderRequests() {
        const requests = (getData('specialMealRequests') || []).filter(item => item.userId === user?.id);
        const body = document.querySelector('#request-body');
        if (body) {
            body.innerHTML = requests.map(request => {
                const occasion = request.occasion || 'Special Meal';
                const people = (request.people !== undefined && request.people !== null && request.people !== '') ? request.people : '-';
                const mealList = (request.meals && request.meals.length) ? request.meals : (request.requestedMeal ? [request.requestedMeal] : []);
                return `<tr><td>${escapeSpecialMealText(occasion)}</td><td>${escapeSpecialMealText(people)}</td><td>${mealList.map(escapeSpecialMealText).join(', ') || '-'}</td><td>${createStatusBadge(request.status)}${request.rejectionReason ? `<div class="small" style="color:var(--red)">${escapeSpecialMealText(request.rejectionReason)}</div>` : ''}</td></tr>`;
            }).join('') || '<tr><td colspan="4" class="muted">No requests yet.</td></tr>';
        }
    }

    renderRequests();
}
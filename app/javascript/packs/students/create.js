window.addEventListener('load', () => {
    const element = document.querySelector("#new-student");
    element.addEventListener('ajax:success', (event) => {
        const [_data, _status, xhr] = event.detail;
        const table = document.querySelector("#students");
        table.insertAdjacentHTML('beforeend', `<tr><td>${_data.full_name}</td><td>${_data.email}</td></tr>`);
    });
    element.addEventListener("ajax:error", (event) => {
        const [_data, _status, xhr] = event.detail;
        element.insertAdjacentHTML('afterbegin', `<p>${_data}</p>`);
    });
});

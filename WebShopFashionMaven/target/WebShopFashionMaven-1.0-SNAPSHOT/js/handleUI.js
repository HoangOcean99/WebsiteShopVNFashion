const trigger = document.getElementById('userNameTrigger');
const menu = document.getElementById('userDropdownMenu');

if (trigger && menu) {
    trigger.addEventListener('click', function (e) {
        e.stopPropagation();
        menu.classList.toggle('show');
    });
    window.addEventListener('click', function (event) {
        if (!event.target.matches('#userNameTrigger') && !menu.contains(event.target)) {
            if (menu.classList.contains('show')) {
                menu.classList.remove('show');
            }
        }
    });
}
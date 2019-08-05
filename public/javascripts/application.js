var deleteEvent = document.getElementById('delete-event');
var deleteForm = document.getElementById('delete-form');

var unhide = function() {
    deleteForm.classList.remove('hide');
};

deleteEvent.addEventListener('click', unhide);
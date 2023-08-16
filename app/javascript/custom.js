$(".logout-button").on("click", function(event){
    event.preventDefault();
    if(confirm("Voulez vous vous déconnectez ?") ) {
        $(this).closest('form').submit();
    }
});
$('.delete').category('ajax:success',function()){
   $(this).closest('tr').fadeOut();
});
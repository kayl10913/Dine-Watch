function ordertable() {  
    $.ajax({
        url: "./userview/ordertable.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function ordertable() {  
    $.ajax({
        url: "userview/ordertable.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}


function deleteOrder(orderItemId) {
    // Confirm deletion
    if (confirm("Are you sure you want to delete this item?")) {
        // AJAX call to delete item
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/Usercontrol/DeleteOrder.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                const response = JSON.parse(xhr.responseText);
                if (response.status === "success") {
                    alert(response.message);
                    // Refresh the order list after successful deletion
                    order_list();
                } else {
                    alert(response.message);
                }
            }
        };
        xhr.send("order_item_id=" + orderItemId);
    }
}



function order_list() {  
    $.ajax({
        url: "userview/order-list.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data); // Update the section with the new order list
        }
    });
}




function showReservation() {  
    $.ajax({
        url: "staffview/viewsReservation.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}




function showProductSizes() {  
    $.ajax({
        url: "staffview/viewProductSizes.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function showUser() {
    $.ajax({
        url: "staffview/viewUser.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function showOrders() {
    $.ajax({
        url: "staffview/viewAllOrders.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function ChangeOrderStatus(id) {
    $.ajax({
        url: "Scontrols/updateOrderStatus.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            alert('Order Status updated successfully');
            $('form').trigger('reset');
            showOrders();
        }
    });
}



// Add product data
function addItems() {
    var item_name = $('#item_name').val();
    var item_type = $('#item_type').val();
    var stock = $('#stock').val();
    var price = $('#price').val();
    var special_instructions = $('#special_instructions').val();
    var file = $('#item_image')[0].files[0];  // Ensure this matches the input field

    // Check if all fields are filled
    if (!item_name || !item_type || !stock || !price || !file) {
        alert("Please fill in all fields and select a file.");
        return;
    }

    var fd = new FormData();
    fd.append('item_name', item_name);
    fd.append('item_type', item_type);
    fd.append('stock', stock);
    fd.append('price', price);
    fd.append('special_instructions', special_instructions);
    fd.append('item_image', file);  // Add the file input
    fd.append('upload', '1'); // Add a flag to signify the upload process

    $.ajax({
        url: "/Scontrols/addItemController.php",  // Ensure the correct path
        method: "POST",
        data: fd,
        processData: false,
        contentType: false,
        success: function(data) {
            console.log(data);  // Log the response for debugging
            $('#myModal').modal('hide');  // Hide the modal after success
            $('#productForm').trigger('reset');  // Reset the form fields
            
            // Show alert and refresh after the user clicks "OK"
            alert("Product added successfully.");
            setTimeout(function() {
                refreshProductList();  // Refresh the product list after OK
            });  // Short delay before refreshing the list
        },
        error: function(xhr, status, error) {
            console.error("Error: " + xhr.responseText);  // Log the error response
            alert("Error: Unable to add the product. Please try again.");
        }
    });
}




// Refresh product list dynamically without redirecting
function refreshProductList() {
    $.ajax({
        url: 'staffview/viewAllProducts.php',  // URL to load the product list
        method: 'GET',
        success: function(data) {
            $('.allContent-section').html(data);  // Update the content with the product list
        },
        error: function() {
            alert('Error refreshing the product list.');
        }
    });
}









function showProductItems() {
    $.ajax({
        url: "staffview/viewAllProducts.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        },
        error: function() {
            alert("Error fetching product items.");
        }
    });
}

// Load the edit form for a product
function itemEditForm(id) {
    $.ajax({
        url: "staffview/editItemForm.php",  // URL to load the edit form
        method: "POST",
        data: { record: id },  // Send the product ID
        success: function(data) {
            $('.allContent-section').html(data);  // Load the form HTML into the section
        },
        error: function() {
            alert("Error loading the form.");
        }
    });
}


// Update product data with image handling
function updateItems(event) {
    event.preventDefault(); // Prevent default form submission

    // Get the values from the form fields
    var product_id = $('#product_id').val();
    var product_name = $('#product_name').val();
    var category = $('#category').val();
    var quantity = $('#quantity').val();
    var price = $('#price').val();
    var special_instructions = $('#special_instructions').val();
    var product_image = $('#item_image')[0].files[0]; // Get the image file if uploaded

    // Validate that required fields are filled
    if (!product_name || !category || !quantity || !price) {
        alert('All fields except special instructions and image are required.');
        return;
    }

    // Create FormData object to handle file uploads and form fields
    var fd = new FormData();
    fd.append('product_id', product_id);
    fd.append('product_name', product_name);
    fd.append('category', category);
    fd.append('quantity', quantity);
    fd.append('price', price);
    fd.append('special_instructions', special_instructions);

    // Append the image file if available
    if (product_image) {
        fd.append('item_image', product_image); // Only append the actual file if it exists
    }

    // Send the AJAX request to update the product
    $.ajax({
        url: '/Scontrols/updateItemController.php', 
        method: 'POST',
        data: fd,
        processData: false,
        contentType: false,
        success: function (data) {
            try {
                var response = JSON.parse(data); // Parse the JSON response
                if (response.status === 'success') {
                    alert('Product updated successfully.');
                    refreshProductList(); // Optionally refresh the product list
                } else {
                    alert('Error: ' + response.message);
                }
            } catch (e) {
                // If response is not JSON
                alert("Error: Invalid response from the server.");
                console.error("Response:", data); // Log the response for debugging
            }
        },
        error: function (xhr, status, error) {
            console.error("Error: " + xhr.responseText);
            alert('Error updating the product item.');
        }
    });
}






// Function to refresh the product list without redirecting
// Function to refresh the product list without redirecting
function refreshProductList() {
    $.ajax({
        url: 'staffview/viewAllProducts.php',  // URL to load the product list
        method: 'GET',
        success: function(data) {
            $('.allContent-section').html(data);  // Update the content with the product list
        },
        error: function() {
            alert('Error refreshing the product list.');
        }
    });
}



// Function to refresh the product list without redirecting
function refreshProductList() {
    $.ajax({
        url: 'staffview/viewAllProducts.php', 
        method: 'GET',
        success: function(data) {
            $('.allContent-section').html(data); 
        },
        error: function() {
            alert('Error refreshing the product list.');
        }
    });
}






// Delete product data 
function itemDelete(id) {
    if (confirm('Are you sure you want to delete this product?')) {
        $.ajax({
            url: "/Scontrols/deleteItemController.php",
            method: "POST",
            data: { record: id },
            success: function(data) {
                console.log(data);  // Log the response for debugging
                alert(data);  // Show success or error message
                showProductItems();  // Refresh the product list after deletion
            },
            error: function(xhr, status, error) {
                console.error("Error: " + xhr.responseText);  // Log any errors from the server
                alert("Error: Unable to delete the product.");
            }
        });
    }
}



function filterItems() {
    var selectedType = document.getElementById("filter_item_type").value;
    var rows = document.querySelectorAll(".product-row");

    rows.forEach(function(row) {
        var itemType = row.getAttribute("data-item-type");

        if (selectedType === "All" || itemType === selectedType) {
            row.style.display = "";  // Show the row
        } else {
            row.style.display = "none";  // Hide the row
        }
    });
}



// Delete cart data
function cartDelete(id) {
    $.ajax({
        url: "Scontroller/deleteCartController.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            alert('Cart Item Successfully deleted');
            $('form').trigger('reset');
            showMyCart();
        }
    });
}






function eachDetailsForm(id) {
    $.ajax({
        url: "staffview/viewEachDetails.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

// Delete category data
function cancelReservation(id) {
    $.ajax({
        url: "Scontroller/catDeleteController.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            alert('Category Successfully deleted');
            $('form').trigger('reset');
            showReservation();
        }
    });
}

// Delete size data
function sizeDelete(id) {
    $.ajax({
        url: "controller/deleteSizeController.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            alert('Size Successfully deleted');
            $('form').trigger('reset');
            showSizes();
        }
    });
}

// Delete variation data
function variationDelete(id) {
    $.ajax({
        url: "controller/deleteVariationController.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            alert('Successfully deleted');
            $('form').trigger('reset');
            showProductSizes();
        }
    });
}

// Edit variation data
function variationEditForm(id) {
    $.ajax({
        url: "staffview/editVariationForm.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

// Update variation after submit
function updateVariations() {
    var v_id = $('#v_id').val();
    var product = $('#product').val();
    var size = $('#size').val();
    var qty = $('#qty').val();
    
    var fd = new FormData();
    fd.append('v_id', v_id);
    fd.append('product', product);
    fd.append('size', size);
    fd.append('qty', qty);
    
    $.ajax({
        url: 'controller/updateVariationController.php',
        method: 'post',
        data: fd,
        processData: false,
        contentType: false,
        success: function(data) {
            alert('Update Success.');
            $('form').trigger('reset');
            showProductSizes();
        }
    });
}

function search(id) {
    $.ajax({
        url: "controller/searchController.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            $('.eachCategoryProducts').html(data);
        }
    });
}

function quantityPlus(id) { 
    $.ajax({
        url: "controller/addQuantityController.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            $('form').trigger('reset');
            showMyCart();
        }
    });
}

function quantityMinus(id) {
    $.ajax({
        url: "controller/subQuantityController.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            $('form').trigger('reset');
            showMyCart();
        }
    });
}

function checkout() {
    $.ajax({
        url: "view/viewCheckout.php",
        method: "post",
        data: { record: 1 },
        success: function(data) {
            $('.allContent-section').html(data);
        }
    });
}

function removeFromWish(id) {
    $.ajax({
        url: "controller/removeFromWishlist.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            alert('Removed from wishlist');
        }
    });
}

function addToWish(id) {
    $.ajax({
        url: "controller/addToWishlist.php",
        method: "post",
        data: { record: id },
        success: function(data) {
            alert('Added to wishlist');        
        }
    });
}

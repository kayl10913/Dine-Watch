fetch('assets/fetch_data.php')
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        const totalSales = data.totalSales ?? 0; // Default to 0 if null
        const totalOrders = data.totalOrders ?? 0; // Default to 0 if null
        const totalSold = data.totalSold ?? 0; // Default to 0 if null
        const totalCustomers = data.totalCustomers ?? 0; // Default to 0 if null

        // Display values in HTML
        document.getElementById('totalSales').innerText = totalSales;
        document.getElementById('totalOrders').innerText = totalOrders;
        document.getElementById('totalSold').innerText = totalSold;
        document.getElementById('totalCustomers').innerText = totalCustomers;

        // Create individual charts using Chart.js
        // Total Sales Chart
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(salesCtx, {
            type: 'bar',
            data: {
                labels: ['Total Sales'],
                datasets: [{
                    label: 'Total Sales',
                    data: [totalSales],
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Total Orders Chart
        const ordersCtx = document.getElementById('ordersChart').getContext('2d');
        const ordersChart = new Chart(ordersCtx, {
            type: 'bar',
            data: {
                labels: ['Total Orders'],
                datasets: [{
                    label: 'Total Orders',
                    data: [totalOrders],
                    backgroundColor: 'rgba(75, 192, 192, 0.6)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Total Sold Chart
        const soldCtx = document.getElementById('soldChart').getContext('2d');
        const soldChart = new Chart(soldCtx, {
            type: 'bar',
            data: {
                labels: ['Total Sold'],
                datasets: [{
                    label: 'Total Sold',
                    data: [totalSold],
                    backgroundColor: 'rgba(153, 102, 255, 0.6)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Total Customers Chart
        const customersCtx = document.getElementById('customersChart').getContext('2d');
        const customersChart = new Chart(customersCtx, {
            type: 'bar',
            data: {
                labels: ['Total Customers'],
                datasets: [{
                    label: 'Total Customers',
                    data: [totalCustomers],
                    backgroundColor: 'rgba(255, 99, 132, 0.6)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    })
    .catch(error => console.error('Error fetching data:', error));

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Food Menu</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: black; color: white; margin: 0; padding: 20px; position: relative; }
        .order-list { position: absolute; top: 20px; right: 20px; background: #4CAF50; color: white; padding: 10px 20px; border-radius: 20px; cursor: pointer; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); }
        .menu-container { display: flex; flex-wrap: wrap; justify-content: center; gap: 30px; max-width: 1500px; margin: auto; }
        .menu-item { border: 1px solid #ddd; padding: 15px; width: 250px; background-color: #222; border-radius: 10px; }
        .menu-item img { width: 100%; height: auto; border-radius: 10px; }
        .btn { background: green; color: white; padding: 10px; border: none; cursor: pointer; width: 100%; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="order-list" onclick="openOrderList()">ORDER LIST</div>
    <h1>Fast Food Menu</h1>
    <div class="menu-container">
        <div class="menu-item">
            <img src="D:\myfront\Burger.jpg" alt="Burger">
            <h3>Burger</h3>
            <p>Juicy beef or chicken patty in a soft bun with toppings.</p>
            <button class="btn" onclick="addToOrderList('Burger', 150)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\French Fries.jpg" alt="French Fries">
            <h3>French Fries</h3>
            <p>Crispy golden fries served with ketchup or mayo.</p>
            <button class="btn" onclick="addToOrderList('French Fries', 80)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Pizza.jpg" alt="Pizza">
            <h3>Pizza</h3>
            <p>Delicious cheesy pizza with various toppings.</p>
            <button class="btn" onclick="addToOrderList('Pizza', 300)">Add to Order List</button>
        </div>
    </div>

    <script>
        let orderList = JSON.parse(localStorage.getItem('orderList')) || [];

        function addToOrderList(itemName, itemPrice) {
            let item = { name: itemName, price: itemPrice, quantity: 1 };
            let existingItem = orderList.find(i => i.name === itemName);
            if (existingItem) existingItem.quantity++;
            else orderList.push(item);

            localStorage.setItem('orderList', JSON.stringify(orderList));
            alert(`${itemName} has been added to your order list.`);
        }

        function openOrderList() {
            window.location.href = 'orderlist.html';
        }
    </script>
</body>
</html>

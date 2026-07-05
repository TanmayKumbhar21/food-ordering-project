<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Snacks Menu</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: black; color: white; margin: 0; padding: 20px; position: relative; }
        .order-list { position: absolute; top: 20px; right: 20px; background: #4CAF50; color: white; padding: 10px 20px; border-radius: 20px; cursor: pointer; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); }
        .menu-container { display: flex; flex-wrap: wrap; justify-content: center; gap: 30px; max-width: 1500px; margin: auto; }
        .menu-item { border: 1px solid #ddd; padding: 15px; width: 250px; background-color: #222; border-radius: 10px; }
        .menu-item img { width: 200px; 
    height: 150px;
    object-fit: cover;  
    border-radius: 10px; }
        .btn { background: green; color: white; padding: 10px; border: none; cursor: pointer; width: 100%; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="order-list" onclick="openOrderList()">ORDER LIST</div>
    <h1>Snacks Menu</h1>
    <div class="menu-container">
        <div class="menu-item">
            <img src="D:\myfront\Samosa.jpg" alt="Samosa">
            <h3>Samosa</h3>
            <p>Crispy, deep-fried pastry filled with spicy potato stuffing.</p>
            <button class="btn" onclick="addToOrderList('Samosa', 30)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Pakora.jpg" alt="Pakora">
            <h3>Pakora</h3>
            <p>Deep-fried crispy fritters made with gram flour and vegetables.</p>
            <button class="btn" onclick="addToOrderList('Pakora', 50)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Spring Rolls.jpg" alt="Spring Rolls">
            <h3>Spring Rolls</h3>
            <p>Crunchy rolls filled with vegetables and served with dip.</p>
            <button class="btn" onclick="addToOrderList('Spring Rolls', 100)">Add to Order List</button>
        </div>
       
        <div class="menu-item">
            <img src="D:\myfront\Nachos.jpg" alt="Nachos">
            <h3>Nachos</h3>
            <p>Crunchy tortilla chips topped with cheese and salsa.</p>
            <button class="btn" onclick="addToOrderList('Nachos', 120)">Add to Order List</button>
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

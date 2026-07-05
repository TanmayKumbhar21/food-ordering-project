<%-- 
    Document   : colddrink
    Created on : 23 Mar 2025, 11:08:27 pm
    Author     : OMKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cold Drink Menu</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: black; color: white; margin: 0; padding: 20px; position: relative; }
        .order-list { position: absolute; top: 20px; right: 20px; background: #4CAF50; color: white; padding: 10px 20px; border-radius: 20px; cursor: pointer; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); }
        .menu-container { display: flex; flex-wrap: wrap; justify-content: center; gap: 30px; max-width: 1500px; margin: auto; }
        .menu-item { border: 1px solid #ddd; padding: 15px; width: 250px; background-color: #222; border-radius: 10px; }
        .menu-item img {  width: 200px; 
    height: 150px;
    object-fit: cover;  
    border-radius: 10px; }
        .btn { background: green; color: white; padding: 10px; border: none; cursor: pointer; width: 100%; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="order-list" onclick="openOrderList()">ORDER LIST</div>
    <h1>Cold Drink Menu</h1>
    <div class="menu-container">
        <div class="menu-item">
            <img src="D:\myfront\Coca-Cola.jpg" alt="Coca-Cola">
            <h3>Coca-Cola</h3>
            <p>Refreshing carbonated soft drink.</p>
            <button class="btn" onclick="addToOrderList('Coca-Cola', 50)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Pepsi.jpg" alt="Pepsi">
            <h3>Pepsi</h3>
            <p>Classic cola-flavored soft drink.</p>
            <button class="btn" onclick="addToOrderList('Pepsi', 50)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Sprite.jpg" alt="Sprite">
            <h3>Sprite</h3>
            <p>Lemon-lime flavored refreshing drink.</p>
            <button class="btn" onclick="addToOrderList('Sprite', 50)">Add to Order List</button>
        </div>
        
        <div class="menu-item">
            <img src="D:\myfront\Mango Shake.jpg" alt="Mango Shake">
            <h3>Mango Shake</h3>
            <p>Thick and delicious mango-flavored shake.</p>
            <button class="btn" onclick="addToOrderList('Mango Shake', 80)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\ice cream combo.jpg" alt="Icecream combo">
            <h3>Icecream combo</h3>
            <p>Delicious icecream combo pack </p>
            <button class="btn" onclick="addToOrderList('Icecream combo', 430)">Add to Order List</button>
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

    </body>
</html>

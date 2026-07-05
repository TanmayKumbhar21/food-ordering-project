<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Non-Veg Menu</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            background-color: #121212; 
            color: white; 
            margin: 0; 
            padding: 20px;
        }
        .order-list {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #ff5722;
            color: white;
            padding: 12px 20px;
            border-radius: 20px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            transition: 0.3s;
        }
        .order-list:hover {
            background: #e64a19;
        }
        .menu-container { 
            display: flex; 
            flex-wrap: wrap; 
            justify-content: center; 
            gap: 25px; 
            max-width: 1200px;
            margin: auto;
        }
        .menu-item { 
            border: 1px solid #444; 
            padding: 15px; 
            width: 260px; 
            background-color: #222; 
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            transition: transform 0.3s;
        }
        .menu-item:hover {
            transform: scale(1.05);
        }
        .menu-item img { 
            width: 200px; 
    height: 150px;
    object-fit: cover;  
    border-radius: 10px;
        }
        .btn { 
            background: #ff5722; 
            color: white; 
            padding: 12px; 
            border: none; 
            cursor: pointer; 
            width: 100%; 
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }
        .btn:hover {
            background: #e64a19;
        }
    </style>
</head>
<body>
    <div class="order-list" onclick="openOrderList()">ORDER LIST</div>
    <h1>Non-Veg Menu</h1>
    <div class="menu-container">
        <div class="menu-item">
            <img src="D:\myfront\Chicken Biryani.jpg" alt="Chicken Biryani">
            <h3>Chicken Biryani</h3>
            <p>Fragrant rice cooked with chicken and spices.</p>
            <button class="btn" onclick="addToOrderList('Chicken Biryani', 300)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Butter Chicken.jpg" alt="Butter Chicken">
            <h3>Butter Chicken</h3>
            <p>Rich tomato-based curry with tender chicken pieces.</p>
            <button class="btn" onclick="addToOrderList('Butter Chicken', 350)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Mutton Rogan Josh.jpg" alt="Mutton Rogan Josh">
            <h3>Mutton Rogan Josh</h3>
            <p>Kashmiri-style mutton curry with aromatic spices.</p>
            <button class="btn" onclick="addToOrderList('Mutton Rogan Josh', 400)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Fish Curry.jpg" alt="Fish Curry">
            <h3>Fish Curry</h3>
            <p>Spicy fish curry cooked with traditional flavors.</p>
            <button class="btn" onclick="addToOrderList('Fish Curry', 280)">Add to Order List</button>
        </div>
    </div>

    <script>
        let orderList = JSON.parse(localStorage.getItem('orderList')) || [];

function addToOrderList(itemName, itemPrice) {
    let item = orderList.find(i => i.name === itemName);

    if (item) {
        item.quantity++;
    } else {
        orderList.push({ name: itemName, price: itemPrice, quantity: 1 });
    }

    localStorage.setItem('orderList', JSON.stringify(orderList));
    alert(itemName + " has been added to your order list.");
}

function openOrderList() {
    window.location.href = 'orderlist.html';
}

    </script>
</body>
</html>
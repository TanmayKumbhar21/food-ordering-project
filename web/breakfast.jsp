<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Breakfast Menu</title>
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
    <h1>Breakfast Menu</h1>
    <div class="menu-container">
        <div class="menu-item">
            <img src="D:\myfront\Aloo Paratha1.jpg" alt="Aloo Paratha">
            <h3>Aloo Paratha</h3>
            <p>Stuffed whole wheat bread with spiced mashed potatoes.</p>
            <button class="btn" onclick="addToOrderList('Aloo Paratha', 150)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Poha.jpg" alt="Poha">
            <h3>Poha</h3>
            <p>Flattened rice cooked with spices and vegetables.</p>
            <button class="btn" onclick="addToOrderList('Poha', 100)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Idli Sambar.jpg" alt="Idli Sambar">
            <h3>Idli Sambar</h3>
            <p>Soft steamed rice cakes served with lentil soup.</p>
            <button class="btn" onclick="addToOrderList('Idli Sambar', 120)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Dosa.jpg" alt="Dosa">
            <h3>Dosa</h3>
            <p>Thin, crispy rice crepe served with chutney and sambar.</p>
            <button class="btn" onclick="addToOrderList('Dosa', 130)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Upma.jpg" alt="Upma">
            <h3>Upma</h3>
            <p>South Indian breakfast dish made from semolina.</p>
            <button class="btn" onclick="addToOrderList('Upma', 90)">Add to Order List</button>
        </div>
        
        <div class="menu-item">
            <img src="D:\myfront\Bread Omelette.jpg" alt="Bread Omelette">
            <h3>Bread Omelette</h3>
            <p>Fluffy omelette served with toasted bread.</p>
            <button class="btn" onclick="addToOrderList('Bread Omelette', 110)">Add to Order List</button>
        </div>
        <div class="menu-item">
            <img src="D:\myfront\Pancakes.jpg" alt="Pancakes">
            <h3>Pancakes</h3>
            <p>Soft and fluffy pancakes served with syrup.</p>
            <button class="btn" onclick="addToOrderList('Pancakes', 140)">Add to Order List</button>
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

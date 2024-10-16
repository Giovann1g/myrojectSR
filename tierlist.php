<?php
// Підключення до бази даних
include 'config.php';

// Отримуємо список фільмів з бази даних
$sql = "SELECT * FROM films";
$result = $conn->query($sql);

// Перевіряємо на помилки підключення та запиту
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Обробка форми
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_name = $_POST['user_name'];
    $tier_list = $_POST['tier']; // Масив з вибраними Tier для фільмів

    if (!empty($user_name) && !empty($tier_list)) {
        // Зберігаємо Tier List користувача
        foreach ($tier_list as $film_id => $tier) {
            $sql_insert = "INSERT INTO user_tierlist (user_name, film_id, tier) VALUES ('$user_name', $film_id, '$tier')";
            $conn->query($sql_insert);
        }
        echo "<p>Tier List збережено успішно для користувача: $user_name</p>";
    } else {
        echo "<p>Будь ласка, введіть ім'я і заповніть Tier List</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tier List</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dragula/3.7.2/dragula.min.js"></script>
    <style>
        /* Оформлення заголовка */
        .header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }

        .tier-list-container {
            display: flex;
            flex-direction: column;
            max-width: 800px;
            margin: 0 auto;
        }

        .tier {
            display: flex;
            align-items: center;
            background-color: #333;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 8px;
        }

        .tier h2 {
            color: white;
            width: 50px;
            text-align: center;
            margin-right: 10px;
        }

        .tier-content {
            flex-grow: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            background-color: #222;
            padding: 10px;
            border-radius: 8px;
        }

        .film-card {
            width: 80px;
            height: 120px;
            background-color: white;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .film-card img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        /* Colors for different tiers */
        #tier-S {
            background-color: #ff7f7f;
        }
        #tier-A {
            background-color: #ffb97f;
        }
        #tier-B {
            background-color: #ffde7f;
        }
        #tier-C {
            background-color: #ffff7f;
        }
        #tier-D {
            background-color: #b7ff7f;
        }

        /* Навігаційна панель */
        nav {
            background-color: #333; /* Темний фон для меню */
            padding: 10px 0;
            text-align: center; /* Центрування меню */
        }

        nav a {
            color: white; /* Колір тексту */
            font-size: 18px; /* Розмір шрифту для навігації */
            text-decoration: none; /* Видалити підкреслення */
            margin: 0 15px; /* Проміжки між вкладками */
            padding: 8px 16px; /* Відступи для збільшення клікабельної області */
            transition: background-color 0.3s; /* Плавна анімація при наведенні */
        }

        nav a:hover {
            background-color: #555; /* Зміна фону при наведенні */
            border-radius: 5px; /* Закруглені кути при наведенні */
        }

        /* Стилі для фільмів для сортування в один рядок */
        .film-selection {
            margin-top: 20px;
            overflow-x: auto; /* Додаємо горизонтальну прокрутку */
        }

        #film-list {
            display: flex;
            gap: 10px;
            padding: 10px;
            background-color: #ddd;
            border-radius: 8px;
            white-space: nowrap; /* Забезпечує відображення в один рядок */
        }

        #film-list .film-card {
            flex: 0 0 auto; /* Робимо елементи нерозтяжними і в один рядок */
        }

        #film-list::-webkit-scrollbar {
            height: 8px;
        }

        #film-list::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 4px;
        }

        /* Футер */
        .footer {
            margin-top: 40px;
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Заголовок -->
    <div class="header">Мій Tier List</div>

    <!-- Панель навігації -->
    <nav>
        <a href="index.php">Каталог</a>
        <a href="tierlist.php">Мій Tier List</a>
    </nav>

    <!-- Форма для введення імені -->
    <form action="tierlist.php" method="POST">
        <label for="user_name">Ваше ім'я:</label>
        <input type="text" id="user_name" name="user_name" required>

        <div class="tier-list-container">
            <!-- Tier S -->
            <div class="tier" id="tier-S">
                <h2>S</h2>
                <div class="tier-content" id="tier-S-content"></div>
            </div>

            <!-- Tier A -->
            <div class="tier" id="tier-A">
                <h2>A</h2>
                <div class="tier-content" id="tier-A-content"></div>
            </div>

            <!-- Tier B -->
            <div class="tier" id="tier-B">
                <h2>B</h2>
                <div class="tier-content" id="tier-B-content"></div>
            </div>

            <!-- Tier C -->
            <div class="tier" id="tier-C">
                <h2>C</h2>
                <div class="tier-content" id="tier-C-content"></div>
            </div>

            <!-- Tier D -->
            <div class="tier" id="tier-D">
                <h2>D</h2>
                <div class="tier-content" id="tier-D-content"></div>
            </div>
        </div>

        <!-- Виведення фільмів для сортування в один рядок -->
        <div class="film-selection">
            <h3>Фільми для сортування:</h3>
            <div id="film-list">
                <?php
                // Перевіряємо чи отримали ми дані з бази
                if ($result && $result->num_rows > 0) {
                    // Виведення фільмів
                    while($row = $result->fetch_assoc()) {
                        echo "<div class='film-card' draggable='true' id='film_" . $row['id'] . "'>";
                        $poster = !empty($row['poster_url']) ? $row['poster_url'] : 'default_poster.png';
                        echo "<img src='" . $poster . "' alt='" . $row['title'] . "'>";
                        echo "</div>";
                    }
                } else {
                    echo "<p>Немає фільмів для сортування.</p>";
                }
                ?>
            </div>
        </div>

        <!-- Кнопка для збереження Tier List -->
        <button type="submit">Зберегти Tier List</button>
    </form>

    <!-- Футер -->
    <div class="footer">
        Це сторінка Олександра Кухарського
    </div>

    <script>
        // Initialize Dragula for dragging films to tiers
        dragula([document.getElementById('tier-S-content'), 
                 document.getElementById('tier-A-content'),
                 document.getElementById('tier-B-content'),
                 document.getElementById('tier-C-content'),
                 document.getElementById('tier-D-content'),
                 document.getElementById('film-list')]);

        // Додаємо приховані поля для фільмів і збереження їх в Tier List
        const form = document.querySelector('form');
        form.addEventListener('submit', () => {
            const tiers = ['S', 'A', 'B', 'C', 'D'];
            tiers.forEach(tier => {
                const tierContent = document.getElementById(`tier-${tier}-content`).children;
                Array.from(tierContent).forEach(filmCard => {
                    const filmId = filmCard.id.split('_')[1];
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = `tier[${filmId}]`;
                    input.value = tier;
                    form.appendChild(input);
                });
            });
        });
    </script>
</body>
</html>

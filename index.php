<?php
// Підключення до бази даних
include 'config.php';

// Отримуємо список фільмів з таблиці films
$sql = "SELECT * FROM films";
$result = $conn->query($sql);

// Перевіряємо на помилки підключення та запиту
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        .catalog {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .movie-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
            cursor: pointer;
        }

        .movie-card:hover {
            transform: translateY(-10px);
        }

        .movie-card img {
            width: 100%;
            height: auto;
        }

        .movie-details {
            padding: 15px;
        }

        .movie-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0 0 10px;
        }

        .movie-year {
            font-size: 14px;
            color: #777;
        }

        .movie-description {
            font-size: 14px;
            margin: 10px 0;
            color: #555;
        }

        .header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }

        /* Стилі для меню */
        nav {
            background-color: #333;
            padding: 10px 0;
            text-align: center;
        }

        nav a {
            color: white;
            font-size: 18px;
            text-decoration: none;
            margin: 0 15px;
            padding: 8px 16px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #555;
            border-radius: 5px;
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

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Каталог фільмів</title>
</head>
<body>
    <h1 class="header">Каталог фільмів</h1>

    <!-- Навігаційне меню -->
    <nav>
        <a href="index.php">Каталог</a>
        <a href="tierlist.php">Мій Tier List</a>
    </nav>

    <div class="catalog">
        <?php
        // Перевіряємо чи отримали ми дані з бази
        if ($result && $result->num_rows > 0) {
            // Виведення фільмів
            while($row = $result->fetch_assoc()) {
                echo "<a href='" . $row['imdb_url'] . "' target='_blank' class='movie-card'>";

                // Перевірка наявності постера
                $poster = !empty($row['poster_url']) ? $row['poster_url'] : 'default_poster.png';
                echo "<img src='" . $poster . "' alt='" . $row['title'] . "'>";

                echo "<div class='movie-details'>";
                echo "<div class='movie-title'>" . $row['title'] . "</div>";

                // Перевірка наявності року випуску
                if (!empty($row['release_year'])) {
                    echo "<div class='movie-year'>Рік випуску: " . $row['release_year'] . "</div>";
                }

                // Перевірка наявності опису
                if (!empty($row['description'])) {
                    echo "<div class='movie-description'>" . $row['description'] . "</div>";
                } else {
                    echo "<div class='movie-description'>Опис відсутній.</div>";
                }

                echo "</div>"; // Закриття movie-details
                echo "</a>"; // Закриття movie-card
            }
        } else {
            echo "<p>Немає фільмів у каталозі.</p>";
        }
        ?>
    </div>

    <!-- Футер -->
    <div class="footer">
        Це сторінка Олександра Кухарського
    </div>
</body>
</html>

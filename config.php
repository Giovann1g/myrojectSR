<?php
$servername = "localhost";
$username = "root"; // ваш користувач MySQL
$password = ""; // пароль MySQL, якщо є
$dbname = "films_info"; // ваша база даних

// Створюємо з'єднання
$conn = new mysqli($servername, $username, $password, $dbname);

// Перевіряємо з'єднання
if ($conn->connect_error) {
    die("З'єднання не вдалося: " . $conn->connect_error);
}
?>

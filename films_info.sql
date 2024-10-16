-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 16 2024 г., 20:42
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `films_info`
--

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `release_year` int(4) DEFAULT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  `imdb_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`id`, `title`, `description`, `release_year`, `poster_url`, `imdb_url`) VALUES
(1, 'Втеча з Шоушенка (The Shawshank Redemption)', 'це американський драматичний фільм 1994 року, заснований на новелі Стівена Кінга. Головний герой, Енді Дюфрейн, банкір, якого несправедливо засуджують до довічного ув\'язнення за вбивство його дружини та її коханця. Він потрапляє до жорстокої в\'язниці Шоушенк, де стикається з корумпованою системою і труднощами життя за ґратами.', 1994, 'https://m.media-amazon.com/images/M/MV5BMDAyY2FhYjctNDc5OS00MDNlLThiMGUtY2UxYWVkNGY2ZjljXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0111161/?ref_=chttp_t_1'),
(2, 'Хрещений батько (The Godfather)', 'Культовий американський кримінальний фільм 1972 року, режисера Френсіса Форда Копполи, заснований на романі Маріо П’юзо. Це історія про мафіозну родину Корлеоне в післявоєнній Америці.', 1972, 'https://m.media-amazon.com/images/M/MV5BM2E4MGU5ZmEtYzczZS00ZWJhLTkzMjAtZTIwZmE1YWFlZjZlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0068646/?ref_=chttp_t_2'),
(3, 'Темний лицар (The Dark Knight)', 'Це американський супергеройський фільм 2008 року режисера Крістофера Нолана, друга частина його трилогії про Бетмена. Фільм розповідає про боротьбу Бетмена (Брюса Вейна) із новим небезпечним ворогом — Джокером, який загрожує вивести місто Готем у хаос.', 2008, 'https://m.media-amazon.com/images/M/MV5BM2VkYjc4NDUtZDZhNC00YTQ3LTk5YjEtMWMxYzQyNWVhMTRlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0468569/?ref_=chttp_t_3'),
(4, 'Пригоди Паддінгтона (Paddington)', 'Це сімейна комедія, заснована на книгах Майкла Бонда про ведмедика Паддінгтона. Головний герой — маленький ведмедик з Перу, який приїжджає до Лондона в пошуках нового дому. Він отримав своє ім\'я від вокзалу Паддінгтон, на якому його випадково знаходить сім\'я Браунів. Вони вирішують прихистити ведмедика, хоч і не підозрюють, скільки пригод і комічних ситуацій чекає на них із таким незвичайним гостем.', 2014, 'https://m.media-amazon.com/images/M/MV5BMTAxOTMwOTkwNDZeQTJeQWpwZ15BbWU4MDEyMTI1NjMx._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt1109624/?ref_=tt_mv_close'),
(5, '12 розгніваних чоловіків (12 Angry Men)', 'Це американський драматичний фільм 1957 року, режисера Сідні Люмета. Сюжет розгортається в одній кімнаті засідань присяжних, де дванадцять чоловіків повинні ухвалити вердикт у справі про вбивство. Обвинувачений — молодий хлопець, якого звинувачують у вбивстві свого батька. Якщо присяжні визнають його винним, хлопця засудять до страти.', 1957, 'https://m.media-amazon.com/images/M/MV5BYjE4NzdmOTYtYjc5Yi00YzBiLWEzNDEtNTgxZGQ2MWVkN2NiXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0050083/?ref_=chttp_t_5'),
(6, 'Володар перснів: Повернення короля (The Lord of the Rings: The Return of the King)', 'Це епічний фентезійний фільм 2003 року, знятий Пітером Джексоном. Це третя і фінальна частина кінотрилогії, заснованої на однойменному романі Дж. Р. Р. Толкіна. Події фільму завершують масштабну історію про боротьбу добра і зла за контроль над Середзем\'ям.', 2003, 'https://m.media-amazon.com/images/M/MV5BMTZkMjBjNWMtZGI5OC00MGU0LTk4ZTItODg2NWM3NTVmNWQ4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0167260/?ref_=chttp_t_6'),
(7, 'Список Шиндлера (Schindler\'s List)', 'Це історичний драматичний фільм 1993 року, знятий Стівеном Спілбергом. Фільм заснований на реальних подіях і розповідає про Оскара Шиндлера, німецького бізнесмена, який врятував понад 1 100 євреїв під час Голокосту, наймаючи їх на роботу на своїх заводах.', 1993, 'https://m.media-amazon.com/images/M/MV5BNjM1ZDQxYWUtMzQyZS00MTE1LWJmZGYtNGUyNTdlYjM3ZmVmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0108052/?ref_=chttp_t_7'),
(8, 'Кримінальне чтиво (Pulp Fiction)', 'Це культовий американський кримінальний фільм 1994 року, знятий Квентіном Тарантіно. Фільм відомий своїм нелінійним сюжетом, який складається з кількох переплетених історій, що показують життя злочинців у Лос-Анджелесі. Відзначається стильними діалогами, чорним гумором і посиланнями на поп-культуру.', 1994, 'https://m.media-amazon.com/images/M/MV5BYzQ3MzAwYWEtMTY1OC00OWI1LWE3OGYtN2M3NWQyNTBjNGI0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0110912/?ref_=chttp_t_8'),
(9, 'Форрест Ґамп (Forrest Gump)', 'це драматичний фільм 1994 року, знятий режисером Робертом Земекісом, заснований на однойменному романі Вінстона Ґрума. Фільм розповідає історію життя простого і добросердого чоловіка на ім\'я Форрест Ґамп, якого зіграв Том Генкс. Незважаючи на обмежений інтелект (IQ 75), Форрест має неймовірно добре серце і живе унікальним життям, проходячи через визначні моменти в історії США другої половини XX століття.', 1994, 'https://m.media-amazon.com/images/M/MV5BNWJmYzU3YWYtMGM5Ny00ZGNmLWE4ZTMtNDM1NThiNDRlMzRmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0109830/?ref_=chttp_t_11'),
(10, 'Бійцівський клуб (Fight Club)', 'Культовий фільм 1999 року, знятий режисером Девідом Фінчером за однойменним романом Чака Паланіка. Головні ролі виконали Бред Пітт, Едвард Нортон і Гелена Бонем Картер. Цей фільм досліджує теми маскулінності, споживацтва, психічних розладів і відчуження в сучасному суспільстві.', 1999, 'https://m.media-amazon.com/images/M/MV5BNjdjMzgzMWItZDRjZS00NjM3LTg2ZTYtOWZiNmFlZDZhYWQ0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0137523/?ref_=chttp_t_13'),
(11, 'Початок (Inception)', 'Це науково-фантастичний трилер 2010 року, знятий режисером Крістофером Ноланом. Головні ролі виконали Леонардо Ді Капріо, Джозеф Гордон-Левітт, Том Гарді, Еллен Пейдж (зараз Елліот Пейдж) і Маріон Котіяр. Фільм досліджує складні теми підсвідомості, реальності та сновидінь.', 2010, 'https://m.media-amazon.com/images/M/MV5BNDhlYjg4N2QtYzVkZi00MmJmLWFlNDQtYWZkZDFjYTgxZjI4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt1375666/?ref_=chttp_t_14'),
(12, 'Матриця (The Matrix)', 'Це культовий науково-фантастичний фільм 1999 року, знятий режисерами-сценаристами сестрами (на той час братами) Вачовські. Фільм поєднує футуристичні ідеї про штучний інтелект і віртуальну реальність із філософськими концепціями про природу реальності. Головні ролі виконали Кіану Рівз, Лоуренс Фішберн, Керрі-Енн Мосс і Г’юго Вівінг.', 1999, 'https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.imdb.com/title/tt0133093/?ref_=chttp_t_16');

-- --------------------------------------------------------

--
-- Структура таблицы `user_tierlist`
--

CREATE TABLE `user_tierlist` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `film_id` int(11) NOT NULL,
  `tier` varchar(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_tierlist`
--

INSERT INTO `user_tierlist` (`id`, `user_name`, `film_id`, `tier`, `created_at`) VALUES
(1, 'STANISLAV', 2, 'S', '2024-10-16 18:11:40'),
(2, 'STANISLAV', 10, 'S', '2024-10-16 18:11:40'),
(3, 'STANISLAV', 9, 'A', '2024-10-16 18:11:40'),
(4, 'STANISLAV', 4, 'A', '2024-10-16 18:11:40'),
(5, 'STANISLAV', 7, 'B', '2024-10-16 18:11:40'),
(6, 'STANISLAV', 3, 'B', '2024-10-16 18:11:40'),
(7, 'STANISLAV', 5, 'C', '2024-10-16 18:11:40'),
(8, 'STANISLAV', 11, 'C', '2024-10-16 18:11:40'),
(9, 'STANISLAV', 12, 'C', '2024-10-16 18:11:40'),
(10, 'STANISLAV', 6, 'D', '2024-10-16 18:11:40'),
(11, 'STANISLAV', 1, 'D', '2024-10-16 18:11:40'),
(12, 'STANISLAV', 8, 'D', '2024-10-16 18:11:40'),
(13, 'Sasha', 8, 'S', '2024-10-16 18:12:25'),
(14, 'Sasha', 7, 'S', '2024-10-16 18:12:25'),
(15, 'Sasha', 2, 'A', '2024-10-16 18:12:25'),
(16, 'Sasha', 3, 'C', '2024-10-16 18:12:25'),
(17, 'Sasha', 6, 'C', '2024-10-16 18:12:25'),
(18, 'Sasha', 9, 'C', '2024-10-16 18:12:25'),
(19, 'Sasha', 10, 'C', '2024-10-16 18:12:25'),
(20, 'Sasha', 11, 'C', '2024-10-16 18:12:25'),
(21, 'Sasha', 1, 'D', '2024-10-16 18:12:25'),
(22, 'Sasha', 4, 'D', '2024-10-16 18:12:25'),
(23, 'Sasha', 5, 'D', '2024-10-16 18:12:25'),
(24, 'Sasha', 12, 'D', '2024-10-16 18:12:25'),
(25, 'Sasha', 8, 'S', '2024-10-16 18:15:34'),
(26, 'Sasha', 7, 'S', '2024-10-16 18:15:34'),
(27, 'Sasha', 2, 'A', '2024-10-16 18:15:34'),
(28, 'Sasha', 3, 'C', '2024-10-16 18:15:34'),
(29, 'Sasha', 6, 'C', '2024-10-16 18:15:34'),
(30, 'Sasha', 9, 'C', '2024-10-16 18:15:34'),
(31, 'Sasha', 10, 'C', '2024-10-16 18:15:34'),
(32, 'Sasha', 11, 'C', '2024-10-16 18:15:34'),
(33, 'Sasha', 1, 'D', '2024-10-16 18:15:34'),
(34, 'Sasha', 4, 'D', '2024-10-16 18:15:34'),
(35, 'Sasha', 5, 'D', '2024-10-16 18:15:34'),
(36, 'Sasha', 12, 'D', '2024-10-16 18:15:34'),
(37, 'Oleksiy Pryadko', 2, 'S', '2024-10-16 18:31:42'),
(38, 'Oleksiy Pryadko', 4, 'S', '2024-10-16 18:31:42'),
(39, 'Oleksiy Pryadko', 6, 'A', '2024-10-16 18:31:42'),
(40, 'Oleksiy Pryadko', 10, 'A', '2024-10-16 18:31:42'),
(41, 'Oleksiy Pryadko', 5, 'B', '2024-10-16 18:31:42'),
(42, 'Oleksiy Pryadko', 9, 'B', '2024-10-16 18:31:42'),
(43, 'Oleksiy Pryadko', 8, 'C', '2024-10-16 18:31:42'),
(44, 'Oleksiy Pryadko', 12, 'C', '2024-10-16 18:31:42'),
(45, 'Oleksiy Pryadko', 3, 'C', '2024-10-16 18:31:42'),
(46, 'Oleksiy Pryadko', 1, 'D', '2024-10-16 18:31:42'),
(47, 'Oleksiy Pryadko', 7, 'D', '2024-10-16 18:31:42'),
(48, 'Oleksiy Pryadko', 11, 'D', '2024-10-16 18:31:42');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_tierlist`
--
ALTER TABLE `user_tierlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `user_tierlist`
--
ALTER TABLE `user_tierlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `user_tierlist`
--
ALTER TABLE `user_tierlist`
  ADD CONSTRAINT `user_tierlist_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

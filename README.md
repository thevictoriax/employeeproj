# Завдання 1

Спроектуйте класи, вказані нижче. У кожному з них визначте метод виведення в потік, 
методи порівняння, виконання арифметичних дій. Оголошення цих класів розташуйте у 
окремому пакеті. Інформацію про екземпляри класів задайте в Playground, прочитайте з 
клавіатури або з файлу. Функціонал класів перевірте за допомогою модульних тестів.

1. Сутність «працівник» характеризується такими даними: прізвище, стаж, оплата за 
годину та мінімальна кількість годин, які він має відпрацювати за тиждень. 
Працівник-програміст додатково пам’ятає кількість насправді відпрацьованих 
годин. Його зарплата зменшується на 25%, якщо відпрацьовано менше за норму. 
Працівник-керівник працює 40 годин на тиждень, має певну кількість підлеглих, 
отримує 1% надбавки за кожного з них. Оголосіть класи, що моделюють описані 
сутності. Екземпляри цих класів вміють повідомляти прізвище, стаж, зарплату за 
тиждень. Порівнюють працівників за величиною заробітної плати.

2. Створіть п’ять різних працівників та занесіть їх у контейнер. Забезпечте можливість 
вводити в режимі діалогу інформацію про нового працівника і долучати його до 
колекції інших. Надрукуйте всі елементи контейнера. Знайдіть найоплачуванішого 
працівника. Чи це програміст? Продемонструйте використання арифметичних 
операторів. Створіть дві нові колекції, що містять окремо керівників, і окремо 
програмістів.

3. Продемонструйте зберігання створених об’єктів до файлу (до різних файлів у різних 
форматах), до бази даних (наявність бази можна імітувати в пам’яті) та завантаження 
їх з файлу, з бази. Робота з БД - завдання на майбутнє


## Розподіл завдань
1 пункт + створення репозиторію — @thevictoriax

2 пункт — @Olesia32

3 пункт + читання екземплярів з файлу та модульні тести — @BoshkaS



# Завдання 2
У попередньому завданні ви створили пакет з ієрархією класів Працівник, Програміст, 
Керівник. Доповніть пакет оголошенням класу Компанія. Компанія має назву, зберігає 
колекцію працівників, наймає їх на роботу та звільняє; вміє виводити на друк інформацію про 
себе і своїх працівників (разом про всіх або про окрему категорію); вміє обчислювати суму 
коштів, потрібних на оплату праці; перевіряє, чи всі програмісти виконують норму, чи 
кількість підлеглих у керівників збігається з кількістю програмістів компанії. Іноді компанія 
переглядає величину оплати своїх працівників, відзначає найоплачуванішого тощо. Ви 
можете доповнити функціонал компанії на власний розсуд. Правильність роботи методів 
класу перевірте за допомогою модульних тестів.

Побудуйте віконний інтерфейс для взаємодії з компанією і працівниками. Головне 
вікно мало б відображати інформацію про компанію та її працівників, надавати доступ через 
візуальні засоби (меню, кнопки тощо) до функціоналу компанії. Для отримання від користувача інформації про нового працівника створіть власне вікно діалогу. Його вміст мав би 
залежати від типу працівника. Забезпечте можливість зберігати компанію до файлу (у різних 
форматах) та завантажувати її з файлу, зберігати до бази даних і завантажувати звідти. Щоб 
обрати ім’я файлу, використайте стандартний діалог.


## Розподіл завдань
Створення нового класу та його методів — @thevictoriax

Створення бази даних та написання методів для роботи з нею, створення віконного інтерфейсу (головна сторінка та сторінка конкретної компанії) — @Olesia32

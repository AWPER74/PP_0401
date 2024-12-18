# Лабораторная работа №1: Информационная система туристического агентства

Тема: Создание базы данных для информационной системы туристического агентства.

Эта лабораторная работа посвящена проектированию и реализации базы данных для управления информацией туристического агентства. База данных включает в себя пять таблиц, связанных между собой для обеспечения целостности и эффективности поиска данных.

## Структура базы данных

База данных состоит из следующих таблиц:

• Пансионаты:
  * Название пансионата (TEXT)
  * Адрес (TEXT)
  * Город (TEXT)
  * Страна (TEXT)
  * Телефон (TEXT)
  * Описание территории (TEXT)
  * Кол-во комнат (INTEGER)
  * Наличие бассейна (BOOLEAN)
  * Наличие медицинских услуг (BOOLEAN)
  * Наличие спа-салона (BOOLEAN)
   Уровень пансионата (TEXT) (например, "эконом", "стандарт", "люкс")*
  * Расстояние до моря (REAL)

• Вид жилья:
   Название (TEXT) (например, "Дом", "Бунгало", "Квартира", "Номер одноместный", "Номер двухместный")*
   Категория жилья (TEXT) (например, "Люкс", "Полулюкс", "Стандарт")*
  * Пансионат (INTEGER, foreign key to Пансионаты)
  * Описание условий проживания (TEXT)
  * Цена за номер в сутки (REAL)

• Туры:
   Название тура (TEXT) (например, "Тур в Европу", "Тур в Среднюю Азию", "Тур в Тибет")*
  * Вид транспорта (TEXT)
   Категория жилья на ночь (TEXT) (например, "Гостиница", "Отель", "Палатка")*
   Вид питания (TEXT) (например, "Одноразовое", "Двухразовое", "Трехразовое", "Завтраки")*
  * Цена тура в сутки (REAL)

• Клиенты:
  * Фамилия (TEXT)
  * Имя (TEXT)
  * Отчество (TEXT)
  * Паспортные данные (TEXT)
  * Дата рождения (DATE)
  * Адрес (TEXT)
  * Город (TEXT)
  * Телефон (TEXT)

• Путевки:
  * Клиент (INTEGER, foreign key to Клиенты)
  * Пансионат (INTEGER, foreign key to Пансионаты)
  * Вид жилья (INTEGER, foreign key to Вид жилья)
  * Дата заезда (DATE)
  * Дата отъезда (DATE)
  * Наличие детей (BOOLEAN)
  * Наличие мед. страховки (BOOLEAN)
  * Кол-во человек (INTEGER)
  * Цена (REAL)
  * Сумма (REAL)


## Выполнение работы

1. Создание базы данных и таблиц: База данных была создана и заполнены таблицы, соответствующие описанной выше структуре

2. Добавление произвольных данных: Таблицы были заполнены произвольными данными для демонстрации функциональности.

3. Создание репозитория и загрузка материалов: Весь проект, включая схему базы данных и скрипты для её создания и заполнения данными, загружен в репозиторий.

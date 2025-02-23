﻿#language: ru

@tree

Функционал: Проверка расчта суммы в табличной части документа Заказ

Как Менеджер по продажам я хочу
изменять цену или количество и иметь верный результат по сумме 
чтобы быстро и корректно получать результат по документу   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Изменение цены и количества
И В командном интерфейсе я выбираю "Продажи" "Заказы"
Тогда открылось окно "Заказы товаров"
И в таблице 'Список' я выбираю текущую строку
Тогда открылось окно "Заказ * от *"
И для каждой строки таблицы "Товары" я выполняю
И в таблице 'Товары' я выбираю текущую строку
И я запоминаю значение поля "Количество" как "$Сумма$" //умножить на значение поля "Цена" как "$Сумма$"
И поле таблицы "Товары" "Сумма" равно переменной "$Сумма$"



//Если ЗначениеПоля "ТоварыСумма" равно 0 тогда //не равно (ЗначениеПоля "Количество" * ЗначениеПоля "Цена") тогда
//И я регистрирую ошибку "Описание ошибки" по данным исключения


//И я запоминаю значение таблицы "Товары" как "ЗначенияТЧ"
//	| 'Количество' |
//	| 'Цена' |
//	| 'Сумма' |
//И ЗначениеПеременной "$Сумма$" равно 20 * 100;
//Если элемент формы с именем "ТоварыСумма" имеет значение 0 тогда

//И в таблице 'Товары' я перехожу к строке:
//	| "Количество" | "Сумма"    | "Товар"   | "Цена"  |
//	| "*"		   | "*"        | "Масло"   | "*" |
//И в таблице 'Товары' я выбираю текущую строку
//И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10"
//И в таблице 'Товары' я завершаю редактирование строки
//И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
//И в таблице 'Товары' я выбираю текущую строку
//И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "50,00"
//И в таблице 'Товары' я завершаю редактирование строки
//И в таблице 'Товары' я перехожу к строке:
//	| "Количество" | "Сумма"    | "Товар"   | "Цена"  |
//	| "*"          | "*"        | "Ряженка" | "*"     |
//И в таблице 'Товары' я выбираю текущую строку
//И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "70,00"
//И в таблице 'Товары' я завершаю редактирование строки
//И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
//И в таблице 'Товары' я выбираю текущую строку
//И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "4"
//И в таблице 'Товары' я завершаю редактирование строки
//И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И Я закрываю окно "Заказ * от *"
И я жду закрытия окна "Заказ * от * *" в течение 20 секунд
И я закрываю все окна клиентского приложения


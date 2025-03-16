﻿#language: ru

@tree

Функционал: <описание фичи>

Как тестировщик я хочу
убедиться в работоспособности документа Продажи 
чтобы убедиться в его работоспособности   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 01_10 Тестирование документа Продажи

* Создание нового документа
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	* Заполнение шапки
		И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
		* Проверка заполнения вида цен при изменении покупателя
			И я нажимаю кнопку выбора у поля с именем 'Покупатель'
			Тогда открылось окно "Контрагенты"
			И в таблице 'Список' я перехожу к строке:
				| "Код"       | "Наименование" |
				| "000000006" | "Пантера АО"   |
			И в таблице 'Список' я выбираю текущую строку
			Тогда элемент формы с именем 'ВидЦен' стал равен "Закупочная"

			И я нажимаю кнопку выбора у поля с именем 'Покупатель'
			Тогда открылось окно "Контрагенты"
			И в таблице 'Список' я перехожу к строке:
				| "Код"       | "Наименование" |
				| "000000012" | "Мосхлеб ОАО"  |
			И в таблице 'Список' я выбираю текущую строку
			Тогда элемент формы с именем 'ВидЦен' стал равен "Оптовая"	
		И из выпадающего списка с именем 'Склад' я выбираю точное значение "Склад отдела продаж"
	* Заполнение табличной части
		* Заполнение товара
			И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
			И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
			И в таблице 'Список' я перехожу к строке:
				| "Код"       | "Наименование" |
				| "000000011" | "Продукты"     |
			И в таблице 'Список' я перехожу на один уровень вниз
			И в таблице 'Список' я перехожу к строке:
				| "Артикул" | "Код"       | "Наименование" |
				| "Т78"     | "000000032" | "Торт "        |
			И в таблице 'Список' я выбираю текущую строку
			И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
			И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2,00"
			И в таблице 'Товары' я завершаю редактирование строки
			Тогда таблица 'Товары' стала равной:
				| 'N' | 'Товар'    | 'Цена'   | 'Количество' | 'Сумма'  |
				| '1' | 'Торт '    | '200,00' | '2,00'       | '400,00' |
			Тогда элемент формы с именем 'ТоварыИтогКоличество' стал равен "2"
			Тогда элемент формы с именем 'ТоварыИтогСумма' стал равен "400"	
		* Заполнение услуги	
			И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
			И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
			И в таблице 'Список' я перехожу к строке:
				| "Код"       | "Наименование" |
				| "000000036" | "Услуги"       |
			И в таблице 'Список' я перехожу на один уровень вниз
			И в таблице 'Список' я перехожу к строке:
				| "Код"       | "Наименование" |
				| "000000037" | "Доставка"     |
			И в таблице 'Список' я выбираю текущую строку
			Тогда таблица 'Товары' стала равной:
				| 'N' | 'Товар'    | 'Цена'   | 'Количество' | 'Сумма'  |
				| '1' | 'Торт '    | '200,00' | '2,00'       | '400,00' |
				| '2' | 'Доставка' | '200,00' | ''           | '200,00' |	
			Тогда элемент формы с именем 'ТоварыИтогКоличество' стал равен "3"
			Тогда элемент формы с именем 'ТоварыИтогСумма' стал равен "600"	
	И я нажимаю на кнопку с именем 'ФормаПровести'		
* Проверка регистров
	И В текущем окне я нажимаю кнопку командного интерфейса "Основное"
	И я запоминаю значение поля "Дата" как "ДатаДокумента"
	И я запоминаю значение поля "Номер" как "НомерДокумента"
	* Регистр взаиморасчетов с контрагентами 
		И В текущем окне я нажимаю кнопку командного интерфейса "Регистр взаиморасчетов с контрагентами"
		Тогда таблица 'Список' стала равной:
			| 'Период'          | 'Регистратор'                                 | 'Номер строки' | 'Контрагент'  | 'Сумма'  | 'Валюта' |
			| '$ДатаДокумента$' | 'Продажа $НомерДокумента$ от $ДатаДокумента$' | '1'            | 'Мосхлеб ОАО' | '600,00' | ''       |
	* Регистр продаж 
		И В текущем окне я нажимаю кнопку командного интерфейса "Регистр продаж"
		Тогда таблица 'Список' стала равной:
			| 'Период'          | 'Регистратор'                                 | 'Номер строки' | 'Покупатель'  | 'Товар'    | 'Количество' | 'Сумма'  |
			| '$ДатаДокумента$' | 'Продажа $НомерДокумента$ от $ДатаДокумента$' | '1'            | 'Мосхлеб ОАО' | 'Торт '    | '2,00'       | '400,00' |
			| '$ДатаДокумента$' | 'Продажа $НомерДокумента$ от $ДатаДокумента$' | '2'            | 'Мосхлеб ОАО' | 'Доставка' | '1,00'       | '200,00' |
	* Регистр товарных запасов 
		И В текущем окне я нажимаю кнопку командного интерфейса "Регистр товарных запасов"
		Тогда таблица 'Список' стала равной:
			| 'Период'          | 'Регистратор'                                 | 'Номер строки' | 'Товар' | 'Склад'               | 'Количество' |
			| '$ДатаДокумента$' | 'Продажа $НомерДокумента$ от $ДатаДокумента$' | '1'            | 'Торт ' | 'Склад отдела продаж' | '2,00'       |
* Проверка печатных форм				
	И В текущем окне я нажимаю кнопку командного интерфейса "Основное"
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда открылось окно "Таблица"
	И я жду когда в табличном документе "SpreadsheetDocument" заполнится ячейка "R11C5" в течение 20 секунд
	Дано Табличный документ "SpreadsheetDocument" равен макету "Расход товара" по шаблону					
								
	


	
			
	

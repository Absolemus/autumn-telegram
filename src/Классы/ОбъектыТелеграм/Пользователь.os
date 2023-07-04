#Область Переменные

Перем ИД; // ID - Число
Перем ЭтоБот; // isbot - Булево
Перем Имя; // firstname - Строка
Перем Фамилия; // lastname - Строка
Перем ИмяПользователя; // username - Строка
Перем Язык; // languagecode - Строка
Перем ЭтоПремиум; // ispremium - Булево
Перем ДобавленоВМенюПриложений; // addedtoattachmentmenu - Булево
Перем МожетПрисоединятьсяКГруппам; // canjoingroups - Булево
Перем МожетЧитатьВсюИсториюСообщений; // canreadallgroupmessages - Булево
Перем ПоддерживаетВнутренниеЗапросы; // supportsinlinequeries - Булево

#КонецОбласти

#Область ОбработкаСобытий

&ОбъектТелеграм
Процедура ПриСозданииОбъекта()
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

Функция КакСтрока() Экспорт

КонецФункции

Функция Заполнить(Данные) Экспорт
	Для Каждого Элемент Из Данные Цикл
		Если Элемент.Ключ = "id" Тогда
			ИД = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "is_bot" Тогда
			ЭтоБот = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "first_name" Тогда
			Имя = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "last_name" Тогда
			Фамилия = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "username" Тогда
			ИмяПользователя = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "language_code" Тогда
			Язык = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "is_premium" Тогда
			ЭтоПремиум = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "added_to_attachment_menu" Тогда
			ДобавленоВМенюПриложений = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "can_join_groups" Тогда
			МожетПрисоединятьсяКГруппам = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "can_read_all_group_messages" Тогда
			МожетЧитатьВсюИсториюСообщений = Элемент.Значение;
		ИначеЕсли Элемент.Ключ = "supports_inline_queries" Тогда
			ПоддерживаетВнутренниеЗапросы = Элемент.Значение;
		КонецЕсли;
	КонецЦикла;

	Возврат ЭтотОбъект;
КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#КонецОбласти
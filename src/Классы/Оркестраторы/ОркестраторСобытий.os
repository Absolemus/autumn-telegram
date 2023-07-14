#Использовать autumn

#Область Переменные

&Пластилин(Значение = "ХранительСобытий", Тип = "Массив")
Перем ХранителиСобытий;
&Пластилин Перем Поделка;
Перем События; 

#КонецОбласти

#Область ОбработчикиСобытий

&Желудь
Процедура ПриСозданииОбъекта()
	События = Новый ТаблицаЗначений;
	События.Колонки.Добавить("Имя");
	События.Колонки.Добавить("Метод");
	События.Колонки.Добавить("Желудь");
	События.Колонки.Добавить("ВозвращаемыйТип");
КонецПроцедуры

Процедура ПриЗапускеПриложения() Экспорт
	Для Каждого ХранительСобытий Из ХранителиСобытий Цикл
		РефлекторОбъекта = РефлекторЖелудя(ХранительСобытий);
		РефлекторСобытия = РефлекторОбъекта.ПолучитьТаблицуМетодов("Событие");
		Для Каждого Событие Из РефлекторСобытия Цикл
			СобытиеАннотация = РаботаСАннотациями.ПолучитьАннотацию(Событие, "Событие");
			ИмяМетода = РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(СобытиеАннотация);
			ВозвращаемыйТип = РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(
				СобытиеАннотация, 
				"ВозвращаемыйТип", 
				Неопределено, 
				Истина
			);

			НовыйСобытие = События.Добавить();
			НовыйСобытие.Имя = Событие.Имя;
			НовыйСобытие.Метод = ИмяМетода;
			НовыйСобытие.Желудь = ХранительСобытий;
			НовыйСобытие.ВозвращаемыйТип = ВозвращаемыйТип;
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Вызов метода событие
// Параметры:
// 		ВходящееСообщение - см. ВходящееСообщение
Процедура ВызватьМетод(ВходящееСообщение) Экспорт
	Если ТипЗнч(ВходящееСообщение) = Тип("Ошибка") Тогда
		ИмяМетода = "Ошибка";
	ИначеЕсли ЭтоИсправление(ВходящееСообщение) Тогда
		ИмяМетода = "Исправление";
	ИначеЕсли ЭтоКоманда(ВходящееСообщение) Тогда
		ИмяМетода = Сред(ВходящееСообщение.Сообщение.Текст, 2);
	Иначе
		ИмяМетода = "";
	КонецЕсли;

	Инфо = События.Найти(ИмяМетода, "Метод");
	Если Инфо = Неопределено Тогда
		ВызватьИсключение СтрШаблон("Метод %1 не найден", ИмяМетода);
	Иначе
		Рефлектор = Новый Рефлектор;
		МассивПараметров = Новый Массив;
		МассивПараметров.Добавить(ВходящееСообщение);
		Если Не Инфо.ВозвращаемыйТип = Неопределено Тогда
			ИсходящееСообщение = Поделка.НайтиЖелудь(Инфо.ВозвращаемыйТип);
			МассивПараметров.Добавить(ИсходящееСообщение);
		КонецЕсли;

		Рефлектор.ВызватьМетод(Инфо.Желудь, Инфо.Имя, МассивПараметров);
		
		ИсходящееСообщение.Отправить();
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция РефлекторЖелудя(Желудь)
	Возврат Новый РефлекторОбъекта(ТипЗнч(Желудь));
КонецФункции

Функция ЭтоКоманда(ВходящееСообщение)
	Возврат СтрНайти(ВходящееСообщение.Сообщение.Текст, "/") = 1;
КонецФункции

Функция ЭтоИсправление(ВходящееСообщение)
	Возврат ЗначениеЗаполнено(ВходящееСообщение.ОтредактированноеСообщение.Текст);
КонецФункции

#КонецОбласти
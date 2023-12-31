#Область Переменные

&Пластилин Перем Поделка;
&Пластилин Перем ОркестраторСобытий;
&Пластилин Перем Ошибка;

#КонецОбласти

#Область ОбработчикиСобытий

&Желудь
&Прозвище("Контроллер")
&Контроллер
Процедура ПриСозданииОбъекта()
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

&ТочкаМаршрута("/telegram")
Процедура ТочкаМаршрута(Запрос, Ответ, Сессия) Экспорт
	ВходящееСообщение = Поделка.НайтиЖелудь("ВходящееСообщение");
	Попытка
		ВходящееСообщение.КакОбъект(Запрос.Тело);
		ОркестраторСобытий.ВызватьМетод(ВходящееСообщение);
	Исключение
		Ошибка.Ошибка = ИнформацияОбОшибке();
		Ошибка.ВходящееСообщение = ВходящееСообщение;
		ОркестраторСобытий.ВызватьМетод(Ошибка);
	КонецПопытки;
КонецПроцедуры

#КонецОбласти
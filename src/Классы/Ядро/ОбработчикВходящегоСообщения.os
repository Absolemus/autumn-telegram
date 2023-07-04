#Область Переменные

&Пластилин Перем Обновление;
&Пластилин Перем ОркестраторСобытий;
&Пластилин Перем ОркестраторНавыков;

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
	ВходящееСообщение = Обновление.КакОбъект(Запрос.Тело);
	Параметры = Новый Соответствие();
	Параметры.Вставить("ВходящееСообщение", ВходящееСообщение);
	Параметры.Вставить("Оркестратор", ОркестраторНавыков);
	ОркестраторСобытий.ВызватьМетод("ЭхоБот", Параметры);
КонецПроцедуры

#КонецОбласти
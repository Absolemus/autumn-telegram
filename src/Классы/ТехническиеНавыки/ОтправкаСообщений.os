#Область Переменные

&Пластилин
Перем Почтальон; 

#КонецОбласти

#Область ОбработчикиСобытий

&ХранительНавыков
Процедура ПриСозданииОбъекта()
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

&Навык("sendMessage")
// Установка хука
// Возвращаемое значение:
// 		Ответ - см. КоннекторHTTP.ПодготовленныйОтвет		
Функция ОтправитьСообщение(Сообщение) Экспорт
	Почтальон.УстановитьМетод("sendMessage");
	Почтальон.УстановитьПараметр("chat_id", Сообщение.chat_id);
	Почтальон.УстановитьПараметр("text", Сообщение.text);

	Возврат Почтальон.Отправить();
КонецФункции

#КонецОбласти
﻿&НаКлиенте
Перем КонтекстЯдра;
&НаКлиенте
Перем СтатусыРезультатаТестирования;
&НаКлиенте
Перем ФлагОтрицанияДляСообщения;

// { Plugin interface
&НаКлиенте
Функция ОписаниеПлагина(ВозможныеТипыПлагинов) Экспорт
	Возврат ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов);
КонецФункции

&НаСервере
Функция ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов)
	Возврат ЭтотОбъектНаСервере().ОписаниеПлагина(ВозможныеТипыПлагинов);
КонецФункции

&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
КонецПроцедуры

// } Plugin interface

&НаКлиенте
Функция Что(Знач ПроверяемоеЗначениеПараметр, Знач Сообщение = "") Экспорт
	
	Объект.ПроверяемоеЗначение = ПроверяемоеЗначениеПараметр;
	Объект.ДопСообщениеОшибки = Сообщение;
	Объект.ФлагОтрицания = Ложь;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Не_() Экспорт
	Объект.ФлагОтрицания = Истина;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЭтоНе() Экспорт
	Возврат Не_();
КонецФункции

&НаКлиенте
Функция Метод(Знач ИмяМетода, Знач ПараметрыМетода = Неопределено) Экспорт
	Объект.ИмяМетода = ИмяМетода;
	Объект.ПараметрыМетода = ПараметрыМетода;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЭтоИстина() Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение = Истина) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Формат(Объект.ПроверяемоеЗначение, "БЛ=Ложь; БИ=Истина"), "является ИСТИНОЙ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьИстина() Экспорт
	Возврат ЭтоИстина();
КонецФункции

&НаКлиенте
Функция ЭтоЛожь() Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение = Ложь) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Формат(Объект.ПроверяемоеЗначение, "БЛ=Ложь; БИ=Истина"), "является ЛОЖЬЮ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьЛожь() Экспорт
	Возврат ЭтоЛожь();
КонецФункции

&НаКлиенте
Функция Равно(Знач ОжидаемоеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение = ОжидаемоеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "РАВНО (" + ОжидаемоеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Больше(Знач МеньшееЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение > МеньшееЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "БОЛЬШЕ (" + МеньшееЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция БольшеИлиРавно(Знач МеньшееИлиРавноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение >= МеньшееИлиРавноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "БОЛЬШЕ ИЛИ РАВНО (" + МеньшееИлиРавноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Минимум(Знач МинимальноеЗначение) Экспорт
	Возврат БольшеИлиРавно(МинимальноеЗначение);
КонецФункции

&НаКлиенте
Функция МеньшеИлиРавно(Знач БольшееИлиРавноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение <= БольшееИлиРавноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "МЕНЬШЕ ИЛИ РАВНО (" + БольшееИлиРавноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Максимум(Знач МаксимальноеЗначение) Экспорт
	Возврат МеньшеИлиРавно(МаксимальноеЗначение);
КонецФункции

&НаКлиенте
Функция Меньше(Знач БольшееЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение < БольшееЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "МЕНЬШЕ (" + БольшееЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Заполнено() Экспорт
	Если Не ЛогическоеВыражениеВерно(ЗначениеЗаполнено(Объект.ПроверяемоеЗначение)) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "является ЗАПОЛНЕННЫМ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Существует() Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение <> Неопределено И Объект.ПроверяемоеЗначение <> Null) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "СУЩЕСТВУЕТ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЭтоНеопределено() Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение = Неопределено) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "является НЕОПРЕДЕЛЕНО.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьНеопределено() Экспорт
	Возврат ЭтоНеопределено();
КонецФункции

&НаКлиенте
Функция ЭтоNull() Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение = Null) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "является NULL.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьNull() Экспорт
	Возврат ЭтоNull();
КонецФункции

&НаКлиенте
Функция ИмеетТип(Знач ТипИлиИмяТипа) Экспорт
	ОжидаемыйТип = ?(ТипЗнч(ТипИлиИмяТипа) = Тип("Строка"), Тип(ТипИлиИмяТипа), ТипИлиИмяТипа);
	ТипПроверяемогоЗначения = ТипЗнч(Объект.ПроверяемоеЗначение);
	Если Не ЛогическоеВыражениеВерно(ТипПроверяемогоЗначения = ОжидаемыйТип) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке("тип - " + ТипПроверяемогоЗначения, "имеет тип (" + ОжидаемыйТип + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Между(Знач НачальноеЗначение, Знач КонечноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(Объект.ПроверяемоеЗначение >= НачальноеЗначение И Объект.ПроверяемоеЗначение <= КонечноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Объект.ПроверяемоеЗначение, "МЕЖДУ (" + НачальноеЗначение + ") и (" + КонечноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Содержит(Знач ИскомоеЗначение) Экспорт
	
	Перем ИскомоеЗначениеНайдено;
	
	ПроверяемоеЗначение = Объект.ПроверяемоеЗначение;
	ДопСообщениеОшибки = Объект.ДопСообщениеОшибки;
	ТипПроверяемоегоЗначения = ТипЗнч(Объект.ПроверяемоеЗначение);
	Если ТипПроверяемоегоЗначения = Тип("Строка") Тогда
		Если СтрЧислоСтрок(ИскомоеЗначение) = 1 Тогда
			ИскомоеЗначениеНайдено = Найти(ПроверяемоеЗначение, ИскомоеЗначение) > 0;
		Иначе
			ПроверитьЧтоМногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(ПроверяемоеЗначение, ИскомоеЗначение, ФорматДСО(ДопСообщениеОшибки));
			ИскомоеЗначениеНайдено = Истина;
		КонецЕсли;
		Возврат ЭтаФорма;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("Массив") Или ТипПроверяемоегоЗначения = Тип("ФиксированныйМассив") Тогда
		ИскомоеЗначениеНайдено = ПроверяемоеЗначение.Найти(ИскомоеЗначение) <> Неопределено;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("Структура") Или ТипПроверяемоегоЗначения = Тип("ФиксированнаяСтруктура")
			Или ТипПроверяемоегоЗначения = Тип("Соответствие") Или ТипПроверяемоегоЗначения = Тип("ФиксированноеСоответствие") Тогда
		Для каждого КлючЗначение Из ПроверяемоеЗначение Цикл
			ИскомоеЗначениеНайдено = КлючЗначение.Значение = ИскомоеЗначение;
			Если ИскомоеЗначениеНайдено Тогда
				Прервать;
			КонецЕсли;
		КонецЦикла;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("СписокЗначений") Тогда
		ИскомоеЗначениеНайдено = ПроверяемоеЗначение.НайтиПоЗначению(ИскомоеЗначение) <> Неопределено;
	КонецЕсли;

	Если ИскомоеЗначениеНайдено = Неопределено Тогда
		СообщениеОшибки = "Утверждение ""Содержит"" не умеет работать с типом <" + ТипПроверяемоегоЗначения + ">." + ФорматДСО(ДопСообщениеОшибки);
		ВызватьИсключение СообщениеОшибки;
	КонецЕсли;

	Если Не ЛогическоеВыражениеВерно(ИскомоеЗначениеНайдено) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "СОДЕРЖИТ (" + ИскомоеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ИмеетДлину(Знач ОжидаемаяДлина) Экспорт
	Перем ФактическаяДлина;

	ТипПроверяемоегоЗначения = ТипЗнч(Объект.ПроверяемоеЗначение);
	Если ТипПроверяемоегоЗначения = Тип("Строка") Тогда
		ФактическаяДлина = СтрДлина(Объект.ПроверяемоеЗначение);
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("Массив") Или ТипПроверяемоегоЗначения = Тип("ФиксированныйМассив")
			Или ТипПроверяемоегоЗначения = Тип("Структура") Или ТипПроверяемоегоЗначения = Тип("ФиксированнаяСтруктура")
			Или ТипПроверяемоегоЗначения = Тип("Соответствие") Или ТипПроверяемоегоЗначения = Тип("ФиксированноеСоответствие")
			Или ТипПроверяемоегоЗначения = Тип("СписокЗначений") Тогда
		ФактическаяДлина = Объект.ПроверяемоеЗначение.Количество();
	КонецЕсли;

	Если ФактическаяДлина = Неопределено Тогда
		СообщениеОшибки = "Утверждение ""ИмеетДлину"" не умеет работать с типом <" + ТипПроверяемоегоЗначения + ">." + ФорматДСО(Объект.ДопСообщениеОшибки);
		ВызватьИсключение СообщениеОшибки;
	КонецЕсли;

	Если Не ЛогическоеВыражениеВерно(ФактическаяДлина = ОжидаемаяДлина) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке("<" + Объект.ПроверяемоеЗначение + "> с длиной " + ФактическаяДлина, "ИМЕЕТ ДЛИНУ (" + ОжидаемаяДлина + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ВыбрасываетИсключение(Знач ФрагментИсключения = "") Экспорт
	Контекст = Объект.ПроверяемоеЗначение;
	СтрокаПараметры = "";
	Если ТипЗнч(Объект.ПараметрыМетода) = Тип("Массив") Тогда
		Для Сч = 0 По Объект.ПараметрыМетода.Количество() - 1 Цикл
			СтрокаПараметры = СтрокаПараметры + ",ПараметрыМетода[" + Сч + "]";
		КонецЦикла;
		СтрокаПараметры = Сред(СтрокаПараметры, 2);
	КонецЕсли;
	СтрокаДляВыполнения = "Контекст." + Объект.ИмяМетода + "(" + СтрокаПараметры + ")";

	ИсключениеВозникло = Ложь;
	Попытка
		Выполнить(СтрокаДляВыполнения);
	Исключение
		ИсключениеВозникло = Истина;
		ТекстИсключения = ОписаниеОшибки();
	КонецПопытки;

	Если Не ЛогическоеВыражениеВерно(ИсключениеВозникло И Найти(ТекстИсключения, ФрагментИсключения) > 0) Тогда
		СообщениеОшибки = "Ожидали, что " + СтрокаДляВыполнения
			+ ?(Объект.ФлагОтрицания, " НЕ ", " ")
			+ "ВЫБРОСИТ ИСКЛЮЧЕНИЕ"
			+ ?(ЗначениеЗаполнено(ФрагментИсключения), " СОДЕРЖАЩЕЕ ТЕКСТ <" + ФрагментИсключения + ">, а был текст <" + ТекстИсключения + ">.", "");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтаФорма;
КонецФункции

// { Helpers
&НаСервере
Процедура ВыполнитьМетодОбъектаНаСервере(Знач ИмяМетода, Знач КоличествоПараметров, Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено)
	ОбъектНаСервере = ЭтотОбъектНаСервере();

	СтрокаПараметры = "";
	Если КоличествоПараметров = 1 Тогда
		СтрокаПараметры = "Параметр1";
	ИначеЕсли КоличествоПараметров = 2 Тогда
		СтрокаПараметры = "Параметр1, Параметр2";
	КонецЕсли;

	Попытка
		Выполнить("ОбъектНаСервере." + ИмяМетода + "(" + СтрокаПараметры + ")");
	Исключение
		ОписаниеОшибки = ОписаниеОшибки();
		ВызватьИсключение "Вызов метода <" + ИмяМетода +">: " + ОписаниеОшибки;
	КонецПопытки;

	ЗначениеВРеквизитФормы(ОбъектНаСервере, "Объект");
КонецПроцедуры

&НаСервере
Функция ЭтотОбъектНаСервере()
	Возврат РеквизитФормыВЗначение("Объект");
КонецФункции

&НаКлиенте
Функция ФорматДСО(Знач ДопСообщениеОшибки)
	Если ДопСообщениеОшибки = "" Тогда
		Возврат "";
	КонецЕсли;

	Возврат Символы.ПС + ДопСообщениеОшибки;
КонецФункции

&НаКлиенте
Процедура ВызватьОшибкуПроверки(Знач СообщениеОшибки)
	Префикс = "["+ СтатусыРезультатаТестирования.ОшибкаПроверки + "]";
	ВызватьИсключение Префикс + " " + СообщениеОшибки;
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьЧтоМногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Знач Строка, Знач Подстрока, ДопСообщениеОшибки = "")
	СообщениеОшибки = "";
	Нашли = МногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Строка, Подстрока, СообщениеОшибки);
	Если Не Нашли Тогда
		ВызватьОшибкуПроверки( КонтекстЯдра.СтрШаблон_("Ожидали, что в строке <
		|%1
		|>
		|найдем подстроку<
		|%2
		|>
		|А это не так.
		|Уточнение: %3.
		|%4", Строка, Подстрока, СообщениеОшибки, ДопСообщениеОшибки));
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Функция МногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Знач Строка, Знач Подстрока, СообщениеОшибки = "")
	ПерваяСтрока = СокрЛП(СтрПолучитьСтроку(Подстрока, 1));
	НашлиПервуюСтроку = Ложь;
	Для Счетчик = 1 По СтрЧислоСтрок(Строка) Цикл
		ОчереднаяСтрока = СокрЛП(СтрПолучитьСтроку(Строка, Счетчик));
		НашлиПервуюСтроку = Найти(ОчереднаяСтрока, ПерваяСтрока) <> 0;
		Если НашлиПервуюСтроку Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;
	Если Не НашлиПервуюСтроку Тогда
		СообщениеОшибки = КонтекстЯдра.СтрШаблон_("Не нашли первую же подстроку <%1>", ПерваяСтрока);
		Возврат Ложь;
	КонецЕсли;

	СчетчикЧтоИщем = 2;
	Для Счетчик = Счетчик + 1 По СтрЧислоСтрок(Строка) Цикл
		ОчереднаяСтрока = СокрЛП(СтрПолучитьСтроку(Строка, Счетчик));
		ЧтоИщем = СокрЛП(СтрПолучитьСтроку(Подстрока, СчетчикЧтоИщем));
		Поз = Найти(ОчереднаяСтрока, ЧтоИщем);
		Если Поз = 0 Тогда
			СообщениеОшибки = КонтекстЯдра.СтрШаблон_("Не нашли подстроку № %1 <%2>", СчетчикЧтоИщем, ЧтоИщем);
			Возврат Ложь;
		Иначе
			СчетчикЧтоИщем  = СчетчикЧтоИщем  + 1;
			Если СчетчикЧтоИщем > СтрЧислоСтрок(Подстрока) Тогда
				Возврат Истина;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	Возврат СчетчикЧтоИщем > СтрЧислоСтрок(Подстрока);
КонецФункции

&НаКлиенте
Функция ЛогическоеВыражениеВерно(Знач ЛогическоеВыражение)
	Результат = Объект.ФлагОтрицания <> ЛогическоеВыражение;
	ФлагОтрицанияДляСообщения = Объект.ФлагОтрицания;
	ФлагОтрицания = Ложь;

	Возврат Результат;
КонецФункции

&НаКлиенте
Функция СформироватьСообщениеОбОшибке(Знач ПроверяемоеЗначение, Знач Ожидание)
	Возврат "Ожидали, что проверяемое значение (" + ПроверяемоеЗначение + ")" + ?(ФлагОтрицанияДляСообщения, " НЕ ", " ") + Ожидание + ФорматДСО(Объект.ДопСообщениеОшибки);
КонецФункции
// } Helpers

СтатусыРезультатаТестирования = Новый Структура;
СтатусыРезультатаТестирования.Вставить("ОшибкаПроверки", "Failed");
СтатусыРезультатаТестирования.Вставить("НеизвестнаяОшибка", "Broken");
СтатусыРезультатаТестирования.Вставить("ТестПропущен", "Pending");
СтатусыРезультатаТестирования = Новый ФиксированнаяСтруктура(СтатусыРезультатаТестирования);

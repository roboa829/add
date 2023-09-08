﻿&НаКлиенте
Перем ПостроительДереваТестов Экспорт;

&НаКлиенте
Перем КонтейнерМодуля Экспорт;

&НаКлиенте
Перем КонтейнерГруппы Экспорт;

#Область ПрограммныйИнтерфейс

&НаКлиенте
Процедура СлучайныйПорядокВыполнения() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		КонтейнерМодуля.СлучайныйПорядокВыполнения = Истина;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура СтрогийПорядокВыполнения() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		
		КонтейнерМодуля.СлучайныйПорядокВыполнения = Ложь;
		ОстановитьВыполнениеПослеПаденияТестов();
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПродолжитьВыполнениеПослеПаденияТеста() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		КонтейнерМодуля.ПродолжитьВыполнениеПослеПаденияТеста = Истина;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОстановитьВыполнениеПослеПаденияТестов() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		КонтейнерМодуля.ПродолжитьВыполнениеПослеПаденияТеста = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура НачатьГруппу(Знач ИмяГруппы, Знач СтрогийПорядокВыполнения = Ложь) Экспорт
	
	КонтейнерГруппы = ПостроительДереваТестов.СоздатьКонтейнер(ИмяГруппы, ПостроительДереваТестов.Объект.ИконкиУзловДереваТестов.Группа);
	КонтейнерГруппы.Путь = КонтейнерМодуля.Путь;
	КонтейнерГруппы.СлучайныйПорядокВыполнения = Не СтрогийПорядокВыполнения;
	КонтейнерМодуля.Строки.Добавить(КонтейнерГруппы);
	
КонецПроцедуры

&НаКлиенте
Функция Добавить(Знач ИмяМетода, Знач Параметры = Неопределено, Знач Представление = "") Экспорт
	
	Если Не ЗначениеЗаполнено(Параметры) ИЛИ ТипЗнч(Параметры) <> Тип("Массив") Тогда
		
		Если ТипЗнч(Параметры) = Тип("Строка") И Представление = "" Тогда
			Представление = Параметры;
		КонецЕсли;
		
		Параметры = Неопределено;
		
	КонецЕсли;
	
	Элемент = ПостроительДереваТестов.СоздатьЭлемент(КонтейнерМодуля.Путь, ИмяМетода, Представление);
	
	Если ЗначениеЗаполнено(КонтейнерГруппы) Тогда
		КонтейнерГруппы.Строки.Добавить(Элемент);
	Иначе
		КонтейнерМодуля.Строки.Добавить(Элемент);
	КонецЕсли;
	
	Если Параметры <> Неопределено Тогда
		Элемент.Параметры = Параметры;
	КонецЕсли;
	
	Возврат Элемент;
	
КонецФункции

&НаКлиенте
Функция ДобавитьДеструктор(Знач ИмяМетодаДеструктора, Знач Представление = "") Экспорт
	
	ЭлементДеструктор = Добавить(ИмяМетодаДеструктора, Неопределено, Представление);
	
	Если ЗначениеЗаполнено(КонтейнерГруппы) Тогда
		КонтейнерГруппы.ЭлементДеструктор = ЭлементДеструктор;
	Иначе
		КонтейнерМодуля.ЭлементДеструктор = ЭлементДеструктор;
	КонецЕсли;
	
	Возврат ЭлементДеструктор;
	
КонецФункции

&НаКлиенте
Функция ПараметрыТеста(Знач Парам1, Знач Парам2 = Неопределено, Знач Парам3 = Неопределено,
		Знач Парам4 = Неопределено, Знач Парам5 = Неопределено, Знач Парам6 = Неопределено,
		Знач Парам7 = Неопределено, Знач Парам8 = Неопределено, Знач Парам9 = Неопределено) Экспорт
	
	ВсеПараметры = Новый Массив;
	ВсеПараметры.Добавить(Парам1);
	ВсеПараметры.Добавить(Парам2);
	ВсеПараметры.Добавить(Парам3);
	ВсеПараметры.Добавить(Парам4);
	ВсеПараметры.Добавить(Парам5);
	ВсеПараметры.Добавить(Парам6);
	ВсеПараметры.Добавить(Парам7);
	ВсеПараметры.Добавить(Парам8);
	ВсеПараметры.Добавить(Парам9);
	
	ИндексСПоследнимПараметром = 0;
	
	Для Сч = 0 По ВсеПараметры.ВГраница() Цикл
		
		Индекс = ВсеПараметры.ВГраница() - Сч;
		Если ВсеПараметры[Индекс] <> Неопределено Тогда
			ИндексСПоследнимПараметром = Индекс;
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	ПараметрыТеста = Новый Массив;
	Для Сч = 0 По ИндексСПоследнимПараметром Цикл
		ПараметрыТеста.Добавить(ВсеПараметры[Сч]);
	КонецЦикла;
	
	Возврат ПараметрыТеста;
	
КонецФункции

// Пропустить тест, при этом ядро не пытается найти и выполнять тест, а сразу помечает его неиспользованным
//	Такой подход значительно ускорит прогон тестов, о которых еще на этапе подготовки известно, что они должны быть пропущены.
//
// Параметры:
//  Представление	 - Строка	 - Представление теста
// 
// Возвращаемое значение:
//   Произвольный - созданный элемент. См. Добавить
//
&НаКлиенте
Функция ПропуститьТест(Знач Представление) Экспорт

	Элемент = Добавить(Представление, Неопределено, Представление);
	Элемент.ПропуститьТест = Истина;
	
	Возврат Элемент;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#Область ВнешнийИнтерфейсПлагина

&НаКлиенте
Функция ВыбратьПутьИнтерактивно(КонтекстЯдра, ИмяРасширения = "") Экспорт
	
	СписокРасширений = СписокРасширений();
	
	Если КонтекстЯдра.ЕстьПоддержкаАсинхронныхВызовов Тогда
		
		ДополнительныеПараметры = Новый Структура();
		ДополнительныеПараметры.Вставить("КонтекстЯдра", КонтекстЯдра);
		
		ОповещениеОВыборе = Новый ОписаниеОповещения("ВыбратьПутьИнтерактивноЗавершение", ЭтотОбъект,
				ДополнительныеПараметры);
		
		СписокРасширений.ПоказатьВыборЭлемента(ОповещениеОВыборе);
		
	Иначе
		
		ВыбранныйЭлемент = СписокРасширений.ВыбратьЭлемент();
		Если ВыбранныйЭлемент <> Неопределено Тогда
			
			ИмяРасширения = ВыбранныйЭлемент.Значение;
			ЗагрузитьТесты(КонтекстЯдра, ИмяРасширения);
			
		КонецЕсли;
		
	КонецЕсли;
	
	Возврат "";
	
КонецФункции

&НаКлиенте
Функция Загрузить(КонтекстЯдра, ИмяРасширения) Экспорт
	
	КонтейнерТестов = ЗагрузитьСписокТестов(КонтекстЯдра, ИмяРасширения);
	
	Возврат КонтейнерТестов;
	
КонецФункции

&НаКлиенте
Процедура НачатьЗагрузку(ОбработчикОповещения, КонтекстЯдра, ИмяРасширения) Экспорт
	
	КонтейнерТестов = ЗагрузитьСписокТестов(КонтекстЯдра, ИмяРасширения);
	
	ВыполнитьОбработкуОповещения(ОбработчикОповещения, КонтейнерТестов);
	
КонецПроцедуры

&НаКлиенте
Функция ПолучитьКонтекстПоПути(КонтекстЯдра, Путь) Экспорт
	
	СоставКонтекста = СтрРазделить(Путь, "#");
	ТипКонтекстаМодуля = СоставКонтекста[0];
	ИмяМодуля = СоставКонтекста[1];
	
	Если ТипКонтекстаМодуля = Объект.ТипыКонтекстаМодулей.Клиент Тогда
		ОписаниеКонтекста = ОбщийМодуль(ИмяМодуля); 
	ИначеЕсли ТипКонтекстаМодуля = Объект.ТипыКонтекстаМодулей.Объект Тогда 
		ОписаниеКонтекста = КонтекстЯдра.НовыйКонтекстВыполненияОбъекта(ИмяМодуля); 
	Иначе
		ОписаниеКонтекста = КонтекстЯдра.НовыйКонтекстВыполненияОбщегоМодуля(ИмяМодуля);
	КонецЕсли;
	
	Возврат ОписаниеКонтекста;
	
КонецФункции

#КонецОбласти

#Область ВнутреннийИнтерфейсПлагина

&НаКлиенте
Процедура ИнициализироватьПостроительДереваТестов(КонтекстЯдра) Экспорт
	ПостроительДереваТестов = КонтекстЯдра.Плагин("ПостроительДереваТестов");
КонецПроцедуры

&НаКлиенте
Функция ИконкаУзлаМодуля() Экспорт
	Возврат ПостроительДереваТестов.Объект.ИконкиУзловДереваТестов.Форма;
КонецФункции

&НаКлиенте
Функция ТипКонтекстаМодуля() Экспорт
	Возврат Объект.ТипыКонтекстаМодулей.Клиент;
КонецФункции

&НаКлиенте
Функция ТипКонтекстаОбъекта() Экспорт
	Возврат Объект.ТипыКонтекстаМодулей.Объект;	
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область ОбъектПлагина

&НаСервере
Функция ОбъектПлагина()
	Возврат РеквизитФормыВЗначение("Объект");
КонецФункции

&НаСервере
Функция ИдентификаторПлагина(Знач КонтекстЯдра)
	
	КонтекстЯдраНаСервере = ВнешниеОбработки.Создать("xddTestRunner");
	ОписаниеПлагина = ОбъектПлагина().ОписаниеПлагина(КонтекстЯдраНаСервере, КонтекстЯдра.ТипыПлагинов);
	Возврат ОписаниеПлагина.Идентификатор;
	
КонецФункции

&НаСервере
Функция СписокРасширений()
	Возврат ОбъектПлагина().СписокРасширений();
КонецФункции

&НаСервере
Функция МодулиРасширения(Знач ИмяРасширения)
	Возврат ОбъектПлагина().МодулиРасширения(ИмяРасширения);
КонецФункции

#КонецОбласти

&НаКлиенте
Процедура ВыбратьПутьИнтерактивноЗавершение(ВыбранныйЭлемент, ДополнительныеПараметры) Экспорт
	
	Если ВыбранныйЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	КонтекстЯдра = ДополнительныеПараметры.КонтекстЯдра;
	ИмяРасширения = ВыбранныйЭлемент.Значение;
	
	НачатьЗагрузкуТестов(Неопределено, КонтекстЯдра, ИмяРасширения)
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьТесты(КонтекстЯдра, ИмяРасширения)
	
	ИдентификаторПлагина = ИдентификаторПлагина(КонтекстЯдра.Объект);
	КонтекстЯдра.ЗагрузитьТесты(ИдентификаторПлагина, ИмяРасширения);
	
КонецПроцедуры

&НаКлиенте
Процедура НачатьЗагрузкуТестов(ОбработкаОповещения, КонтекстЯдра, ИмяРасширения)
	
	ИдентификаторПлагина = ИдентификаторПлагина(КонтекстЯдра.Объект);
	КонтекстЯдра.НачатьЗагрузкуТестов(ОбработкаОповещения, ИдентификаторПлагина, ИмяРасширения);
	
КонецПроцедуры

&НаКлиенте
Функция ЗагрузитьСписокТестов(КонтекстЯдра, ИмяРасширения)
		
	ИнициализироватьПостроительДереваТестов(КонтекстЯдра);
	КонтейнерТестов = ПостроительДереваТестов.СоздатьКонтейнер(ИмяРасширения);
	
	МодулиРасширения = МодулиРасширения(ИмяРасширения);
	
	СерверныеТесты = НаборТестовНаСервере(МодулиРасширения.Сервер, КонтекстЯдра.Объект);
	Для Каждого СерверныйТест Из СерверныеТесты Цикл
		КонтейнерТестов.Строки.Добавить(СерверныйТест);
	КонецЦикла;
	
	КлиентскиеТесты = НаборТестов(ЭтотОбъект, МодулиРасширения.Клиент);
	Для Каждого КлиентскийТест Из КлиентскиеТесты Цикл
		КонтейнерТестов.Строки.Добавить(КлиентскийТест);
	КонецЦикла;
	
	ТестыМодулейОбъектов = НаборТестовМодулейОбъектов(МодулиРасширения.МодулиОбъектов, КонтекстЯдра.Объект);
	Для Каждого ТестМодуля Из ТестыМодулейОбъектов Цикл
		КонтейнерТестов.Строки.Добавить(ТестМодуля);
	КонецЦикла;
	
	ПостроительДереваТестов = Неопределено;
	КонтейнерМодуля = Неопределено;
	КонтейнерГруппы = Неопределено;
	
	Возврат КонтейнерТестов;
	
КонецФункции

&НаСервере
Функция НаборТестовНаСервере(Знач СерверныеМодули, Знач КонтекстЯдра)
	
	ОбъектПлагина = ОбъектПлагина();
	ОбъектПлагина.ИнициализироватьПостроительДереваТестов(КонтекстЯдра);
	
	Возврат НаборТестов(ОбъектПлагина, СерверныеМодули);
	
КонецФункции

&НаСервере
Функция НаборТестовМодулейОбъектов(Знач МодулиОбъектов, Знач КонтекстЯдра)
	
	ОбъектПлагина = ОбъектПлагина();
	ОбъектПлагина.ИнициализироватьПостроительДереваТестов(КонтекстЯдра);  
	
	Возврат НаборТестов(ОбъектПлагина, МодулиОбъектов);
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Функция НаборТестов(ОбъектПлагина, КлиентскиеМодули)
	
	НаборТестов = Новый Массив;
	
	Для Каждого ИмяМодуля Из КлиентскиеМодули Цикл
		
		ОбъектМодуля = ОбщийМодуль(ИмяМодуля);
		
		НачатьНовыйМодуль(ОбъектПлагина, ИмяМодуля);
		ЗаполнитьНаборТестовМодуля(ОбъектПлагина, ОбъектМодуля);
		ЗавершитьМодуль(ОбъектПлагина, НаборТестов);
		
	КонецЦикла;
	
	Возврат Новый ФиксированныйМассив(НаборТестов);
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Функция ОбщийМодуль(ИмяМодуля)
	
	#Если Сервер Тогда
	УстановитьБезопасныйРежим(Истина);
	#КонецЕсли
	
	ОбъектМодуля = Вычислить(ИмяМодуля);
	
	Возврат ОбъектМодуля;
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура ЗаполнитьНаборТестовМодуля(ОбъектПлагина, ОбъектМодуля)
	
	Попытка
		ОбъектМодуля.ЗаполнитьНаборТестов(ОбъектПлагина);
	Исключение
		
		ИнформацияОбОшибке = ИнформацияОбОшибке();
		
		Если Не ЭтоИсключениеМетодОбъектаНеОбнаружен(ИнформацияОбОшибке) Тогда
			ВызватьИсключение;
		КонецЕсли;
		
	КонецПопытки;
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Функция ЭтоИсключениеМетодОбъектаНеОбнаружен(ИнформацияОбОшибке)
	
	СписокОписаний = Новый Массив();
	СписокОписаний.Добавить("Метод объекта не обнаружен (ЗаполнитьНаборТестов)");
	СписокОписаний.Добавить("Object method not found (ЗаполнитьНаборТестов)");
	
	Возврат (СписокОписаний.Найти(ИнформацияОбОшибке.Описание) <> Неопределено);
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура НачатьНовыйМодуль(ОбъектПлагина, ИмяМодуля)
	
	ИконкаУзла = ОбъектПлагина.ИконкаУзлаМодуля();
	КонтекстСервер = ОбъектПлагина.ТипКонтекстаМодуля(); 
	КонтекстОбъект = ОбъектПлагина.ТипКонтекстаОбъекта();
	
	ОбъектПлагина.КонтейнерГруппы = Неопределено;
	ОбъектПлагина.КонтейнерМодуля = ОбъектПлагина.ПостроительДереваТестов.СоздатьКонтейнер(ИмяМодуля, ИконкаУзла);
	Если СтрНайти(ИмяМодуля, ".") > 0 Тогда 
		ОбъектПлагина.КонтейнерМодуля.Путь = СтрШаблон("%1#%2", КонтекстОбъект, ИмяМодуля);
	Иначе
		ОбъектПлагина.КонтейнерМодуля.Путь = СтрШаблон("%1#%2", КонтекстСервер, ИмяМодуля);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура ЗавершитьМодуль(ОбъектПлагина, НаборТестов)
	
	Если ОбъектПлагина.КонтейнерМодуля.Строки.Количество() > 0 Тогда
		НаборТестов.Добавить(ОбъектПлагина.КонтейнерМодуля);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти
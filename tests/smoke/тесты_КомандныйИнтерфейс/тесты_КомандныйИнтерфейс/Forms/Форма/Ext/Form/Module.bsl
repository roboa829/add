﻿
&НаКлиенте
Перем КонтекстЯдра;

&НаКлиенте
Перем Утверждения;

&НаКлиенте
Перем ПлагинТестКлиенты;

// TODO расставить области

// Процедура - Инициализация тестов
//
// Параметры:
//  КонтекстЯдраПараметр - Произвольный	 - ВнешниеОбработки.xddTestRunner.УпрФорма
//
&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	ПлагинТестКлиенты = КонтекстЯдра.Плагин("ТестКлиенты");

	ЗагрузитьНастройки();
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьНастройки()
	
	ПутьНастройки = КлючНастройки();

	Если ЗначениеЗаполнено(Объект.Настройки) Тогда
		Возврат;
	КонецЕсли;

	ПлагинНастроек = КонтекстЯдра.Плагин("Настройки");

	НастройкиМодальныхОкон = ПлагинНастроек.ПолучитьНастройку(ПлагинТестКлиенты.КлючНастройкиМодальныхОкон());

	Объект.Настройки = ПлагинНастроек.ПолучитьНастройку(ПутьНастройки);
	Если Не ЗначениеЗаполнено(Объект.Настройки) Тогда
		Объект.Настройки = Новый Структура;
	КонецЕсли;

	НаборНастроекПоУмолчанию = СоздатьНаборНастроекПоУмолчанию();

	ЗаменитьНесуществующиеНастройкиЗначениямиПоУмолчанию(Объект.Настройки, НаборНастроекПоУмолчанию);

	Если ЕстьНастройка("СтрогийПорядокВыполнения", Объект.Настройки) Тогда
		Объект.СтрогийПорядокВыполнения = Объект.Настройки.СтрогийПорядокВыполнения;
	КонецЕсли;

	Если ЗначениеЗаполнено(НастройкиМодальныхОкон) Тогда
		Объект.Настройки.Вставить(ПлагинТестКлиенты.КлючНастройкиМодальныхОкон(), НастройкиМодальныхОкон);
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Функция ЕстьНастройка(Знач ПутьНастроек, СтруктураНастроек = Неопределено)

	Если СтруктураНастроек = Неопределено Тогда
		СтруктураНастроек = Объект.Настройки;
	КонецЕсли;

	Возврат КонтекстЯдра.Плагин("Настройки").ЕстьНастройка(ПутьНастроек, СтруктураНастроек);

КонецФункции

&НаСервере
Функция СоздатьНаборНастроекПоУмолчанию()

	Рез = Новый Структура;

	Рез.Вставить("СтрогийПорядокВыполнения", Истина);
	Рез.Вставить("ПроверятьТолькоИзбранные", Новый Структура);
	//Рез.Вставить("ИсключатьПоИмени", Новый Структура);
	//Рез.Вставить("ОтборПоПрефиксу", Ложь);
	//Рез.Вставить("Префикс", "");
	//Рез.Вставить("Подсистема", "");

	Возврат Новый ФиксированнаяСтруктура(Рез);

КонецФункции

&НаКлиенте
Процедура ЗаменитьНесуществующиеНастройкиЗначениямиПоУмолчанию(Знач Настройки, Знач НаборНастроекПоУмолчанию)

	Для каждого КлючЗначение Из НаборНастроекПоУмолчанию Цикл
		Если Не ЕстьНастройка(КлючЗначение.Ключ) Тогда
			Настройки.Вставить(КлючЗначение.Ключ, КлючЗначение.Значение);
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Функция НужноВыполнятьТест()
	
	ЗначениеПоУмолчанию = Истина;
	
	ЗагрузитьНастройки();
	
	Настройки = ОБъект.Настройки;
	
	Если Не ЗначениеЗаполнено(Настройки) Тогда
		Возврат ЗначениеПоУмолчанию;
	КонецЕсли;
	
	КлючНастройки = КлючНастройки();
	
	ВыполнятьТест = Неопределено;
	Если ТипЗнч(Настройки) = Тип("Структура") 
		И Настройки.Свойство("Используется", ВыполнятьТест) Тогда

			Возврат ВыполнятьТест = Истина;	
	КонецЕсли;
	
	Возврат ЗначениеПоУмолчанию;

КонецФункции

// Функция - Ключ настройки
// 
// Возвращаемое значение:
//   Строка - CommandInterface 
//
&НаКлиенте
Функция КлючНастройки()
	Возврат "CommandInterface";
КонецФункции

// Процедура - Заполнить набор тестов
//
// Параметры:
//  НаборТестов			 - Произвольный	 - объект для подготовки тестов - класс ЗагрузчикХХХ
//  КонтекстЯдраПараметр - Произвольный	 - ВнешниеОбработки.xddTestRunner.УпрФорма
//
&НаКлиенте
Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт

	Инициализация(КонтекстЯдраПараметр);
	
	Если Не НужноВыполнятьТест() Тогда
		Возврат;
	КонецЕсли;

	Если Объект.СтрогийПорядокВыполнения Тогда
		НаборТестов.СтрогийПорядокВыполнения();
		НаборТестов.ПродолжитьВыполнениеПослеПаденияТеста();
	КонецЕсли;

	КонтекстЯдра = КонтекстЯдраПараметр;

	ПлагинТестКлиенты = КонтекстЯдра.Плагин("ТестКлиенты");

	ТестКлиент = ПодключитьТестКлиент();
	Если ТестКлиент = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ДобавитьТестыИзКомандногоИнтерфейса(НаборТестов, ТестКлиент);

КонецПроцедуры

&НаКлиенте
Функция ПодключитьТестКлиент()
	
	Перем ИнфоОшибки;
	
	Результат = Неопределено;
	
	Попытка
		Результат = ПлагинТестКлиенты.ТестКлиентПоУмолчанию();
	Исключение
		ИнфоОшибки = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
		Сообщить(ИнфоОшибки); // TODO скрывается исключение
	КонецПопытки;
	
	Возврат Результат;

КонецФункции

&НаКлиенте
Процедура ДобавитьТестыИзКомандногоИнтерфейса(Знач НаборТестов, ТестКлиент)
	
	ОсновноеОкно = ПлагинТестКлиенты.ОсновноеОкно(ТестКлиент);
	
	ФильтрПоИмени = ПодготовитьФильтрыПоИмени();
	
	ОписаниеДобавляемыхТестов = ОписаниеДобавляемыхТестов(ТестКлиент, ОсновноеОкно, ФильтрПоИмени);
	Для Каждого ГруппаТестов Из ОписаниеДобавляемыхТестов Цикл
		
		СписокДляСортировки = Новый СписокЗначений;
		Для Каждого КлючЗначение Из ГруппаТестов.Тесты Цикл
			Если ВключитьПоНавигационнойСсылке(КлючЗначение.Ключ, ФильтрПоИмени) Тогда
				СписокДляСортировки.Добавить(КлючЗначение, КлючЗначение.Значение.ПредставлениеТеста);
			КонецЕсли;
			
		КонецЦикла;
		СписокДляСортировки.СортироватьПоПредставлению();
		
		Если СписокДляСортировки.Количество() Тогда
			НаборТестов.НачатьГруппу(КонтекстЯдра.СтрШаблон_(НСтр("ru = 'Раздел: %1'"),ГруппаТестов.ИмяГруппы));
		КонецЕсли;
		
		Для Каждого ЭлементСпискаЗначений  Из СписокДляСортировки Цикл
			
			КлючЗначение = ЭлементСпискаЗначений.Значение;
			Описание = КлючЗначение.Значение;
			ОписаниеНавигационнаяСсылка = Описание.НавигационнаяСсылка;
			
			НаборТестов.Добавить(
			Описание.ИмяТеста,
			НаборТестов.ПараметрыТеста(ОписаниеНавигационнаяСсылка),
			КонтекстЯдра.СтрШаблон_(НСтр("ru = '%1: проверка элемента командного интерфейса'"), Описание.ПредставлениеТеста));
			
		КонецЦикла;
		
	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Функция ПодготовитьФильтрыПоИмени()
	
	Результат = НовыйФильтрПоИмени();
	
	ИсключаемыеОперации = Новый Массив;
	ДобавитьИсключения(ИсключаемыеОперации, "ОбщиеКоманды", "ОбщаяКоманда.");
	ДобавитьИсключения(ИсключаемыеОперации, "ОбщиеФормы", "ОбщаяФорма.");
	ДобавитьИсключения(ИсключаемыеОперации, "Справочники", "Справочник.");
	ДобавитьИсключения(ИсключаемыеОперации, "Документы", "Документ.");
	ДобавитьИсключения(ИсключаемыеОперации, "Отчеты", "Отчет.");
	ДобавитьИсключения(ИсключаемыеОперации, "Обработки", "Обработка.");
	ДобавитьИсключения(ИсключаемыеОперации, "БизнесПроцессы", "БизнесПроцесс.");
	ДобавитьИсключения(ИсключаемыеОперации, "ВнешниеИсточникиДанных", "ВнешнийИсточникДанных.");
	
	ИсключаемыеРазделы = Новый Массив;
	ДобавитьИсключения(ИсключаемыеРазделы, "Разделы", "");
	
	НастройкиТеста = Объект.Настройки;
	
	СтруктураПроверятьТолькоИзбранные = ЗначениеИзСтруктуры(НастройкиТеста, "ПроверятьТолькоИзбранные", Новый Структура);
	ФильтроватьПоИзбранным = ЗначениеЗаполнено(СтруктураПроверятьТолькоИзбранные);
	
	ВключенОтборПоПрефиксу = ЗначениеИзСтруктуры(НастройкиТеста, "ОтборПоПрефиксу", Ложь);
	Префикс = ЗначениеИзСтруктуры(НастройкиТеста, "Префикс", "");
	
	ИмяПодсистемы = ЗначениеИзСтруктуры(НастройкиТеста, "Подсистема", "");
	ВключенОтборПоПодсистеме = ЗначениеЗаполнено(ИмяПодсистемы);
	
	Результат.Вставить("ФильтроватьПоИзбранным", ФильтроватьПоИзбранным);
	Результат.Вставить("ИсключаемыеОперации", ИсключаемыеОперации);
	Результат.Вставить("ИсключаемыеРазделы", ИсключаемыеРазделы);
	Результат.Вставить("НастройкиОтбораПоИзбранным", СтруктураПроверятьТолькоИзбранные);
	Результат.Вставить("ВключенОтборПоПрефиксу", ВключенОтборПоПрефиксу);
	Результат.Вставить("Префикс", Префикс);
	Результат.Вставить("ИмяПодсистемы", ИмяПодсистемы);
	Результат.Вставить("ВключенОтборПоПодсистеме", ВключенОтборПоПодсистеме);
	
	Возврат Результат;
КонецФункции

&НаКлиенте
Функция НовыйФильтрПоИмени()

	Результат = Новый Структура;
	Результат.Вставить("ВидыМетаданных", ВидыМетаданных());
	Результат.Вставить("ФильтроватьПоИзбранным", Ложь);
	Результат.Вставить("ИсключаемыеОперации", Новый Массив);
	Результат.Вставить("ИсключаемыеРазделы", Новый Массив);
	Результат.Вставить("НастройкиОтбораПоИзбранным", Новый Структура);
	Результат.Вставить("ВключенОтборПоПрефиксу", Ложь);
	Результат.Вставить("Префикс", "");
	Результат.Вставить("ИмяПодсистемы", "");
	Результат.Вставить("ВключенОтборПоПодсистеме", Ложь);

	Возврат Результат;

КонецФункции

&НаКлиенте
Функция ВидыМетаданных()
	
	Результат = Новый Структура;
	
	Результат.Вставить("ОбщаяКоманда", "ОбщиеКоманды");
	Результат.Вставить("ОбщаяФорма", "ОбщиеФормы");
	Результат.Вставить("Справочник", "Справочники");
	Результат.Вставить("Документ", "Документы");
	Результат.Вставить("Отчет", "Отчеты");
	Результат.Вставить("Обработка", "Обработки");
	Результат.Вставить("БизнесПроцесс", "БизнесПроцессы");
	Результат.Вставить("ВнешнийИсточникДанных", "ВнешниеИсточникиДанных");
	
	Возврат Новый ФиксированнаяСтруктура(Результат);
	
КонецФункции

&НаКлиенте
Функция ЗначениеИзСтруктуры(Знач Структура, Знач ИмяНастройки, Знач ЗначениеПоУмолчанию)
	
	Результат = Неопределено;
	
	Если Не Структура.Свойство(ИмяНастройки, Результат) Или Не ЗначениеЗаполнено(Результат) Тогда
		Результат = ЗначениеПоУмолчанию;
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

&НаКлиенте
Функция ВключитьРаздел(Знач Имя, Знач ФильтрПоИмени)
	
	Возврат ВключитьПоИмени("Разделы", Имя, ФильтрПоИмени, ФильтрПоИмени.ИсключаемыеРазделы);

КонецФункции

&НаКлиенте
Функция ВключитьПоНавигационнойСсылке(Знач Имя, Знач ФильтрПоИмени)
	
	Результат = Не ФильтрПоИмени.ФильтроватьПоИзбранным;
	
	// - e1cib/command/Справочник.СправочникИерархияЭлементов.ОткрытьСписок
	СегментыПути = СтрРазделить(Имя, "/");
	
	КоличествоПравильныхСегментов = 3;
	ТакуюСсылкуПропускаем = СегментыПути.Количество() < КоличествоПравильныхСегментов 
		Или СегментыПути[0] <> "e1cib" Или СегментыПути[1] <> "command";
		
	Если ТакуюСсылкуПропускаем Тогда
		Возврат Результат;
	КонецЕсли;
	
	ПолноеИмяМетаданного = СегментыПути[КоличествоПравильныхСегментов - 1];
	Сегменты = СтрРазделить(ПолноеИмяМетаданного, ".");
	
	ИмяВида = Сегменты[0];
	ИмяМетаданного = Сегменты[1] + "." + Сегменты[КоличествоПравильныхСегментов - 1];
	
	КлючВида = ЗначениеИзСтруктуры(ФильтрПоИмени.ВидыМетаданных, ИмяВида, Неопределено);
	Если Не ЗначениеЗаполнено(КлючВида) Тогда
		Возврат Результат;
	КонецЕсли;
	
	ОписаниеМетаданного = Новый Структура;
	ОписаниеМетаданного.Вставить("ПолноеИмя", ПолноеИмяМетаданного);
	ОписаниеМетаданного.Вставить("КлючВида", КлючВида);
	ОписаниеМетаданного.Вставить("ИмяВида", ИмяВида);
	ОписаниеМетаданного.Вставить("Имя", ИмяМетаданного);
	
	Отобрали = ОтобралиПоПрефиксуИлиПодсистеме(ФильтрПоИмени, ИмяМетаданного, ОписаниеМетаданного);
	Если ЗначениеЗаполнено(Отобрали) Тогда
		Возврат Отобрали;
	КонецЕсли;
	
	Возврат ВключитьПоИмени(КлючВида, ИмяМетаданного, ФильтрПоИмени, ФильтрПоИмени.ИсключаемыеОперации);

КонецФункции

&НаКлиенте
Функция ОтобралиПоПрефиксуИлиПодсистеме(ФильтрПоИмени, ИмяМетаданного, ОписаниеМетаданного)

	ВключенОтборПоПрефиксу = ФильтрПоИмени.ВключенОтборПоПрефиксу;
	
	ИмяПодсистемы = ФильтрПоИмени.ИмяПодсистемы;
	ВключенОтборПоПодсистеме = ФильтрПоИмени.ВключенОтборПоПодсистеме;
	
	Если ВключенОтборПоПрефиксу Тогда
		
		//Возврат ОтобралиПоПрефиксу(ФильтрПоИмени.Префикс, ИмяМетаданного);
		Если ОтобралиПоПрефиксу(ФильтрПоИмени.Префикс, ИмяМетаданного) Тогда
			Возврат Истина;
		КонецЕсли;
		
		Возврат ВключенОтборПоПодсистеме И ОтобралиПоПодсистеме(ОписаниеМетаданного, ИмяПодсистемы);

	КонецЕсли;
	
	Если ВключенОтборПоПодсистеме Тогда
		Возврат ОтобралиПоПодсистеме(ОписаниеМетаданного, ИмяПодсистемы);
	КонецЕсли;

	Возврат Неопределено;
	
КонецФункции

&НаКлиенте
Функция ОтобралиПоПрефиксу(Знач ПрефиксДляОтбора, Знач ИмяМетаданного)
	
	Возврат СтрНайти(ИмяМетаданного, ПрефиксДляОтбора) = 1;

КонецФункции

&НаСервереБезКонтекста
Функция ОтобралиПоПодсистеме(Знач ОписаниеМетаданного, Знач ИмяПодсистемы)
	
	МетаОбъект = Метаданные.НайтиПоПолномуИмени(ОписаниеМетаданного.ПолноеИмя);
	Если МетаОбъект = Неопределено Тогда
		ВызватьИсключение "Неизвестное метаданное " + ОписаниеМетаданного.ПолноеИмя;
	КонецЕсли;

	Подсистема = НайтиПодсистему(ИмяПодсистемы);
	Если Подсистема = Неопределено Тогда
		ВызватьИсключение "Не нашли подсистему по пути " + ИмяПодсистемы;
	КонецЕсли;
	
	Возврат Подсистема.Состав.Содержит(МетаОбъект);

КонецФункции

&НаСервереБезКонтекста
Функция НайтиПодсистему(Знач ИмяПодсистемы)

	Результат = Неопределено;
	
	Сегменты = СтрРазделить(ИмяПодсистемы, ".");
	ТекущаяПодсистема = Метаданные;
	Для Уровень = 0 По Сегменты.ВГраница() Цикл
		
		Сегмент = Сегменты[Уровень];
		
		Результат = ТекущаяПодсистема.Подсистемы.Найти(Сегмент);
		Если Результат = Неопределено Тогда
			Возврат Неопределено;
		КонецЕсли; 
		
		ТекущаяПодсистема = Результат;
	КонецЦикла;

	Возврат Результат;

КонецФункции

&НаКлиенте
Функция ВключитьПоИмени(Знач ИмяКорня, Знач Имя, Знач ФильтрПоИмени, Знач КоллекцияДляИсключения)
	
	Если ФильтрПоИмени.ФильтроватьПоИзбранным Тогда
		ФильтрМетаданных = ЗначениеИзСтруктуры(ФильтрПоИмени.НастройкиОтбораПоИзбранным, ИмяКорня, Новый Массив);
		Возврат НайтиИмяВКоллекции(Имя, ФильтрМетаданных, КонтекстЯдра);
	КонецЕсли;

	Если ИсключитьИзПроверки(Имя, КоллекцияДляИсключения) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Истина; // если нет ни включений, ни исключения, разрешаем тест, как и сейчас	

КонецФункции

&НаКлиенте
Функция НайтиИмяВКоллекции(Знач ЧтоИщем, Знач КоллекцияДляПоиска, Знач КонтекстЯдра = Неопределено)
	
	Если Не ЗначениеЗаполнено(КоллекцияДляПоиска) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Возврат КонтекстЯдра.ЕстьВИсключаемойКоллекции(ЧтоИщем, КоллекцияДляПоиска);
	
КонецФункции

&НаКлиенте
Процедура ДобавитьИсключения(Знач ИсключаемыеОперации, ИмяНастройки, ПрефиксШаблона)

	Если ВидМетаданныхИсключенИзТестирования(ИмяНастройки) Тогда

		ИсключаемыеОперации.Добавить(ПрефиксШаблона);

	ИначеЕсли ЕстьНастройка(ИмяНастройки) Тогда

		Для Каждого ПараметрНастройки Из Объект.Настройки[ИмяНастройки] Цикл
			ИсключаемыеОперации.Добавить(ПрефиксШаблона + ПараметрНастройки);
			
			Если СтрНайти(ПараметрНастройки, "*") Тогда
				ИсключаемыеОперации.Добавить(ПараметрНастройки);
			КонецЕсли;
		КонецЦикла;

	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Функция ИсключитьИзПроверки(ОписаниеНавигационнаяСсылка, ИсключаемыеОперации)

	Для Каждого ШаблонИсключения Из ИсключаемыеОперации Цикл
		Если Найти(ОписаниеНавигационнаяСсылка, ШаблонИсключения) <> 0 Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;

	Возврат КонтекстЯдра.ЕстьВИсключаемойКоллекции(ОписаниеНавигационнаяСсылка, ИсключаемыеОперации);

КонецФункции

&НаКлиенте
Процедура ПередЗапускомТеста() Экспорт

	ПлагинТестКлиенты = КонтекстЯдра.Плагин("ТестКлиенты");
	Если ЕстьНастройка(ПлагинТестКлиенты.КлючНастройкиМодальныхОкон(), Объект.Настройки) Тогда
		ПлагинТестКлиенты.УстановитьНастройкиМодальныхОкон(Объект.Настройки[ПлагинТестКлиенты.КлючНастройкиМодальныхОкон()]);
	КонецЕсли;

	ТестКлиент = ПлагинТестКлиенты.ТестКлиентПоУмолчанию();
	ПлагинТестКлиенты.ЗакрытьВсеОткрытыеОкна(ТестКлиент);

КонецПроцедуры

&НаКлиенте
Процедура ПослеЗапускаТеста() Экспорт

КонецПроцедуры

&НаКлиенте
Функция ОписаниеДобавляемыхТестов(ТестКлиент, ОсновноеОкно, ФильтрПоИмени)

	Результат = Новый Массив;
	
	Попытка
		КомандныйИнтерфейс = ОсновноеОкно.ПолучитьКомандныйИнтерфейс();
	Исключение
		ВызватьИсключение "Не удалось получить командный интерфейс.
		|Возможно, сеанс тест-клиента заблокирован модальным окном";
	КонецПопытки;
	
	ПанельРазделов = КомандныйИнтерфейс.НайтиОбъект(Тип("ТестируемаяГруппаКомандногоИнтерфейса"), 
		НСтр("ru = 'Панель разделов'; en = 'Section panel'"));
	Если ПанельРазделов = Неопределено Тогда
		ПанельРазделов = КомандныйИнтерфейс.НайтиОбъект(Тип("ТестируемаяГруппаКомандногоИнтерфейса"), "Section panel");
	КонецЕсли;

	Если ТипЗнч(ПанельРазделов) = Тип("ТестируемаяГруппаКомандногоИнтерфейса") Тогда
		КнопкиРазделов = ПанельРазделов.НайтиОбъекты(Тип("ТестируемаяКнопкаКомандногоИнтерфейса"));
		Для Каждого ТекКнопкаРаздел Из КнопкиРазделов Цикл
			ТекстЗаголовка = ТекКнопкаРаздел.ТекстЗаголовка;
			
			Если Не ВключитьРаздел(ТекстЗаголовка, ФильтрПоИмени) Тогда
				Продолжить;
			КонецЕсли;

			СтруктураГруппы = Новый Структура;
			СтруктураГруппы.Вставить("ИмяГруппы", ТекстЗаголовка);
			СтруктураГруппы.Вставить("Тесты", Новый Соответствие);
			
			Результат.Добавить(СтруктураГруппы);
			
			ТекКнопкаРаздел.Нажать();
			
			ДобавитьОписаниеТеста(СтруктураГруппы.Тесты, КомандныйИнтерфейс);
			
			ТекКнопкаРаздел.Нажать();
		КонецЦикла;

		Если КнопкиРазделов.Количество() > 1 Тогда
			КнопкиРазделов[0].Нажать();
			КнопкиРазделов[0].Нажать();
		КонецЕсли;
	КонецЕсли;

	Возврат Результат;

КонецФункции

&НаКлиенте
Процедура ДобавитьОписаниеТеста(КоллекцияОписанийТестов, КомандныйИнтерфейс)

	Разделы = Новый Массив;
	Разделы.Добавить(КомандныйИнтерфейс);
	Для Каждого Раздел Из КомандныйИнтерфейс.НайтиОбъекты(Тип("ТестируемаяГруппаКомандногоИнтерфейса")) Цикл
		Если ЭтоСлужебныйРаздел(Раздел) Тогда
			Продолжить;
		КонецЕсли;
		Разделы.Добавить(Раздел);
	КонецЦикла;

	Для Каждого ТекРаздел Из Разделы Цикл

		Для Каждого ТекКнопка Из ТекРаздел.НайтиОбъекты(Тип("ТестируемаяКнопкаКомандногоИнтерфейса")) Цикл

			Если Найти(ТекКнопка.НавигационнаяСсылка, "e1cib/command/Подсистема.") > 0
				Или Не ЗначениеЗаполнено(ТекКнопка.НавигационнаяСсылка)
				Или ЭтоСлужебныйРазделВерсия82(ТекКнопка) Тогда
				Продолжить;
			КонецЕсли;

			ПредставлениеТеста = КонтекстЯдра.СтрШаблон_("%1->%2", ТекРаздел.ТекстЗаголовка, ТекКнопка.ТекстЗаголовка);

			ДобавляемоеОписание = Новый Структура;
			ДобавляемоеОписание.Вставить("ПредставлениеТеста", ПредставлениеТеста);
			ДобавляемоеОписание.Вставить("НавигационнаяСсылка", ТекКнопка.НавигационнаяСсылка);
			ДобавляемоеОписание.Вставить("ИмяТеста", ИмяТеста(ТекКнопка.НавигационнаяСсылка));
			КоллекцияОписанийТестов.Вставить(ТекКнопка.НавигационнаяСсылка, ДобавляемоеОписание);

		КонецЦикла;

	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Функция ВидМетаданныхИсключенИзТестирования(ВидМетаданных)
	Если ЕстьНастройка(ВидМетаданных) Тогда
		Возврат (ТипЗнч(Объект.Настройки[ВидМетаданных]) = Тип("Булево") И НЕ Объект.Настройки[ВидМетаданных]);
	КонецЕсли;
	Возврат Ложь;
КонецФункции

&НаКлиенте
Функция ИмяТеста(ПараметрНавигационнаяСсылка)

	ПропускаемыеНавигационныеСсылки = Новый Массив;
	ПропускаемыеНавигационныеСсылки.Добавить("e1cib/command/ОбщаяКоманда.СтраницаМобильноеПриложениеНаAppStore");
	ПропускаемыеНавигационныеСсылки.Добавить("e1cib/command/ОбщаяКоманда.СтраницаМобильноеПриложениеНаGooglePlay");
	ПропускаемыеНавигационныеСсылки.Добавить("e1cib/command/ОбщаяКоманда.СтраницаПродуктаНаСайте1С");
	ПропускаемыеНавигационныеСсылки.Добавить("e1cib/command/ОбщаяКоманда.СтраницаЧтоНовогоВВерсииВидео");
	ПропускаемыеНавигационныеСсылки.Добавить("e1cib/command/Обработка.Ценообразование.Команда.Ценообразование");
	ПропускаемыеНавигационныеСсылки.Добавить("e1cib/command/ОбщаяКоманда.Налоги_РегламентированнаяОтчетность");

	Если ПропускаемыеНавигационныеСсылки.Найти(ПараметрНавигационнаяСсылка) = Неопределено Тогда
		Возврат "ТестДолжен_ПерейтиПоКнопкеКомандногоИнтерфейса";
	Иначе
		Возврат "ТестДолжен_ПропуститьВыполнение";
	КонецЕсли;

КонецФункции

&НаКлиенте
Функция ЭтоСлужебныйРаздел(ГруппаКомандногоИнтерфейса)

	ЗаголовкиСлужебныхРазделов = Новый Соответствие;

	// Такси
	ЗаголовкиСлужебныхРазделов.Вставить(НРег(НСтр("ru = 'Панель разделов'"))                , Истина);
	ЗаголовкиСлужебныхРазделов.Вставить(НРег(НСтр("ru = 'Панель инструментов'"))            , Истина);
	ЗаголовкиСлужебныхРазделов.Вставить(НРег(НСтр("ru = 'Панель открытых'"))                , Истина);
	ЗаголовкиСлужебныхРазделов.Вставить(НРег(НСтр("ru = 'Меню функций'"))                   , Истина);

	Возврат ЗаголовкиСлужебныхРазделов.Получить(НРег(ГруппаКомандногоИнтерфейса.ТекстЗаголовка)) = Истина;

КонецФункции

&НаКлиенте
Функция ЭтоСлужебныйРазделВерсия82(ГруппаКомандногоИнтерфейса)

	ЗаголовкиСлужебныхРазделов = Новый Соответствие;

	// Версия 8.2
	ЗаголовкиСлужебныхРазделов.Вставить(НРег(НСтр("ru = 'Отчеты'"))         , Истина);
	ЗаголовкиСлужебныхРазделов.Вставить(НРег(НСтр("ru = 'Сервис'"))         , Истина);
	ЗаголовкиСлужебныхРазделов.Вставить(НРег(НСтр("ru = 'Панель действий'")), Истина);

	Возврат ЗаголовкиСлужебныхРазделов.Получить(НРег(ГруппаКомандногоИнтерфейса.ТекстЗаголовка)) = Истина;

КонецФункции

&НаКлиенте
Процедура ТестДолжен_ПропуститьВыполнение(ПараметрНавигационнаяСсылка) Экспорт

	КонтекстЯдра.ПропуститьТест();

КонецПроцедуры

&НаКлиенте
Процедура ТестДолжен_ПерейтиПоКнопкеКомандногоИнтерфейса(ПараметрНавигационнаяСсылка) Экспорт

	ТестКлиент = ПлагинТестКлиенты.ТестКлиентПоУмолчанию();
	ОсновноеОкно = ПлагинТестКлиенты.ОсновноеОкно(ТестКлиент);

	ОткрытыеОкнаДо = ПлагинТестКлиенты.ОткрытыеОкна(ТестКлиент);

	Попытка
		ОсновноеОкно.ВыполнитьКоманду(ПараметрНавигационнаяСсылка);
	Исключение
		ВызватьИсключение КонтекстЯдра.СтрШаблон_("Не удалось выполнить команду %1 на тест-клиенте.
		|Возможно, сеанс тест-клиента заблокирован модальным окном", ПараметрНавигационнаяСсылка);
	КонецПопытки;

	ПлагинТестКлиенты.ИдентифицироватьОкноПредупреждение(ТестКлиент, ПереходПоКнопкеКомандногоИнтерфейса(), Ложь);

	ОписанияШаговСценария = Новый Массив;
	ОписанияШаговСценария.Добавить(КликПоПервойСтрокеТаблицыФормы());
	ОписанияШаговСценария.Добавить(КликПоПоследнейСтрокеТаблицыФормы());

	Для Каждого ШагСценария Из ОписанияШаговСценария Цикл
		ОкноСТаблицейФормы = ТестКлиент.ПолучитьАктивноеОкно();
		Если ОкноСТаблицейФормы.НачальнаяСтраница Или ОкноСТаблицейФормы.Основное Тогда
			Продолжить;
		КонецЕсли;
		Обработали = ВыполнитьШагПроверкиТаблицыФормы(ОкноСТаблицейФормы, ШагСценария, ТестКлиент);
		Если Обработали Тогда
			ПлагинТестКлиенты.ИдентифицироватьОкноПредупреждение(ТестКлиент, ШагСценария, Ложь);
		КонецЕсли;
	КонецЦикла;

	ПлагинТестКлиенты.ЗакрытьВсеОткрытыеОкна(ТестКлиент);

	ПлагинТестКлиенты.ПроверитьНаНовыеМодальныеОкна(ТестКлиент, ОткрытыеОкнаДо);

КонецПроцедуры

&НаКлиенте
Функция ВыполнитьШагПроверкиТаблицыФормы(ОкноСТаблицейФормы, ШагСценария, ТестКлиент)

	Результат = Ложь;
	ТекстИсключенияДляГруппировки = НСтр("ru = 'Действие недоступно для строки группировки списка!'");

	ТаблицыФормы = ОкноСТаблицейФормы.НайтиОбъекты(Тип("ТестируемаяТаблицаФормы"));
	
	Если ТаблицыФормы = Неопределено Тогда
		Возврат Результат;
	КонецЕсли;
	
	Для Каждого ТаблицаФормы Из ТаблицыФормы Цикл

		ТаблицаФормы.Активизировать();

		Если Не ТаблицаФормыДоступна(ТаблицаФормы) Тогда
			Продолжить;
		КонецЕсли;

		ПерейтиКЗаданнойСтрокеТаблицыФормы(ШагСценария, ТаблицаФормы, ТестКлиент);

		Если Не ЗначениеЗаполнено(ТаблицаФормы.ПолучитьВыделенныеСтроки()) Тогда
			Результат = Истина;
		Иначе

			РазвернутьВетвьДерева(ТаблицаФормы);

			ТаблицаФормы.Выбрать();

		КонецЕсли;

		Пока ПлагинТестКлиенты.ПоявилосьОкноПредупрежденияСТекстом(ТестКлиент, ТекстИсключенияДляГруппировки) Цикл

			ТекущееОкно = ТестКлиент.ПолучитьАктивноеОкно();
			ТекущееОкно.Закрыть();

			Если ТаблицаФормы.ВозможноРазвернуть() Тогда
				Если Не ТаблицаФормы.Развернут() Тогда
					ТаблицаФормы.Развернуть();
				КонецЕсли;
				ТаблицаФормы.ПерейтиНаУровеньВниз();
			КонецЕсли;

			ТаблицаФормы.Выбрать();

		КонецЦикла;

		ПлагинТестКлиенты.ИдентифицироватьОкноПредупреждение(ТестКлиент, ШагСценария, Ложь);

		ТекущееОкно = ТестКлиент.ПолучитьАктивноеОкно();
		Если ПриКликеВТаблицеФормыНовоеОкноНеОткрылось(ТекущееОкно, ОкноСТаблицейФормы) Тогда
			Если ТаблицаФормы.ТекущийРежимРедактирование() Тогда
				ТаблицаФормы.ЗакончитьРедактированиеСтроки();
			КонецЕсли;
			Результат = Истина;
		Иначе
			НажатьКнопкуЗаписать(ШагСценария, ТекущееОкно, ТестКлиент);
		КонецЕсли;
		
		Если ШагСценария = КликПоПервойСтрокеТаблицыФормы() Тогда
			ПроверитьКомандныйИнтерфейсОкна(ТекущееОкно, ТестКлиент);
		КонецЕсли;
		
		Если ОкноСТаблицейФормы <> ТекущееОкно Тогда
			ТекущееОкно.Закрыть();
		КонецЕсли;
		
	КонецЦикла;

	Возврат Результат;

КонецФункции

&НаКлиенте
Процедура ПерейтиКЗаданнойСтрокеТаблицыФормы(ШагСценария, ТаблицаФормы, ТестКлиент)

	Если ШагСценария = КликПоПервойСтрокеТаблицыФормы() Тогда

		ТаблицаФормы.ПерейтиКПервойСтроке();

	ИначеЕсли ШагСценария = КликПоПоследнейСтрокеТаблицыФормы() Тогда

		ТаблицаФормы.ПерейтиКПоследнейСтроке();

	Иначе

		ВызватьИсключение КонтекстЯдра.СтрШаблон_("Поведение для шага ""%1"" не определено", ШагСценария);

	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Функция ПриКликеВТаблицеФормыНовоеОкноНеОткрылось(ТекущееОкно, ОкноСТаблицейФормы)

	Возврат ТекущееОкно = ОкноСТаблицейФормы;

КонецФункции

&НаКлиенте
Процедура ПроверитьМодифицированность(ШагСценария, ТекущееОкно, ТестКлиент, МоментПроверки)

	ТестируемаяФорма = ТекущееОкно.НайтиОбъект(Тип("ТестируемаяФорма"));
	ТекущаяМодифицированность = ТестируемаяФорма.ТекущаяМодифицированность();
	Если ТекущаяМодифицированность Тогда
		ТекстИсключения = КонтекстЯдра.СтрШаблон_("%1 - %2 - %3 - %4:
		|Ожидали, что форма не модифицирована сразу же после ее открытия или сразу же после записи, а это не так.",
		ШагСценария, МоментПроверки, ТестируемаяФорма.ИмяФормы, ТестируемаяФорма.ТекстЗаголовка);
		КонтекстЯдра.ВызватьОшибкуПроверки(ТекстИсключения);
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура НажатьКнопкуЗаписать(ШагСценария, ТекущееОкно, ТестКлиент)

	КнопкаЗаписать = ТекущееОкно.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Записать");
	Если КнопкаЗаписать = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Если Не КнопкаЗаписать.ТекущаяВидимость() Или Не КнопкаЗаписать.ТекущаяДоступность() Тогда
		Возврат;
	КонецЕсли;

	// Платформа не позволяет заранее определить доступность кнопки.
	// Поэтому нажимаем в попытке, а затем ловим исключение, если нажать кнопку не удалось.
	Попытка
		КнопкаЗаписать.Нажать();
	Исключение
		ТекстИсключения = ОписаниеОшибки();
		Если Найти(ТекстИсключения, "Неподходящий тип элемента управления для вызванного действия") = 0
		   // У формы установлен признак ТолькоПросмотр
		   И Найти(ТекстИсключения, "Невидимый пользователю элемент управления не может выполнять интерактивные действия") = 0 Тогда
			КонтекстЯдра.ВызватьОшибкуПроверки(ТекстИсключения);
		КонецЕсли;
	КонецПопытки;

	ПлагинТестКлиенты.ИдентифицироватьОкноПредупреждение(
		ТестКлиент,
		КонтекстЯдра.СтрШаблон_("%1: Кнопка ""Записать""", ШагСценария),
		Ложь);

КонецПроцедуры

&НаКлиенте
Процедура ПроверитьКомандныйИнтерфейсОкна(ТекущееОкно, ТестКлиент)

	КомандныйИнтерфейс = ТекущееОкно.ПолучитьКомандныйИнтерфейс();
	Для Каждого ТекКнопка Из КомандныйИнтерфейс.НайтиОбъекты(Тип("ТестируемаяКнопкаКомандногоИнтерфейса")) Цикл

		ТекКнопка.Нажать();

		ПлагинТестКлиенты.ИдентифицироватьОкноПредупреждение(
			ТестКлиент,
			КонтекстЯдра.СтрШаблон_("Командный интерфейс формы: ""%1""", ТекКнопка.ТекстЗаголовка),
			Ложь);

	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Функция ПереходПоКнопкеКомандногоИнтерфейса()

	Возврат "Переход по кнопке командного интерфейса";

КонецФункции

&НаКлиенте
Функция КликПоПервойСтрокеТаблицыФормы()

	Возврат "Клик по первой строке таблицы формы";

КонецФункции

&НаКлиенте
Функция КликПоПоследнейСтрокеТаблицыФормы()

	Возврат "Клик по последней строке таблицы формы";

КонецФункции

&НаКлиенте
Функция ТаблицаФормыДоступна(ТаблицаФормы)
	Возврат ТаблицаФормы.ТекущаяДоступность() И ТаблицаФормы.ТекущаяВидимость() И Не ТаблицаФормы.ТекущееТолькоПросмотр();
КонецФункции

&НаКлиенте
Процедура РазвернутьВетвьДерева(ТаблицаФормы)
	
	ТекущаяСтрока = ТекущаяСтрокаТаблицы(ТаблицаФормы);
	
	Пока ТаблицаФормы.ВозможноРазвернуть() Цикл
		
		Если Не ТаблицаФормы.Развернут(ТекущаяСтрока) Тогда
			ТаблицаФормы.Развернуть(ТекущаяСтрока);
			Если Не ТаблицаФормы.Развернут(ТекущаяСтрока) Тогда
				Прервать;
			КонецЕсли;
		КонецЕсли;
		
		ТаблицаФормы.ПерейтиКПоследнейСтроке(Истина);
		Если ТаблицаФормы.ПолучитьВыделенныеСтроки().Количество() <= 1 Тогда
			ТаблицаФормы.ПерейтиКСтроке(ТекущаяСтрока, НаправлениеПереходаКСтроке.Вверх);
			Прервать;	
		КонецЕсли;
		
		Если ТаблицаФормы.ПерейтиКСтроке(ТекущаяСтрока, НаправлениеПереходаКСтроке.Вверх) Тогда
			ТаблицаФормы.ПерейтиНаУровеньВниз();
		КонецЕсли;
		
		мТекущаяСтрока = ТекущаяСтрокаТаблицы(ТаблицаФормы);
		Если СтрокиТаблицыРавны(ТекущаяСтрока, мТекущаяСтрока) Тогда
			Прервать;
		Иначе
			ТекущаяСтрока = мТекущаяСтрока;
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Функция ТекущаяСтрокаТаблицы(ТаблицаФормы)
	
	ВыделенныеСтроки = ТаблицаФормы.ПолучитьВыделенныеСтроки();
	
	Если ВыделенныеСтроки.Количество() Тогда
		ТекущаяСтрокаТаблицы = ВыделенныеСтроки[0];
	Иначе
		ТекущаяСтрокаТаблицы = Новый Соответствие;
	КонецЕсли;
	
	Возврат ТекущаяСтрокаТаблицы;
	
КонецФункции

&НаКлиенте
Функция СтрокиТаблицыРавны(Строка1, Строка2)
	
	Если ТипЗнч(Строка1) <> Тип("Соответствие") Или ТипЗнч(Строка2) <> Тип("Соответствие") Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Если Строка1.Количество() <> Строка2.Количество() Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Для Каждого КлючЗначение Из Строка1 Цикл
		Если КлючЗначение.Значение <> Строка2[КлючЗначение.Ключ] Тогда
			Возврат Ложь;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

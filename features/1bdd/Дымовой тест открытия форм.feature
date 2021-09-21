# language: ru

Функционал: Дымовой тест открытия форм
	Как Разработчик/Инженер по тестированию
	Я Хочу иметь возможность автоматической проверки запуска тестов через Ванесса-АДД
    Чтобы удостовериться в качестве подготовленной конфигурации

Контекст:
    Допустим я подготовил репозиторий и рабочий каталог проекта
    # И я подготовил рабочую базу проекта "./build/ib" по умолчанию

    # И Я копирую каталог "feature" из каталога "tests/fixtures" проекта в подкаталог "build" рабочего каталога
    И Я копирую файл "env.json" из каталога "." проекта в подкаталог "build" рабочего каталога

    И Я сохраняю значение "INFO" в переменную окружения "LOGOS_LEVEL"
    Дано Я очищаю параметры команды "vrunner" в контексте

    Когда Я добавляю параметр "xunit" для команды "vrunner"
    И Я добавляю параметр "<КаталогПроекта>/tests/smoke/тесты_ОткрытиеФормКонфигурации.epf" для команды "vrunner"
    И Я добавляю параметр "--ibconnection /F<КаталогПроекта>/build/ibservicexdd" для команды "vrunner"
    И Я добавляю параметр "--workspace ./build" для команды "vrunner"
    И Я добавляю параметр "--xddExitCodePath ./build/xddExitCodePath.txt" для команды "vrunner"
    И Я добавляю параметр "--pathxunit $addRoot/xddTestRunner.epf" для команды "vrunner"
    И Я добавляю параметр "--language ru" для команды "vrunner"

Сценарий: Тестирование всех метаданных - настроены исключения, индивидуально для каждого вида тестов

    И Я добавляю параметр "--xddConfig <КаталогПроекта>/spec/fixtures/smoke.json" для команды "vrunner"
    Когда Я выполняю команду "vrunner"
    # И Я сообщаю вывод команды "vrunner"
    Тогда Вывод команды "vrunner" содержит
    | Выполняю тесты  с помощью фреймворка Vanessa-ADD (Vanessa Automation Driven Development) |
    |  ==>> набор тестов Тесты "Открытие форм конфигурации" |
    |  ==>> набор тестов УпрФорма # Тесты_ОткрытиеФормКонфигурации |
        |==>> набор тестов Справочники                                                                                      |
        |  -->> тест Справочник.Справочник1.Форма.ФормаЭлемента : открытие формы объекта при создании                       |
        |  -->> тест Справочник.Справочник1.Форма.ФормаЭлемента : открытие формы записанного объекта                        |
        |  -->> тест Справочник.Справочник1 : открытие формы списка                                                         |
        |  -->> тест Справочник.Справочник2 : открытие формы объекта при создании                                           |
        |  -->> тест Справочник.Справочник2 : открытие формы записанного объекта                                            |
        |  -->> тест Справочник.Справочник2 : открытие формы списка                                                         |
        |  -->> тест Справочник.ИерархическийСправочник.Форма.ФормаЭлемента : открытие формы объекта при создании           |
        |  -->> тест Справочник.ИерархическийСправочник.Форма.ФормаГруппы : открытие формы объекта при создании             |
        |  -->> тест Справочник.ИерархическийСправочник.Форма.ФормаЭлемента : открытие формы записанного объекта            |
        |  -->> тест Справочник.ИерархическийСправочник.Форма.ФормаГруппы : открытие формы записанного объекта              |
        |  -->> тест Справочник.ИерархическийСправочник : открытие формы списка                                             |
        |  -->> тест Справочник.СправочникСТабЧастью : открытие формы объекта при создании                                  |
        |  -->> тест Справочник.СправочникСТабЧастью : открытие формы записанного объекта                                   |
        |  -->> тест Справочник.СправочникСТабЧастью : открытие формы списка                                                |
        |  -->> тест Справочник.ПодчиненныйСправочник : открытие формы объекта при создании                                 |
        |  -->> тест Справочник.ПодчиненныйСправочник : открытие формы записанного объекта                                  |
        |  -->> тест Справочник.ПодчиненныйСправочник : открытие формы списка                                               |
        |  -->> тест Справочник.СправочникСоСсылкойНаСамогоСебя.Форма.ФормаЭлемента : открытие формы объекта при создании   |
        |  -->> тест Справочник.СправочникСоСсылкойНаСамогоСебя.Форма.ФормаЭлемента : открытие формы записанного объекта    |
        |  -->> тест Справочник.СправочникСоСсылкойНаСамогоСебя : открытие формы списка                                     |
        |  -->> тест Справочник.ПодчиненныйСДвумяВладельцами : открытие формы объекта при создании                          |
        |  -->> тест Справочник.ПодчиненныйСДвумяВладельцами : открытие формы записанного объекта                           |
        |  -->> тест Справочник.ПодчиненныйСДвумяВладельцами : открытие формы списка                                        |
        |  -->> тест Справочник.СправочникСОбязательнымРеквизитом : открытие формы объекта при создании                     |
        # |  -->> тест Справочник.СправочникСОбязательнымРеквизитом : открытие формы записанного объекта                      |
        |  -->> тест Справочник.СправочникСОбязательнымРеквизитом : открытие формы списка                                   |
        |  -->> тест Справочник.ПростойСправочник3 : открытие формы объекта при создании                                    |
        |  -->> тест Справочник.ПростойСправочник3 : открытие формы записанного объекта                                     |
        |  -->> тест Справочник.ПростойСправочник3 : открытие формы списка                                                  |
        |  -->> тест Справочник.СправочникИерархияЭлементов.Форма.ФормаЭлемента : открытие формы объекта при создании       |
        |  -->> тест Справочник.СправочникИерархияЭлементов.Форма.ФормаЭлемента : открытие формы записанного объекта        |
        |  -->> тест Справочник.СправочникИерархияЭлементов : открытие формы списка                                         |
        |  -->> тест Справочник.Справочник3.Форма.ФормаЭлемента : открытие формы объекта при создании                       |
        |  -->> тест Справочник.Справочник3.Форма.ФормаЭлемента : открытие формы записанного объекта                        |
        |  -->> тест Справочник.Справочник3 : открытие формы списка                                                         |
        |  -->> тест Справочник.ПростойСправочник.Форма.УпрФормаЭлемента : открытие формы объекта при создании              |
        |  -->> тест Справочник.ПростойСправочник.Форма.УпрФормаЭлемента : открытие формы записанного объекта               |
        |  -->> тест Справочник.ПростойСправочник.Форма.ФормаСписка : открытие формы списка                                 |
        |  -->> тест Справочник.ПростойСправочник.Форма.ФормаВыбора : открытие формы списка                                 |
        |  -->> тест Справочник.ПростойСправочник2 : открытие формы объекта при создании                                    |
        # |  -->> тест Справочник.ПростойСправочник2 : открытие формы записанного объекта                                     |
        |  -->> тест Справочник.ПростойСправочник2 : открытие формы списка                                                  |
        |  -->> тест Справочник.дт_ЭлементыСхемРазмещения : открытие формы объекта при создании                             |
        |  -->> тест Справочник.дт_ЭлементыСхемРазмещения : открытие формы записанного объекта                              |
        |  -->> тест Справочник.дт_ЭлементыСхемРазмещения : открытие формы списка                                           |
        |==>> набор тестов Документы                                                                                        |
        |  -->> тест Документ.Документ2.Форма.ФормаДокумента : открытие формы объекта при создании                          |
        |  -->> тест Документ.Документ2.Форма.ФормаДокумента : открытие формы записанного объекта                           |
        |  -->> тест Документ.Документ2.Форма.ФормаСписка : открытие формы списка                                           |
        |  -->> тест Документ.ДокументСДвижениями : открытие формы объекта при создании                                     |
        |  -->> тест Документ.ДокументСДвижениями : открытие формы записанного объекта                                      |
        |  -->> тест Документ.ДокументСДвижениями : открытие формы списка                                                   |
        |==>> набор тестов Обработки                                                                                        |
        |  -->> тест Обработка.Тест_Обработка.Форма.Форма                                                                   |
        |  -->> тест Обработка.ТестОбработка_Форма_ИсключениеПриОткрытии.Форма.УправляемаяФорма                             |
        |  -->> тест Обработка.ТестПадающий_Обработка                                                                       |
        |  -->> тест Обработка.Тест_ЗагрузчикИзПодсистем_НовыйAPIОбъявленияТестов.Форма.Форма                               |
        |==>> набор тестов Отчеты                                                                                           |
        |  -->> тест Отчет.Отчет1.Форма.УправляемаяФормаОтчета                                                              |
        |  -->> тест Отчет.Отчет1                                                                                           |
        |  -->> тест Отчет.ТестовыйОтчетСКДДляСравнениеСЭталоном                                                            |
        |  -->> тест Отчет.Тест_Отчет                                                                                       |
        |  -->> тест Отчет.Отчет2                                                                                           |
        |  -->> тест Отчет.ОтчетСОбщейФормойПоУмолчанию                                                                     |
        |  -->> тест Отчет.ОтчетССобственнымиФормами.Форма.ФормаОтчета                                                      |
        |  -->> тест Отчет.ОтчетССобственнымиФормами.Форма.ФормаНастроек                                                    |
        |  -->> тест Отчет.ОтчетССобственнымиФормами                                                                        |
        |  -->> тест Отчет.ОтчетБезУказанияФорм                                                                             |
        |  -->> тест Отчет.дт_ЭлементыСхемРазмещения                                                                        |
        |  -->> тест Отчет.ВложенныеСхемыСКД                                                                                |
        |==>> набор тестов БизнесПроцессы                                                                                   |
        |  -->> тест БизнесПроцесс.БизнесПроцесс1 : открытие формы объекта при создании                                     |
        |  -->> тест БизнесПроцесс.БизнесПроцесс1 : открытие формы записанного объекта                                      |
        |  -->> тест БизнесПроцесс.БизнесПроцесс1 : открытие формы списка                                                   |
        |  -->> тест БизнесПроцесс.БизнесПроцесс2 : открытие формы объекта при создании                                     |
        |  -->> тест БизнесПроцесс.БизнесПроцесс2 : открытие формы записанного объекта                                      |
        |  -->> тест БизнесПроцесс.БизнесПроцесс2 : открытие формы списка                                                   |
        | ==>> набор тестов Прочее |
        |   -->> тест ТестДолжен_ПроверитьБагПлатформыПриОткрытииУправляемойФормыПриОткрытииКоторойЕстьИсключение |
    # | ИНФОРМАЦИЯ - Все тесты выполнены! |
    # | Выполнение тестов завершено |

    # И Код возврата команды "vrunner" равен 0

Сценарий: Тестирование документов - настроена проверка только избранных

    И Я добавляю параметр "--xddConfig <КаталогПроекта>/spec/fixtures/smoke-include.json" для команды "vrunner"

    Когда Я выполняю команду "vrunner"
    Тогда Вывод команды "vrunner" содержит
    |  ==>> набор тестов Тесты "Открытие форм конфигурации" |
    |  ==>> набор тестов УпрФорма # Тесты_ОткрытиеФормКонфигурации |
    |  ==>> набор тестов Документы                                                         |
    | -->> тест Документ.Документ2   |
    | ИНФОРМАЦИЯ - Все тесты выполнены! |
    | Выполнение тестов завершено |
    И Вывод команды "vrunner" не содержит
    |    -->> тест Документ.ДокументСДвижениями |

    И Код возврата команды "vrunner" равен 0

Сценарий: Тестирование документов - настроено исключение по имени для всех тестов

    И Я добавляю параметр "--xddConfig <КаталогПроекта>/spec/fixtures/smoke-exclude.json" для команды "vrunner"

    Когда Я выполняю команду "vrunner"
    Тогда Вывод команды "vrunner" содержит
    |  ==>> набор тестов УпрФорма # Тесты_ОткрытиеФормКонфигурации |
    |  ==>> набор тестов Документы                                                         |
    |    -->> тест Документ.ДокументСДвижениями |
    | ИНФОРМАЦИЯ - Все тесты выполнены! |
    | Выполнение тестов завершено |
    И Вывод команды "vrunner" не содержит
    | -->> тест Документ.Документ2 |

    И Код возврата команды "vrunner" равен 0

Сценарий: Тестирование документов - фильтр по префиксу

    И Я добавляю параметр "--xddConfig <КаталогПроекта>/spec/fixtures/smoke-prefix.json" для команды "vrunner"

    Когда Я выполняю команду "vrunner"
    Тогда Вывод команды "vrunner" содержит
    |  ==>> набор тестов Документы                                                         |
    |    -->> тест Документ.ДокументСДвижениями |
    | ИНФОРМАЦИЯ - Все тесты выполнены! |
    | Выполнение тестов завершено |
    И Вывод команды "vrunner" не содержит
    |    -->> тест Документ.Документ2   |

    И Код возврата команды "vrunner" равен 0

Сценарий: Тестирование документов - фильтр по подсистеме

    И Я добавляю параметр "--xddConfig <КаталогПроекта>/spec/fixtures/smoke-subsystem.json" для команды "vrunner"

    Когда Я выполняю команду "vrunner"
    Тогда Вывод команды "vrunner" содержит
    |  ==>> набор тестов Обработки                      |
    |      -->> тест Обработка.Тест_Обработка.Форма.Форма |
    |  ==>> набор тестов Отчеты                         |
    |      -->> тест Отчет.Тест_Отчет                     |
    | ИНФОРМАЦИЯ - Все тесты выполнены! |
    | Выполнение тестов завершено |
    И Вывод команды "vrunner" не содержит
    |  ==>> набор тестов Документы                                                         |

    И Код возврата команды "vrunner" равен 0

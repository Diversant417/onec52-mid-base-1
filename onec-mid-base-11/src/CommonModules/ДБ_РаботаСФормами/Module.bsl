#Область ПрограммныйИнтерфейс
// Добавляет реквизиты Согласованная Скидка, Контактное Лицо и Пересчитать Таблицу на формы Заказ Покупателя
// для остальных форм добавляется поле Контактное Лицо
Процедура ДополнитьФорму(Форма) Экспорт

	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппеШапкаСправа(Форма);
		ДобавитьПолеСогласованнаяГруппаСкидка(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда   
		ДобавитьПолеКонтактноеЛицоВГруппеШапкаСправа(Форма);   
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда   
		ДобавитьПолеКонтактноеЛицоВГруппеШапкаСправа(Форма);  	
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда   
		ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма); 	
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда   
		ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма); 	
	КонецЕсли;
	
	
КонецПроцедуры



#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПолеКонтактноеЛицоВГруппеШапкаСправа(Форма)  
	
    ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо",Тип("ПолеФормы"),Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДБ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)  
	
    ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо",Тип("ПолеФормы"), ,Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДБ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьПолеСогласованнаяГруппаСкидка(Форма)  
	
	Группа = Форма.Элементы.Добавить("ГруппаСкидка",Тип("ГруппаФормы"),Форма.Элементы.ГруппаШапкаЛево);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.ОтображатьЗаголовок = Ложь;
	
    ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка",Тип("ПолеФормы"),Форма.Элементы.ГруппаСкидка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДБ_СогласованнаяСкидка";   
	ПолеВвода.УстановитьДействие ("ПриИзменении", "ДБ_СогласованнаяСкидкаПриИзмененииВместо");  
	
	НоваяКоманда = Форма.Команды.Добавить("ПересчитатьТаблицу");
	НоваяКоманда.Действие = "ДБ_ПересчитатьТаблицуПосле";
	НоваяКоманда.Заголовок = "Пересчитать таблицу"; 
	НоваяКоманда.Картинка = БиблиотекаКартинок.Обновить;
	НоваяКоманда.Отображение = ОтображениеКнопки.КартинкаИТекст;
	
	КнопкаКоманды = Форма.Элементы.Добавить("ПересчитатьТаблицу", Тип("КнопкаФормы"),Форма.Элементы.ГруппаСкидка);
	КнопкаКоманды.ИмяКоманды = "ПересчитатьТаблицу";
	КнопкаКоманды.Вид = ВидКнопкиФормы.ОбычнаяКнопка;

	
КонецПроцедуры

#КонецОбласти

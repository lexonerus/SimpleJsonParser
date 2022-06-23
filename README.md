# SimpleJsonParser
Gingerbread Test

![alt text](https://github.com/lexonerus/SimpleJsonParser/blob/main/gingerbread.png)

## Задание:
В качестве тестового задания предлагается создать небольшое приложение, позволяющее:
получать с сервера json-файл cо списком данных нескольких типов (ex: картинка, блок текста, селектор одного варианта из N) и списком кого, какие блоки данных и в каком порядке надо отобразить.
отображать список указанных элементов, и, при клике на них (или выборе одного из вариантов ответа), выводить информацию, что за объект инициировал событие (например: id, имя)
Ссылка на JSON-файл: https://pryaniky.com/static/json/sample.json (data - данные, view - что и в каком порядке выводить)
Используемый язык: Swift
Предпочтительный паттерн при реализации приложения: MVVM
Навык использования Pods (Moya, Alamofire, Kingfisher и т.п.) будет плюсом.
Знакомство с RxSwift будет плюсом

## Структура JSON файла:

```
{
	"data": [{
			"name": "hz",
			"data": {
				"text": "Текстовый блок"
			}
		}, {
			"name": "picture",
			"data": {
				"url": "https://pryaniky.com/static/img/logo-a-512.png",
				"text": "Пряники"
			}
		}, {
			"name": "selector",
			"data": {
				"selectedId": 1,
				"variants": [{
						"id": 1,
						"text": "Вариант раз"
					}, {
						"id": 2,
						"text": "Вариант два"
					}, {
						"id": 3,
						"text": "Вариант три"
					}
				]
			}
		}
	],
	"view": ["hz", "selector", "picture", "hz"]
}
```

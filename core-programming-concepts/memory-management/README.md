# Swift. Управление памятью

В Swift управление памятью полностью основано на __ARC (Automatic Reference Counting)__. В отличие от Objective-C, где можно было вручную использовать retain и release, в Swift все это происходит автоматически.

## Как работает ARC?

* Подсчет ссылок: каждый объект в Swift хранит счетчик ссылок (reference count).
* Когда создается новая ссылка на объект, счетчик увеличивается.
* Когда ссылка удаляется, счетчик уменьшается.
* Когда счетчик достигает нуля, память автоматически освобождается.

```
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) создан")
    }
    deinit {
        print("\(name) уничтожен")
    }
}

var person1: Person? = Person(name: "Иван")  // Иван создан
person1 = nil  // Иван уничтожен (ARC освобождает память)
```

## Проблема циклов сильных ссылок (Retain Cycles)

Иногда ARC не может освободить объект, если две или более ссылок удерживают друг друга. Это называется `retain cycle` (цикл удержания).

```
class Person {
    let name: String
    var pet: Pet?  // Сильная ссылка на Pet
    init(name: String) { self.name = name }
    deinit { print("\(name) уничтожен") }
}

class Pet {
    let name: String
    var owner: Person?  // Сильная ссылка на Person
    init(name: String) { self.name = name }
    deinit { print("\(name) уничтожен") }
}

var ivan: Person? = Person(name: "Иван")
var barsik: Pet? = Pet(name: "Барсик")

ivan?.pet = barsik
barsik?.owner = ivan

ivan = nil  // Иван не уничтожен, потому что barsik всё еще ссылается на него
barsik = nil  // Барсик тоже не уничтожен – циклическая ссылка!
```

__Память утекла! Оба объекта удерживают друг друга и никогда не освобождаются.__

#### Решение: _слабые и бесхозные ссылки_

Чтобы разорвать цикл, используем `weak` или `unowned`.

```
class Pet {
    let name: String
    weak var owner: Person?  // Теперь ссылка не удерживает Person
    init(name: String) { self.name = name }
    deinit { print("\(name) уничтожен") }
}
```

Используем `unowned`, если ссылка НЕ может быть `nil`.

```
class CreditCard {
    let number: String
    unowned let owner: Person  // unowned не увеличивает счетчик ссылок
    init(number: String, owner: Person) {
        self.number = number
        self.owner = owner
    }
    deinit { print("Карта \(number) уничтожена") }
}
```

#### ⚠️ Разница:

`weak var owner: Person?` – может стать nil, поэтому объявляется как optional.

`unowned let owner: Person` – никогда не бывает nil, иначе приложение упадет.

## ARC и замыкания (Closures)

Замыкания могут захватывать объекты, создавая циклы ссылок.

```
class Person {
    let name: String
    var greeting: (() -> Void)?  // Замыкание хранится в объекте
    
    init(name: String) { self.name = name }
    
    func sayHello() {
        greeting = { print("Привет от \(self.name)") }  // Захват `self`
    }
    deinit { print("\(name) уничтожен") }
}

var ivan: Person? = Person(name: "Иван")
ivan?.sayHello()
ivan = nil  // ⚠️ Иван не уничтожен – замыкание удерживает `self`!
```

#### Решение: _использовать [`weak self`] или [`unowned self`]_

```
func sayHello() {
    greeting = { [weak self] in
        if let self = self {
            print("Привет от \(self.name)")
        }
    }
}
```
## Выводы

* ARC автоматически управляет памятью, но циклы ссылок могут вызывать утечки.
* Используйте `weak` или `unowned`, чтобы разрывать циклы.
* Замыкания могут захватывать `self`, создавая циклы – используйте `[weak self]`.

В Swift нет ручного управления памятью – всё работает через ARC, но разработчику важно следить за циклами ссылок.
/*
Опциональные цепочки (последовательности)
*/

// Опциональная цепочка (optional chaining) - процесс запросов и вызовов свойств, методов, сабскриптов (индексов) 
// у опционала, который может быть nil. Если опционал содержит какое-либо значение, то вызов свойства, метода или 
// сабскрипта успешен, и наоборот, если опционал равен nil, то вызов свойства, метода или сабскрипта возвращает nil. 
// Множественные запросы могут быть соединены вместе, и вся цепочка этих запросов не срабатывает, если хотя бы один 
// запрос равен nil.

/*
Aльтернатива принудительному извлечению
*/

// Вы обозначаете опциональную последовательность, когда ставите вопросительный знак (?) опционального значения, 
// свойство, метод или индекс которого вы хотите вызвать, если опционал не nil. 
// Это очень похоже на установку восклицательного знака (!) после опционального значения для принудительного 
// извлечения его значения. Основное отличие в том, что опциональная последовательность не исполняется, если опционал 
// равен nil, в то время как принудительное извлечение приводит к runtime ошибке, когда опционал равен nil.

class Person1 {
    var residence: Residence1?
}
class Residence1 {
    var numberOfRooms = 1
}

// Экземпляры Residence имеют единственное свойство numberOfRooms типа Int, со значением по умолчанию 1. 
// Экземпляры Person имеют опциональное свойство residence типа Residence?. Если вы создаете новый экземпляр Person, 
// то его свойство residence по умолчанию имеет значение nil, в силу того, что оно является опционалом.

let john1 = Person1()

// Если вы попытаетесь получить доступ к свойству numberOfRooms свойства residence экземпляра Person, 
// поставив восклицательный знак после residence, для принудительного извлечения, то вы получите ошибку исполнения, 
//потому что residence не имеет значения для извлечения:
// let roomCount = john.residence!.numberOfRooms // Ошибка

// Опциональная последовательность предоставляет альтернативный способ получить доступ к значению numberOfRooms. 
// Для использования опциональной последовательности используйте вопросительный знак, на месте восклицательного знака

if let roomCount = john1.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
} // Выведет "Unable to retrieve the number of rooms."

/*
Определение классовых моделей для опциональной цепочки
*/

class Person {
    var residence: Residence?
}

class Room {
    let name: String
    init(name: String) { 
        self.name = name 
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?

    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("Общее количество комнат равно \(numberOfRooms)")
    }
    var address: Address?
}

// Класс Address имеет три опциональных свойства типа String?.

// Класс Address предоставляет метод buildingIdentifier(), который возвращает String?. 
// Этот метод проверяет значения свойств экземпляра и возвращает buildingName, если у него есть значение или 
// возвращает buildingNumber, если у него есть значение или nil, если ни у одного из свойств нет значения.

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
} // Выведет "Unable to retrieve the number of rooms."

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

// В этом примере попытка установить значение свойству address опциональному свойству residence? провалится, 
// так как john.residence все еще nil.

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john.residence?.address = createAddress()
// Можно заметить, что функция createAddress() не вызывается, так как ничего в консоли у нас не выводится.

/*
Вызов методов
*/

// Вы можете использовать опциональную последовательность для вызова метода опциональной величины, 
// и проверить сам вызов метода на успешность. 
// Вы можете сделать это, даже если этот метод не возвращает значения.

if john.residence?.printNumberOfRooms() != nil {
    print("Есть возможность вывести общее количество комнат.")
} else {
    print("Нет возможности вывести общее количество комнат.")
} // Выведет "Нет возможности вывести общее количество комнат."

// Если вы вызовите этот метод на опциональном значении в опциональной последовательности, то он вернет 
// тип не Void, а Void?, потому что возвращаемые значения всегда опционального типа, когда они вызываются 
// через опциональную последовательность. Это позволяет вам использовать конструкцию if для проверки на 
// возможность вызова метода printNumberOfRooms, даже если метод сам не определяет возвращаемого значения. 

if (john.residence?.address = someAddress) != nil {
    print("Была возможность установить адрес.")
} else {
    print("Не было возможности установить адрес.")
} // Выведет "Не было возможности установить адрес."

/*
Доступ к сабскриптам 
*/

if let firstRoomName = john.residence?[0].name {
    print("Название первой комнаты \(firstRoomName).")
} else {
    print("Никак не получить название первой комнаты.")
} // Выведет "Никак не получить название первой комнаты."

john.residence?[0] = Room(name: "Bathroom")
// Это попытка установки значения через сабскрипт так же не срабатывает, так как residence все еще nil.

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Гостиная"))
johnsHouse.rooms.append(Room(name: "Кухня"))
john.residence = johnsHouse
 
if let firstRoomName = john.residence?[0].name {
    print("Название первой комнаты \(firstRoomName).")
} else {
    print("Никак не получить название первой комнаты.")
}
// Выведет "Название первой комнаты Гостиная."

/*
Получение доступа к сабскрипту (индексу) опционального типа
*/

// Если сабскрипт возвращает значение опционального типа, например ключ словаря типа Dictionary в Swift, 
// то мы должны поставить вопросительный знак после закрывающей скобки сабскрипта, для присоединения его 
// опционального возвращаемого значения

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// массив "Dave" теперь имеет вид [91, 82, 84], массив "Bev" - [80, 94, 81]

/*
Соединение нескольких уровней опциональных цепочек
*/

// Вы можете соединить несколько уровней опциональных последовательностей вместе для того, чтобы пробраться 
// до свойств, методов, сабскриптов, которые находятся глубже в модели. 
// Однако многоуровневые опциональные последовательности не добавляют новых уровней опциональности 
// к возвращаемым значениям.

    // Если тип, который вы пытаетесь получить не опциональный, то он станет опциональным из-за 
    // опциональной последовательности.

    // Если тип, который вы пытаетесь получить, уже опциональный, то более опциональным он уже не станет, 
    // даже по причине опциональной последовательности.

// То есть: 

    // Если вы пытаетесь получить значение типа Int через опциональную последовательность, то получите Int?, 
    // и это не будет зависеть от того, сколько уровней в опциональной последовательности задействовано.

    // Аналогично, если вы попытаетесь получить значение типа Int? через опциональную последовательность, 
    // то вы получите Int?, что опять таки не зависит от количества уровней, которые задействованы в 
    // опциональной последовательности.

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
} // Выведет "Unable to retrieve the address."

// Значение john.residence на данный момент содержит корректный экземпляр класса Residence. Однако значение 
// john.residence.address равно nil. Из-за этого вызов john.residence?.address?.street проваливается.

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress
 
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
} // Выведет "John's street name is Laurel Street."

/*
Связывание методов в ОП с опциональными возвращаемыми значениями
*/

// Вы так же можете использовать опциональную последовательность для вызова метода, который возвращает 
// значение опционального типа, а затем к этой опциональной последовательности может прикрепить и 
// возвращаемое значение самого метода, если это нужно.

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
} // Выведет "John's building identifier is The Larches."

// Если вы хотите продолжить свою опциональную привязку и на возвращаемое значение метода, то разместите 
// вопросительный знак после круглых скобок самого метода

if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
} // Выведет "John's building identifier begins with "The"."
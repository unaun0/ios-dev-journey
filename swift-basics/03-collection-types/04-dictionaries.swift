/*
Словари
*/

// Словарь хранит связи между ключами одного типа и значениями другого типа в коллекции без определённого порядка. 
// Каждое значение связано с уникальным ключом, который служит идентификатором этого значения в словаре. 

// Тип Dictionary Swift связан с NSDictionary классом Foundation.

// Создание пустого словаря

var namesOfIntegers1: Dictionary<Int, String> = [:]
var namesOfIntegers: [Int: String] = [:]

namesOfIntegers[16] = "sixteen" // Добавление - Ключ = 16, Значение = "sixteen"

namesOfIntegers = [:] // Опустошить словарь

// Создание словаря с помощью словарного литерала

var airports1 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

/*
Доступ к словарю и его изменение
*/

// count, isEmpty аналогично Array и Set

airports["LHR"] = "London" // Добавление

airports["LHR"] = "London Heathrow" // Изменение значения для ключа
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] { // Проверка доступа к значению
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}

airports["APL"] = "Apple International"

airports["APL"] = nil // Удаление элемента ключ-значение из словаря
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

// Перебор по словарю
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ


for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson

let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]


let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]

// Тип Dictionary в Swift не имеет определённого порядка. Чтобы перебрать ключи или значения словаря в 
// определённом порядке, используйте метод sorted() для keys или values
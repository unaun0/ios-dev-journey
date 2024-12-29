// ex.9.1

// Набор требований (свойств, методов или других функциональностей), 
// которые должны быть реализованы классами, структурами или перечислениями, 
// которые соответствуют этим протоколам

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Типы, которые соответствуют этому протоколу, 
// должны иметь свойство simpleDescription (только для чтения или чтения/записи).
// Они должны реализовать метод adjust(), который изменяет состояние объекта.

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
print(b.simpleDescription)

// ex.9.2

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

var number = 7
number.adjust()
print(number)

// ex.9.3

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty) error


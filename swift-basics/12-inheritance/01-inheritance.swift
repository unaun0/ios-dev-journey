/*
Наследование
*/

// Класс может наследовать методы, свойства и другие характеристики другого класса. 
// Когда один класс наследует у другого класса, то наследующий класс называется подклассом, 
// класс у которого наследуют - суперклассом. 

// Наследование - фундаментальное поведение, которое отделяет классы от других типов Swift.

/*
Определение базового класса
*/

// Любой класс, который ничего не наследует из другого класса, называется базовым классом.

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "движется на скорости \(currentSpeed) миль в час"
    }
    func makeNoise() {
        //ничего не делаем, так как не каждый транспорт шумит
    }
}
let someVehicle = Vehicle()
print("Транспорт: \(someVehicle.description)") //Транспорт: движется на скорости 0.0 миль в час

/*
Наследование подклассом

class SomeSubclass: SomeSuperclass {
  // определение подкласса проводится тут
}
*/

class Bicycle: Vehicle {
    var hasBasket = false
}

// Новый класс Bicycle автоматически собирает все характеристики Vehicle, например, 
// такие свойства как currentSpeed и description и метод makeNoise().

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Велосипед: \(bicycle.description)") //Велосипед: движется на скорости 15.0 миль в час

// Подклассы сами могут создавать подклассы. 

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Тандем: \(tandem.description)") // Тандем: движется на скорости 22.0 миль в час

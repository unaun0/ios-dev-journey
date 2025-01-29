/*
Тема: Методы

Задание: 
    Расширь класс Круг, добавив метод площадь(), который возвращает площадь круга.
*/

import Foundation

class Circle {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    var circumference: Double {
        return 2 * .pi * radius
    }

    func area() -> Double {
        return .pi * radius * radius
    }
}

let circle = Circle(radius: 5)

print("Радиус круга: \(circle.radius)")
print("Длина окружности: \(circle.circumference)")
print("Площадь окружности: \(circle.area())")
/*
Тема: Свойства

Задание: 
    Создай класс Круг, в котором есть свойство радиус, а также вычисляемое свойство длина окружности.
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
}

let circle = Circle(radius: 5)
print("Радиус круга: \(circle.radius)")
print("Длина окружности: \(circle.circumference)")
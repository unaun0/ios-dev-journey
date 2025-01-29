/*
Тема: Базовые операторы

Задание: 
    Создай простую калькуляторную функцию, которая принимает два числа и 
    оператор (+, -, *, /) в виде строки и выполняет соответствующую операцию.
*/

import Foundation

print("Введите первое число:", terminator: " ")
let num1 = Double(readLine()!)!

print("Введите второе число:", terminator: " ")
let num2 = Double(readLine()!)!

print("Введите оператор(+, -, *, /)", terminator: " ")
let op = (readLine() ?? "").trimmingCharacters(in: CharacterSet.whitespaces)

if op == "+" {
    print(num1 + num2)
} else if op == "-" {
    print(num1 - num2)
} else if op == "*" {
    print(num1 * num2)
} else if op == "/" {
    print(num1 / num2)
} else {
    print("Оператор не задан")
}


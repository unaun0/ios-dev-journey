/*
Тема: Типы коллекций

Задание: 
    Создай массив с именами нескольких друзей. Напиши код, который:
    добавляет новое имя,
    удаляет имя по индексу,
    сортирует массив по алфавиту.
*/

import Foundation

var friendList = ["Маша", "Катя", "Антон", "Аня", "Янина", "Яна"]

print("Введите имя нового друга:", terminator: " ")
let newFriend = (readLine() ?? "").trimmingCharacters(in: CharacterSet.whitespaces)
friendList.append(newFriend)
print("Список друзей:", friendList)

print("Введите номер друга для удаления по индексу (от 0 до \(friendList.count - 1)):", terminator: " ")
let delFriend = Int((readLine() ?? "").trimmingCharacters(in: CharacterSet.whitespaces)) ?? 0
friendList.remove(at: delFriend)
print("Список друзей:", friendList)

friendList.sort()
print("Список друзей:", friendList)


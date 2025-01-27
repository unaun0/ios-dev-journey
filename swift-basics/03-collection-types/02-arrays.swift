/*
Массивы
*/

// Массив хранит значения одного типа в упорядоченном списке. 
// Одно и то же значение может встречаться в массиве несколько раз в разных позициях.

// ArrayТип Swift связан с NSArray классом Foundation.

// Создание пустого массива

var someArr: Array<Int> = []
var someInts: [Int] = [] // Аналогично someArr
print("someInts is of type [Int] with \(someInts.count) items.") // "someInts is of type [Int] with 0 items."

// Создание массива со значением по умолчанию

var threeDoubles = Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]

// Создание массива путем сложения двух массивов вместе

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles // [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

// Создание массива с помощью литерала массива
// [<#value 1#>, <#value 2#>, <#value 3#>]

var shoppingList: [String] = ["Eggs", "Milk"]

// Доступ к массиву и его изменение

print("The shopping list contains \(shoppingList.count) items.") // Количество элементов в массиве - 2

if shoppingList.isEmpty { // Проверка - пустой ли массив
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

shoppingList.append("Flour") // Добавить новый элемент в конец массива
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0] // "Eggs" - Получить значение из массива по индексу

shoppingList[0] = "Six eggs" // Изменить существующее значение по заданному индексу

shoppingList[4...6] = ["Bananas", "Apples"] // Заменяет элементы с индексами 4, 5, 6 на 2 элемента: "Bananas", "Apples"

shoppingList.insert("Maple Syrup", at: 0) // Вставить элемент в массив по указанному индексу

let mapleSyrup = shoppingList.remove(at: 0) // Удалить элемент из массива по указанному индексу

let apples = shoppingList.removeLast() // Удалить последний элемент из массива

/*
Выполнение итерации по массиву
*/

for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
/*
Логические значения
*/

// В Swift есть базовый тип Boolean, называемый Bool. 
// Булевы значения называются логическими, потому что они могут быть только истинными или ложными. 

// В Swift есть два булевых константных значения: true и false

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

// Безопасность типов в Swift не позволяет заменять Bool на значения, которые отличны от логических.

let i = 1
// if i { // Ошибка
//    ... 
// }

if i == 1 { // Правильно
    print(i)
}


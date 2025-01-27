/*
Замыкания
*/

// Замыкания - это самодостаточные блоки с определенным функционалом, которые могут быть переданы и использованы в вашем коде.

/*
Блок замыкания, без возврата значения и параметров
*/

// Функция, это частный случай замыкания.
// Простыми словами: блок замыкания по сути является функцией без имени, с дополнительным функционалом, 
// они могут захватывать значения из окружающего контекста. 

// Синтаксис самого простого блока замыкания, который ничего не принимает и ничего не возвращает:
// { 
//      код для выполнения
// }

let greeting = {
    print("Hello, Swift!")
}
greeting() // Hello, Swift!
// У данного замыкания нет ни каких параметров, и нет никакого возвращаемого значения.

// Можем сразу запустить блок замыкания если после фигурных скобок определим круглые скобки
let greeting2 = {
    print("Hello, Swift!")
}() // Hello, Swift!

// Мы можем передавать эти замыкания, хранить их, передавать аргументы как функции и 
// обращаться с ними почти так же, как с любым другим объектом в Swift.

/*
Замыкание принимающее параметры
*/

// { (параметры) in
//      код для выполнения
// }

let greeting3 = { (name: String) in
    print("Hello, \(name)!")
}
greeting3("Tim") // Hello, Tim!

let multiply: (Int, Int) -> Void = { numberOne, numberTwo in
    print(numberOne * numberTwo)
}
multiply(3, 5) // 15

// Еще один вариант записи
let multiply2 = { (numberOne: Int, numberTwo: Int) in
    print(numberOne * numberTwo)
}
multiply2(3, 5) // в консоли будет 15

/*
Замыкание возвращающие значения
*/

// { (параметры) -> тип результата in
//      код для выполнения
// }

let multiply3 = { (numberOne: Int, numberTwo: Int) -> Int in
    numberOne * numberTwo
}
let result = multiply3(3, 5)
print(result) // 15

/*
Замыкание в качестве параметров
*/

// Так же как и функции, блоки замыканиям мы можем передавать в качестве параметров

let multiplyClosure = { (numberOne: Int, numberTwo: Int) -> Int in
    numberOne * numberTwo
}
func multiply4(numberOne: Int, numberTwo: Int) -> Int {
    numberOne * numberTwo
}
let action = multiply4 // копия функции
multiplyClosure(4, 3)
action(4, 3)

// Функция, которая принимает в качестве параметра тип блока замыкания
func performOperation(_ operation: (Int, Int) -> Int) {
    let result = operation(4, 5)
    print("The result is: \(result)")
}
performOperation(multiplyClosure)
performOperation(multiply4)

// Параметр с типом блока замыкания, лучше определять в конце. 

func performOperation2(between numberOne: Int,and numberTwo: Int , operation: (Int, Int) -> Int) {
    let result = operation(numberOne, numberTwo)
    print("The result is: \(result)")
}

performOperation2(between: 3, and: 5, operation: multiplyClosure) // The result is: 15
performOperation2(between: 3, and: 5, operation: multiply4) // The result is: 15

/*
Замыкающие выражения - это способ написания встроенных замыканий.
*/

let operation: (Int, Int) -> Int = { numberOne, numberTwo in
    numberOne * numberTwo
}
let value = operation(4, 5)

performOperation2(between: 1, and: 2, operation: {(op1, op2) -> Int in
    return op1 + op2
})

// Eсли замыкание передается в качестве последнего параметра в функцию, то синтаксис позволяет сократить запись, 
// и код замыкания просто прикрепляется к хвосту вызова
performOperation2(between: 1, and: 2) {(op1, op2) -> Int in
    return op1 + op2
}

// Не используем ключевое слово «return»
performOperation2(between: 1, and: 2) {(op1, op2) -> Int in
    op1 + op2
}

// Используем стенографические имена для параметров.
// Т.е. каждому параметру по умолчанию присваивается псевдоним в формате $n, 
// где n — порядковый номер параметра, начиная с нуля. 
// Таким образом, нам, оказывается, даже не нужно придумывать имена для аргументов. 
// В таком случае весь «заголовок» замыкания уже не несет в себе никакой смысловой нагрузки, и его можно опустить
performOperation2(between: 1, and: 2) { $0 + $1 }

// Операторные функции.
// Если замыкание работает только с двумя входными аргументами, в качестве замыкания разрешается передать операторную функцию, 
// которая будет выполняться над этими аргументами (операндами). 
performOperation2(between: 1, and: 2, operation: +)

// Swift также позволяет использовать операции сравнения в качестве операторной фуниции
func performComparisonOperation(_ op1: Double, _ op2: Double, _ operation: (Double, Double) -> Bool) -> Bool {
    return operation(op1, op2)
}
print(performComparisonOperation(1.0, 1.0, >=)) // Выведет "true"
print(performComparisonOperation(1.0, 1.0, <)) // Выведет "false"

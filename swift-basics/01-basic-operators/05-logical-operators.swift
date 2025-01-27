/*
Логические операторы
*/

// Логические операторы изменяют или объединяют логические значения true и false. 
// Swift поддерживает три стандартных логических оператора:
// НЕ (!a)
// И (a && b)
// ИЛИ (a || b)

/*
Логический оператор NOT
*/

// Логический оператор НЕ (!a) инвертирует логическое значение, так что true становится false, а false становится true.
// Логический оператор NOT является префиксным оператором и ставится непосредственно перед значением, 
// с которым он работает, без пробелов.

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

/*
Логический оператор AND
*/

// Логический оператор И (a && b) создаёт логические выражения, в которых оба значения должны быть true, 
// чтобы общее выражение также было true.
// Если любое из значений равно false, то и всё выражение будет равно false. 
// На самом деле, если первое значение равно false, то второе значение даже не будет вычисляться, 
// потому что оно не может сделать всё выражение равным true. Это называется короткой цепью вычислений.

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

/*
Логический оператор OR
*/

// Логический оператор ИЛИ (a || b) — это инфиксный оператор, состоящий из двух соседних символов вертикальной черты. 
// Вы используете его для создания логических выражений, в которых только одно из двух значений должно быть true для того, 
// чтобы общее выражение было true.

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

/*
Объединение логических операторов
*/

// Вы можете комбинировать несколько логических операторов для создания более длинных составных выражений

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

/*
Явные круглые скобки
*/

// Иногда полезно использовать скобки, даже если они не нужны, чтобы упростить чтение сложного выражения. 

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
/*
Вложенные функции
*/

// Все ранее рассмотренные функции являются примерами глобальных функций, 
// которые определяются в глобальной области видимости. 
// Вы также можете определять функции внутри других функций, 
// которые называются вложенными функциями.

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print(moveNearerToZero(4)) // 5
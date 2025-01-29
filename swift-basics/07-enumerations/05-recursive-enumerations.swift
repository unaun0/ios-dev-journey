/*
Рекурсивные перечисления
*/

// Рекурсивные перечисления - это такие перечисления, экземпляры которого являются ассоциативным значением одного 
// или более кейсов перечисления. Вы обозначаете такие кейсы перечисления при помощи ключевого слова indirect перед кейсом, 
// что сообщает компилятору о том, что нужен дополнительный слой индирекции.

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// либо можете написать indirect прямо перед самим перечислением

// indirect enum ArithmeticExpression {
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
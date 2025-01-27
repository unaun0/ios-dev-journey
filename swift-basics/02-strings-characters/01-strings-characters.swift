/*
Строки и символы
*/

// Строка — это последовательность символов, например "hello, world" или "albatross". 
// Строки в Swift представлены типом String. 
// Доступ к содержимому String можно получить разными способами, в том числе как к коллекции значений Character.

// Типы String и Character в Swift обеспечивают быстрый и совместимый с Unicode способ работы с текстом в коде.

// Тип String в Swift связан с классом NSString в Foundation. Foundation также расширяет String для предоставления методов, 
// определённых в NSString. Это означает, что если вы импортируете Foundation, то можете получить доступ 
// к этим NSString методам в String без приведения типов.

/*
Строковые литералы
*/

let someString = "Some string literal value"

/*
Многострочные строковые литералы
*/

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

// Обратная косая черта (\) в конце строки - перенос строки в коде

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

/*
Специальные символы в строковых литералах
*/

// Строковые литералы могут включать следующие специальные символы:
    // Специальные символы в кодировке \0 (нулевой символ), \\ (обратная косая черта), 
    // \t (горизонтальная табуляция), \n (перевод строки), \r (возврат каретки), 
    // \" (двойная кавычка) и \' (одинарная кавычка)

    // Произвольное скалярное значение Юникода, записываемое как \u{n}, 
    // где n — это шестнадцатеричное число

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotatison mark \"\"\"
"""
print(threeDoubleQuotationMarks)
// Escaping the first quotation mark """
// Escaping all three quotation marks """

/*
Расширенные pазделители строк
*/

// Вы можете поместить строковый литерал в расширенные разделители, чтобы включить в строку специальные символы, 
// не прибегая к их воздействию. Вы помещаете строку в кавычки (") и окружаете её знаками (#). 
// Например, при выводе строкового литерала #"Line 1\nLine 2"# выводится управляющая последовательность перевода строки (\n), 
// а не строка, разделённая на две строки.

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """\n
"""#
print(threeMoreDoubleQuotationMarks) // "Here are three more double quotes: """\n"

/*
Инициализация пустой строки
*/

var emptyString = ""
var anotherEmptyString = String() 
if emptyString.isEmpty {
    print("Nothing to see here")
}

/* 
Изменение строк
*/

var variableString = "Horse"
variableString += " and carriage" // "Horse and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander" // Ошибка: constant string cannot be modified

/* 
Работа с символами
*/

for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"] // Массив символов
let catString = String(catCharacters)
print(catString) // "Cat!🐱"

/*
Объединение строк и символов
*/

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2 // "hello there"

var instruction = "look over"
instruction += string2 // "look over there"

let exclamationMark1: Character = "!"
welcome.append(exclamationMark1) // "hello there!"

// Нельзя добавить String или Character к существующей переменной Character, 
// потому что переменная типа Character должна содержать только один символ.

/*
Интерполяция строк
*/

// Строковая интерполяция — это способ создания нового String значения из комбинации констант, 
// переменных, литералов и выражений путём включения их значений в строковый литерал.

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)" // "3 times 2.5 is 7.5"

print(#"Write an interpolated string in Swift using \(multiplier)."#) // "Write an interpolated string in Swift using \(multiplier)."

print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."

// Выражения, которые вы вводите в скобках внутри интерполированной строки, не могут содержать обратную косую черту (\), 
// возврат каретки или перевод строки. Однако они могут содержать другие строковые литералы.

// Чтобы подсчитать количество значений Character в строке, используйте count

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters") // "unusualMenagerie has 40 characters"

/*
Строковые индексы
*/

// Каждому значению String соответствует тип индекса, String.Index, который определяет положение каждого Character в строке.
// startIndex  - начало строки - позиция первого символ строки 
// endIndex — конец строки - позиция после последнего символа строки
// Получить доступ к индексам до и после заданного индекса с помощью методов: before и after

let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u

// Сдвиг относительно указанного индекса; index(_:offsetBy:)
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // a

// Попытка обратиться к индексу, выходящему за пределы диапазона строки, или к Character по индексу, 
// выходящему за пределы диапазона строки, приведёт к ошибке во время выполнения.

// greeting[greeting.endIndex] // Error
// greeting.index(after: greeting.endIndex) // Error

// можно использовать indices для доступа ко всем индексам отдельных символов в строке

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
} // "G u t e n   T a g !"

// Можно использовать startIndex и endIndex, index(before:), index(after:) и index(_:offsetBy:) 
// для любого типа, соответствующего Collection протоколу. 
// Сюда входят String, а также такие типы коллекций, как Array, Dictionary и Set.

/*
Вставка и удаление
*/

// Вставить один символ в строку по указанному индексу - метод insert(_:at:)

var welcm = "hello"
welcm.insert("!", at: welcm.endIndex) // "hello!"

// Вставить содержимое другой строки по указанному индексу - метод insert(contentsOf:at:)

welcm.insert(contentsOf: " there", at: welcm.index(before: welcm.endIndex)) // "hello there!"

// Удалить из строки один символ по указанному индексу - метод remove(at:)

welcm.remove(at: welcm.index(before: welcome.endIndex)) // "hello there"

// Удалить подстроку по указанному диапазону - метод removeSubrange(_:)

let rng = welcm.index(welcm.endIndex, offsetBy: -6)..<welcm.endIndex
welcm.removeSubrange(rng) // "hello"

// insert(_:at:), insert(contentsOf:at:), remove(at:), и removeSubrange(_:) 
// можно использовать для String, Array, Dictionary и Set (для любого типа, 
// соответствующего протоколу RangeReplaceableCollection)
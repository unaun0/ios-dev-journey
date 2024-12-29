import Foundation

// ex.10.1

// В Swift ошибки представляются типами, которые соответствуют протоколу Error.
// В данном примере используется перечисление PrinterError, 
// чтобы определить три возможные ошибки:
//      outOfPaper — ошибка, когда закончилась бумага.
//      noToner — ошибка, когда закончился тонер.
//      onFire — критическая ошибка, когда принтер загорелся.

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// throws указывает, что функция может выбросить ошибку.
// Если внутри функции происходит ошибка, мы используем throw для её генерации. 
// После этого выполнение функции немедленно завершается.

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// код, который может выбросить ошибку, оборачивается в do блок.
// Перед вызовом потенциально ошибочной функции используется ключевое слово try.
// Если происходит ошибка, управление переходит в блок catch.
// Ошибка автоматически присваивается имени error, если не указано иное.

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// Prints "Job sent"

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// ex.10.2
// Какую ошибку нужно сгенерировать, чтобы она была обработана третьим блоком catch?
// Любую ошибку, не являющуюся PrinterError
do {
    throw NSError(domain: "TestError", code: 1, userInfo: nil)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// Вывод: Error Domain=TestError Code=1 "(null)"

// ex.10.3
// Использование try? для обработки ошибок

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// Когда мы используем try?, попытка выполнить функцию, 
// которая может выбросить ошибку, 
// возвращает опциональное значение (Optional). 
// Если функция завершается без ошибок, 
// возвращается обёрнутый результат в виде опционала. 
// Если функция выбрасывает ошибку, результат будет равен nil, 
// и ошибка будет проигнорирована (не обработана).

// ex.10.4
// Использование defer для выполнения завершающего кода
// defer позволяет выполнить определённый код после завершения функции, 
// независимо от того, произошла ли ошибка.
// Важно, что блоки defer выполняются в том порядке, 
// в котором они были объявлены, 
// но в обратном порядке их вызова (последний defer выполняется первым).

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)
// Prints "false"

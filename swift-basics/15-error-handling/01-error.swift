/*
Обработка ошибок
*/

// Обработка ошибок - это процесс реагирования на возникновение ошибок и восстановление после появления ошибок в программе. 

/*
Отображение и генерация ошибок
*/

// В Swift для создания перечня возможных ошибок служат перечисления, где каждый член перечисления соответствует отдельной ошибке.
// Само перечисление при этом должно поддерживать протокол ErrorType, который, хотя и является пустым, сообщает о том, что данный
// объектный тип содержит варианты ошибок. Не стоит создавать одно перечисление на все случаи жизни. Группируйте возможные ошибки 
// по их смыслу в различных перечислениях.

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
// Процесс появления ошибки называется выбрасыванием ошибки. Для того чтобы выбросить ошибку, 
// необходимо воспользоваться оператором throw.

// throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
// Swift/ErrorType.swift:200: Fatal error: Error raised at top level: main.VendingMachineError.insufficientFunds(coinsNeeded: 5)

/*
Обработка ошибок
*/

// Выброшенную ошибку необходимо перехватить и корректно обработать.
// В Swift существует четыре способа обработки ошибок:
    // Передача ошибки.
    // Обработка ошибки оператором do-catch.
    // Преобразование ошибки в опционал.
    // Запрет на выброс ошибки.

// Если при вызове какой-либо функции или метода вы знаете, что он может выбросить ошибку, то 
// необходимо перед вызовом указывать ключевое слово try.

/*
Передача ошибки с помощью генерирующей функции
*/

// При передаче ошибки блок кода (функция, метод или инициализатор), ставший источником ошибки, самостоятельно не обрабатывает ее,
// а передает выше в код, который вызвал данный блок кода.

// Чтобы указать, что функция, метод или инициализатор могут генерировать ошибку, вам нужно написать ключевое слово throws 
// в реализации функции после ее параметров. Функция, отмеченная throws называется генерирующей функцией. 
// Если у функции установлен возвращаемый тип, то вы пишете ключевое слово throws перед стрелкой возврата (->).

// func canThrowErrors() throws -> String
// func cannotThrowErrors() -> String

// Генерирующая функция передает ошибки, которые возникают внутри нее в область вызова этой функции.
// !!! Любые ошибки, сгенерированные внутри non-throwing функции, должны быть обработаны внутри самой функции.

struct Item {
    var price: Int
    var count: Int
}
 
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// Генерирующие ошибку инициализаторы могут распространять ошибки таким же образом, как генерирующие ошибку функции. 
// Например, инициализатор структуры PurchasedSnack в списке ниже вызывает генерирующую ошибку функции как часть процесса инициализации, 
// и он обрабатывает любые ошибки, с которыми сталкивается, путем распространения их до вызывающего его объекта.

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
// var psnack = try PurchasedSnack(name: "Яблоко", vendingMachine: VendingMachine())
// Swift/ErrorType.swift:200: Fatal error: Error raised at top level: main.VendingMachineError.invalidSelection

/*
Обработка ошибок с использованием do-catch
*/

// Используйте инструкцию do-catch для обработки ошибок, запуская блок кода. Если выдается ошибка в коде условия do, 
// она соотносится с условием catch для определения того, кто именно сможет обработать ошибку.

/* 
            do {
                try выражение
                выражение
            } catch шаблон 1 {
                выражение
            } catch шаблон 2  where условие {
                выражение
            } catch шаблон 3, шаблон 4 where условие {
                выражение
            } catch {
                выражение
            }
*/

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Ошибка выбора.")
} catch VendingMachineError.outOfStock {
    print("Нет в наличии.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Недостаточно средств. Пожалуйста вставьте еще \(coinsNeeded) монетки.")
} catch {
    print("Неожиданная ошибка: \(error).")
} // Выведет "Недостаточно средств. Пожалуйста вставьте еще 2 монетки.

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Некорректный вывод, нет в наличии или недостаточно денег.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
} // Выведет "Некорректный вывод, нет в наличии или недостаточно денег."

/*
Преобразование ошибок в опциональные значения
*/

// Вы можете использовать try? для обработки ошибки, преобразовав ее в опциональное значение. 
// Если ошибка генерируется при условии try?, то значение выражения вычисляется как nil. 
// Например, в следующем коде x и y имеют одинаковые значения и поведение:

/*
            func someThrowingFunction() throws -> Int {
                // ...
            }
            
            let x = try? someThrowingFunction()
            
            let y: Int?
            do {
                y = try someThrowingFunction()
            } catch {
                y = nil
            }
*/

// Использование try? позволяет написать краткий код обработки ошибок, если вы хотите обрабатывать все ошибки таким же образом. 

/* 
            func fetchData() -> Data? {
                if let data = try? fetchDataFromDisk() { return data }
                if let data = try? fetchDataFromServer() { return data }
                return nil
            }
*/

/*
Запрет на передачу ошибок
*/

// Иногда вы знаете, что функции throw или методы не сгенерируют ошибку во время исполнения. 
// В этих случаях, вы можете написать try! перед выражением для запрета передачи ошибки и завернуть вызов в утверждение того, 
// что ошибка точно не будет сгенерирована. Если ошибка на самом деле сгенерирована, вы получите сообщение об ошибке исполнения.

// let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

/*
Установка действий по очистке (Cleanup)
*/

// Вы используете оператор defer для выполнения набора инструкций перед тем как исполнение кода оставит текущий блок. 
// Это позволяет сделать любую необходимую очистку, которая должна быть выполнена, независимо от того, как именно это 
// произойдет — либо он покинет из-за сгенерированной ошибки или из-за оператора, такого как break или return. 

// Например, вы можете использовать defer, чтобы удостовериться, что файл дескрипторов закрыт и выделенная память вручную освобождена.

import Foundation

func openFile(filename: String) {
    // Проверяем существование файла
    guard FileManager.default.fileExists(atPath: filename) else {
        print("Файл не найден")
        return
    }
    
    // Открываем файл в режиме "только чтение"
    let fileDescriptor = open(filename, O_RDONLY)
    
    // Проверяем, удалось ли открыть файл
    guard fileDescriptor != -1 else {
        print("Ошибка открытия файла")
        return
    }

    // Убеждаемся, что файл будет закрыт после выхода из функции
    defer {
        close(fileDescriptor)
        print("Файл закрыт")
    }

    print("Файл успешно открыт и обрабатывается")
    
    // Здесь можно читать данные из файла...
    // ...

    // close(file) вызывается здесь, в конце зоны видимости.
}
openFile(filename: "/path/to/file.txt")

// Вы можете использовать оператор defer, даже если не используете коды обработки ошибок.
/*
Вложенные типы
*/

// В Swift можно создавать вложенные типы — это типы, определенные внутри других типов. 
// Вложенные типы полезны, когда требуется поддержка или контекст для более сложных типов. 
// Это могут быть структуры, классы, перечисления или даже функции, которые существуют внутри 
// другого типа для удобства и улучшения организации кода.

/*
Зачем использовать вложенные типы?

- Инкапсуляция логики: Вложенные типы могут быть использованы для группировки вспомогательной логики или 
                       данных внутри основного типа, что улучшает структуру кода.
- Упрощение доступа: Вложенные типы позволяют избежать длинных имен типов, так как они автоматически получают 
                     контекст от внешнего типа.
- Логическая связь: Когда типы тесно связаны с основным типом, вложение помогает лучше организовать их в 
                    логической иерархии.
*/

// Пример: Модель карты в игре Blackjack

struct BlackjackCard {
    // Вложенное перечисление для масти карты
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    // Вложенное перечисление для ранга карты
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace

        // Вложенная структура для значений карт (например, у Туза два значения: 1 или 11)
        struct Values {
            let first: Int, second: Int?
        }

        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    // Свойства карты: ранг и масть
    let rank: Rank, suit: Suit
    // Описание карты
    var description: String {
        var output = "Suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

// Создание экземпляра карты
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
// Выведет: "theAceOfSpades: Suit is ♠, value is 1 or 11"

/*
Вложенные перечисления:
    Suit — перечисление для масти карты. Каждая масть представлена символом (например, ♠, ♡ и т.д.).
    Rank — перечисление для ранга карты. Карты имеют номера от 2 до 10, а также дополнительные карты: 
           валет, дама, король и туз. Каждая карта имеет числовое значение.
Вложенная структура:
    Внутри Rank есть вложенная структура Values, которая описывает возможные значения карты. 
    Например, для Туза (Ace) это два возможных значения: 1 и 11, а для других карт только одно значение 
    (например, 10 для короля).
Вычисляемое свойство:   
    В Rank определено вычисляемое свойство values, которое возвращает экземпляр структуры Values 
    в зависимости от ранга карты. Это позволяет динамически вычислять значение карты в зависимости от ее ранга.
Использование вложенных типов:
    Мы создаем экземпляр карты с помощью вложенных типов. Например, для Туза (Ace) масти пики (Spades) 
    и выводим его описание с возможными значениями.
*/

/* Использование вложенных типов */

// Для доступа к вложенным типам снаружи их контекста, нужно указать имя внешнего типа перед вложенным типом
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
// heartsSymbol равен "♡"

/* Другие примеры */

struct Vehicle {
    var brand: String

    // Вложенная структура для характеристики двигателя
    struct Engine {
        var horsepower: Int
        var type: String
    }

    var engine: Engine
}

let myCar = Vehicle(brand: "Tesla", engine: Vehicle.Engine(horsepower: 500, type: "Electric"))
print("My car is a \(myCar.brand) with a \(myCar.engine.type) engine with \(myCar.engine.horsepower) HP.")
// My car is a Tesla with a Electric engine with 500 HP.

/* Вложенные функции */

struct Math {
    // Вложенная функция для вычисления квадрата числа
    static func square(_ number: Int) -> Int {
        return number * number
    }
}
let result = Math.square(5)
print(result) // 25
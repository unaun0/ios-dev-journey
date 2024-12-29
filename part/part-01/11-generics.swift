// ex.11.1
// Обобщённая функция для создания массива

// Когда вызывается makeArray(repeating: "knock", numberOfTimes: 4), 
// тип Item автоматически становится String, 
// потому что передано значение типа String. 
// Функция создаёт массив, состоящий из повторяющихся 
// элементов типа Item (в данном случае, строки "knock"), и возвращает его.
// Типы генериков создаются путём добавления имени типа внутри 
// угловых скобок <Item>.

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
let arr = makeArray(repeating: "knock", numberOfTimes: 4)
print(arr) // ["knock", "knock", "knock", "knock"]

// ex.11.2

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// ex.11.3

// Функция anyCommonElements принимает два последовательных объекта (lhs и rhs) 
// и проверяет, есть ли в них общие элементы. 
// Важно, что она использует генерики для типов последовательностей (T и U), 
// и для того, чтобы сравнивать элементы этих последовательностей, 
// требуется, чтобы элементы были сравнимыми (с помощью протокола Equatable).

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

// Вместо использования where после параметров типов, 
// вы также можете использовать его в виде ограничения на тип

func anyCommonElements<T: Equatable>(lhs: [T], rhs: [T]) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
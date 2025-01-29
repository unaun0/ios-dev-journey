/*
Сабскрипты
*/

// Классы, структуры и перечисления могут определять сабскрипты, которые являются сокращенным вариантом доступа к 
// члену коллекции, списка или последовательности.

// Сабскрипты позволяют вам запрашивать экземпляры определенного типа, написав одно или несколько значений 
// в квадратных скобках после имени экземпляра.

/*
Синтаксис сабскрипта
*/

/*
        subscript(index: Int) -> Int {
            get {
                //возвращает надлежащее значение скрипта
            }
            set(newValue) {
                //проводит надлежащие установки 
            }
        } 
*/

// Тип newValue такой же как и у возвращаемого значения сабскрипта. 
// В случае с вычисляемыми свойствами вы можете не указывать параметр сеттера (newValue). 
// Параметр по умолчанию называется newValue и предоставляется, если не было назначено другого.

// Как и в случае с нередактируемыми (read-only) вычисляемыми свойствами, 
// вы можете опустить слово get для нередактируемых (read-only) сабскриптов

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("шесть умножить на три будет \(threeTimesTable[6])") // "шесть умножить на три будет 18"

// В этом примере новый экземпляр TimesTable создан для отображения таблицы умножения на три. 
// Это определяется переданным ему значением 3 в инициализатор структуры как значение 
// для параметра экземпляра multiplier.

/*
Опции сабскрипта
*/

// Сабскрипты могут принимать любое количество входных параметров, и эти параметры могут быть любого типа. 
// Сабскрипты так же могут возвращать любой тип.

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }

    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns } 
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
// grid = [0.0, 0.0, 0.0, 0.0] - первые два значения - первая строка, следующие - вторая строка матрицы
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
// grid = [0.0, 1.5, 3.2, 0.0]
// let someValue = matrix[2, 2] // Вызов assert -> Ошибка: Index out of range

/*
Сабскрипты типа
*/

// Сабскрипты сущностей, как было сказано выше, являются сабскриптами экземпляров конкретного типа. 
// Вы также можете определить сабскрипты, которые вызываются у самого типа. Сабскриты такого типа называются 
// сабскриптом типа

// Вы указываете сабскрипт типа при помощи ключевого слова static перед ключевым словом subscript.

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
print(Planet[4]) // mars
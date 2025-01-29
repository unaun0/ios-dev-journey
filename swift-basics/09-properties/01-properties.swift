/*
Свойства
*/

// Свойства хранения и вычисляемые свойства обычно связаны с экземплярами конкретного типа. 
// Однако свойства так же могут быть связаны и с типом самим по себе. Такие свойства известны как свойства типа.

/*
Свойства хранения
*/

// В самой простой форме свойство хранения - константа или переменная, которая хранится как часть экземпляра 
// определенного класса или структуры. 
// Свойства хранения могут быть или переменными свойствами хранения (начинаются с ключевого слова var), 
// или константами свойствами хранения (начинается с ключевого слова let).

// Вы можете присвоить значение по умолчанию для свойства хранения как часть его определения.
// Вы так же можете присвоить начальное значение для свойства хранения во время его инициализации.

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

/*
Свойства хранения константных экземпляров структуры
*/

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// rangeOfFourItems.firstValue = 6 // Ошибка

// Когда экземпляр типа значений отмечен как константа, то все его свойства так же считаются константами.

/*
Ленивые свойства хранения
*/

// Ленивое свойство хранения - свойство, начальное значение которого не вычисляется до первого использования. 
// Индикатор ленивого свойства - ключевое слово lazy.

class DataImporter {
    /*  
     DataImporter - класс для импорта данных из внешних источников
     Считаем, что классу требуется большое количество времени для инициализации
     */
    var fileName = "data.txt"
    // ...
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // ...
}
 
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// Экземпляр класса DataImporter для свойства importer еще не создан.
print(manager.importer.fileName) 
// Экземпляр DataImporter для свойства importer создается только тогда, когда впервые к нему обращаются.

// Если к свойству обозначенному через модификатор lazy обращаются сразу с нескольких потоков единовременно, 
// и если оно еще не было инициализировано, то нет никакой гарантии того, что оно будет инициализировано всего один раз.

/*
Вычисляемые свойства
*/

// Вычисляемые свойства фактически не хранят значения. 
// Вместо этого они предоставляют геттер и опциональный сеттер для получения и установки других свойств косвенно.

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))") // "square.origin is now at (10.0, 10.0)"

/*
Сокращенный вариант объявления сеттера
*/

// Если сеттер высчитываемого свойства не определяет имени для нового значения, то используется имя по умолчанию newValue. 
// Альтернативный вариант структуры Rect, обладающей преимуществом сокращенного синтаксиса:
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

/*
Сокращенный вариант объявления геттера
*/

// Если все тело геттера представляет собой одно выражение, геттер неявно возвращает это выражение.
// Пропуск ключевого слова return в геттере работает аналогично пропуску ключевого слова return в функциях

struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

/*
Вычисляемые свойства только для чтения
*/

// Вычисляемое свойство имеющее геттер, но не имеющее сеттера известно так же как вычисляемое свойство только для чтения. 

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)") // "the volume of fourByFiveByTwo is 40.0"

/*
Наблюдатели свойства
*/

// Наблюдатели свойства могут наблюдать и отвечать на изменения значения свойства. 
// Наблюдатели свойств вызываются каждый раз, как устанавливается значение свойству,
// даже если устанавливаемое значение не отличается от старого.
// Вы можете добавить наблюдателей в следующие места:
    // Свойства хранения, которые вы определяете
    // Свойства хранения, которые вы наследуете
    // Вычисляемые свойства, которые вы наследуете
// Для наследуемых свойств вы добавляете наблюдателей свойства, переопределяя свойство в подклассе.
// Для определяемого вычисляемого свойства, используйте сеттер для наблюдения и реакции на изменения значения свойства, 
// вместо того, чтобы пытаться создавать наблюдатель.

// У вас есть опция определять один или оба наблюдателя свойства:
    // willSet вызывается прямо перед сохранением значения
    // didSet вызывается сразу после сохранения значения

// Если вы реализуете наблюдатель willSet, то он передает новое значение свойства как константный параметр. 
// Вы можете сами определить ему имя внутри реализации willSet. 
// Если вы не станете указывать новое имя параметра и скобки внутри реализации, то параметр все равно будет доступен 
// через имя параметра по умолчанию newValue.

// Аналогично, если вы реализуете наблюдатель didSet, то ему будет передан параметр-константа, 
// содержащий старое значение свойства. Вы можете задать имя параметру, но если вы этого не сделаете, 
// то он все равно будет доступен через имя параметра по умолчанию oldValue.

// Наблюдатели willSet и didSet суперкласса вызываются, когда свойство устанавливается в инициализаторе подкласса. 
// Они не вызываются в то время, пока класс устанавливает свои собственные свойства, до того, 
// пока не будет вызван инициализатор суперкласса.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("Вот-вот значение будет равно \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Добавлено \(totalSteps - oldValue) шагов")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200 // Вот-вот значение будет равно 200 // Добавлено 200 шагов
stepCounter.totalSteps = 360 // Вот-вот значение будет равно 360 // Добавлено 160 шагов
stepCounter.totalSteps = 896 // Вот-вот значение будет равно 896 // Добавлено 536 шагов

/*
Обертки для свойств
*/

// Обертка свойства добавляет слой разделения между кодом, который определяет как свойство хранится и кодом, 
// который определяет само свойство. 

// Для того, чтобы определить обертку, вы создаете структуру, перечисление или класс, который определяет 
// свойство wrappedValue. 

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

// Объявление для number в примере выше определено как private, что гарантирует, что число будет использовано 
// только в реализации TwelveOrLess. Код, который написан где-либо еще, обращается к значению с помощью геттера 
// и сеттера для wrappedValue и не может использовать число напрямую.

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height) // Выведет "0"

rectangle.height = 10
print(rectangle.height) // Выведет "10"

rectangle.height = 24
print(rectangle.height) // Выведет "12"

// Вы можете написать код, который использует поведение обертки свойства, 
// не используя преимущества специального синтаксиса атрибутов.

struct SmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

// Свойства _height и _width хранят экземпляр обертки TwelveOrLess. 
// Геттер и сеттер для height и width обертывают доступ к свойству wrappedValue.

/*
Установка исходных значений для оберток свойств
*/

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// Определение SmallNumber включает три инициализатора - init(), init(wrappedValue : ) и init(wrappedValue: maximum: ), 
// которые в приведенных ниже примерах используются для установки значения в обертке и максимального значения. 

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}
var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width) // Выведет "0 0"


struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}
var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width) // Выведет "1 1"


struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}
var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width) // Выведет "2 3"
narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width) // Выведет "5 4"


struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}
var mixedRectangle = MixedRectangle()
print(mixedRectangle.height) // Выведет "1"
mixedRectangle.height = 20
print(mixedRectangle.height) // Выведет "12"

/*
Проецирование значения из обертки свойства
*/

// В дополнение к обернутому значению обертка свойства может предоставлять дополнительные функциональные возможности, 
// определяя проецируемое значение, например, обертка свойства, которая управляет доступом к базе данных, 
// может предоставлять метод flushDatabaseConnection() для ее проецируемого значения. 
// Имя проецируемого значения такое же, как и значение в обертке, за исключением того, что оно начинается 
// со знака доллара ($). Поскольку ваш код не может определять свойства, начинающиеся с символа $, 
// проецируемое значение никогда не влияет на свойства, которые вы определяете.

@propertyWrapper
struct SmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()
someStructure.someNumber = 4
print(someStructure.$someNumber) // Выведет "false"
someStructure.someNumber = 55
print(someStructure.$someNumber) // Выведет "true"


enum Size {
    case small, large
}
struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
            case .small:
                height = 10
                width = 20
            case .large:
                height = 100
                width = 100
        }
        return $height || $width
    }
}
// То есть символ $ в Swift используется для доступа к projectedValue обёрточного свойства (@propertyWrapper).

/*
Глобальные и локальные переменные
*/

// Возможности, описанные выше для вычисляемых и свойств хранения, так же доступны в глобальных переменных и 
// в локальных переменных. 

// Глобальные переменные - переменные, которые объявляются вне любой функции, метода, замыкания или контекста типа. 
// Локальные переменные - переменные, которые объявляются внутри функции, метода или внутри контекста замыкания.

// Все глобальные и локальные переменные, с которыми вы столкнулись в предыдущих главах, были переменными хранения. 
// Переменные хранения похожи на свойства хранения, которые предоставляют хранилище для значения определенного типа 
// и позволяют этому значению быть установленным и полученным.

// Однако вы так же можете объявить вычисляемые переменные и объявить обозреватели для переменных хранения 
// в глобальной или в локальной области своего действия. 
// Вычисляемые переменные вычисляют значение, вместо того, чтобы его хранить, и записываются они таким же образом как 
// и вычисляемые свойства.

// Глобальные константы и переменные всегда являются вычисляемыми отложено, аналогично свойствам ленивого хранения. 
// В отличии от свойств ленивого хранения глобальные константы и переменные не нуждаются в маркере lazy. 
// Локальные константы и переменные никогда не вычисляются отложено.

var globalVariable = "Я глобальная переменная"  // Глобальная переменная
func someFunction() {
    var localVariable = "Я локальная переменная"  // Локальная переменная
    print(localVariable)
}
print(globalVariable)  // Работает
someFunction()
// print(localVariable)  // Ошибка 


var globalComputedVariable: String {
    return "Я вычисляемая глобальная переменная"
}
print(globalComputedVariable)  // "Я вычисляемая глобальная переменная"
// globalComputedVariable не хранит значение, а вычисляет его каждый раз, когда к ней обращаются.


func someFunction() {
    var localComputedVariable: Int {
        return Int.random(in: 1...100)
    }
    print("Случайное число: \(localComputedVariable)")
    print("Новое случайное число: \(localComputedVariable)") // Разные числа!
}
someFunction()
// Каждый вызов localComputedVariable генерирует новое случайное число, потому что оно не хранится, а вычисляется заново.

// Ленивый глобальные переменные
var expensiveComputation: Int = {
    print("Выполняется сложная операция...")
    return 42
}()
print("Программа запущена") // "Программа запущена" (переменная еще не инициализирована)
print(expensiveComputation) // "Выполняется сложная операция..." (инициализация только сейчас) "42"
// expensiveComputation не выполняется, пока к ней не обратятся!

// Локальные переменные никогда не бывают ленивыми, потому что:
    // Они создаются в момент вызова функции.
    // Они уничтожаются при выходе из функции.

/*
Свойства типа
*/

// Свойства экземпляров - свойства, которые принадлежат экземпляру конкретного типа. 
// Каждый раз, когда вы создаете экземпляр этого типа, он имеет свои собственные свойства экземпляра, 
// отдельные от другого экземпляра.

// Свойства типа в Swift — это свойства, которые принадлежат самому типу, а не его экземпляру. 
// Это значит, что свойство доступно через сам тип, а не через объект.

struct SomeStruct {
    static let sharedValue = "Я свойство типа"   // Константа типа
    static var count = 0                            // Переменное свойство типа
    init() {
        SomeStruct.count += 1   // Увеличиваем счетчик при создании нового экземпляра
    }
}

// Доступ через сам тип
print(SomeStruct.sharedValue)  // Выведет: "Я свойство типа"
let instance1 = SomeStruct()  // Создаем первый экземпляр
let instance2 = SomeStruct()  // Создаем второй экземпляр
print(SomeStruct.count)       // Выведет: 2 (оба экземпляра увеличили count)

// Здесь sharedValue и count принадлежат типу, а не экземплярам. 
// Изменение count в любом экземпляре отражается на уровне типа.

struct Circle {
    static let pi = 3.14159       // Константа типа
    static var radius: Double = 0 // Хранение радиуса всех кругов

    static var area: Double {     // Вычисляемое свойство типа
        return pi * radius * radius
    }
}
Circle.radius = 5
print("Площадь круга: \(Circle.area)")  // Выведет: "Площадь круга: 78.53975"

// Классы
class Parent {
    class var description: String {   // Вычисляемое свойство типа
        return "Это родительский класс"
    }
}
class Child: Parent {
    override class var description: String {  // Переопределение свойства типа
        return "Это дочерний класс"
    }
}
print(Parent.description)  // Выведет: "Это родительский класс"
print(Child.description)   // Выведет: "Это дочерний класс"
// Использование class var позволяет переопределить вычисляемое свойство типа в наследуемых классах.

// Перечисления
enum Directions {
    static let allDirections = ["North", "South", "East", "West"]
}
print(Directions.allDirections)  // Выведет: ["North", "South", "East", "West"]

/*
Запросы и установка свойств типа
*/

// Обращение к свойству типа и присваивание ему значения происходит с использованием точечного синтаксиса. 
// Однако запрос и присваивание значения происходит в свойстве типа, а не в экземпляре того типа. 
// Примеры выше.


/*
Множества
*/

// Набор хранит различные значения одного типа в коллекции без определённого порядка. 

// Тип Set Swift связан с NSSet классом Foundation.

// Тип должен быть хешируемым, чтобы его можно было хранить в наборе, 
// то есть тип должен предоставлять способ вычисления хеш-значения для себя. 
// Хеш-значение — это Int значение, одинаковое для всех объектов, которые сравниваются одинаково, 
// то есть если a == b, то хеш-значение a равно хеш-значению b.

// Все базовые типы Swift (такие как String, Int, Double и Bool) по умолчанию являются хешируемыми и 
// могут использоваться в качестве типов значений наборов или ключей словарей.


// Создание и инициализация пустого множества

var letters = Set<Character>()
var letters2: Set<Character> = Set<Character>()
// var letters3: Set<Character> = () // Ошибка

var letters4: Set<Character>
letters4 = [] // Пустое множество с помощью литерала пустого массива

// Создание набора с помощью литерала массива

var favoriteGenres1: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

// Доступ к множеству и его изменение

// Аналогично массивам, кроме использования индексов - множество неупорядочено

/*
Основные операции с множествами
*/

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


oddDigits.union(evenDigits).sorted() // Объединение
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted() // Пересечение
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // Вычитание
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // Симметрическая разность
// [1, 2, 9]

/*
Членство и Равенство
*/

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]


houseAnimals.isSubset(of: farmAnimals) // isSubset - A - подмножество B
// true
farmAnimals.isSuperset(of: houseAnimals) // isSuperset - множество B включает подмножество A
// true
farmAnimals.isDisjoint(with: cityAnimals) // A и B не имеют общих значений
// true
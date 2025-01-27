/*
Метки параметров функции
*/

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// print(greet(person: "Bill", hometown: "Cupertino")) // Ошибка 
// Prints "Hello Bill!  Glad you could visit from Cupertino."

/*
Пропуск меток аргументов
*/

func someFunction(_ firstParameterName: Int, secondParameterName: Int) -> Int {
    firstParameterName + secondParameterName
}
print(someFunction(1, secondParameterName: 2))

/*
Значения параметров по умолчанию
*/

func someFunction2(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) -> Int {
    parameterWithoutDefault + parameterWithDefault
}
someFunction2(parameterWithoutDefault: 3, parameterWithDefault: 6) // 9
someFunction2(parameterWithoutDefault: 4) // 16
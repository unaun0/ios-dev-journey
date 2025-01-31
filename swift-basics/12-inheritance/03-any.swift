/*
Псевдонимы Any и AnyObject
*/

// Swift предлагает два специальных псевдонима, позволяющих работать с неопределенными типами:
// - AnyObject соответствует произвольному экземпляру любого класса;
// - Any соответствует произвольному типу данных.

// Данные псевдонимы позволяют корректно обрабатывать ситуации, когда конкретное наименование 
// типа или класса неизвестно либо набор возможных типов может быть разнородным.

/*
Псевдоним Any
*/

var things:  [Any] = []
things.append(0.1)
things.append(1)
things.append("Hello")
things.append(true)
things.append((3.0, 5.0))
things.append(
    { (name: String) -> String in "Hello, \(name)!"}
)
print(things) // [0.1, 1, "Hello", true, (3.0, 5.0), (Function)]

// Каждый из элементов массива преобразуется в определенный тип при помощи оператора as

print(things[0] as! Double) // 0.1

/*
Псевдоним AnyObject
*/

let anyObjectArray: [AnyObject] = ["Macbook" as AnyObject, 1 as AnyObject, 2 as AnyObject]
print(anyObjectArray) // [Swift.__SwiftValue, Swift.__SwiftValue, Swift.__SwiftValue]

for item in anyObjectArray {
    if item is String {
        print("\(item) является типом String")
    } else if item is Int {
        print("\(item) является типом Int")
    }
}
// Macbook является типом String
// 1 является типом Int
// 2 является типом Int

/* Аналогично
for item in anyObjectArray {
    if item is NSString {
        print("\(item) является типом NSString")
    } else if item is NSNumber {
        print("\(item) является типом NSNumber")
    }
} */

// Swift автоматически преобразует некоторые типы Objective‑C в типы Swift, 
// а некоторые типы Swift в типы Objective‑C. 
// Типы, которые можно конвертировать между Objective‑C и Swift, называются соединенными.
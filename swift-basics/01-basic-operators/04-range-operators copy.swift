/*
Операторы диапазона
*/

// Оператор закрытого диапазона (a...b) определяет диапазон от a до b и включает значения a и b. 
// Значение a не должно быть больше b.

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// Полуоткрытый оператор диапазона (a..<b) определяет диапазон, который начинается с a и заканчивается на b, но не включает b. 
// Он называется полуоткрытым, потому что содержит первое значение, но не содержит последнее. 

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count // 4
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

// Односторонние диапазоны

for name in names[2...] {
    print(name)
}
// Brian
// Jack


for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
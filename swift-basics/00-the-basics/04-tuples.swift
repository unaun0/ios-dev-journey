/*
Кортежи
*/

// Кортежи объединяют несколько значений в одно составное значение. 
// Значения в кортеже могут быть любого типа и не обязательно должны быть одного типа.

let http404Error = (404, "Not Found")

// Можно разбить содержимое кортежа на отдельные константы или переменные

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)") // "The status code is 404"
print("The status message is \(statusMessage)") // "The status message is Not Found"

// Если нужны только некоторые значения кортежа

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)") // "The status code is 404"

// В качестве альтернативы можно получить доступ к отдельным значениям элементов в кортеже, 
// используя номера индексов, начиная с нуля

print("The status code is \(http404Error.0)") // "The status code is 404"
print("The status message is \(http404Error.1)") // "The status message is Not Found"

// Можно присвоить имена отдельным элементам в кортеже

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)") // "The status code is 200"
print("The status message is \(http200Status.description)") // "The status message is OK"
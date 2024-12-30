/*
Разработать программу, 
которая вычисляет n-е число из последовательности Фибоначчи, 
где n — это число, введённое пользователем. 
Программа должна учитывать возможные переполнения, 
которые могут произойти при вычислениях, и корректно обрабатывать ошибки ввода.
*/

func readIntInput(promt: String) -> Int? {
    print(promt)
    if let input = readLine(), let value = Int(input) {
        return value
    } else {
        print("Invalid input. Please enter a valid number")
        return nil
    }
}

guard
    let num = readIntInput(promt: "Enter number:"),
    num >= 0
else {
    print("Failed to get valid input. Exiting program...")
    exit(1)
}

var a: UInt64 = 0
var b: UInt64 = 1
var c: UInt64 = 0
if num == 0 {
    c = a
} else if num == 1 {
    c = b
} else {
    for _ in 2...num {
        let result = a.addingReportingOverflow(b)
        if result.overflow {
            print("Error: overflow occurred while calculating Fibonacci number.")
            exit(1)
        }
        c = result.partialValue
        a = b
        b = c
    }
}
print("The \(num)th Fibonacci number is \(c)")


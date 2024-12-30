/*
Разработать программу для вычисления нормального веса и индекса массы тела (BMI) 
на основе введённых пользователем данных: рост, обхват груди и вес. 
Программа должна принимать три значения: 
    рост в сантиметрах, 
    обхват груди в сантиметрах,
    вес в килограммах;
после чего вычислить и вывести два результата:
    нормальный вес (с использованием формулы: normal = (height * chest) / 240)
    индекс массы тела (BMI) (с использованием формулы: bmi = weight / (height_in_meters * height_in_meters))
*/

import Foundation

func readDoubleInput(promt: String) -> Double? {
    print(promt)
    if let input: String = readLine(), let value: Double = Double(input) {
        return value
    } else {
        print("Invalid input. Please enter a valid number.")
        return nil
    }
}

guard
    let height = readDoubleInput(promt: "Height (in cm):"),
    let chest = readDoubleInput(promt: "Chest (in cm):"),
    let weight = readDoubleInput(promt: "Weight (in kg):"),
    height > 0.0, chest > 0.0, weight > 0.0
else {
    print("Failed to get valid inputs. Exiting program...")
    exit(1)
}

let normalWeight = (height * chest) / 240.0
let heightInMeters = height / 100.0
let bmi = weight / (heightInMeters * heightInMeters)

print(String(format: "Normal weight: %.6f", normalWeight))
print(String(format: "BMI: %.6f", bmi))
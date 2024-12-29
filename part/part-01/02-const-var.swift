// ex.2.1

var myVar = 42
myVar = 50
let myConst = 42

print(myVar, myConst)

// ex.2.2

let implicitInt = 42
let implicitDouble = 42.0
let explicitDouble: Double = 70

print(implicitInt, implicitDouble, explicitDouble)

let explicitFloat: Float = 4

print(explicitFloat)

// ex.2.3

let label = "The wight is "
let wight = 94
let wightLabel = label + String(wight)

print(wightLabel)

// let wightLabel2 = label + wight
// error: binary operator '+' cannot be applied to operands of type 'String' and 'Int'

// ex.2.4

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) fruits."

print(appleSummary, fruitSummary)

let name = "Yana"
let greeting = "Hello, \(name)!"

print(greeting)

let num1 = 4.5
let num2 = 3.2
let resultString = "\(num1) + \(num2) = \(num1 + num2)"

print(resultString)

// ex.2.5

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

print(quotation)
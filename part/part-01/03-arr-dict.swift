// ex.3.1

var fruits = ["apple", "orange", "mango"]
fruits[1] = "pear"
fruits.append("plum")

print(fruits)

// ex.3.2

var occupations = [
    "Engineer": "AI",
    "Doctor": "Surgeon"
]
occupations["Lawyer"] = "Judge"

print(occupations)

// ex.3.3

let emptyArr: [String] = []
let emptyDict: [String : Int] = [:]

// ex.3.4

fruits = []
occupations = [:]

print(fruits, occupations)

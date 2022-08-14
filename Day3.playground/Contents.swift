import UIKit

// MARK: Arithmetic Operators
/// Arithmetic operators are operators on math like * / + -
print(3 * 4, 3 / 4, 3 + 4, 3 - 4, 4 % 3)

// MARK: Operator Overloading
/// Same operator can be used in different ways depending on the data type
print(3 + 4) // Addition
print("String" + " Concatenation")

// MARK: Compund assignment operators
var num1 = 5
num1 = num1 + 3 /// Instead of writing this, there is an easier way.

num1 += 3 // This is called compund assignment operator

// MARK: Comparison Operators

let firstScore = 0
let secondScore = 4
/// Equal: ==
firstScore == secondScore
/// Not Equal: !=
firstScore != secondScore
/// Smaller than: <
firstScore < secondScore
/// Greater than: >
firstScore > secondScore

// MARK: Conditions
/// There are some different conditional statements. if, switch, for, while and ternary operator.
/// They are used for checking some condition and run some code if condition is true.
/*
struct deckOfCards {
    let dictOfClubs: [String : Int]     = ["One" : 1, "Two" : 2, "Three" : 3, "Four" : 4, "Five" : 5, "Six" : 6, "Seven" : 7, "Eight" : 8, "Nine" : 9, "Ten" : 10, "Jack" : 10, "Queen" : 10, "King" : 10]
    let dictOfDiamonds: [String : Int]  = ["One" : 1, "Two" : 2, "Three" : 3, "Four" : 4, "Five" : 5, "Six" : 6, "Seven" : 7, "Eight" : 8, "Nine" : 9, "Ten" : 10, "Jack" : 10, "Queen" : 10, "King" : 10]
    let dictOfHearts: [String : Int]    = ["One" : 1, "Two" : 2, "Three" : 3, "Four" : 4, "Five" : 5, "Six" : 6, "Seven" : 7, "Eight" : 8, "Nine" : 9, "Ten" : 10, "Jack" : 10, "Queen" : 10, "King" : 10]
    let dictOfSpades: [String : Int]    = ["One" : 1, "Two" : 2, "Three" : 3, "Four" : 4, "Five" : 5, "Six" : 6, "Seven" : 7, "Eight" : 8, "Nine" : 9, "Ten" : 10, "Jack" : 10, "Queen" : 10, "King" : 10]
    
}
*/
// MARK: If
let firstCard = Int.random(in: 1...11)
let secondCard = Int.random(in: 1...10)

print(firstCard + secondCard)

if firstCard + secondCard == 2 {
    print("Aces - lucky")
} else if firstCard + secondCard == 21 {
    print("Blackjack")
} else {
    print("Regular Cards")
}

// MARK: Combining Conditions
/// It's possible to combine more than one condition by using AND ( && ) or OR ( || )
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
} else if (age1 > 18 && age2 < 18) || (age1 < 18 && age2 > 18) {
    print("One of them is over 18")
}
/// Avoid using && and || as much as possible because statement gets complicated

// MARK: Ternary Operator
/// It's like if - else statement in one line that checks the condition and if it's true performs some work; if it's false performs some another work.

let isAuthenticated = true
isAuthenticated ? "Welcome" : "Who are you?"

// MARK: Switch Statements
/// Basically if three or more different conditions must be checked using same value, it's better to use swift.
/// Reduces the amount of work and increases code readability.

let weather = "Sunny"

switch weather {
case "Rainy":
    print("Bring an umbrella.")
case "Snowy":
    print("Wrap up warm.")
case "Sunny":
    print("Wear sunscreen.") /// If a condition in switch case is satisfied, Swift will ignore the rest and exit the conditional statement.
    fallthrough /// fallthrough keyword makes swift run the next case.
default:
    print("Enjoy your day!")
}

// MARK: Range Operators
// 1...10 from 1 to 10 including 1 and 10
// 1..<10 from 1 to 10 including 1 and excluding 10

let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
case 85...100:
    print("You did great!!!")
default:
    print("That score isn't valid")
}


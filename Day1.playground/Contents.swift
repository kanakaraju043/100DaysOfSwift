import UIKit

// MARK: Variables
/// Values of variables can be changed but data types must be same.
var greeting = "Hello"
greeting = "Hi"
/// greeting = 26 is not possible.

// MARK: Constant
/// If you are not going to change the value, you can use constant data type.
let maxLimit = 10000
/// Declaration without initialization. You can initialize it after declaration just once.
let minLimit: Int
minLimit = 10

// MARK: Strings and Integers
/// Swift is a type-safe language which means every variable must have one specific type only.
/// This is because when working with complex proejcts. Type-safety makes sure that you don't make mistake with the data.
let age = 26
type(of: age)

/// Underscores can be used to increase readability as seperators between digits. Swift will underscores in a number.
let population = 123_456_789
let pi = 3.141_592_653

// MARK: Multi-line strings
/// By using double quotes, you can't define a string on multiple lines. But with triple quotes you can.
// Triple quotes should have their own line.
let weWillRockYou = """
Buddy, you're a boy, make a big noise
Playing in the street, gonna be a big man someday
You got mud on your face, you big disgrace
Kicking your can all over the place, singin'

We will, we will rock you
We will, we will rock you
"""
//print(weWillRockYou)

/// It's also possible to write in this format in code to increase readability. But display as single line by adding back slash ( \ ) at the end of each line.
let weWontRockYou = """
Buddy, you're a boy, make a big noise \
Playing in the street, gonna be a big man someday \
You got mud on your face, you big disgrace \
Kicking your can all over the place, singin' \
\
We will, we will rock you \
We will, we will rock you
"""
//print(weWontRockYou)


// MARK: Doubles and Booleans
/// Double stands for double precision floating point number. 64-bit floating-point number holds the fractional values up to 15 decimal digits.
var aDoubleNumber = 1.234_567_890_123_456_789
print(aDoubleNumber)

/// Booleans can have two values. true and false.
var isLoggedIn = true
isLoggedIn.toggle()

// MARK: String Interpolation
/// It's possible to call variables,  make some functional work in between strings
let score: Double = 85.0
print("You score is \(score) and it's equal to \(score * 4.0 / 100.0) in 4.00 system")

// MARK: Type annotations
/// Swift has type inference but sometimes you have to specift de type of data.
let album: String = "Appetite For Destruction"
let releaseDate: Int = 1987
let isRock: Bool = true

import UIKit

// MARK: Functions
/// Example of a basic function.
func sayHi() {
    print("Hello World!")
}
sayHi()

// Functions can be useful for breaking up code. Also
// can be useful for building new functions out of existing functions. Which is a technique called "function composition"

// MARK: Accepting Parameters
func square(number: Int) {
    print(number * number)
}
square(number: 5)

// If there are more than six parameters, you should check your function.
// Does the function need all 6 parameters?
// Could that function be split up into smaller functions?
// Is it possible to group parameters?


// MARK: Default Parameters
func greet0(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet0("Taylor") // Since nicely parameter has a default value, you don't have to pass an argument to that.
greet0("Taylor", nicely: false)

func squareWithReturn(number: Int) -> Int { //Return type should be specified.
    return number * number
}
squareWithReturn(number: 3)

// Parameters have two labels. Left one is argument label;
// Right one is parameter name.
// If underscore is used as argument label, you don't have to write label while calling the function. Pass the value directly.
func greet(_ name: String) -> String {
    "Welcome \(name)" // If there is only one line of code, you don't have to write return.
}
greet("Ömer Faruk Kazar")

//Now, all this matters because these divisions have names: when our code can be boiled down to a single value, such as true, false, “Hello”, or 19, we call that an expression. Expressions are things that can be assigned to a variable, or printed using print(). On the other hand, when we’re performing actions such as creating variables, starting a loop, or checking a condition, then we call that a statement.

func greet2(_ name: String) -> String {
    name == "Taylor Swift" ? "Oh wow" : "I don't know you"
}
greet2("Taylor Swift")

// MARK: Returning Multiple Values
/// You can use Arrays, Dictionaries and Sets as Return Type but Tuples are the best because: They are fixed in size.
/// Can contain different type of values together.
/// Can be reached elements by  "key" or "index numbers".

func getUser() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let user = getUser()
print(user.first)

// MARK: Variadic Functions
/// Variadic Functions can accept any numbers of parameters of the same type.

// The print function is actually variadic.
print("Print", "function", "is", "variadic")

func square(numbers: Int...) {
    for number in numbers {
        print(number * number)
    }
}
square(numbers: 1, 2, 3, 4, 5) // Variadic parameters seperated with commas

// MARK: Throwing Functions
/// This topic is about error handling. If there are something wrong about the function, that relevant error will be thrown and

enum PasswordError: Error {
    case obvious
    case tooShort
}

func checkPassword(_ password: String) throws -> String {
    
    if password == "123456" {
        throw PasswordError.obvious
    }
    
    if password.count < 6 {
        throw PasswordError.tooShort
    } else if password.count < 8 {
        return "OK"
    } else {
        return "Perfect"
    }
}

do {
    let result = try checkPassword("123456")
    print("Password Rating: \(result)")
} catch PasswordError.tooShort {
    print("Password should be minimum 6 characters")
} catch PasswordError.obvious {
    print("Password shouldn't contain consecutive numbers.")
} catch { // This catch block catches any other type of errors.
    print("There was an error.")
    print(error.localizedDescription)
}

// MARK: inout parameters
/// If you want to change the value of an external variable permanently, you need to pass that as an inout parameter.
func changeTheScore(score: inout Int) {
    score += 1
}

var myScore = 10
changeTheScore(score: &myScore) /// You have to use ampersand before argument name.
print(myScore)



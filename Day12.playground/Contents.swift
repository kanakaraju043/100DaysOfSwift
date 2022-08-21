import UIKit

// MARK: How to handle missing data with optionals
let opposites = [ // Created a [ String: String ]dictionary
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"] // Failed to read Peach because it doesn't exist.
// This will return nil because value types in dictionaries are optional. Any kind of data can be optional, including Int, Double, and Bool, as well as instances of enums, structs, and classes.

// Unwrapping Optionals:
if let marioOpposite = opposites["Mario"] { // if let combination is very common in Swift. combines if(condition) and let(creating constant) keywords.
    print("Mario's opposite is \(marioOpposite)")
}
// if let does three things:
// Reads the optional value from dictionary.
// If optional has a string inside, gets unwrapped. Since this is successfull ( true ), condition has succeeded and condition's body will run.

// Condition's body will only run if optional has a value inside. Feel free to use else block. Because that's jusa a normal if block.

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// If you try to pass a Int? to a function that requires Int parameter swift will refuse to build that code.
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
//print(square(number: number))

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// It’s very common to unwrap them into a constant of the same name. This is perfectly allowable in Swift, and means we don’t need to keep naming constants unwrappedNumber or similar.

if let number = number { // What’s happening here is that we’re temporarily creating a second constant of the same name, available only inside the condition’s body. This is called shadowing, and it’s mainly used with optional unwraps like you can see above.
    print(square(number: number))
    // So, inside the condition’s body we have an unwrapped value to work with – a real Int rather than an optional Int? – but outside we still have the optional.
}

// MARK: How to unwrap optional with guard

func printSquare(number: Int?) {
    guard let number = number else { // guard let checks the number if it has a value. If it has a value, skips else. But it doesn't have a value, runs else statement.
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

// if let checks if number has a value and body part comes if that statement is true.
// guard let checks if number has a value but want that to fail and body part comes if that condition fails.

var myVar: Int? = 3

if let myVar = myVar {
    print("myVar is not empty. It's \(myVar)")
}

//guard let myVar = myVar else {
//    print("myVar is empty.")
//}
// So, if let runs the code inside its braces if the optional had a value, and guard let runs the code inside its braces if the optional didn’t have a value.

// This is sometimes called an early return: we check that all a function’s inputs are valid right as the function starts, and if any aren’t valid we get to run some code then exit straight away. If all our checks pass, our function can run exactly as intended.

//guard is designed exactly for this style of programming, and in fact does two things to help:
//
//If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
//If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.

func printSquare2(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print(number * number)
}

printSquare2(of: 5)

// So: use if let to unwrap optionals so you can process them somehow, and use guard let to ensure optionals have something inside them and exit otherwise.

// Tip: You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use guard someArray.isEmpty else { return }.

// MARK: How to unwrap optionals with nil coalescing
// it lets us unwrap an optional and provide a default value if the optional was empty.

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"]

let new = captains["Serenity"]
let new2 = captains["Serenity"] ?? "N/A" // attempts to find value of "Serenity" key, if it's nil drops to default value N/A.
let new3 = captains["Serenity", default: "N/A"] // It's same as this operation.

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
print(type(of: favorite))

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)

// MARK: How to handle multiple optionals using optional chaining
// Optional chaining is a simplified syntax for reading optionals inside optionals.
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one" // This can be read as if the optional has a value inside, unwrap it then do the rest of the code.
// In this case: if we managed to get a random element from array, then uppercase it.
print("Next in line: \(chosen)")

// The magic of optional chaining is that it silently does nothing if the optional was empty – it will just send back the same optional you had before, still empty. This means the return value of an optional chain is always an optional, which is why we still need nil coalescing to provide a default value.

// Optional chains can go as long as you want, and as soon as any part sends back nil the rest of the line of code is ignored and sends back nil.

struct Book2 {
    let title: String
    let author: String?
}

var book2: Book2? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"

//So, it reads “if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A”.
// It's like going from general to specific

// MARK: How to handle function failure with optionals

//If all we care about is whether the function succeeded or failed, we can use an optional try to have the function return an optional value. If the function ran without throwing any errors then the optional will contain the return value, but if any error was thrown the function will return nil. This means we don’t get to know exactly what error was thrown, but often that’s fine – we might just care if the function worked or not.

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23){
    print("User: \(user)")
}

// If you want, you can combine try? with nil coalescing, which means “attempt to get the return value from this function, but if it fails use this default value instead.”

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// You’ll find try? is mainly used in three places:

//In combination with guard let to exit the current function if the try? call returns nil.
//In combination with nil coalescing to attempt something or provide a default value on failure.
//When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example.

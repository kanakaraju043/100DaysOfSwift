import UIKit

// MARK: Using closures as parameters when they accept parameters

func travel(action: (String) -> Void) { // This function accepts a closure as a parameter named action. Closure should accept String as a parameter and return nothing.
    print("I'm getting ready to go to travel.")
    action("London") //closure is called here and passed "London" as parameter.
    print("I arrived.")
}

travel { (destination: String) -> Void in // Trailing closure definition done here.
    print("I'm going to \(destination) in my car.")
}

// MARK: Using closures as parameters when they return values

func travel2(action: (String) -> String) {
    print("I'm getting ready to go to travel2.")
    print(action("London"))
    print("I arrived.")
}

travel2 { (destination: String) -> String in // Nothing much changed. We just used return like the way it is in functions.
    return ("I'm going to \(destination) in my car.")
}

func travel3(action: (String) -> String) {
    print("I'm getting ready to go to travel3.")
    print(action("London"))
    print("I arrived.")
}

// MARK: Shorthand Parameter Names

travel3 { (destination: String) -> String in // We used to write this but since we've already declared that in function's parameter type Swift knows the parameter and return type so we can remove them.
    return "I'm going to \(destination) in my car." // Since this is the only line of code, we can delete return too.
}

//So, trailing closure becomes:
travel3 { destination in
        "I'm going to \(destination) in my car."
}

//Swift has shorthand syntax that lets you even go shorter. Rather than writing destination in, we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.

travel3 {
    "I'm going to \($0) in my car."
}

// MARK: Closures with multiple parameters

func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go travel4")
    print(action("London", 60))
    print("I arrived.")
}

travel4 {
    "I'm going to \($0) at \($1) mph"
}

// MARK: Returning Closures from Functions

func travel5() -> (String) -> Void { // First -> is to specify functions return value
    // Second -> is to specify Closure's return value.
    return {
        print("I'm going to \($0)")
    }
}

let result5 = travel5()
result5("London")

// MARK: Capturing values
/// If you use any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist any more.
func travel6() -> (String) -> Void {
    var counter = 0 // counter is defined in the function, not in the closure. But
    
    return {
        print("I'm going to \($0)")
        counter += 1 // If that variable used in the closure, it'll be captured by closure and remain alive for the closure.
        print(counter)
    }
}

let result6 = travel6()
result6("London")
result6("London")
result6("London")


// MARK: Closures Summary
    // You can assign closures to variables, then call them later on.
    // Closures can accept parameters and return values, like regular functions.
    // You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
    // If the last parameter to your function is a closure, you can use trailing closure syntax.
    // Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
    // If you use external values inside your closures, they will be captured so the closure can refer to them later.

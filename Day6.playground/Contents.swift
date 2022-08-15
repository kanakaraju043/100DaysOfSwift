import UIKit

// MARK: Creating Basic Closures
/// They work like functions but written differently. It's like a function assigned to a variable
///
let drivingCar = {
    print("I'm driving in my car")
}
drivingCar()

/// Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a function, and store the closure somewhere else.
// Some use cases:
    //Running some code after a delay.
    //Running some code after an animation has finished.
    //Running some code when a download has finished.
    //Running some code when a user has selected an option from your menu.

// MARK: Accepting Parameters
let drivingTo = { (place: String) in // Parameters defined inside the braces. in keyword marks that parameter list has ended and closure's body started.
    //It's not possible to use external parameter name in closures.
    print("I'm headed to \(place)")
}
drivingTo("Home") // Unlike functions you can't use parameter label. You should directly pass the value.

// MARK: Returning Values
/// Just like function but a little syntax difference.
let drivingFrom = { (place: String) -> String in
    return "I'm coming from \(place)"
}

print(drivingFrom("Work"))

// MARK: Returning Values without taking parameters.
let gasPrice = { () -> String in
    return "Gas prices are too high."
}
print(gasPrice())

// This works with functions too.
func gasPrices() -> String {
    return "Function"
}
gasPrices()

// MARK: Closures as Parameters
print("Closures as Parameters: ")
let driving = {
    print("I'm driving my Car")
}
/*
/// In order to use closure as a parameter in function, we have to specify the closure's parameter in function definition.
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action() // Called closure
    print("I arrived.")
}

travel(action: driving) // called function named travel. Passing driving closure as action parameter.

// MARK: Trailing Closure Syntax
/// If last parameter to function is a closure, Swift let you use a special syntax called Trailing Closure Syntax.
/// You can pass closure directly after the function inside braces.
*/
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived")
}

travel() {
    print("I'm driving in my car.")
}

// In fact, there are no other parameters we can remove ()
travel {
    print("I'm driving in my car.")
}
// Trailing Closure Syntax is extremely common in Swift

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation...")
    animations()
}

// Without trailing syntax:
animate(duration: 3, animations: {
    print("Fade out image")
})

// With trailing syntax:
animate(duration: 3) {
    print("Fade out image")
}


import UIKit

// MARK: How to create and use protocols
/// Protocols are a bit like contracts. They let us define what kinds of functionality we expect a data type to support, and Swift ensures that the rest of our code follows those rules.

//  func commute(distance: Int, using vehicle: Car) {
//
//  }
//
//  func commute(distance: Int, using vehicle: Train) {
//      // lots of code here
//  }
//
//  func commute(distance: Int, using vehicle: Bus) {
//      // lots of code here
//  }

//Or they might use a bike, an e-scooter, a ride share, or any number of other transport options.
//
//The truth is that at this level we don’t actually care how the underlying trip happens. What we care about is much broader: how long might it take for the user to commute using each option, and how to perform the actual act of moving to the new location.
//
//This is where protocols come in: they let us define a series of properties and methods that we want to use. They don’t implement those properties and methods – they don’t actually put any code behind it – they just say that the properties and methods must exist, a bit like a blueprint.

protocol Vehicle { // This is a new type, so use camelCase starting with an uppercase letter.
    var name: String { get }
    var currentPassenger: Int { get set }
    func estimateTime(for distance: Int) -> Int // Methods defined inside protocol wihtout body.
    func travel(distance: Int) // Can be marked as throwing or mutating if needed.
}

// If a new struct, class or enum created with protocol. They should be satisfy the protocols reqiurements.

struct Car: Vehicle {
    let name = "Car"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int { // We used both methods that Vehicle protocol requires.
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    func openSunroof() { // After protocol satisfied, you can do anything you want.
        print("Opening the Sunroof")
    }
}

func commute(distance: Int, using vehicle: Car) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

// This commute function can be rewritten like this:
func commute2(distance: Int, using vehicle: Vehicle) { // It allows us to use Vehicle as the type of our paramer rather than Car. So we can pass any parameter that conforms to Vehicle parameter to this function.
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute2(distance: 50, using: bike)
// We can pass both car and bike into commute2 function that's the power of protocols.
// Also commute2 function automatically uses the appropriate one

protocol Vehicle2 {
    var name: String { get } // It's possible to add properties to the protocol. It's a constant or ready only computed property
    var currentPassengers: Int { get set } // Have to specify if it's read only or both. It's a variable or read and write computed property
    // We can't provide default values for properties in protocol.
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km.")
    }
} // This function lists all the possible vehicles and estimated hours to destination.

getTravelEstimates(using: [car, bike], distance: 150)

//As well as accepting protocols as parameters, you can also return protocols from a function if needed.
//
//Tip: You can conform to as many protocols as you need, just by listing them one by one separated with a comma. If you ever need to subclass something and conform to a protocol, you should put the parent class name first, then write your protocols afterwards.

// MARK: Opaque return types
func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}
// Both of these types conform to Equatable protocol which allows us to compare for equality
// Because both of these types conform to equatable, rewrite func like this:
func getRandomNumber2() -> some Equatable {
    Int.random(in: 1...6)
}
func getRandomBool2() -> some Equatable {
    Bool.random()
}
// We added some because if you use Equatable as return type, you'll lose the number's or boolean's type. So added "some" keyword which makes this return type opaque and says that it is going to return some equatable data but you should check what the real type of data. Whether it's Int or Bool for this case.
//this is going to send back some kind of equatable to compare, but I don’t want to write out the exact thing.

// MARK: How to create and use Extensions
//Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.

var quote = "     The truth is rarely pure and never simple     "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String { // We want to add an extension to an existing type (which is String in this case.)
    func trimmed() -> String { // Defined new function.
        self.trimmingCharacters(in: .whitespacesAndNewlines) // return
    }
} // All the codes between these will be added to String data type as extension.

let trimmed2 = quote.trimmed()

// We could have written a function like this:
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed3 = trim(quote)

//That’s less code than using an extension, both in terms of making the function and using it. This kind of function is called a global function, because it’s available everywhere in our project.

// However, the extension has a number of benefits over the global function, including:

//When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
//Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
//Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.

//What’s more, extensions make it easier to modify values in place – i.e., to change a value directly, rather than return a new value.
//
//For example, earlier we wrote a trimmed() method that returns a new string with whitespace and newlines removed, but if we wanted to modify the string directly we could add this to the extension:

//mutating func trim() {
//    self = self.trimmed()
//}

// MARK: How to create and use protocol extensions
// Protocols let us define contracts like blueprints.
// Extensions let us add functionality to existing types.
// What happens if we write extensions on protocols

// Protocol extensions does that and any types corforms that protocol gets those extensions.
let guests = ["Mario", "Luigi"," Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
// Tip: Xcode’s playgrounds run their code from top to bottom, so make sure you put that extension before where it’s used.

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

extension Collection { // Collection includes Array, Set, Dictionary
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, i'm \(name)")
    } // We defined a default for the Person protocol via extensions.
}// And now conforming types can add their own sayHello() method if they want, but they don’t need to – they can always rely on the one provided inside our protocol extension.

struct Employee: Person {
    let name: String
}
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

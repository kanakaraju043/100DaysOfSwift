import UIKit

// MARK: How to create your own classes
/// Classes are similar with Structs but there are some differences too.
/// Similarities:
/// They are both data types.
/// You can add properties, methods, property observers, access control.
/// You can create custom initializers

/// Differences:
// Structs are value type; Classes are reference type.
/// Inheritance: You can inherit all the methods and properties from parent class. If you want to you can override some of them.
/// Swift won't generate a memberwise initializer because of inheritance. You should own initializer or define default values.
/// If you copy instance of a class both copies pointing the same data. If you change one, the other one changes too. ( reference type )
/// We can add deinitializer ( freeing up all the memory that allocated for data ) after final copy is destroyed.
/// Constant class instances' variable properties can be changed.

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//Why does Swift have both classes and structs?
//  Classes do not come with synthesized memberwise initializers.
//  One class can be built upon (“inherit from”) another class, gaining its properties and methods.
//  Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
//  Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
//  Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.


// MARK: How to make one Class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
}

class Developer: Employee { // Developer is a child of Employee class
    func work() {
        print("I'm writing code for \(hours) hours") // Child classes can refer to parent classes properties.
    }
}

class Manager: Employee { // Each subclass inherits from Employee and then adds their own customization.
    func work() {
        print("I'm going to meeting for \(hours) hours") // Child classes can refer to parent classes properties.
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

class Employee2 {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer2: Employee2 {
    func work() {
        print("I'm writing code for \(hours) hours")
    }
    
    override func printSummary() { // If you want to specialize a method of parent class, you should use override keyword. That'll change that method for child class.
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager2: Employee2 {
    func work() {
        print("I'm going to meeting for \(hours) hours.")
    }
}

let robert2 = Developer2(hours: 8)
let joseph2 = Manager2(hours: 10)
let novall2 = Developer2(hours: 8)
novall2.printSummary()

// Tip: If you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.

// MARK: How to add initializers for classes
/// A child class should always call parent's initializer after it called it's own initializer and done the custom settings.

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
/*
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
    } This will give an error.
}
*/
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) //init parent class' isElectric property and pass the value of child's init argument to that.
        // super keyword can be used on other methods too. It indicates that method belongs to parent
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

class CarWithParentsInıt: Vehicle {
    let isConvertible = false // It's possible to use parent's initializer like this if you are not going to customize something.
}

// MARK: How to copy classes
/// In swift, all instances of a class points the same data. If you change one of the copy, that means all of the other copies will change.
/*
class User {
    var username = "Anonymous"
    
    func copy() -> User { // This is how you create Deep Copy
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor" // Even if we changed data of one copy, all of the copies changed.
print(user1.username)

//var user1 = User()
//var user2 = User()
//user2.username = "Taylor"
//print(user1.username) // This'll print Anonymous

//MARK: How to create a deinitializer for a class
//Just like initializers, you don’t use func with deinitializers – they are special.
//Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
//Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//We never call deinitializers directly; they are handled automatically by the system.
//Structs don’t have deinitializers, because you can’t copy them.

//Exactly when your deinitializers are called depends on what you’re doing, but really it comes down to a concept called scope. Scope more or less means “the context where information is available”, and you’ve seen lots of examples already:
//
//If you create a variable inside a function, you can’t access it from outside the function.
//If you create a variable inside an if condition, that variable is not available outside the condition.
//If you create a variable inside a for loop, including the loop variable itself, you can’t use it outside the loop.

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}


for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

*/

// MARK: How to work with variables inside classes

class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor"
print(user.name)

//So, we end up with four options:
//
//Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
//Constant instance, variable property – a signpost that always points to the same user, but their name can change.
//Variable instance, constant property – a signpost that can point to different users, but their names never change.
//Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.

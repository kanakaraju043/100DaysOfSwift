import UIKit

// MARK: How to create your own structs
/// Structs are like blueprints, you should create new instances of that.
struct Album {
    let title: String // Variables and constants belong to Structs called properties.
    let artist: String
    var year: Int = 0000 // year has a default value of 0000 and if you don't want to change that, you can use initializer without year property.
    let rating: Float16
    
    func printSummary(){ // If a function belongs to a type, it's called Method.
        print("\(title) Album was released in \(year) bu \(artist). Has a rating of \(rating)/10")
    }
}

let rapstar = Album(title: "Rapstar", artist: "Ceza", year: 2004, rating: 8.7) // This is called an instance of Album struct. Created by using initializer.
let rapstarWoYear = Album(title: "Rapstar", artist: "Ceza", rating: 8.7)

rapstar.printSummary()

/// Mutating Functions:
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) { // If function changes something belong to the var structs, that function should be marked as mutating.
        // But in constant structs swift won't allow you to use takeVacation function.
        // A method that is not marked as mutating cannot call a mutating function – you must mark them both as mutating.
        if vacationRemaining > days {
            vacationRemaining -= days // mutates vacationRemaining variable here.
            print("I'm going on a vacation.")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14) // Since this is a variable instance of struct, usage of mutating function is allowed.
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

//let archer2 = Employee(name: "Sterling Archer2", vacationRemaining: 14)
//archer2.takeVacation(days: 4) // Error
//print(archer2.vacationRemaining)

// MARK: Computed Properties
print("------Computed Properties------")

struct Employee3 {
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken: Int = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue // newValue, vacationRemaining için atadığın yeni değeri temsil ediyor. Kalan tatil hakkının güncellenmiş hali ile kullanılmış tatil hakkını toplayıp max tatil hakkına atıyorsun.
            //vacationAllocated'i set ediyorsun yani.
        }
    }
}

var archer3 = Employee3(name: "Sterling Archer", vacationAllocated: 14)
archer3.vacationTaken += 4
print(archer3.vacationTaken, archer3.vacationRemaining, archer3.vacationAllocated)
archer3.vacationRemaining = 2
print(archer3.vacationTaken, archer3.vacationRemaining, archer3.vacationAllocated)

// MARK: Property Observers
print("-----Property Observers-----")
/// There are two different property observers.
/// didSet: runs if the property just changed and used more often.
/// willSet: runs before the property changed. Used rarely.



struct Game {
    var score = 0 {
        didSet { // Instead of printing score manually everytime,
            print("Score is now \(score)") // Swift will do that automatically after score property has changed.
        }
    }
}

var game = Game()
game.score += 10
game.score -= 4
game.score += 0

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value is: \(newValue)")
        }
        didSet {
            print("Old value is: \(oldValue)")
            print("Current value is: \(contacts)")
        }
    }
}

var app = App()
app.contacts.append("Nikola T")
print("----")
app.contacts.append("James W")
print("----")
app.contacts.append("Max P")

// Avoid Property Observers as much as possible because it can cause performance problems.


// MARK: How to create custom initializers

struct Player {
    let name: String
    let number: Int
    
    init(name: String, number: Int) { // Definition of default initializer. It's owned by us now.
        self.name = name // self.name is the property, name is the parameter.
        self.number = number // assign passed number value to the current struct's number property
    }
}

let player = Player(name:"John R", number: 15) // This creates a new Player instance by using default initializer.
print(player)

struct Player2 {
    let name: String
    let number: Int
    
    init(name: String) { // It's possible to use different type of initializers. But you'll use Swift's default initializer.
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player2 = Player2(name: "Jack M")
print(player2)

// MARK: Extension

struct Employee4 {
    var name: String
    var yearsActive = 0
}

extension Employee4 { // By using extensions it's possible to save Swift's default memberwise initializer.
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

let roslin = Employee4(name: "Laura Roslin")
let anon = Employee4()


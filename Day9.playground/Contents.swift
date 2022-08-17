import UIKit

// MARK: Access Control
/// Some data should be hidden from external access. To do that, we'll use private.

struct BankAccount {
    var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdraw money successfully")
} else {
    print("Failed to get the money.")
}

// Should've been used in this way. But you can write this directly without using method:
account.funds -= 1000
// The money in the account decreased in uncontrolled way. This bypasses the logic we put.
// To solve this we should tell Swift that funds should be accessible only inside the struct, methods belong to struct, computed properties or property observers
// This takes only one extra word: private var funds = 0

struct BankAccount2 {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            print("Withdraw successfull")
            return true
        } else {
            print("Withdraw failed.")
            return false
        }
    }
}

var account2 = BankAccount2()
//account2.funds += 1000 // Since funds defined as private this isn't available.
//print(account2.funds)

//Use private for “don’t let anything outside the struct use this.”
//Use fileprivate for “don’t let anything outside the current file use this.”
//Use public for “let anyone, anywhere use this."

// private(set) means let anyone read this property, but only let my methods write it.
/// If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only deposit() and withdraw() could actually change the value.


// MARK: Static Properties and Methods
// Static properties and methods belong to the Struct itself. Rather than belonging it's instances.
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Ömer Faruk Kazar")
print(School.studentCount)

//Accessing non-static code from static code isn't allowed.
//Accessing static code from non-static code is allowed.
    //School.studentCount  also you can use Self with capital S to refer to current type
    //self refers to current value of struct, Self refers to current type

struct AppData {
    static let version = "1.3 beta 2"
    static let fileName = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "asgdagad", password: "hj34snd5")
}

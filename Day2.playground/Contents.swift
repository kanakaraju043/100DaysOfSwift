import UIKit

// MARK: Arrays
/// Arrays are collections of values. Holds the same type of datas together and in a sequence.
let Beatles = ["John Lennon", "Paul McCartney", "George Harrison", "Ringo Starr"]
/// Each value in array is indexed from left to right by starting 0.
Beatles[0]
Beatles[3]

/// Arrays are a good choice for group of sequenced items like Songs in an album, Exam results of a classroom.

// MARK: Dictionaries
/// In dictionaries data kept as Key : Value pairs.
let numbersToInteger = ["One" : 1, "Two" : 2, "Three" : 3]
/// Dictionary values' return type are Optional. To avoid that, "default" keyword can be used.
print(numbersToInteger["One"])
print(numbersToInteger["Two", default: 0])

// MARK: Sets
/// Sets are just like arrays but elements are stored unordered. Because of that, searching an element in a set is much more faster than arrays.
/// All items in set are Unique.
let studentID: Set<Int> = ([112, 114, 116, 213, 213])
print(studentID) // Even though 213 is written twice, it appeared once because every item should be unique in sets. Same value isn't allowed.

// MARK: Tuples
/// Adding or removing item isn't allowed. Tuples are fixed in size.
/// Can hold different data types.
/// Values can be accessed by either using index numbers or by their names.

var name = (first: "Taylor", last: "Swift", age: 32, isSinger: true)
name.0
name.first
name.2
name.isSinger

// MARK: enums
/// enums are a way of defining groups of related values in a way that makes them easier to use.

enum SocialPlatform: String, CaseIterable {
    case twitter    = "My favorite!" // These are raw values.
    case facebook   = "I never use this."
    case instagram  = "I don't have an account"
    case linkedIn   = "I need to start posting here."
}

func shareImage(on platform: SocialPlatform) {
    switch platform {
    case .twitter:
        print("Image shared on Twitter")
    case .facebook:
        print("Image shared on Facebook")
    case .instagram:
        print("Image shared on Instagram")
    case .linkedIn:
        print("Image shared on LinkedIn")
    }
}

//shareImage(on: .instagram)

// MARK: rawValue
func getOmersOpinion(on platform: SocialPlatform) {
    print(platform.rawValue)
}

//getOmersOpinion(on: .instagram)

// CaseIterable is a Protocol
print(SocialPlatform.allCases.count)

for platform in SocialPlatform.allCases {
    print(platform.rawValue)
}

// MARK: Associated Values
enum SocialMediaPlatform {
    case twitter(followers: Int) // These are associated values
    case youtube(subscribers: Int)
    case instagram
    case linkedIn
}

func getSponsorshipEligibility(for platform: SocialMediaPlatform) { //Function to handle and use associated values of SocialMediaPlatform enums'
    switch platform {
    case .twitter(let followers) where followers > 10_000:
        print("Eligible for sponsored Tweet.")
    case .youtube(let subscribers) where subscribers > 25_000:
        print("Eligible for sponsored video.")
    default:
        print("Not eligible for sponsorship")
    }
}
getSponsorshipEligibility(for: .twitter(followers: 954))

// MARK: Quick check
/*
 Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 Arrays store items in the order you add them, and you access them using numerical positions.
 Sets store items without any order, so you can’t access them using numerical positions.
 Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 Dictionaries store items according to a key, and you can read items using those keys.
 Enums are a way of grouping related values so you can use them without spelling mistakes.
 You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */

import UIKit

// MARK: For loops

// Loop variable i's value will be 1,2,3... by sequence until i becomes 10 and loop ends.
for i in 1...10 {
    print(i)
}

print("Players gonna")

/// If you won't use loop variable in the loop, you can change it to underscore
for _ in 1...5 {
    print("Play")
}

// MARK: While loops
/// If the condition given to the loop is true, loop will continue until it becomes false.
var number = 1
while number <= 10 {
    print(number)
    number += 1
}

//The main difference is that for loops are generally used with finite sequences: we loop through the numbers 1 through 10, or through the items in an array, for example. On the other hand, while loops can loop until any arbitrary condition becomes false, which allows them until we tell them to stop.

//This means we can repeat the same code until…
//
//…the user asks us to stop
//…a server tell us to stop
//…we’ve found the answer we’re looking for
//…we’ve generated enough data

// MARK: Repeat Loops
/// Continues to the loop while condition is satisfying.
number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

while false {
    print("This is false")
}
repeat {
    print("This is false")
} while false

// MARK: continue and break
/// continue keyword immediately exits that iteration and jumps to next iteration.
/// break keyword immediately exits the loop

var countdown = 10

while countdown > 0 {
    countdown -= 1
    
    if countdown.isMultiple(of: 3) {
        continue
    }
    if countdown == 4 {
        print("I'm bored. Let's go now!")
        break
    }
    print(countdown)
}

// MARK: Exiting Multiple Loops
/// You should label outerLoop with a keyword.
/// break "label" if the condition satisfied.

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// MARK: Infinite Loops
/// All apps on your iPhone use infinite loops, because they start running, then continually watch for events until you choose to quit them.
var counter = 0

while true {
    print(" ")
    counter += 1
    
    if counter == 273 {
        break
    }
}

//That allows you to end the loop when you’re ready, so they aren’t truly infinite. As a result, programmers will often call these pseudo-infinite loops – they will run for a long time, and perhaps indeed forever in the case of critical systems that never restart, but technically they aren’t truly infinite.
//
//You might wonder why this sort of code is useful, but actually it’s really common. For example, all the apps you use on your iPhone have infinite loops. Think about it: when your app launches it needs to repeat a series of instructions until it’s told to stop:
//
//Check for any user input
//Run any code you need
//Redraw the screen
//Repeat
//That might last for 10 seconds if you’re just checking Twitter, but it might last for hours if you’re playing a game – or perhaps it might run for much longer. The point is that we don’t know when the loop will stop, so we can just loop from 1 to a billion.
//
//

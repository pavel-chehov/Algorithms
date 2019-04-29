//breadth-first search
//Complexity: O(V + E) v - nodes, e - edge
//

import Foundation

class Person {
    let isSeller: Bool
    let name: String
    var isChecked: Bool = false
    let neighbors: [Person]
    
    init(isSeller: Bool, name: String, neighbors: [Person]) {
        self.isSeller = isSeller
        self.name = name
        self.neighbors = neighbors
    }
}

extension Array {
    mutating func popFirst() -> Element? {
        if self.count > 0 {
            let element = self[0]
            self.remove(at: 0)
            return element
        }
        return nil
    }
}

func sellerBreadthFirstSearch(from person: Person) -> Person? {
    var searchQueue = [person]
    
    while !searchQueue.isEmpty {
        let person = searchQueue.popFirst()!
        if person.isChecked {
            continue
        }
        if person.isSeller {
            return person
        }
        person.isChecked = true
        searchQueue.append(contentsOf: person.neighbors)
    }
    
    return nil
}

let john = Person(isSeller: false, name: "John", neighbors: [])
let tom = Person(isSeller: false, name: "Tom", neighbors: [])
let anuj = Person(isSeller: true, name: "Anuj", neighbors: [])
let peggy = Person(isSeller: false, name: "Peggy", neighbors: [])
let clare = Person(isSeller: false, name: "Clare", neighbors: [tom, john])
let bob = Person(isSeller: false, name: "Bob", neighbors: [peggy, anuj])
let alice = Person(isSeller: false, name: "Alice", neighbors: [peggy])
let me = Person(isSeller: false, name: "Me", neighbors: [alice, bob, clare])

let seller = sellerBreadthFirstSearch(from: me)
print(seller?.name)

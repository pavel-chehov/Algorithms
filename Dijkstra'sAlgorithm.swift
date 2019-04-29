//Dijkstra's algorithm
//Complexity: O(n^2) in general case
//
// start -> A(6) and B(6)
// A -> finish(1)
// B -> A(3) and finish(5)
//

import Foundation

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

class Node {
    let name: String
    var isProcessed: Bool = false
    var ribs: [Rib] = []
    
    init(name: String) {
        self.name = name
    }
    
    var cheapestRib: Rib? {
        return ribs.min{$0.cost < $1.cost}
    }
}

class Rib {
    let parent: Node
    let child: Node
    let cost: Int
    
    init(from: Node, to: Node, cost: Int) {
        self.parent = from
        self.child = to
        self.cost = cost
    }
}

var start = Node(name: "Start")
var b = Node(name: "B")
var a = Node(name: "A")
var finish = Node(name: "Finish")

var startARib = Rib(from: start, to: a, cost: 6)
var startBRib = Rib(from: start, to: b, cost: 2)
var baRib = Rib(from: b, to: a, cost: 3)
var aFinishRib = Rib(from: a, to: finish, cost: 1)
var bFinishRib = Rib(from: b, to: finish, cost: 5)


start.ribs = [startARib, startBRib]
a.ribs = [aFinishRib]
b.ribs = [baRib, bFinishRib]

func cheapestWay(from start: Node, to finish: Node) -> Int {
    var notProcessedNodes: [Node] = []
    var costTable: [String:Int] = [:]
    
    notProcessedNodes.append(start)
    
    while !notProcessedNodes.isEmpty {
        let node = notProcessedNodes.popFirst()!
        guard !node.isProcessed else {
            continue
        }
        node.isProcessed = true
        for rib in node.ribs {
            let child = rib.child
            let parent = rib.parent
            let currentNodeCost = costTable[parent.name] ?? 0
            let newCost = currentNodeCost + rib.cost
            
            if !costTable.keys.contains(child.name) {
                costTable[child.name] = newCost
            } else {
                let oldCost = costTable[child.name]!
                if newCost < oldCost {
                    costTable[child.name] = newCost
                }
            }
        }
        let unprocessedChildNodes = node.ribs.sorted {$0.cost < $1.cost}.map {$0.child}
        notProcessedNodes.append(contentsOf: unprocessedChildNodes)
    }
    
    return costTable[finish.name] ?? 0
}

let value = cheapestWay(from: start, to: finish)
print(value)

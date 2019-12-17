import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init(_ elements: [Element]) {
        storage = elements
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

/*Challenge 1: Reverse an Array
 Create a function that prints the contents of an array in reversed order.” */

func reverseArray<T>(_ array: [T]) {
    var stack = Stack<T>([])
    
    array.forEach { element in
        stack.push(element)
    }
    
    while let value = stack.pop() {
        print(value)
    }
}

/* “Challenge 2: Balance the parentheses
Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. ” */

func isParenthesesBalanced(in string: String) -> Bool {
    var stack = Stack<Character>([])
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}

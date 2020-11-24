extension MutableCollection {
    /// Call a closure on each element of an array. The closure receives an `inout`
    /// element so it can be mutated if necessary.
    /// - Parameter block: The closure to call on each element
    public mutating func mutableForEach(block: (inout Element) throws -> Void) rethrows {
        try indices.forEach { index in
            try block(&self[index])
        }
    }

    public mutating func mutableForEachWithIndex(block: (inout Element, Index) throws -> Void) rethrows {
        try indices.forEach { index in
            try block(&self[index], index)
        }
    }
}

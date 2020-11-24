extension SliceView {
    /// If the sum of all hints + the count of hints - 1 is equal
    /// to the slice dimension length, the slice has only one
    /// possible solution.
    mutating func solveWholeSliceIfPossible() {
        let filledCount = hints.reduce(0, +)
        let requiredGaps = hints.count - 1
        guard dimensionLength - requiredGaps == filledCount else {
            return
        }

        let filledSegments = hints.map { Array(repeating: Slot.filled, count: $0) }
        let allSlots = Array(filledSegments.joined(separator: [.unfilled]))
        mutableForEachWithIndex { slot, index in
            slot = allSlots[index]
        }
    }

    /// When considering the two possible extreme positions of a slice
    /// (i.e. all painted segments are as close to each edge of the
    /// slice as possible), a hint is superposed if the hint is greater
    /// than the size of the edge gap. This guarantees that the overlapping
    /// slots of the hint are filled.
    mutating func partiallySolveSuperpositionOfExtremes() {
        let filledCount = hints.reduce(0, +)
        let minimumGaps = hints.count - 1
        let edgeGap = dimensionLength - filledCount + minimumGaps

        var offset = edgeGap
        hints.forEach { hint in
            defer { offset += hint + 1 } // add 1 for minimum gap
            guard hint > edgeGap else { return }
            let overlap = hint - edgeGap
            (0..<overlap).forEach {
                self[offset + $0] = .filled
            }
        }
    }
}

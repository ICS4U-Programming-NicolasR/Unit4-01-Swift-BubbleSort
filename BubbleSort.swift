//
// BubbleSort.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-05-09
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Sorts with bubble sort
import Foundation

func bubbleSort(_ nums: inout [Int]) {
    for counter in 0..<nums.count {
        for counter2 in 0..<(nums.count - 1 - counter) where nums[counter2] > nums[counter2 + 1] {
            nums.swapAt(counter2, counter2 + 1)
        }
    }
}

// Set the input and output file paths
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

// Read input from file
if let inputFile = try? String(contentsOfFile: inputFilePath) {
    let lines = inputFile.components(separatedBy: "\n")

    // Process each line
    var answers = [String]()
    for line in lines {
        let numbers = line.split(separator: " ").compactMap { Int($0) }
        var nums = Array(numbers)

        // Sort the numbers using bubble sort
        bubbleSort(&nums)
        // Write the sorted array to the output file
        let sortedArray = "Your array sorted is \(nums)"
        answers.append(sortedArray)
    }
    // Write output to file
    let outputString = answers.joined(separator: "\n")
    do {
        try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file: \(error)")
    }
} else {
    print("File not found or unable to read input file")
}

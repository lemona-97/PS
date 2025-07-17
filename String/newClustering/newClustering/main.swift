//
//  main.swift
//  newClustering
//
//  Created by 임우섭 on 7/17/25.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    let characters1 = str1.lowercased().map { $0 }
    let characters2 = str2.lowercased().map { $0 }
    
    var array1: [String] = []
    var array2: [String] = []
    
    for i in 0..<(characters1.count - 1) {
        if characters1[i].isLetter && characters1[i+1].isLetter {
            array1.append(String(characters1[i]) + String(characters1[i+1]))
        }
    }
    for i in 0..<(characters2.count - 1) {
        if characters2[i].isLetter && characters2[i+1].isLetter {
            array2.append(String(characters2[i]) + String(characters2[i+1]))
        }
    }
    
    var intersection: [String] = []
    
    var temp2 = array2
    for i in 0..<array1.count {
        for j in 0..<temp2.count {
            if array1[i] == temp2[j] {
                intersection.append(temp2.remove(at:j))
                break
            }
        }
        
    }
    if array1.count == 0 && array2.count == 0 { return 65536 }
    if intersection.count == 0 { return 0 }
    print(intersection)
    let unionCount = Double(array1.count + array2.count - intersection.count)
    let result = Int(Double(intersection.count) / unionCount * 65536.0)
    return result
}

// 문자열 다루기 & 배열 다루기, 집합 개념 (교집합 & 합집합)

//
//  main.swift
//  secretMap
//
//  Created by 임우섭 on 7/15/25.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    // 지도를 겹칠 필요가 있는가?
    // 비상금은 중요하지않다
    // 지도를 겹치는게 문제다.
    
    // 문자열 배열을 모두 이진수 배열로 변환
    // or 연산으로 지도를 채우고
    // 1을 #로 0을 공백으로 출력
    var answer: [String] = []

    var arrayOne: [[String]] = []
    arr1.forEach {
        arrayOne.append(toBinary(n, $0).map { String($0)})
    }
    
    var arrayTwo: [[String]] = []
    arr2.forEach {
        arrayTwo.append(toBinary(n, $0).map { String($0) })
    }
    
    for i in 0..<n {
        var oneLine = ""
        for j in 0..<n {
            if arrayOne[i][j] == "1" || arrayTwo[i][j] == "1" {
                oneLine += "#"
            } else {
                oneLine += " "
            }
        }
        answer.append(oneLine)
    }
    
    return answer
}

func toBinary(_ n: Int,_ num: Int) -> String {
    var originalNum = num
    var binary = ""
    if num <= 1 {
        binary = String(num)
    } else {
        while originalNum != 1 {
            if originalNum % 2 == 0 {
                binary = "0" + binary
            } else {
                binary = "1" + binary
            }
            originalNum /= 2
        }
        binary = "1" + binary
    }
    for _ in 0..<(n - binary.count) {
        binary = "0" + binary
    }
    return binary
}

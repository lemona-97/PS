//
//  main.swift
//  kNaryIsPrime
//
//  Created by 임우섭 on 7/20/25.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    // k진수 변환
    let knaryString = kNumberString(n, k)
    // 0기준으로 숫자 나누어 배열 추출
    let knaryArray = knaryString.components(separatedBy: "0").filter{ $0 != "" }
    // 배열의 숫자들이 10진법기준으로 소수인지 판단
    var count = 0
    for num in knaryArray {
        print("input: \(num)")
        print(isPrime(Int64(num)!))
        if isPrime(Int64(num)!) { count += 1 }
    }
    return count
}

func kNumberString(_ n: Int, _ k: Int) -> String {
    var result = ""
    var number = n
    while number > k {
        result = "\(number % k)" + result
        number /= k
    }
    result = "\(number)" + result
    return result
}

func isPrime(_ num: Int64) -> Bool {
    if num == 1 { return false }
    if num == 2 { return true }
    if num == 3 { return true }
    if num % 2 == 0 { return false }
    for i in 2..<Int64(sqrt(Double(num))) + 1 {
        if num % i == 0 {
            return false
        }
    }
    return true
}


print(solution(110011, 10))

// Int의 범위:
// print(Int.max) 9223372036854775807
// print(Int64.max) 9223372036854775807
// 아마 채점 엔진의 최대값이 32bit인듯해서 테스트 케이스 11에서 오류가 나는것 같다.

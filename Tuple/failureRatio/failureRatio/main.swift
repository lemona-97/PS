//
//  main.swift
//  failureRatio
//
//  Created by 임우섭 on 7/20/25.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: N+1)
    var failure: [Int: Double] = Dictionary(uniqueKeysWithValues: (0..<N).map { ($0, 0.0) })
    
    for currentStage in stages {
        result[currentStage - 1] += 1 // 2면 index 1에 +1 해줌
    }
    // 높은스테이지부터 내려가면서 실패율 계산
    // 1~10스테이지 일경우
    // 10스테이지 - 10스테이지 도전자 수 / (완료한 사람수 + 10스테이지 도전자 수)
    // 9스테이지 - 9스테이지 도전자 수 / 완료한 사람 수 + 10스테이지 도전자 수 + 9스테이지 도전자 수
    // ... 1스테이지 일경우 1스테이지 도전자 / 전체 수
    var upperChallengerSum = result[N] // 완료한 사람 수로 시작
    for i in 0..<N {
        let current = N - i - 1
        let currentChallengerCount = result[current]
        if result[current] != 0 {
        failure[current] = Double(currentChallengerCount) / Double(upperChallengerSum + currentChallengerCount)
        }
        upperChallengerSum += currentChallengerCount
    }
    var answer = failure.sorted(by: {
        $0.key < $1.key
    })
    answer.sort(by: { $0.value > $1.value })
    return answer.map(\.key).map { $0 + 1 }
}

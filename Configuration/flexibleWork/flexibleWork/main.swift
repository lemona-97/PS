//
//  main.swift
//  flexibleWork
//
//  Created by 임우섭 on 7/14/25.
//

import Foundation
    // 1 5 6
    // 2 4 5
    // 3 3 4
    // 4 2 3
    // 5 1 2
    // 6 0 1
    // 7 6 0
func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var total = 0
    var n = schedules.count
    if startday < 7 {
        let exclude = [6-startday, 7 - startday]
        for i in 0..<n {
            let schedule = schedules[i] / 100 * 60 + schedules[i] % 100
            var count = 0
            for j in 0..<7 {
                if exclude.contains(j) { continue }
                let arrivedTime = timelogs[i][j] / 100 * 60 + timelogs[i][j] % 100
                if arrivedTime <= schedule + 10 {
                    count += 1
                } else {
                    break
                }
            }
            if count == 5 { total += 1 }
        }
    } else {
        let exclude = [0, 6]
        for i in 0..<n {
            let schedule = schedules[i] / 100 * 60 + schedules[i] % 100
            var count = 0
            for j in 0..<7 {
                if exclude.contains(j) { continue }
                let arrivedTime = timelogs[i][j] / 100 * 60 + timelogs[i][j] % 100
                if arrivedTime <= schedule + 10 {
                    count += 1
                } else {
                    break
                }
            }
            if count == 5 { total += 1 }
        }
    }
    return total
}

// 단순 구현문제
//
// 핵심: 시간을 분으로 환산해야함, 시작 요일 별로 계산할 필요 없는 인덱스 구하기
// 처음에 그냥 비교했다가 테스트 케이스는 통과했지만 35점 나옴.

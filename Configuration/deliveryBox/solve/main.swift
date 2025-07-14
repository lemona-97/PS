//
//  main.swift
//  solve
//
//  Created by 임우섭 on 7/13/25.
//

import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    if n <= w {
        return 1
    }
    
    var boxes : [[Int]] = []
    
    for i in 0..<w {
        boxes.append([i+1])
    }
    
    for i in w+1...n {
        if (i - 1) / w % 2 == 0 { // 짝수 row
            if i % w == 0 {
                boxes[w-1].append(i)
            } else {
                boxes[i % w - 1].append(i)
            }
        } else { // 홀수 row
            if i % w == 0 {
                boxes[0].append(i)
            } else {
                boxes[w - (i % w)].append(i)
            }
        }
    }
    boxes.forEach {
        print($0)
    }
    
    for i in 0..<w {
        if boxes[i].contains(num) {
            let counts = boxes[i].count
            for j in 0..<counts {
                if boxes[i][j] == num {
                    return counts - j
                } else {
                    continue
                }
            }
        } else {
            continue
        }
    }
    return 0
}

// 단순 구현문제
// 핵심: 어려운 알고리즘이나 그런거 없다. 말그대로 잘 구현해서 계산하기

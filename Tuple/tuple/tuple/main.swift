//
//  main.swift
//  tuple
//
//  Created by 임우섭 on 7/15/25.
//

import Foundation

func solution(_ s:String) -> [Int] {

    // 원소가 하나인 집합의 원소를 배열에 추가하고
    // 모든 집합에서 해당 원소를 빼준다.
    // 위 두가지를 반복하면 될듯

    var tuples = s

    tuples.removeFirst(2)
    tuples.removeLast(2)
    let array = tuples.components(separatedBy: "},{") // ["2", "2,1", "2,1,3", "2,1,3,4"]
    var tupleArray = array.map { $0.components(separatedBy:",") }
    var dict: [String: Int] = [:]
    for tuple in tupleArray {
        tuple.forEach {
            if dict[$0] == nil {
                dict[$0] = 1
            } else {
                dict[$0] = dict[$0]! + 1
            }
        }
    }

    return dict.sorted(by: { $0.value > $1.value }).map { Int($0[keyPath: \.key])!}
}

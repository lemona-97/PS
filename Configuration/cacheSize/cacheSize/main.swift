//
//  main.swift
//  cacheSize
//
//  Created by 임우섭 on 7/15/25.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 } // 캐시 사이즈가 0이면 그대로 return
    
    var totalTime = 0
    var lowerCities = cities.map { $0.lowercased() }
    //캐시가 도시 수보다 작을때, 같을때, 더 클 때?
    
    var caches: [String] = []
    for i in 0..<lowerCities.count {
        let currentValue = lowerCities[i]
        if caches.contains(currentValue) {
            for j in 0..<caches.count {
                if caches[j] == currentValue {
                    caches.remove(at:j)
                    caches.append(currentValue)
                    break
                }
            }
            totalTime += 1
        } else {
            if caches.count == cacheSize {
                caches = caches.dropFirst().map { $0 }
            }
            caches.append(lowerCities[i])
            totalTime += 5
        }
    }
    return totalTime
}

// 캐시 사이즈가 크고 작고는 상관이 없다.
// 0일때만 빠르게 return 해줄수 있고
// 실제 캐시처럼 구현을 하면 된다.

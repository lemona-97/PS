//
//  main.swift
//  videoPlayer
//
//  Created by 임우섭 on 7/14/25.
//

import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    
    // 분으로 모두 환산
    // command에 따라 명령수행
    let videoA = video_len.components(separatedBy:":").map { Int($0)! }
    let videoMin = videoA[0] * 60 + videoA[1]
    
    let posA = pos.components(separatedBy:":").map { Int($0)! }
    var posMin = posA[0] * 60 + posA[1]
    
    let startA = op_start.components(separatedBy:":").map { Int($0)! }
    let startMin = startA[0] * 60 + startA[1]
    
    let endA = op_end.components(separatedBy:":").map { Int($0)! }
    let endMin = endA[0] * 60 + endA[1]
    
    // 오프닝 건너뛰기 먼저 확인
    if posMin >= startMin && posMin <= endMin {
        posMin = endMin
    }
    
    commands.forEach {
        if $0 == "prev" {
            if posMin <= 10 {
                posMin = 0
            } else {
                posMin -= 10
            }
        } else {
            if videoMin - posMin <= 10 {
                posMin = videoMin
            } else {
                posMin += 10
            }
        }
        
        if posMin >= startMin && posMin <= endMin { // 결과가 오프닝구간이면 이동
            posMin = endMin
        }
    }
    
    var result = ""
    
    let resultHour = posMin / 60
    let resultMin = posMin % 60
    
    if resultHour < 10 {
        result = "0"
    }
    result += "\(resultHour):"
    if resultMin < 10 {
        result += "0"
    }
    result += "\(resultMin)"
    return result
}

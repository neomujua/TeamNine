//
//  Test.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/25.
//  Copyright © 2020 이현호. All rights reserved.
//

import Foundation

class Test {
    var aaa: Int
    var bbb: Int
    
    init(aaa: Int, bbb: Int) {
        self.aaa = aaa
        self.bbb = bbb
    }
    
    func getSum(aaa: Int, bbb: Int) -> Int {
        return aaa+bbb
    }
}

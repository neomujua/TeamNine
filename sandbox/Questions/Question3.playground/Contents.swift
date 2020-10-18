//var retArray: [Int] = []
//
//let array = [2,3,5,6,7,1]
//
//for num in array {
//    var result: Bool = true
//    
//    if num == 2 {
//        retArray.append(num)
//    }
//    else if num > 2 {
//        for i in 2..<num {
//            if num%i == 0 {
//                result = false
//            }
//        }
//        if (result) {
//            retArray.append(num)
//        }
//    }
//}
//
//print(retArray)
//
//print(array.filter {
//    if $0 == 2 {
//        return true
//    }
//    else if $0 > 2 {
//        for i in 2..<$0 {
//            if $0%i == 0 {
//                return false
//            }
//        }
//    }
//    if $0 == 1 {
//        return false
//    }
//    return true
//})

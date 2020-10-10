var retArray: [Int] = []

let array = [2,3,5,6,7,1]

for num in array {
    var result: Bool = true
    
    if num == 2 {
        retArray.append(num)
    }
    else if num > 2 {
        for i in 2..<num {
            if num%i == 0 {
                result = false
            }
        }
        if (result) {
            retArray.append(num)
        }
    }
}

print(retArray)

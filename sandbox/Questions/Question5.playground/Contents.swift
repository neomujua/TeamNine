let numbers = [12,3,7,2346,1,236,4,12,8671]
var result = [Int]()

for number in numbers {
    if number % 4 == 0 {
        result.append(number)
    }
}

print(result)

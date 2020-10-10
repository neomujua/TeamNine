//1번
let data = [1,2,3,4,5]

var total: Int = 0
for item in data {
    if item % 2 != 0 {
        total += item
    }
}
print(total)

print(data.filter{ $0%2 != 0 }.reduce(0){ $0 + $1 })

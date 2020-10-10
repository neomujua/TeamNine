let width = [1,2,3,4]
let height = [1,2,3,4]
var area = [Int]()

for (wIndex, w) in width.enumerated() {
    area.append(w * height[wIndex])
}

print(area)

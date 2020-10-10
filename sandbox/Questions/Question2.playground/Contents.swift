let data = [1,2,3,4,5]
var word_array:[String] = []
for item in data {
    word_array.append(String(describing: item))
}
print(word_array)

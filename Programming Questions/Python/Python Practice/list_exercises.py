def nested_sum (list):
    toReturn = 0
    for nested in list:
        # print(nested)
        for num in nested:
            toReturn += num
    return toReturn

# the cool way
def nested_sum2 (list):
    merged_list = [num for nested in list for num in nested]
    return sum(merged_list)
            
    

testList = [[1, 2], [3], [4, 5, 6]]
print(f'Ex 1 Result: {nested_sum2(testList)}')

testList2 = [1, 2, 3]

def cumsum (list):
    numStored = 0
    listReturn = []
    for i in range(len(list)):
        list[i] += numStored
        numStored = list[i]
        listReturn += [list[i]]
        # OR
        # listReturn.append(list[i])
    return listReturn

print(f'Ex 2 Result: {cumsum(testList2)}')
    

def middle (list):
    middleList = list[1:len(list)-1]
    return middleList

testList3 = [1, 2, 3, 4]
print(f'Ex 3 Result: {middle(testList3)}')
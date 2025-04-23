#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'migratoryBirds' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#

def migratoryBirds(arr):
    seen={}
    maxCount=0
    bird_type=1000
    for i, n in enumerate(arr):
        if n in seen:
            temp =seen[n]
            temp +=1
            seen[n]=temp
            if (maxCount == temp and n < bird_type) or (maxCount < temp) :
                maxCount = temp
                bird_type = n
        else:
            seen[n]=1
    
    return bird_type
            

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    arr_count = int(input().strip())

    arr = list(map(int, input().rstrip().split()))

    result = migratoryBirds(arr)

    fptr.write(str(result) + '\n')

    fptr.close()

#Better Solution
# def migratoryBirds(arr):
#    freq = [0] * 6
#    for i in arr:
#        freq[i] += 1  
#    print(freq)
#    return freq.index(max(freq))

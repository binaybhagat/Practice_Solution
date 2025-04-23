#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'countApplesAndOranges' function below.
#
# The function accepts following parameters:
#  1. INTEGER s
#  2. INTEGER t
#  3. INTEGER a
#  4. INTEGER b
#  5. INTEGER_ARRAY apples
#  6. INTEGER_ARRAY oranges
#

# ALTERNATE SOLUTION

#def countApplesAndOranges(s, t, a, b, apples, oranges): # Write your code here 
#    map_apple_position = lambda x: x + a 
#    map_orange_position = lambda x: x + b 
#    filter_position = lambda x: s <= x <= t
#
#    apples_positions = list(map(map_apple_position, apples ))
#    apple_position = list(filter(filter_position, apples_positions))
#
#    oranges_positions = list(map(map_orange_position, oranges ))
#    oranges_position = list(filter(filter_position, oranges_positions))

def countApplesAndOranges(s, t, a, b, apples, oranges):
    appleDistance = [x+a for x in apples]
    orangedistance= [x+b for x in oranges]

    appleCount=0
    orangeCount=0
    for i in appleDistance:
        if i >=s and i<=t:
            appleCount+=1
    for i in orangedistance:
        if i >=s and i<=t:
            orangeCount+=1
    print(appleCount)
    print(orangeCount)    

if __name__ == '__main__':
    first_multiple_input = input().rstrip().split()

    s = int(first_multiple_input[0])

    t = int(first_multiple_input[1])

    second_multiple_input = input().rstrip().split()

    a = int(second_multiple_input[0])

    b = int(second_multiple_input[1])

    third_multiple_input = input().rstrip().split()

    m = int(third_multiple_input[0])

    n = int(third_multiple_input[1])

    apples = list(map(int, input().rstrip().split()))

    oranges = list(map(int, input().rstrip().split()))

    countApplesAndOranges(s, t, a, b, apples, oranges)

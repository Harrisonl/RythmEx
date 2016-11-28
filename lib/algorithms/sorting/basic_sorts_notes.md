# Selection Sort

Slower sorting method, not ideal

### Example:

* In iteration i, find the smallest value
* Swap the smallest value and swap that with i

```
list_to_sort = [2,6,7,1,9,4,2,4]

#First iteration

i = 2, min of remaining = 1

new_list = [1,6,7,2,9,4,2,4]

next_list = [6,7,2,9,4,2,4]

#Because [1] is in it's final order
```

# Insertion Sort

Faster then Selection Sort, but still not ideal. ~ 1/2 N^2 worst case

However, quite good results for partially ordered arrays.

### Example:

* In each iteration swap a[i] with every value to it's left that is greater

```
list_to_sort = [2,6,7,1,9,4,2,4]

#Second iteration

[2 < 6] == true -> Next

# Third iteration

[6 < 7] == true -> Next

# Fourth iteration

[7 < 1] == false -> Move [1] left one
[6 < 1] == false -> Move [1] left one
[2 < 1] == false -> Move [1] left one
```

# Shell Sort

### idea:
Move entries more than one position at a time by h-sorting the array.

### Example:

* Uses insertion sort logic, but instead of moving back 1 position it moves back h positions
* This results in a partially sorted array which is fast with an insertion sort

### Analysis:
No body knows an accurate model yet for number of values although some suggest the 3x + 1 increment is **O(N^3/2)**
Can be quite fast unless array size is huge.


# Shuffle Sort

### Idea:
* Generate a random real number for each array entry 
* Sort the array

* in iteration i, pick integer r between 0 and i uniformly at random
* swap a[i] and a[r]

Gives a pretty good random shuffle of an array. However, never 100% shuffle.





# Mergesort (2 Sorted Sub Arrays)

### Idea:
* Divide array into two halves
* Recursively sort each half
* Merge two halves

Basically given two sorted subarrays e.g. { a[lo] to a[mid] } and { a[mid +1] to a[high] , replace with a merge sorted array.

### Example:

let's say you have two sorted sub arrays

sa -> [1,4,7,9]
sb -> [1,2,6,8]

The full array == sa + sb

pseduo:

```
array = sa + sb
i = 0 ->(This is sa's current index)
j = 0 ->(This is sb's current index)

for k in array
  k = lower_of(sa[i], sa[j])

#if sa was lower
i++, k++

#if sb was lower
j++, k++
----------------
# E.g.

array = [1,4,7,9,1,2,6,8]

First iteration value of array:

k = lower(sa[0], sb[0]) # -> Both the same, take the first array's value
#-> k = 1
i++, k++

Second iteration value of array:

k = lower(sa[1], sb[0]) # lower(4,1) -> sb wins
#-> k2 = 1
j++, k++

Third iteration value of array:

k = lower(sa[1], sb[1]) # lower(4,2) -> sb wins
#-> k3 = 2
j++, k++

Fourth iteration value of array:

k = lower(sa[1], sb[2]) # lower(4,6) -> sa wins
#-> k3 = 4
i++, k++

```

### Analysis:

* Worst Case compares = N log(N)
* Worst Case Accesses = 6Nlog(N)

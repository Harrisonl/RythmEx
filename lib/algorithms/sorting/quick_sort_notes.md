# Quick Sort

### Idea:
* Shuffle the array
* Partion so that for some j, entry a[j] is in place. No larger entry to the left of j and no smaller entry to the right
* Sort each piece recursively

### Example:

[4,6,1,7,3,4,7,0]

```
# Use 4 as pivot

i starts at 6, j starts at 0.

If j < i, swap the two elements

[4,0,1,7,3,4,7,6]

i now points to 0 and j now points to 7.

Since 0 is less then 7 move i right one (1)

Since 1 is less then 7 move i right one (7)

----
when the two pointers meet and wait for them to cross once.

Then swap the pivot with j.
```

### Benefits:
* Unlike mergesort, doesn't use any extra space
* Quite a bit faster than mergesort. 1bil -> mergesort = 18 minutes, quick sort = 12

### Cons:
* Hard to test when pointer cross
* Shuffling is needed for performance guarentee
* Staying in bounds can be hard


### Analysis:

The number of comparisons (C) of N items is 2N*ln(N).




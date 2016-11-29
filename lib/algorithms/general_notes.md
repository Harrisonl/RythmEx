# Complexity of Sorting:

Framework for studying which algorithm is best for solving a particular problem.

**Terms**:
* Model of computation: Allowable operations
* Cost Model: Operation Counts (e.g. add, divide, access)
* Upper bound: Cost guarentee provided by some algorithm for x
* Lower bound: Proven limit on cost guarentee of all algorithms of x
* Optimal algorithm: Algorithm with best possible cost guarentee for X

E.g. Sorting:
* Model of computation: Decision Tree (e.g. [1,5,2,3] is 5 > 1)
* Cost Model: compares (only really costly operation)
* Upper bound: ~ N log(N) (from mergesort)
* Lower bound: ~ N log(N)
* Optimal algorithm: mergesort

This proves that mergesort is optimal when using compares, but not when looking for optimal space usage.

# Priority Queues:

Essentially where you take a particular value off the queue, based on some sort rule e.g. max values first.

**E.G.**
Find the largest M items in a stream of N items (huge N).

E.g. Fraud Detection, find the largest transactions, only store those ones becauses we couldn't possibly store them.

### Example
Pseudo
```
value = Stdin -> read

value > 1,000,000 ?

add value to priority queue, delete the smallest value
-------------

queue = []
max size = 5

Stream -> 1, 4,5,2,6,9,23,6,3,2,8,5,3,7,9,4,2,75,21

queue -> [1,4,5,2,9]
queue -> Need to add 23, remove 1 [23,4,5,2,9]
queue -> need to add 6, remove 2 [6,23,4,5,9]
queue -> skip 3 [6,23,4,5,9]
```


# Complete Binary Tree

### Definition:
* Binary Tree: Empty or node with links to left and right binary trees
* Complete Tree: Perfectly balanced (expect maybe for bottom). Height of complete tree with N nodes is [lg N]. Proof is that heigh only increases when N is a power of 2.


# Binary Heap

Array representation of a heap-ordered complete binary tree

log N insert, log N del max, get back, 1

### Heap-ordered binary tree:
* Keys in nodes
* Parents key no smaller than children's keys

### Arrays representation:
* Indicies start at 1
* Take nodes in level order (e.g. node level)
* No explicit links needed

### Proposition:
* Largest key is a[1] (1 indexed) which is the root
* Can use array indices to move through tree
* Parent of node at key, is at key / 2
* Children of node at key, are at 2k and 2k+1

### Peter Principle:
If a child key becomes larger then it's parent key.

To fix this:
* Replace Parent with Child that violates the rul
* Repeat for the new parent's parent.

### Insert New Element:
Insert node at the end, then swim it up.

### When parent becomes smaller:
* Replace the parent with the larger child value
* Repeat untill order is restored

### Delete the maximum in a heap:
* Exchange root, with the last value added
* Sink it down until it fits


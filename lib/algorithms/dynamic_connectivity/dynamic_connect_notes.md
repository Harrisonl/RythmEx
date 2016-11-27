# Dynamic Connectivity 
---

### Example:
Given a set of N connected objects:
* Connect two objects
* Check if there is a path connecting the two objects

E.g.

A--------B---------C
         |
D        E         F

* Is A connected to B: true
* Is A connected to E: true (A -> B -> E)

Often represent the nodes as integer.

### Connected Components:

This is a maximal set of objects that are mutually connected. 

E.g.

[D] - [ABCE] - [F]


### Program:

The program will have two abilities:

* Find: Check if two objects are in the same connected components
* Union: Connect two objects (may involve merging two connected components groups)

### Algorithms:

**Quick find (eager approach)**

Data structure: 
* Integer Array size N
* Each node belongs to a value in the ID array. Connected Components will have the same ID's

Nodes -> [0, 1, 2, 3, 4, 5]
IDS -> [0, 1, 1, 1, 0, 5]

This says that 
* 0 is connected to 4
* 1 is connected to 2 and 3 (and vice-versa)
* 5 is not connected to any

This makes finding easy as we can simply look up both values.

Connecting two nodes is more difficult:

We need to change all the values of 1 ID to the same value of the other.

E.g. join(0, 2)

We have to change all the ID's of each elements connected elements to be the same.

Therefore it becomes:

IDS -> [0, 0, 0, 0, 0, 5]

*Benefits*:
* Find is quick

*Cons*:
* Union is expensive (goes through every element)

**Quick Union (lazy approach)**

Uses nested arrays (essentially graphs) to  represent the data.

E.g.


0--------1---------2
         |
3        4         6

IDS -> [0, 0, 1, 3, 1, 6]

This makes connecting two nodes much easier as we don't have to traverse the whole list.

In order to combine two nodes all we have to do (e.g. connect(3, 4))
* Change the root of 4 to match the root of 3
* 4's root -> 0, 3's root -> 3
* ID[0] becomes 3

So we get:

IDS -> [3, 0, 1, 3, 1, 6]

**Benefits**
* Insert is faster
* Lookup relatively fast

**Cons**
* Potential to have large tree put below a smaller tree making the find longer (i.e. has to go up all the values)

**Weighted Quick Union**

This is the same as the union, however the smaller tree is always added to the larger tree.





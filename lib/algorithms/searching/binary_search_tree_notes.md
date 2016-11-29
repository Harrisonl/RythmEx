# Binary Search Tree:

Tree in symetrical order

###Ideas:
* Tree like structure
* Each node is smaller then it's right child's node and larger then it's left child's node

**A node is comprised of four fields**:
* A Key and value
* A reference to the left and right subtree

### Searching the Tree:
Let's say that we are searching for 4 in:
[1,4,6,23,54,75,245,246,931]

* Start at the root node
* If val (54) is less then the root go to it's left child
* else go to it's right child
* Continue until you hit it.

E.g.

Node | Compare
--------------
54   | less
6    | less
1    | greater
4    | found

### Putting in the Tree:
* Search for the key then either
* If key is found, change the value
* If key isn't present, add the new node

### Cost:
* Search: 1 + the depth of the node in the tree
* Put: 

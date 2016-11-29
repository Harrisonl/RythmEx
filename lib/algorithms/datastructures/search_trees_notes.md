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
--------------
6    | less
--------------
1    | greater
--------------
4    | found
--------------

### Putting in the Tree:
* Search for the key then either
* If key is found, change the value
* If key isn't present, add the new node

### Deleting Keys:
* Hibbard: 
  * No children: Find the node, replace with null
  * One child: Replace node with child
  * Two Children: Grab greater thens left, replace with node (more to it though). However this can lead to becoming less balanced (harder to search).


### Cost:
* Search: 1 + the depth of the node in the tree
* Put: 1 + the depth of the node in the tree


# 2 - 3 Keys

###Ideas:
* Allows 1 or 2 keys on a single node
* If there are 2 keys, then must have 3 children. One less then both, great then both, inbetween the two
* Perfectly balance, e.g. every path from root to null has same length
* Symmetric Order: In order traversal give elements in order

###Search:
* Start at root
* Comapre and move
* Repeat 

This is the same as a binary search tree however this time you have to make comparisons against between values.

###Insert:
* When inserting into a 1 key node, simply turn it into a 2 key node
* This ensures that the tree is perfectly balanced
* When adding into a 2 key node, first make a 4 node, and then move the middle key to the parent.
* The only time the depth of a tree increases is when the root node is added (e.g. when the node becomes a 3 key node)

E.g.

```
values to add -> SEARCHXPL
# ==== -> New Step
# -- -- -> Same step, moving
S
====
ES
====
AES
-- --
E -> S
  -> A
====
E -> RS
  -> A
====
E -> RS
  -> AC
====
E -> HRS
  -> AC
-- --
   -> S
ER -> H
   -> AC
====
   -> SX
ER -> H
   -> AC
====
   -> SX
ER -> HP
   -> AC
====
   -> SX
ER -> HLP
   -> AC
-- --
    -> SX
ELR -> P
    -> H
    -> AC
-- --
        -> SX
  -> R  -> P
L
  -> E  -> H
        -> AC
```

###Analysis:
* Splitting a 3 key is a local transformation: constant number of operations
* Maintains symmetric order and perfect balance
* This means that worse case in log(N)
* Best case Log3(N)

Tree height is between 12 and 20 for a million nodes
Tree height is between 18 and 30 for a billion nodes

This means that if you have a billion nodes, you are going to search a maxmimum of 30 times.

Inserting is also faster as none of the subnodes need rearranges.

# RED-BLACK BSTs

###Ideas:
* Implement 2-3 trees as BST
* Use internal left-leaning links as glue for 3-nodes

E.g.
```
   -> X
ES -> H
   -> A

Becomes

  -> X

S
       -> H
  -> E
       -> A
```

###Analysis:
* No node has two red links connected to it (because 2 key becomes 1 key)
* Every path from root to null link has the same number of black links -> * Perfect black balance*
* Red links always go left

To represent colors, have and extra bit for the color - red == true, black == false.

###Inserting:

**Rotations**
* Have to sometimes perform rotation as sometimes red will go right
* Again a local operation so quite fast

E.g. 1 == red 0 == black

```
         -> X
  -> S(1)
         -> P
E

  -> C(0)

Becomes

  -> X(0)

S
         -> P
  -> E(0)
         -> C
```

**Color Flips**
* Recolor to split a temp 3 key.

**2 Node insert example**
Example Insert:

```
c: {
  b(1): {}
}

#=> Insert a

c: {
  b(1): {
      a(1): {}
  }
}
```

Problem here is that we have two red links in a row (C -> B -> A) which in a two-three tree would mean three nodes

```
#=> Right rotate

b: {
  c(1): {}
  a(1): {}
}

#=> Color Flip
b: {
  c(0): {}
  a(0): {}
}
```


**3 Node insert example**

Steps:
* Do Standard BST insert: Link color red
* Rotate to balance the 4-node
* Flip colors to pass red link up
* rotate to lean left again

```

e: {
  s(0): {
    r(1): {}
  },
  c(0): {
    a(1): {}
  }
}

#=> insert h

e: {
  s(0): {
    r(1): {   <- Two red links in a row X
      h(1)    <-
    }
  },
  c(0): {
    a(1): {}
  }
}

#=> Rotate Right

e: {
  r(0): {
    s(1): {}, <- Need to color flip
    h(1): {}  <-
  },
  c(0): {
    a(1): {}
  }
}

#=> Color Flip

e: {
  r(1): { <- Red link is leaning the wrong way!
    s(0): {}, 
    h(0): {} 
  },
  c(0): {
    a(1): {}
  }
}

#=> Rotate left

r: {
  s(0): {},
  e(0): {
    h(0): {}
    c(0): {
      a(1): {}
    }
  }
}

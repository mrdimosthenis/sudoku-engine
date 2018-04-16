# sudoku-engine

This is my first program in Haskell. It is just a [60-line](https://github.com/mrdimosthenis/sudoku-engine/blob/master/src/Traverse.hs) sudoku engine.

![Logo](https://github.com/mrdimosthenis/sudoku-engine/blob/master/icon.png)

Let us give it a try!

Install the program:
```
curl -sSL https://get.haskellstack.org/ | sh
git clone https://github.com/mrdimosthenis/sudoku-engine.git
cd sudoku-engine
stack setup
stack build
```

Execute it:
```
stack exec sudoku-engine-exe " \
* 4 * * * * 8 6 5 \
8 * * 3 * * * * * \
* 7 * 8 5 * * 9 * \
* 6 2 5 * * * * 4 \
* 3 4 9 * 7 6 8 * \
9 * * * * 3 7 5 * \
* 5 * * 1 9 * 2 * \
* * * * * 8 * * 6 \
4 8 1 * * * * 7 * \
"
```

The output will be:
```
3 4 9 1 7 2 8 6 5
8 2 5 3 9 6 1 4 7
1 7 6 8 5 4 2 9 3
7 6 2 5 8 1 9 3 4
5 3 4 9 2 7 6 8 1
9 1 8 6 4 3 7 5 2
6 5 3 7 1 9 4 2 8
2 9 7 4 3 8 5 1 6
4 8 1 2 6 5 3 7 9
```

It runs for any ordinary size (4x4, 9x9, 16x16 ...).

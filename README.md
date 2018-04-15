# sudoku-engine

This is my first program in Haskell. It is just a [60-line](https://github.com/mrdimosthenis/sudoku-engine/blob/master/src/Traverse.hs) sudoku engine.

Please give it a try!

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
1 2 * * \
* * 1 * \
* 1 4 * \
* * * 1 \
"
```

The output will be:
```
1 2 3 4
3 4 1 2
2 1 4 3
4 3 2 1
```

It runs for any ordinary size (4x4, 9x9, 16x16 ...).
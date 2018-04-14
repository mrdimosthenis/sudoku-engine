# sudoku-engine

This is my first program in Haskell. Is just a [60-line](https://github.com/mrdimosthenis/sudoku-engine/blob/master/src/Traverse.hs) sudoku engine.

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
stack exec my-project-exe " \
> 1 2 * * \
> * * 1 * \
> * 1 4 * \
> * * * 1 \
> "
```

The output will be:
```
1 2 3 4
3 4 1 2
2 1 4 3
4 3 2 1
```

It runs for any valid sudoku dimension (4x4, 9x9, 12x12 ...).
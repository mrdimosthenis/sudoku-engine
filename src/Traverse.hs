module Traverse where

import Data.List ((\\))

type Elem = Int
type Puzzle = [[Elem]]
type Index = Int
type Point = (Index, Index)

boxSize :: Puzzle -> Int
boxSize = floor . sqrt . fromIntegral . length

elemsInSameRow :: Puzzle -> Point -> [Elem]
elemsInSameRow puzzle (_, j) = puzzle !! j

elemsInSameCol :: Puzzle -> Point -> [Elem]
elemsInSameCol puzzle (i, _) = map (!! i) puzzle

boxFloor :: Puzzle -> Point -> Point
boxFloor puzzle (i, j) = (i - i `mod` bSize, j - j `mod` bSize)
    where   bSize = boxSize puzzle

elemsInSameBox :: Puzzle -> Point -> [Elem]
elemsInSameBox puzzle point = concatMap (part iFloor bSize) $ part jFloor bSize puzzle
    where   part n m ls = take m $ drop n ls
            bSize = boxSize puzzle
            (iFloor, jFloor) = boxFloor puzzle point

freeElems :: Puzzle -> Point -> [Elem]
freeElems puzzle point = [1 .. length puzzle + 1] \\ reservedElems
    where   reservedElems = (elemsInSameRow puzzle point)
                         ++ (elemsInSameCol puzzle point)
                         ++ (elemsInSameBox puzzle point)

isValid :: Puzzle -> Bool
isValid = undefined

nextPoint :: Puzzle -> Point
nextPoint = undefined

nextPuzzles :: Puzzle -> [Puzzle]
nextPuzzles = undefined

isSolution :: Puzzle -> Bool
isSolution = undefined

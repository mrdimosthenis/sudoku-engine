module Traverse where

import Data.List ((\\), find)

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
elemsInSameBox puzzle point = concatMap (sublist iFloor bSize) $ sublist jFloor bSize puzzle
    where   sublist n m elems = take m $ drop n elems
            bSize = boxSize puzzle
            (iFloor, jFloor) = boxFloor puzzle point

freeElems :: Puzzle -> Point -> [Elem]
freeElems puzzle point = [1 .. length puzzle - 1] \\ reservedElems
    where   reservedElems = (elemsInSameRow puzzle point)
                         ++ (elemsInSameCol puzzle point)
                         ++ (elemsInSameBox puzzle point)

isValidArea :: [Elem] -> Bool
isValidArea = allUnique . filter (/= 0)
    where   allUnique :: [Elem] -> Bool
            allUnique []     = True
            allUnique (x:xs) = x `notElem` xs && allUnique xs

isValid :: Puzzle -> Bool
isValid puzzle = (all isValidArea . map (\j -> elemsInSameRow puzzle (0, j)) $ [0..maxIndex])
              && (all isValidArea . map (\i -> elemsInSameCol puzzle (i, 0)) $ [0..maxIndex])
              && (all isValidArea . map (elemsInSameBox puzzle)              $
                         [(i, j) | i <- [0, bSize .. maxIndex], j <- [0, bSize .. maxIndex]])
    where   maxIndex = length puzzle - 1
            bSize = boxSize puzzle

freePoint :: Puzzle -> Maybe Point
freePoint = fmap fst
          . find (\(_, elem) -> elem == 0)
          . zip [(i, j) | i <- [0..], j <- [0..]]
          . concat

nextPuzzles :: Puzzle -> [Puzzle]
nextPuzzles = undefined

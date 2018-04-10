module Traverse where

import Data.List ((\\), find)

type Element = Int
type Puzzle = [[Element]]
type Index = Int
type Point = (Index, Index)

boxSize :: Puzzle -> Int
boxSize = floor . (\x -> x ::Float) . sqrt . fromIntegral . length

elemsInSameRow :: Puzzle -> Point -> [Element]
elemsInSameRow puzzle (_, j) = puzzle !! j

elemsInSameCol :: Puzzle -> Point -> [Element]
elemsInSameCol puzzle (i, _) = map (!! i) puzzle

boxFloor :: Puzzle -> Point -> Point
boxFloor puzzle (i, j) = (i - i `mod` bSize, j - j `mod` bSize)
    where   bSize = boxSize puzzle

elemsInSameBox :: Puzzle -> Point -> [Element]
elemsInSameBox puzzle point = concatMap (sublist iFloor bSize) $ sublist jFloor bSize puzzle
    where   sublist n m elems = take m $ drop n elems
            bSize = boxSize puzzle
            (iFloor, jFloor) = boxFloor puzzle point

freeElems :: Puzzle -> Point -> [Element]
freeElems puzzle point = [1 .. length puzzle] \\ reservedElems
    where   reservedElems = (elemsInSameRow puzzle point)
                         ++ (elemsInSameCol puzzle point)
                         ++ (elemsInSameBox puzzle point)

freePoint :: Puzzle -> Maybe Point
freePoint puzzle = fmap fst
                 . find (\(_, el) -> el == 0)
                 . zip [(i, j) | j <- [0..maxIndex], i <- [0..maxIndex]]
                 . concat
                 $ puzzle
    where   maxIndex = length puzzle - 1

updatePuzzle :: Puzzle -> Point -> Element -> Puzzle
updatePuzzle puzzle (i, j) el = update j updatedRow puzzle
    where   update n newElem (x:xs)
                | n == 0    = newElem:xs
                | otherwise = x:update (n-1) newElem xs
            updatedRow = update i el $ puzzle !! j

nextPuzzles :: Puzzle -> Point -> [Puzzle]
nextPuzzles puzzle point = map (updatePuzzle puzzle point) $ freeElems puzzle point

solve :: [Puzzle] -> Maybe Puzzle
solve []     = Nothing
solve (x:xs) = case (freePoint x) of
    Nothing    -> Just x
    Just point -> solve (nextPuzzles x point ++ xs)

module Validate where

import Data.Maybe (isNothing)
import Traverse

isNonZeroUnique :: [Element] -> Bool
isNonZeroUnique = allUnique . filter (/= 0)
    where   allUnique :: [Element] -> Bool
            allUnique []     = True
            allUnique (x:xs) = x `notElem` xs && allUnique xs

isValid :: Puzzle -> Bool
isValid puzzle = (all isNonZeroUnique . map (\j -> elemsInSameRow puzzle (0, j)) $ [0..maxIndex])
              && (all isNonZeroUnique . map (\i -> elemsInSameCol puzzle (i, 0)) $ [0..maxIndex])
              && (all isNonZeroUnique . map (elemsInSameBox puzzle)              $
                         [(i, j) | i <- [0, bSize .. maxIndex], j <- [0, bSize .. maxIndex]])
    where   maxIndex = length puzzle - 1
            bSize = boxSize puzzle

isSolved :: Puzzle -> Bool
isSolved puzzle = (isValid puzzle) && (isNothing $ freePoint puzzle)

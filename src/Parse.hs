module Parse where

import Data.List (partition, intercalate)
import Data.Char (isSpace, isDigit)
import Traverse

trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

groupN :: Int -> [Int] -> [[Int]]
groupN _ [] = []
groupN n l
  | n > 0 = (take n l) : (groupN n (drop n l))
  | otherwise = error "Negative n"

parseAndSolve :: String -> Either String (Maybe Puzzle)
parseAndSolve str
    | (elemsNum <= 1) || (size * size /= elemsNum) =
        Left ("You provided " ++ show elemsNum ++ " elements. Valid number of elements: 16, 81, 144 ...")
    | not $ null nonValidElems =
        Left ("Invalid elements: " ++ intercalate ", " nonValidElems)
    | otherwise = Right (solve
                       . (:[])
                       . groupN (intSqrt elemsNum)
                       . map (\x -> if x == "*" then 0 else read x)
                       $ wrds)
    where   wrds = words $ trim str
            elemsNum = length wrds
            size = intSqrt elemsNum
            (_, nonValidElems) = partition (\wrd -> wrd == "*" || (all isDigit wrd && read wrd `elem` [1..size])) wrds

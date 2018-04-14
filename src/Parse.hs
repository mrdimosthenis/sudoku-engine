module Parse where

import Data.List (intercalate)
import Data.Char (isSpace, isDigit)
import Traverse

isValidSize :: Int -> Bool
isValidSize n = (n > 1) && (squareRoot * squareRoot == n)
    where squareRoot = intSqrt n

hasValidIntElems :: Int -> [Int]  -> Bool
hasValidIntElems size intElems = all (`elem` [1..size]) intElems

trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

--isValidString :: String -> Bool
--isValidString str = (isValidSize size)
--                 && (all (all isDigit) $ nonAsteriskElems)
--                 && (hasValidIntElems size $ map (\x -> read x :: Int) nonAsteriskElems)
--    where   wrds = words $ trim str
--            size = length wrds
--            nonAsteriskElems = filter (\s -> s /= "*") wrds

isValidString :: String -> Either String Puzzle
isValidString str
    | isValidSize size =
        Left ("You provided " ++ show size ++ " elements. Valid number of elements: 16, 81, 144 ...")
    | (all (all isDigit) $ nonAsteriskElems) && (hasValidIntElems size $ map (\x -> read x :: Int) nonAsteriskElems) =
        Left ("There are invalid elements. Valid elements: " ++ "*, " ++ (intercalate ", " $ map show [1..size]))
    where   wrds = words $ trim str
            size = length wrds
            nonAsteriskElems = filter (\s -> s /= "*") wrds

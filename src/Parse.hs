module Parse where

import Data.List (nub, partition, intercalate)
import Data.Char (isSpace, isDigit)
import Validate (isValid, isSolved)
import Traverse

trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

groupN :: Int -> [Int] -> [[Int]]
groupN _ [] = []
groupN n l
  | n > 0 = (take n l) : (groupN n (drop n l))
  | otherwise = error "Negative n"

validationResponse :: Puzzle -> Either String (Maybe Puzzle)
validationResponse puzzle
    | not $ isValid puzzle  = Left "This puzzle is invalid"
    | isSolved puzzle       = Left "This puzzle is already solved"
    | otherwise             = Right (solve . (:[]) $ puzzle)

parseAndSolve :: String -> Either String (Maybe Puzzle)
parseAndSolve str
    | (elemsNum <= 1) || (sqrtSize * sqrtSize * sqrtSize * sqrtSize /= elemsNum) =
        Left ("You provided " ++ show elemsNum ++ " elements\nValid number of elements: 16, 81, 256 ...")
    | not $ null nonValidElems =
        Left ("Invalid elements: " ++ intercalate ", " (nub nonValidElems)
           ++ "\nValid elements: " ++ intercalate ", " ("*" : map show [1..size]))
    | otherwise = validationResponse . groupN (intSqrt elemsNum) . map (\x -> if x == "*" then 0 else read x) $ wrds
    where   wrds               = words $ trim str
            elemsNum           = length wrds
            size               = intSqrt elemsNum
            sqrtSize           = intSqrt size
            (_, nonValidElems) = partition (\wrd -> wrd == "*" || (all isDigit wrd && read wrd `elem` [1..size])) wrds

showPuzzle :: Puzzle -> String
showPuzzle = intercalate "\n" . map (intercalate " " . map show)

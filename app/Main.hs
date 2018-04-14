module Main where

import System.Environment (getArgs)
import Parse (parseAndSolve, showPuzzle)

main :: IO ()
main = do
    args <- getArgs
    dispatch args

dispatch :: [String] -> IO ()
dispatch []            = putStrLn $ "please run something like\n\n"
                                 ++ "stack exec sudoku-engine-exe \" \\\n"
                                 ++ "1 2 * * \\\n"
                                 ++ "* * 1 * \\\n"
                                 ++ "* 1 4 * \\\n"
                                 ++ "* * * 1 \\\n"
                                 ++ "\""
dispatch (puzzleStr:_) = case (parseAndSolve puzzleStr) of
                            Left msg        -> putStrLn msg
                            Right mSolution -> case mSolution of
                                Nothing       -> putStrLn "There is no solution to this puzzle"
                                Just solution -> putStrLn $ showPuzzle solution

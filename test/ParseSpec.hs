module ParseSpec (main, spec) where

import Test.Hspec
import Parse (parseAndSolve)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "invalid" $ do
    it "size" $ do
        parseAndSolve "1 2 3 4 5 6 7 8 9" `shouldBe` Left "You provided 9 elements\nValid number of elements: 16, 81, 256 ..."
    it "elements" $ do
        parseAndSolve "0 0 0 0 1 2 3 4 0 0 0 0 0 * * 2" `shouldBe` Left "Invalid elements: 0\nValid elements: 1, 2, 3, 4"
    it "same row column or square" $ do
        parseAndSolve "1 2 3 4 2 * * * * * * * * * * *" `shouldBe` Left "This puzzle is invalid"
    it "same row column or square" $ do
        parseAndSolve "1 2 3 4 3 4 1 2 2 1 4 3 4 3 2 1" `shouldBe` Left "This puzzle is already solved"
  describe "valid" $ do
    it "with solution" $ do
        parseAndSolve "1 2 3 4 * * * * * * * * * * * *" `shouldBe` Right (Just [[1,2,3,4],[3,4,1,2],[2,1,4,3],[4,3,2,1]])
    it "without solution" $ do
        parseAndSolve " 1 2 3 4 * * *  * 3 * * * * 1 4 2 " `shouldBe` Right (Nothing)

module ValidateSpec (main, spec) where

import Test.Hspec
import Validate (isValid, isSolved)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "it is not valid when two elements appear in the" $ do
    it "same row" $ do
        isValid [[1,1,0,0]
                ,[0,0,0,0]
                ,[0,0,0,0]
                ,[0,0,0,0]] `shouldBe` False
    it "same column" $ do
        isValid [[0,0,3,0]
                ,[0,1,0,0]
                ,[0,0,0,2]
                ,[0,0,0,2]] `shouldBe` False
    it "same box" $ do
        isValid [[0,4,0,0,0,0,8,6,5]
                ,[8,0,0,3,0,0,0,0,9]
                ,[0,7,0,8,5,0,0,9,0]
                ,[0,6,2,5,0,0,0,0,4]
                ,[0,3,4,9,0,7,6,8,0]
                ,[9,0,0,0,0,3,7,5,0]
                ,[0,5,0,0,1,9,0,2,0]
                ,[0,0,0,0,0,8,0,0,6]
                ,[4,8,1,0,0,0,0,7,0]] `shouldBe` False
  describe "it is not valid when there is an invalid element" $ do
    it "-1 in 4x4" $ do
        isValid [[0,0,0,0]
                ,[0,0,0,0]
                ,[0,0,-1,0]
                ,[0,0,0,0]] `shouldBe` False
    it "10 in 9x9" $ do
        isValid [[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,10,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]] `shouldBe` False
  describe "it is valid when it is" $ do
    it "empty 9x9" $ do
        isValid [[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]
                ,[0,0,0,0,0,0,0,0,0]] `shouldBe` True
    it "already solved 4x4" $ do
        isValid [[1,2,3,4]
                ,[3,4,1,2]
                ,[2,1,4,3]
                ,[4,3,2,1]] `shouldBe` True
    it "just a valid puzzle" $ do
        isValid [[0,4,0,0,0,0,8,6,5]
                ,[8,0,0,3,0,0,0,0,0]
                ,[0,7,0,8,5,0,0,9,0]
                ,[0,6,2,5,0,0,0,0,4]
                ,[0,3,4,9,0,7,6,8,0]
                ,[9,0,0,0,0,3,7,5,0]
                ,[0,5,0,0,1,9,0,2,0]
                ,[0,0,0,0,0,8,0,0,6]
                ,[4,8,1,0,0,0,0,7,0]] `shouldBe` True
  describe "it is" $ do
    it "solved 9x9" $ do
        isSolved [[3,4,9,1,7,2,8,6,5]
                 ,[8,2,5,3,9,6,1,4,7]
                 ,[1,7,6,8,5,4,2,9,3]
                 ,[7,6,2,5,8,1,9,3,4]
                 ,[5,3,4,9,2,7,6,8,1]
                 ,[9,1,8,6,4,3,7,5,2]
                 ,[6,5,3,7,1,9,4,2,8]
                 ,[2,9,7,4,3,8,5,1,6]
                 ,[4,8,1,2,6,5,3,7,9]] `shouldBe` True
    it "not solved 4x4" $ do
        isSolved [[0,2,3,4]
                 ,[1,0,0,0]
                 ,[2,0,0,0]
                 ,[3,0,0,0]] `shouldBe` False

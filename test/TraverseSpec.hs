module TraverseSpec (main, spec) where

import Test.Hspec
import Traverse (solve)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "solve 4x4" $ do
    it "empty" $ do
      solve [[[0,0,0,0]
             ,[0,0,0,0]
             ,[0,0,0,0]
             ,[0,0,0,0]]] `shouldBe` Just [[1,2,3,4]
                                          ,[3,4,1,2]
                                          ,[2,1,4,3]
                                          ,[4,3,2,1]]
    it "puzzle" $ do
      solve [[[3,0,0,1]
             ,[0,0,2,0]
             ,[0,3,0,0]
             ,[4,0,0,2]]] `shouldBe` Just [[3,2,4,1]
                                          ,[1,4,2,3]
                                          ,[2,3,1,4]
                                          ,[4,1,3,2]]
    it "without solution" $ do
      solve [[[0,2,3,4]
             ,[1,0,0,0]
             ,[2,0,0,0]
             ,[3,0,0,0]]] `shouldBe` Nothing                                      
  describe "solve 9x9" $ do
    it "puzzle" $ do
      solve [[[0,4,0,0,0,0,8,6,5]
             ,[8,0,0,3,0,0,0,0,0]
             ,[0,7,0,8,5,0,0,9,0]
             ,[0,6,2,5,0,0,0,0,4]
             ,[0,3,4,9,0,7,6,8,0]
             ,[9,0,0,0,0,3,7,5,0]
             ,[0,5,0,0,1,9,0,2,0]
             ,[0,0,0,0,0,8,0,0,6]
             ,[4,8,1,0,0,0,0,7,0]]] `shouldBe` Just [[3,4,9,1,7,2,8,6,5]
                                                    ,[8,2,5,3,9,6,1,4,7]
                                                    ,[1,7,6,8,5,4,2,9,3]
                                                    ,[7,6,2,5,8,1,9,3,4]
                                                    ,[5,3,4,9,2,7,6,8,1]
                                                    ,[9,1,8,6,4,3,7,5,2]
                                                    ,[6,5,3,7,1,9,4,2,8]
                                                    ,[2,9,7,4,3,8,5,1,6]
                                                    ,[4,8,1,2,6,5,3,7,9]]

module TraverseSpec (main, spec) where

import Test.Hspec
import Traverse (solve)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "solve" $ do
    it "starting puzzle" $ do
      solve [[]] `shouldBe` Nothing
      --it "should work for the first perfect powers" $ do
      --  solve [[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]] `shouldBe` Nothing

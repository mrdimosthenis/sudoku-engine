module ParseSpec (main, spec) where

import Test.Hspec
import Parse (isValidSize)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "valid sizes" $ do
    it "16" $ do
        isValidSize 16 `shouldBe` True
    it "81" $ do
        isValidSize 16 `shouldBe` True
  describe "invalid sizes" $ do
    it "0" $ do
        isValidSize 0 `shouldBe` False
    it "1" $ do
        isValidSize 1 `shouldBe` False
    it "15" $ do
        isValidSize 15 `shouldBe` False
    it "17" $ do
        isValidSize 17 `shouldBe` False
    it "80" $ do
        isValidSize 80 `shouldBe` False
    it "82" $ do
        isValidSize 82 `shouldBe` False

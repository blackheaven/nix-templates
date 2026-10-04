module MyProjectSpec (spec) where

import MyProject (greet)
import Test.Hspec

spec :: Spec
spec =
  describe "greet" $
    it "greets the given name" $
      greet "world" `shouldBe` "Hello, world!"

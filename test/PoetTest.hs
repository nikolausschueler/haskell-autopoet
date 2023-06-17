module Main where

import Test.Tasty
import Test.Tasty.HUnit
import Poet

main = defaultMain $
  testCase "Simple test" $ do
    scramble "abc" "abc"

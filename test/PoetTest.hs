module Main where

import Test.Tasty
import Test.Tasty.HUnit
import Poet

main = defaultMain $
  testCase "Simple test" $ do
    assertEqual "Successor of substring of same lenght as text"
      ['\ETX'] (successors "abc" "abc" '\ETX')

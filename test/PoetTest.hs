module Main where

import Test.Tasty
import Test.Tasty.HUnit
import Poet

main = defaultMain tests
tests = testGroup "Tests"
  [ testCase "Simple test" $ do
    assertEqual "Successor of substring of same lenght as text"
      ['\ETX'] (successors "abc" "abc" '\ETX')
  , testCase "Even simpler test" $ do
    assertEqual "Successor of substring of same lenght as text"
      ['\ETX'] (successors "ab" "ab" '\ETX')
  ]

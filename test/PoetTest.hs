module Main where

import Test.Tasty
import Test.Tasty.HUnit
import Poet

main = defaultMain tests
tests = testGroup "Tests"
  [ testCase "Simple test" $ do
    assertEqual "Successor of substring of same lenght as text"
      [Nothing] (successors "abc" "abc")
  , testCase "Even simpler test" $ do
    assertEqual "Successor of substring of same lenght as text"
      [Nothing] (successors "ab" "ab")
  , testCase "Test scrambling" $ do
    x <- scramble "abc" "abcabcabc" []
    assertEqual "Sequence length is multiple of three"
      0 (length x `mod` 3)
  , testCase "Test scrambling" $ do
    x <- scramble "abc" "abcdabceabc" []
    assertEqual "Sequence length is multiple of four"
      0 (length x `mod` 4)
  , testCase "Test scrambling" $ do
    x <- scramble "abc" "abcdabceabcf" []
    assertEqual "Sequence length is multiple of four, rest is 1"
      1 (length x `mod` 4)
  ]

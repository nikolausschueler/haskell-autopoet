module Poet where

import Data.List
import Data.Maybe
import System.Exit
import System.Random

getRandomElement :: [a] -> IO a
getRandomElement l = do
    i <- randomRIO (0, length l - 1)
    return $ l !! i

successor :: Eq a => [a] -> [a] -> Maybe a
successor s (x:xs)
  | length s == length (x:xs) = Nothing
  | otherwise = Just (head (drop (length s) (x:xs)))

successors :: Eq a => [a] -> [a] -> [Maybe a]
successors s [] = []
successors s (x:xs)
  | isPrefixOf s (x:xs) = successor s (x:xs) : successors s xs
  | otherwise = successors s xs

scramble word text output = do
  let succs = successors word text
  succ <- getRandomElement succs
  if isNothing succ then return output
  else scramble (tail word ++ [fromJust succ]) text (output ++ [fromJust succ])

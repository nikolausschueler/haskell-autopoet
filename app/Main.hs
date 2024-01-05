module Main where

import System.Console.GetOpt
import System.Environment
import System.Exit
import System.IO

import qualified Poet (scramble)

data Options = Options { optWordlen :: Int }

startOptions :: Options
startOptions = Options { optWordlen = 3 }

options :: [OptDescr (Options -> IO Options)]
options =
    [ Option "w" ["wordlen"]
                 (ReqArg
                  (\arg opt -> return opt { optWordlen = read arg :: Int })
                  "WORD LENGTH")
                 "" -- "Length of word use for matching"
     , Option "h" ["help"]
                 (NoArg
                  (\_ -> do
                    prg <- getProgName
                    hPutStrLn stderr (usageInfo prg options)
                    exitWith ExitSuccess))
                  "Show help"
    ]

main :: IO ()

main = do
  args <- getArgs
  let (actions, nonOptions, errors) = getOpt Permute options args
  opts <- foldl (>>=) (return startOptions) actions
  let Options { optWordlen = wordlen } = opts
  text <- getContents
  let word = take wordlen text
  putStr word
  output <- Poet.scramble word text []
  putStrLn output

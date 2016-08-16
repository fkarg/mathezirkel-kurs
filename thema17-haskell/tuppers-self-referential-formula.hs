module Main where

import Control.Monad
import Data.Ratio

tupper :: Integer -> Integer -> Bool
tupper x y = 1/2 < floor' (((y `div` 17) % 2^(17*x + y `mod` 17)) `mod'` 2)

k :: Integer
k = 960939379918958884971672962127852754715004339660129306651505519271702802395266424689642842174350718121267153782770623355993237280874144307891325963941337723487857735749823926629715517173716995165232890538221612403238855866184013235585136048828693337902491454229288667081096184496091705183454067827731551705405381627380967602565625016981482083418783163849115590225610003652351370343874461848378737238198224849863465033159410054974700593138339226497249461751545728366702369745461014655997933798537483143786841806593422227898388722980000748404719

main :: IO ()
main = do
    forM_ [0..16] $ \y -> do
        forM_ [105,104..0] $ \x -> do
            putStr $ if tupper x (k+y) then "*" else " "
        putStr "\n"

mod' :: Rational -> Rational -> Rational
mod' x y = (x/y - fromInteger (truncate (x/y))) * y

floor' :: Rational -> Rational
floor' x = fromIntegral (floor x :: Integer)

module Main where

import Data.Function ((&))
import OpenSCAD
import PathExtrude (bezier3, pathExtrude)
import Prelude

sample :: Model3d
sample = cube 1 & pathExtrude (bezier3 (0, 0, 0) (0, 0, 20) (0, 10, -20) (0, 10, 0))

main :: IO ()
main = do
  sample & render & writeFile "product.scad"

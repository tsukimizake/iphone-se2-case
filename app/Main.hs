module Main where

import OpenSCAD as OS
import Prelude
import Data.Function ((&))


sample :: OS.Model3d
sample = OS.cube 11


main :: IO ()
main = do
  sample & OS.render & writeFile "product.scad"

module Main where

import Data.Function ((&))
import OpenSCAD
import PathExtrude (bezier3, pathExtrude)
import Prelude

sample :: Model3d
sample =
  v1
    `difference` overHangCutter
    `difference` (box 46 40 10 & with minkowski (sphere 2 def) & translate (-23, 60, 0))
    `difference` (box 40 11 10 & with minkowski (sphere 2 def) & translate (-70, -40.5, 0))
    `difference` (box 40 34 10 & with minkowski (sphere 2 def) & translate (20, -52, 0))

-- cube 1 & pathExtrude (bezier3 (0, 0, 0) (0, 0, 20) (0, 10, -20) (0, 10, 0))

overHangCutter :: Model3d
overHangCutter =
  let len = 123
      wid = 53
      pyramidscale = 6.5
      pyramid40degree = obCylinder (0.83 * pyramidscale) (1 * pyramidscale) 0 def
   in minkowski
        [box wid len 3, pyramid40degree]
        & with intersection (box 200 400 100 & translate (-100, -200, 0))
        & translate (-(wid / 2), -(len / 2), 0)

v1 :: Model3d
v1 = importFile "iphone_se_case_v1.stl" & rotate3d (90, 0, 0)

main :: IO ()
main = do
  sample & render & writeFile "product.scad"

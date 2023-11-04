default:
  ~/.cabal/bin/cabal-fmt -i product.cabal
  cabal build; cabal exec product

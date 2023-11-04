default:
  ~/.cabal/bin/cabal-fmt -i tyrell-adapter.cabal
  cabal build; cabal exec tyrell-adapter

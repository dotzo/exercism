{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hello_world (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,5] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\Documents\\Programming\\exercism\\haskell\\hello-world\\.stack-work\\install\\e020166b\\bin"
libdir     = "D:\\Documents\\Programming\\exercism\\haskell\\hello-world\\.stack-work\\install\\e020166b\\lib\\x86_64-windows-ghc-8.6.5\\hello-world-1.1.0.5-EuDWVluU9u63XSfa6BERds"
dynlibdir  = "D:\\Documents\\Programming\\exercism\\haskell\\hello-world\\.stack-work\\install\\e020166b\\lib\\x86_64-windows-ghc-8.6.5"
datadir    = "D:\\Documents\\Programming\\exercism\\haskell\\hello-world\\.stack-work\\install\\e020166b\\share\\x86_64-windows-ghc-8.6.5\\hello-world-1.1.0.5"
libexecdir = "D:\\Documents\\Programming\\exercism\\haskell\\hello-world\\.stack-work\\install\\e020166b\\libexec\\x86_64-windows-ghc-8.6.5\\hello-world-1.1.0.5"
sysconfdir = "D:\\Documents\\Programming\\exercism\\haskell\\hello-world\\.stack-work\\install\\e020166b\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hello_world_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hello_world_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hello_world_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hello_world_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_world_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_world_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)

-- | Relative date formatting, see http://momentjs.com/docs/#/displaying/fromnow/
module Data.Moment.Simple.Relative
  ( fromNow
  , fromNow'
  ) where

import Prelude

import Control.Monad.Eff (Eff())
import Data.Date (Now())
import Data.Date.Locale (Locale())
import Data.Function (Fn2(), runFn2)
import Data.Moment.Simple.Types (Moment())

foreign import fromNow_ :: forall eff.
  Fn2 Moment Boolean (Eff (now :: Now, locale :: Locale | eff) String)

-- | Display the time as relative time with an "ago" suffix.
fromNow :: forall eff. Moment -> Eff (now :: Now, locale :: Locale | eff) String
fromNow m = runFn2 fromNow_ m false

-- | Display the time as relative time *without* an "ago" suffix.
fromNow' :: forall eff. Moment -> Eff (now :: Now, locale :: Locale | eff) String
fromNow' m = runFn2 fromNow_ m true

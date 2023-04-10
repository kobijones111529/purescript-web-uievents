module Web.UIEvent.InputEvent
  ( InputEvent
  , data_
  , fromEvent
  , fromUIEvent
  , isComposing
  , toEvent
  , toUIEvent
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.UIEvent.UIEvent (UIEvent)

foreign import data InputEvent :: Type

fromUIEvent :: UIEvent -> Maybe InputEvent
fromUIEvent = unsafeReadProtoTagged "InputEvent"

fromEvent :: Event -> Maybe InputEvent
fromEvent = unsafeReadProtoTagged "InputEvent"

toUIEvent :: InputEvent -> UIEvent
toUIEvent = unsafeCoerce

toEvent :: InputEvent -> Event
toEvent = unsafeCoerce

foreign import _data_ :: InputEvent -> Nullable String

data_ :: InputEvent -> Maybe String
data_ = toMaybe <$> _data_

foreign import isComposing :: InputEvent -> Boolean

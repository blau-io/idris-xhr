--    Copyright 2017, the blau.io contributors
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--        http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.

module API.Web.XHR.XMLHttpRequest

import IdrisScript

%access public export
%default total

record XMLHttpRequest where
  constructor NewXMLRequest
  ||| self is a non-standard field to faciliate integration with JavaScript
  self : JSRef

open : XMLHttpRequest -> (method : String) -> (url : String) -> JS_IO ()
open xhr = jscall "%0.open(%1, %2)" (JSRef -> String -> String -> JS_IO ()) $
           self xhr

send : XMLHttpRequest -> JS_IO ()
send xhr = jscall "%0.send()" (JSRef -> JS_IO ()) $ self xhr


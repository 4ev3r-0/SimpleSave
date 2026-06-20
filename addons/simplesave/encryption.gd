extends Node

var enabled:bool = false
var key:String = "SimpleSaveKey"


func encrypt(text:String) -> String:

	if !enabled:
		return text

	return Marshalls.utf8_to_base64(text)


func decrypt(text:String) -> String:

	if !enabled:
		return text

	return Marshalls.base64_to_utf8(text)

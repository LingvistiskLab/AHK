!z::

Clipboard := ""
SendInput, ^c
ClipWait 0

	Clipboard := RegExReplace(Clipboard, "(.*) og (.*)", "$2 og $1")

SendInput, ^v

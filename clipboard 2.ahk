!z::

Clipboard := ""
SendInput, ^c
ClipWait 0

	stringcasesense, on
	Clipboard := StrReplace(Clipboard,"A","B")

SendInput, ^v

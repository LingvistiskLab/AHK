;marker et ord i en tekst, brug hotkey til at slå ordet op i RO eller DDO

!z:: 

Clipboard := ""
Send, ^c
ClipWait
q = %Clipboard%

; Fjern ';' før den ordbog du vil slå op i 
;url := "https://dsn.dk/soegning/?soegeord=" q
url := "https://ordnet.dk/ddo/ordbog?query=" q
;url := "https://udtaleordbog.dk/search.php?s=" q

; Fjern ';' før den browser du vil bruge 
Run, "%url%" ;default browser
;Run, firefox.exe -new-window "%url%"
;Run, iexplore.exe %url%
;Run, chrome.exe "%url%" " --new-window "
:Run, msedge.exe "%url%" " --new-window"

Return

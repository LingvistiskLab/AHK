!z:: 

url := "https://schwa.dk/filer/ipacharpick/?font=Times%20New%20Roman&sc=da"

; Fjern ';' før den browser du vil bruge 
Run, "%url%" ;default browser
;Run, firefox.exe -new-window "%url%"
;Run, iexplore.exe %url%
;Run, chrome.exe "%url%" " --new-window "
:Run, msedge.exe "%url%" " --new-window"

Return

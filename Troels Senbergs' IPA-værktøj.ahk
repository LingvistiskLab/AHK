; ------------- MIT LICENSE ------------- 
; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”),
; to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
; and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

; THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

; ------------- CREDITS ------------- 
; Ide og fonem-bibliotek: Troels Senbergs
; Al den fantastisk kodning: Lucas Adelholm, Rune og Andreas Mehlsen
; Faglig feedback og beta-testere: Holger Juul og Ruben Schachtenhaufen.

; ------------- SKABELONER TIL PROGRAMMERING -------------
; Tryk: [ctrl+shift+p] ("p" for "programmering") mens scriptet kører for at læse en vejledning til skabelonerne. Kopier skabelonen ind hvor du vil have den nye entry/nye tast, og udfyld selv dens værdier. 

; SKABELON - NY ENTRY (kopier alt efter kolon):"TAST": [["[TEGN] <EKS> <EKS>", ["CODE"]]],
; SKABELON - NYT SEGMENT (kopier alt efter kolon):, ["[TEGN] <EKS> <EKS>", ["CODE"]]
; SKABELON - DOBBELT UNICODE (kopier alt efter kolon):["CODE", "CODE"]

; HJÆLP - NYT SEGMENT
; TILFØJ SIDST I CYCLE: kopiér skabelonen (husk at medtage det første komma) ind imellem de to sidste: "]]" i en tasts entry. Således:
;    "X": [["[Y] <K1> <K2>", ["Z"]]], 
; -> "X": [["[Y] <K1> <K2>", ["Z"]], ["[Y] <K1> <K2>", ["Z"]]],

; TILFØJ MIDT I CYCLE: Kopiér skabelonen (husk at medtage det første komma) ind imellem: "]," i en tasts entry. Således:
;    "X": [["[Y] <K1> <K2>", ["Z"]], ["[Y] <K1> <K2>", ["Z"]]]
; -> "X": [["[Y] <K1> <K2>", ["Z"]], ["[Y] <K1> <K2>", ["Z"]], ["[Y] <K1> <K2>", ["Z"]]]

; HJÆLP - DOBBELT UNICODE
; Kopier skabelonen ind ovenpå: ["CODE"], således:
;    "TAST": [["[TEGN] <EKS> <EKS>", ["CODE"]]],
; -> "TAST": [["[TEGN] <EKS> <EKS>", ["CODE", "CODE"]]],

#SingleInstance force
#Persistent
#NoEnv
#Warn

SendMode Input

; Define your phonetic symbols for each key.

;Bibliotek 1: a-g (a-b-c-d-e-f-g)
global library1 := { "a": [["[a] <A̲nne> <ma̲sse>", ["0061"]], ["[æ] <A̲ne> <ma̲se>", ["00E6"]], ["[ɑ] <A̲rne> <ra̲se>", ["0251"]], ["[ɐ] <hoppe̲r̲> <spise̲r̲>", ["0250"]]], "b": [["[b] <B̲ent> <b̲øjet>", ["0062"]], ["[β] engelsk <upv̲ote>", ["03B2"]], ["[ʙ] Pirahã <kaoáíb̲ogi>", ["0299"]]], "c": [["[c] norsk <fet̲t̲> spansk <c̲h̲oco>", ["0063"]], ["[ɔ] <å̲l> <o̲st>", ["0254"]], ["[ɕ] <s̲j̲at> <c̲h̲okolade>", ["0255"]], ["[ç] engelsk <h̲ue>", ["00E7"]]], "d": [["[d] <d̲in> <d̲eres>", ["0064"]], ["[ð] <blød̲> <grød̲", ["00F0"]], ["[ɖ] engelsk <d̲ine>", ["0256"]]], "e": [["[e] <e̲n> <e̲gern>", ["0065"]], ["[ə] <spise̲> <købe̲>", ["0259"]], ["[ɛ] <E̲lse> <e̲lm>", ["025B"]]], "f": [["[f] <f̲in> <f̲an>", ["0066"]], ["[ɸ] spansk <f̲uera> <ab̲dicar>", ["0278"]], ["[ɟ] norsk <fad̲d̲er>", ["025F"]]], "g": [["[g] <g̲raf> <g̲iraf>", ["0067"]], ["[ɤ] urundet [o]: engelsk <fo̲o̲t>", ["0264"]], ["[ɢ] engelsk <g̲audy>", ["0262"]]] } 

;Bibliotek 2: h-m (h-i-j-k-l-m-n)
global library2 := { "h": [["[h] <h̲elt> <H̲erlev>", ["0068"]], ["[ɦ] engelsk <beh̲ind>", ["0266"]], ["[ɧ] svensk sj-lyd", ["0267"]]], "i": [["[i] <I̲lse> <i̲s>", ["0069"]], ["[ɪ] engelsk <hi̲t> <bi̲t>", ["026A"]], ["[ɪ̯] <hej̲> <drej̲>", ["026A", "032F"]], ["[ɨ] engelsk <go̲o̲d> <ru̲de>", ["0268"]]], "j": [["[j] <J̲ens> <j̲arl>", ["006A"]], ["[ɪ̯] <hej̲> <drej̲>", ["026A", "032F"]], ["[ʝ] norsk <g̲i> svensk <j̲ord>", ["029D"]]], "k": [["[k] <K̲arl> <k̲at>", ["006B"]]], "l": [["[l] <L̲ars> <l̲ap>", ["006C"]], ["[l̩] syllabisk [l]", ["006C", "0329"]], ["[ɬ] norsk <sæl̲t>", ["026C"]], ["[ɭ] fransk <bel̲l̲e>", ["026D"]], ["[ʎ] engelsk <mil̲l̲i̲on>", ["028E"]], ["[ʟ] engelsk <middl̲e>", ["029F"]]], "m": [["[m] <M̲ads> <m̲ere>", ["006D"]], ["[m̩] syllabisk [m]", ["006D", "0329"]], ["[ɱ] norsk <kom̲fyr>", ["0271"]]], "n": [["[n] <N̲iels> <n̲ed>", ["006E"]], ["[ŋ] <han̲g̲> <tran̲g̲>", ["014B"]], ["[n̩] syllabisk [n]", ["006E", "0329"]], ["[ŋ̩] syllabisk [ŋ]", ["014B", "0329"]], ["[ɲ] italiensk <bag̲n̲o>", ["0272"]], ["[ɳ] norsk <gar̲n̲>", ["0273"]], ["[ɴ] hollandsk <aan̲genaam>", ["0274"]]] }

;Bibliotek 3: o-u (o-p-q-r-s-t-u)
global library3 := { "o": [["[o] <sto̲l> <so̲l>", ["006F"]], ["[ɤ] urundet [o]: engelsk <fo̲o̲t>", ["0264"]]], "p": [["[p] <P̲er> <p̲let>", ["0070"]]], "q": [["[q] engelsk <c̲aught> <c̲ut>", ["0071"]]], "r": [["[ʁ] <r̲en> <r̲ød>", ["0281"]], ["[ɐ̯] <Thor̲> <mor̲>", ["0250", "032F"]], ["[ɹ] engelsk <r̲agtime>", ["0279"]], ["[r] Snurret r (tril)", ["0072"]], ["[ɾ] engelsk <thr̲ee>", ["027E"]], ["[ʀ] engelsk <r̲ed>", ["0280"]], ["[ɽ] norsk <bI̲ad>", ["027D"]]], "s": [["[s] <S̲anne> <s̲er>", ["0073"]], ["[ɕ] <s̲j̲at> <c̲h̲okolade>", ["0255"]], ["[θ] engelsk <t̲h̲riller> <t̲h̲ink>", ["03B8"]], ["[ʃ] engelsk <s̲h̲eep>", ["0283"]], ["[ʂ] norsk <nor̲s̲k>", ["0282"]]], "t": [["[t] <T̲im> <t̲al>", ["0074"]], ["[θ] engelsk <t̲h̲riller> <t̲h̲ink>", ["03B8"]], ["[ʈ] engelsk <t̲ime>", ["0288"]]], "u": [["[u] <bu̲d> <gu̲d>", ["0075"]], ["[ʊ] <EKS> <EKS>", ["028A"]], ["[ʊ̯] <løv̲> <tøv̲>", ["028A", "032F"]], ["[ɯ] urundet [u]", ["026F"]], ["[ʉ] engelsk <go̲o̲se>", ["0289"]]] }

;Bibliotek 4: v-å (v-w-x-y-z-æ-ø-å)
global library4 := { "v": [["[v] <V̲era> <v̲ejr>", ["0076"]], ["[ʊ̯] <løv̲> <tøv̲>", ["028A", "032F"]], ["[ʋ] italiensk <r̲ar̲o>", ["028B"]], ["[ⱱ] mono <v̲wa>", ["2C71"]]], "w": [["[w] <w̲ifi> <???>", ["0077"]], ["[ʊ̯] <løv̲> <tøv̲>", ["028A", "032F"]], ["[ɰ] fransk <ar̲a>", ["0270"]]], "x": [["[x] engelsk <loc̲h̲>", ["0078"]], ["[χ] fransk <tr̲ès>", ["03C7"]]], "y": [["[y] <y̲de> <sy̲lte>", ["0079"]], ["[ʏ] norsk <ny̲tt>", ["028F"]], ["[ɥ] engelsk <w̲ill>", ["0265"]], ["[ʎ] engelsk <mil̲l̲i̲on>", ["028E"]]], "z": [["[z] engelsk <z̲oo>", ["007A"]], ["[ʒ] engelsk <vis̲i̲on>", ["0292"]], ["[ʑ] engelsk <vis̲i̲on>", ["0291"]], ["[ʐ] svensk <fr̲i>", ["0290"]]], "æ": [["[ɛ] <E̲lse> <e̲lm>", ["025B"]], ["[æ] <A̲ne> <ma̲se>", ["00E6"]]], "ø": [["[ø] <ø̲de> <kø̲be>", ["00F8"]], ["[œ] <hø̲ne> <drø̲ne>", ["0153"]], ["[ɶ] <rø̲r> <gø̲r>", ["0276"]]], "å": [["[ɔ] <å̲l> <o̲st>", ["0254"]], ["[ɒ] <o̲g> <o̲rdne>", ["0252"]], ["[ʌ] <o̲ttende> <o̲dder>", ["028C"]], ["[å] Ortografisk <å̲>", ["00E5"]]] }

;Bibliotek 5: tal (8-9)
global library5 := { 8: [["[", ["005B"]], ["(", ["0028"]], ["<", ["003C"]], ["/", ["002F"]]], 9: [["]", ["005D"]], [")", ["0029"]], [">", ["003E"]], ["/", ["002F"]]], 0: [["[◌̥] Ustemthed", ["0325"]], ["[ₒ◌] Nultryk", ["2092"]]] }

;Bibliotek 6: tegn ([,]-[.]-[-]-[']-[+])
global library6 := { "'": [["[ˈ◌] Hovedtryk", ["02C8"]], ["[ˌ◌] Bitryk", ["02CC"]], ["[◌̩] Stavelsesbærende", ["0329"]]], ",": [["[◌ʰ] Aspireret", ["02B0"]], ["[◌ʲ] Palatalisering", ["02B2"]], ["[◌ˢ] Alveolært Affrikeret", ["02E2"]], ["[◌ʷ] Labialisering", ["02B7"]], ["[◌ˠ] Velarisering", ["02E0"]], ["[◌ˁ] Faryngalisering", ["02C1"]]], ".": [["[◌ː] Lang vokal", ["02D0"]], ["[◌ˑ] Halvlang vokal", ["02D1"]], ["[|] Pause", ["007C"]], ["[◌ˣ] Stødefterslag", ["02E3"]]], "-": [["[◌̠] Tilbagetrukket", ["0320"]], ["[◌̞] Mere åben", ["031E"]], ["[◌̝] Mere lukket", ["031D"]], ["[◌̹] Mere runding", ["0339"]], ["[◌̜] Mindre runding", ["031C"]], ["[◌̃] Nasalitet", ["0303"]], ["[◌˞] Retrofleksion", ["02DE"]]], "+": [["[◌̟] Fremskudt", ["031F"]], ["[◌̯] Halvvokal", ["032F"]], ["[◌ˀ] Stød", ["02C0"]], ["[◌ʔ] Kraftigt stød", ["0294"]], ["[ˀ◌] Sprængansats", ["02C0"]], ["[◌̬] Stemthed", ["032C"]], ["[◌̤] Luftfyldt stemme", ["0324"]], ["[◌̰] Knirkestemme", ["0330"]], ["[ ◌͡◌] Svævende diftong", ["0361"]]] }

global keyPressCount := -1
global lastKeyPressed := ""
global isGangsterModeToggled := false
global supportedKeys := [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "y", "z", "æ", "ø", "å", 8, 9, 0, ",", ".", "-", "'", "+" ]

for index, supportedKey in supportedKeys
{
    Hotkey, $%supportedKey%, DefaultHotkeyHandler, UseErrorLevel
    Hotkey, +%supportedKey%, DefaultHotkeyHandler, UseErrorLevel
    Hotkey, ^%supportedKey%, HelpHotkeyHandler, UseErrorLevel
}

Suspend, On

; Gangster Mode Toggle (Ctrl+Shift+G)
^+g::
    Suspend, Permit

    isGangsterModeToggled := !isGangsterModeToggled

    if (isGangsterModeToggled)
        Suspend, Off
    else
        Suspend, On

    if (isGangsterModeToggled)
        ToolTip, Gʌngstər Mode ON, % A_CaretX+20, % A_CaretY+20, 10
    else
        ToolTip, Gʌngstər Mode OFF, % A_CaretX+20, % A_CaretY+20, 10

    SetTimer, RemoveToolTip, -2000

    return

; Show Help Menu (Ctrl+Shift+H)
^+h::
    Suspend, Permit

    MsgBox, 64, HJÆÆÆÆÆÆÆLP! :O :O :O :'(`n, --------------- START ------------------- `nNår scriptet startets er fonetisk mode som default slået fra. Mens det er slået fra, er kun tre funktioner aktiverede: `n `n1) TOGGLE: Tryk [ctrl+shift+g] ("g" for "gangster") for at toggle fonetisk tastatur til/fra. Det kan man altid gøre. `n `n2) HJÆLP: Tryk [ctrl+shift+h] ("h" for "hjælp") for at vise hjælpevinduet her. Det kan man altid gøre.`n `n3) PROGRAMMERING: Tryk [ctrl+shift+p] ("p" for "programmering) for at vise et vindue der instruerer dig i at redigere scriptets kode. Det kan man altid gøre.`n`nDerudover opfører tastaturet sig fuldstændigt normalt. Man burde ikke engang bemærke at scriptet kører. `n`n--------------- FONETISK MODE -------------------`nNår det fonetiske tastatur er slået til, har de fleste taster nye funktioner. Det gælder: `n- Alle bogstaver (a-å) `n- Nogle tal (8, 9 og 0) `n- Visse tegn ([,], [.], [-], ['] og [+]). `nAlle andre taster virker fortsat som de plejer. De påvirkede taster har 3 nye funktioner: `n `n1) DIREKTE: Tryk [tast]: det mest almindelige tegn forbundet med tasten indsættes direkte. `n `n2) CYCLE: Tryk [shift+tast]: Tegn forbundet med tasten vises i et lille vindue sammen med eksempler på dens lydværdi. Trykker man [tast] igen "cycler" den igennem de øvrige tegn. Når der ikke er flere tegn starter cyclen forfra. Man indsætter ved at hæve [shift].`n `n3) OVERSIGT: Tryk [ctrl+tast]: En oversigt over alle tastens tegn vises i et vindue. `n`n--------------- AFSLUTTE -------------------`n1) Du kan altid toggle det fonetiske tastatur fra igen med: [ctrl+shift+g]. `n`n2) Hvis du vil slukke helt for scriptet kan du trykke den lille pil op i nederste højre hjørne af din windows-proceslinje. Højreklik på det grønne ikon med et hvidt "s" og vælg "exit"`n`n--------------- CREDITS -------------------`n- Ide og fonem-bibliotek: Troels Senbergs `n- Al den fantastisk kodning: Lucas Adelholm, Rune og Andreas Mehlsen`n- Faglig feedback og beta-testere: Holger Juul og Ruben Schachtenhaufen.
 
    return

; Show Help Menu (Ctrl+Shift+P)
^+p::
    Suspend, Permit

    MsgBox, 64, Hjælp til at programmere, For at ændre koden skal du først åbne scriptet i et program som Notepad. Dette kan du desværre ikke gøre hvis du bruger executable (.exe) versionen af programmet. `n`n--------------- OPBYGNING -------------------`nProgrammet er bygget op omkring et centralt fonem-data-center der består af 6 biblioteker. `n`nBiblioteker: `nDe 6 biblioteker er: Alfabetet delt op i 4 + 1 til tal + 1 til tegn. Når man trykker på en tast tjekker programmet fra toppen af om tasten tilhører bibliotek 1. Hvis ikke, går den videre til bibliotek 2, dernæst 3 osv. Når den har fundet tastens bibliotek går den ind i tastens entry.`n`nEntry:`nAlle tasters grundstruktur ser således ud: `n`n"TAST": [["[TEGN] <EKS> <EKS>", ["KODE"]]`n`nHvor at:`n     TAST er tasten der blev trykket`n     TEGN er den grafiske repræsentation af tegnet`n     EKS og EKS er eksemplerne på tegnets lydværdi`n     KODE er tegnets unicode. `n`n--------------- ÆNDRINGER -------------------`nFor at lave ændringer, må du arbejde ud fra tegnenes entries. Jeg har lagt skabeloner i starten af scriptet, der kan hjælpe dig. Her er de grundlæggende ændringer: `n `nTAST: Angiv den tast på "TAST" der aktiverer sekvensen. Det skal du bruge, hvis du vil oprette en ny entry. Hvis du opretter en ny tast skal du også tilføje den til "global supportedkeys", som ligger under det sidste bibliotek. `n`nTOOLTIP: Alt indenfor gåseøjnene: "[TEGN] <EKS> <EKS>" vises i tooltip når der cycles. Jeg plejer at vise tegnets grafiske repræsentation og to eksempler på dets lydværdier men du bestemmer selv. For at indsætte tegnet skal du bare finde det på nettet og kopiere det ind på TEGN.`n`nKODE: Når programmet indsætter et tegn, gør den det på baggrund af den unicode der står på "KODE". For at finde unicode: kopier tegnet ind i word og tryk [alt+x]. Tegnet vil blive konverteret til en 4-digit kode (eks.: 028A). Kopier den kode ind på "KODE". `n     NB: Visse tegn består af to koder, eks: [ʊ̯] =  [ʊ] + [◌]. For at finde deres unicodes må du kopiere det samlede tegn ind i word og bruge [alt+x] til at konvertere begge tegn. Sæt tegnene på KODE's plads men i stedet for ["KODE"] brug strukturen ["KODE1", "KODE2"]. `n`nRÆKKEFØLGE: Tegnene cycles i den samme rækkefølge som i tastens entry. Dvs.: En rækkefølge-ændring i dens entry ændrer også dens cycle-rækkefølge. En entry's første segment, er altid dén der sættes direkte ind, når der ikke cycles.`n`nTILFØJ: For at tilføje indsætter du bare et nyt segment dét sted i cyclen du vil have den ind. Adskil de to segmente med et komma og et mellemrum. Således: `n"TAST": [["[TEGN] <EKS> <EKS>", ["KODE"], ["[TEGN] <EKS> <EKS>", ["KODE"]]. `n`nSLET: Slet et hvilket som helst segment for at fjerne det fra cyclen.`n`nANDET: Du kan også gøre meget mere, men med de her muligheder tror jeg du kan gøre det meste. Leg endelig videre hvis du vil gøre mere.

    return

RemoveToolTip:
    ToolTip, , , , 10
    return

SendKey(key, index)
{
    sendKeyInfo := GetKeyInfo(key)
    unicodes := sendKeyInfo[index][2]

    for index, unicode in unicodes
        SendInput, {U+%unicode%}
}

GetKeyInfo(key)
{
    if (library1.HasKey(key))
        return library1[key]
    if (library2.HasKey(key))
        return library2[key]
    if (library3.HasKey(key))
        return library3[key]
    if (library4.HasKey(key))
        return library4[key]
    if (library5.HasKey(key))
        return library5[key]
    if (library6.HasKey(key))
        return library6[key]

    throw Exception("Key not present in any library.", key)
}

; Confirm Symbol Selection
~Shift Up::
    if (keyPressCount == -1)
      return

    SendKey(lastKeyPressed, keyPressCount)

    keyPressCount := -1
    ToolTip

    return

DefaultHotkeyHandler:
    currentKeyPressed := SubStr(A_ThisHotkey, 2)

    isHoldingShift := GetKeyState("Shift", "D")

    if (!isHoldingShift)
    {
        SendKey(currentKeyPressed, 1)
        return
    }

    currentKeyInfo := GetKeyInfo(currentKeyPressed)

    if (currentKeyPressed == lastKeyPressed)
    {
        if (keyPressCount == -1)
            keyPressCount := 1
        else
            keyPressCount += 1

        if (keyPressCount > currentKeyInfo.length())
            keyPressCount := 1
    }
    else
        keyPressCount := 1

    tooltipText := currentKeyInfo[keyPressCount][1]
    ToolTip, %tooltipText%, % A_CaretX+10, % A_CaretY-10

    lastKeyPressed := currentKeyPressed

    return

HelpHotkeyHandler:
    currentKeyPressed := SubStr(A_ThisHotkey, 2)
    currentKeyInfo := GetKeyInfo(currentKeyPressed)

    ; Initialize an empty result string.
    result := ""

    ; Loop through the array and concatenate the strings.
    for index, keyInfo in currentKeyInfo
        result := result . keyInfo[1] . "`n"

    ; Display the final result.
    MsgBox, , Hjælp - "%currentKeyPressed%", %result%

    return

; Place holder for the bot

Local $coord = PixelSearch(0, 0, 1440, 900, 0x313129)
PixelGetColor ( $coord[0] , $coord[1] )
If Not @error Then
    MsgBox(0, "X and Y are:", $coord[0] & "," & $coord[1])
EndIf

MsgBox(0, "Tutorial", PixelGetColor ( $coord[0] , $coord[1] ))
Local $coord = PixelSearch(0, 0, 1440, 900, 0x37372C)
PixelGetColor ( $coord[0] , $coord[1] )
If Not @error Then
    MsgBox(0, "X and Y are:", $coord[0] & "," & $coord[1])
EndIf

MsgBox(0, "Color At Location", PixelGetColor ( $coord[0] , $coord[1] ))
; find the board's starting location
Local $coord = PixelSearch(0, 0, 1440, 900, 0x37372C)
If Not @error Then
    MsgBox(0, "Board's X and Y values are:", $coord[0] & "," & $coord[1])
EndIf
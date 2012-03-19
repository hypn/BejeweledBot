Local $coord = PixelSearch(0, 0, 1440, 900, 0x37372C)
PixelGetColor ( $coord[0] , $coord[1] )
If Not @error Then
    MsgBox(0, "X and Y are:", $coord[0] & "," & $coord[1])
EndIf

For $i = 0 To 7 Step 1
	MouseMove($coord[0]  + 18 +( $i* 37), $coord[1] + 26 )
    MsgBox(0, "Count down!", PixelGetColor ( $coord[0]  + 18 +( $i* 37), $coord[1] + 26 ))
Next

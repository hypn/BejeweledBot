#AutoIt3Wrapper_Change2CUI=Y
Local $coord = PixelSearch(0, 0, 1440, 900, 0x37372C)
Local $crd[8][8]

;X and Y relate to the x-axis and y-axis
For $y = 0 To 7 Step 1
   For $x = 0 To 7 Step 1
	;MouseMove($coord[0]  + 18 +( $i* 37), $coord[1] + 26 )
	$crd[$i][$x] = PixelGetColor ( $coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
   Next
Next


Local $iMax = UBound($crd)
for $i = 0 To UBound($crd) - 1
   For $x = 0 To 7 Step 1
	  Switch $crd[$i][$x]
		 Case 16775956,16776960
			ConsoleWrite("Yellow , ")
		 Case 16206352,16471568 ; we also match 15* as red in most cases
			ConsoleWrite("Red , ")
		 Case 16777215,16514043
			ConsoleWrite("Silver , ")
		 Case 12749289,12885488,11902199 ,13021688,12029936,12157930
			ConsoleWrite("Purple , ")
		 Case 5420321,4303909
			ConsoleWrite("Green , ")
		 Case 16675594
			ConsoleWrite("Orange , ")
		 Case 6220025,5565436,8249328,5892858,4911103,6353407,6547447,7921905,6874614,7202036
			ConsoleWrite("Blue , ")
		 Case Else
			;If the color code is not matched above then we do a rough check
			;This may be wrong so we mark with a * (note this has yet to match a wrong color)
			$checker = StringLeft(StringFormat("%i",$crd[$i][$x]),2)
			Switch $checker
			   Case "16"
				  ConsoleWrite("*Orange* , ")
			   Case "15"
				  ConsoleWrite("*Red* , ")
			   Case "52","75"
				  ConsoleWrite("*Blue* , ")
			   Case Else
				  ConsoleWrite($checker &", ")
			EndSwitch
	  EndSwitch
   Next
   ConsoleWrite(@LF )
Next


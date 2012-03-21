#AutoIt3Wrapper_Change2CUI=Y
Local $coord = PixelSearch(0, 0, 1440, 900, 0x37372C)
Local $crd[8][8]
For $i = 0 To 7 Step 1
   For $x = 0 To 7 Step 1
	;MouseMove($coord[0]  + 18 +( $i* 37), $coord[1] + 26 )
	$crd[$i][$x] = PixelGetColor ( $coord[0]  + 18 +( $x* 37), $coord[1] + ( ($i +1) * 37) - 11 )
   Next
Next


Local $iMax = UBound($crd)
for $i = 0 To UBound($crd) - 1
   For $x = 0 To 7 Step 1
	  Switch $crd[$i][$x]
		 Case 16775956,16776960
			ConsoleWrite("Yellow , ")
		 Case 15675664,15552565,15940880,16206352,16471568
			ConsoleWrite("Red , ")
		 Case 16777215,16514043
			ConsoleWrite("Silver , ")
		 Case 12749289,12885488,11902199 ,13021688,12029936,12157930
			ConsoleWrite("Purple , ")
		 Case 5420321,4303909
			ConsoleWrite("Green , ")
		 Case 16704666, 16702608,16626785,16698749,16677652,16681511,16700806,16693088,16683312,16679453,16687171,16621380, 16685370,16675594
			ConsoleWrite("Orange , ")
		 Case 6220025,5565436,8249328,5892858,4911103,6353407,6547447,7921905,6874614,7202036
			ConsoleWrite("Blue , ")
		 Case Else
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


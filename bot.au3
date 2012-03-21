#AutoIt3Wrapper_Change2CUI=Y
Local $coord = PixelSearch(0, 0, 1440, 900, 0x37372C)
Local $crd[8][8]

;X and Y relate to the x-axis and y-axis
For $y = 0 To 7 Step 1
   For $x = 0 To 7 Step 1
	;MouseMove($coord[0]  + 18 +( $i* 37), $coord[1] + 26 )
	$crd[$y][$x] = PixelGetColor ( $coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
   Next
Next

Local $coloredMap[8][8]
for $i = 0 To UBound($crd) - 1
   For $x = 0 To 7 Step 1
	  Switch $crd[$i][$x]
		 Case 16775956,16776960
			$coloredMap[$i][$x] = "Yellow"
;~ 			ConsoleWrite("Yellow , ")
		 Case 16206352,16471568 ; we also match 15* as red in most cases
			$coloredMap[$i][$x] = "Red"
;~ 			ConsoleWrite("Red , ")
		 Case 16777215,16514043
			$coloredMap[$i][$x] = "Silver"
;~ 			ConsoleWrite("Silver , ")
		 Case 12749289,12885488,11902199 ,13021688,12029936,12157930
			$coloredMap[$i][$x] = "Purple"
;~ 			ConsoleWrite("Purple , ")
		 Case 5420321,4303909
			$coloredMap[$i][$x] = "Green"
;~ 			ConsoleWrite("Green , ")
		 Case 16675594
			$coloredMap[$i][$x] = "Orange"
;~ 			ConsoleWrite("Orange , ")
		 Case 6220025,5565436,8249328,5892858,4911103,6353407,6547447,7921905,6874614,7202036
			$coloredMap[$i][$x] = "Blue"
;~ 			ConsoleWrite("Blue , ")
		 Case Else
			;If the color code is not matched above then we do a rough check
			;This may be wrong so we mark with a * (note this has yet to match a wrong color)
			$checker = StringLeft(StringFormat("%i",$crd[$i][$x]),2)
			Switch $checker
			Case "16"
				  $coloredMap[$i][$x] = "Orange"
;~ 				  ConsoleWrite("*Orange* , ")
			   Case "15"
				  $coloredMap[$i][$x] = "Red"
;~ 				  ConsoleWrite("*Red* , ")
			   Case "52","75"
				  $coloredMap[$i][$x] = "Blue"
;~ 				  ConsoleWrite("*Blue* , ")
			   Case Else
				  $coloredMap[$i][$x] = $checker
;~ 				  ConsoleWrite($checker &", ")
			EndSwitch
	  EndSwitch
   Next
;~    ConsoleWrite(@LF )
Next

for $y = 0 To 7
   For $x = 0 To 7 Step 1
	  if $y < 7 Then
		 ConsoleWrite($coloredMap[$y][$x] & " , ")
		 ;Search for and item 1 down and 2 to the right
		 if $x < 6 Then
			ConsoleWrite($coloredMap[$y+1][$x+2]& " , ")
		 EndIf
		 ;Search for and item 1 down and 2 to the left
		 if $x > 2 Then
			ConsoleWrite($coloredMap[$y+1][$x-2]& " , ")
		 EndIf
		 
		 if $y < 6 Then
			;Search for and item 2 down and 1 to the right
			;Search for and item 1 down and 1 to the right
			if $x < 6 Then
			   if $coloredMap[$y][$x] == $coloredMap[$y+2][$x+1]  Then
				  if $coloredMap[$y+1][$x+1]  == $coloredMap[$y][$x] Then
					 ConsoleWrite(@LF )	    
					 ConsoleWrite(" Row Match 3 down right")
					 ConsoleWrite(@LF )	    
				  Else
					 ConsoleWrite($coloredMap[$y+1][$x+1]& " , ")
					 ConsoleWrite($coloredMap[$y+2][$x+1]& " , ")
				  endif
			   EndIf
			EndIf
			;Search for and item 2 down and 1 to the left
			;Search for and item 1 down and 1 to the left
			if $x > 1 Then
			   if $coloredMap[$y][$x] == $coloredMap[$y+2][$x-1]  Then
				  if $coloredMap[$y+1][$x-1]  == $coloredMap[$y][$x] Then
					 ConsoleWrite(@LF )	    
					 ConsoleWrite(" Row Match 3 down left")
					 ConsoleWrite(@LF )	    
				  Else
					 ConsoleWrite($coloredMap[$y+1][$x-1]& " , ")
					 ConsoleWrite($coloredMap[$y+2][$x-1]& " , ")
				  EndIf
			   EndIf
			   
			EndIf
		 Else
			;Search for and item 2 up and 1 to the right
			if $x < 6 Then
			   ConsoleWrite($coloredMap[$y-2][$x+1])
			EndIf
		 EndIf
	  Else	 
		 ConsoleWrite($coloredMap[$y][$x] & " , ")
		 if $x < 5 Then
			ConsoleWrite($coloredMap[$y-1][$x+2]& " , ")
		 EndIf
		 if $x < 6 Then
			ConsoleWrite($coloredMap[$y-2][$x+1])
		 EndIf
	  EndIf
	  ConsoleWrite(@LF )	    
;~ 	  ExitLoop
   Next
   ConsoleWrite(@LF )	    

Next
;~ ConsoleWrite($coloredMap[0][0])
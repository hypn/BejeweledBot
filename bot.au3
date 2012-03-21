#AutoIt3Wrapper_Change2CUI=Y
Local $coord = PixelSearch(0, 0, 1440, 900, 0x37372C)

Func buildColorMap()
   Local $ucm[8][8]
   ;X and Y relate to the x-axis and y-axis
   For $y = 0 To 7 Step 1
	  For $x = 0 To 7 Step 1
	   ;MouseMove($coord[0]  + 18 +( $i* 37), $coord[1] + 26 )
	   $ucm[$y][$x] = PixelGetColor ( $coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
	  Next
   Next
   Return $ucm
EndFunc

Func clickCurrentCell($x,$y)
   MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
EndFunc
Func clickCellAbove($x,$y)
   MouseClick ( "left" ,$coord[0]  + 18 +( ($x)  * 37), $coord[1] + ( ($y) * 37) - 11 )
EndFunc
Func clickCellLeft($x,$y)
   MouseClick ( "left" ,$coord[0]  + 18 +( ($x -1) * 37), $coord[1] + ( ($y +1) * 37) - 11 )
EndFunc
;This checks for a match downwards to the right of the current block
Func checkMatchDownRightEnd($coloredMap,$x,$y)
   if $y < 7 And $x < 6 Then
		 if $coloredMap[$y][$x] == $coloredMap[$y+1][$x+2]  Then
			if $coloredMap[$y+1][$x+1]  == $coloredMap[$y][$x] Then
			   ConsoleWrite(@LF )	    
			   ConsoleWrite(" Row Match 3 down right")
			   MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
			   MouseClick ( "left" ,$coord[0]  + 18 +( $x * 37), $coord[1] + ( ($y +2) * 37) - 11 )
			   Return True
			EndIf
	  EndIf
   EndIf
   Return False
EndFunc

Func checkMatchUpLeftEnd($coloredMap,$x,$y)
   if $y > 2 And $x > 0 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y-2][$x -1] And $coloredMap[$y][$x] == $coloredMap[$y-1][$x-1] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 up left")
			clickCurrentCell($x,$y)
			clickCellLeft($x,$y)
			Return True
	  EndIf
   EndIf
   Return False
EndFunc

Func checkMatchLeftEnd($coloredMap,$x,$y)
   if $x > 2 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y][$x -2] And $coloredMap[$y][$x] == $coloredMap[$y][$x-3] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 up left")
			clickCurrentCell($x,$y)
			clickCellLeft($x,$y)
			Return True
	  EndIf
   EndIf
   Return False
EndFunc

;Check a number of blocks aiming to the left on the left of the current block but
;above as well
Func checkMatchLeftLeftUpEnd($coloredMap,$x,$y)
   if $x >= 2 And $y > 0 Then
;~ 	  ConsoleWrite($coloredMap[$y][$x] & $coloredMap[$y-1][$x -2] & $coloredMap[$y-1][$x -3])
;~ 	  ConsoleWrite(@LF)
	  if $coloredMap[$y][$x] == $coloredMap[$y-1][$x -1] And $coloredMap[$y][$x] == $coloredMap[$y-1][$x-2] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 up left")
			clickCurrentCell($x,$y)
			;Click one to the left
			clickCellAbove($x,$y)
			Return True
	  EndIf
   EndIf
   Return False
EndFunc

Func checkMatchRightEnd($coloredMap,$x,$y)
   if $x < 4 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y][$x+3]  Then
		 if $coloredMap[$y][$x] == $coloredMap[$y][$x+2] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 right right")
			MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
			MouseClick ( "left" ,$coord[0]  + 18 +( ($x + 1)  * 37), $coord[1] + ( ($y +1) * 37) - 11 )
			Return True
;~ 		 Else
;~ 			ConsoleWrite($coloredMap[$y+1][$x+1]& " , ")
;~ 			ConsoleWrite($coloredMap[$y+1][$x+2]& " , ")
		 EndIf
	  EndIf	 
   EndIf
   Return False
EndFunc

Func checkMatchRightMiddle($coloredMap,$x,$y)
   if $y > 0 And $x < 6 And $y < 6 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y-1][$x+1] And $coloredMap[$y][$x] == $coloredMap[$y+1][$x+1] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 right middle")
			;Click the current cell
			MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
			;Click 1 up
			MouseClick ( "left" ,$coord[0]  + 18 +( ($x + 1)  * 37), $coord[1] + ( ($y +1) * 37) - 11 )
			Return True
	  EndIf	 
   EndIf
   Return False
EndFunc

Func checkMatchBottomMiddle($coloredMap,$x,$y)
   if $x < 6 And $x > 0 And $y <= 6 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y+1][$x+1] And $coloredMap[$y][$x] == $coloredMap[$y+1][$x-1] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 right middle")
			;Click the current cell
			MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
			;Click 1 to the right
			MouseClick ( "left" ,$coord[0]  + 18 +( ($x)  * 37), $coord[1] + ( ($y +2) * 37) - 11 )
			Return True
	  EndIf	 
   EndIf
   Return False
EndFunc

Func checkMatchTopMiddle($coloredMap,$x,$y)
   if $x < 6 And $x > 0 And $y > 0 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y-1][$x+1] And $coloredMap[$y][$x] == $coloredMap[$y-1][$x-1] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 right middle")
			;Click the current cell
			clickCurrentCell($x,$y)
			clickCellAbove($x,$y)		
			Return True
	  EndIf	 
   EndIf
   Return False
EndFunc

Func checkMatchUpEnd($coloredMap,$x,$y)
   if $y > 2 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y-3][$x] And $coloredMap[$y][$x] == $coloredMap[$y-2][$x] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 right middle")
			;Click the current cell
			MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
			;Click 1 to the right
			MouseClick ( "left" ,$coord[0]  + 18 +( ($x)  * 37), $coord[1] + ( ($y) * 37) - 11 )
			Return True
	  EndIf	 
   EndIf
   Return False
EndFunc

Func checkMatchDownEnd($coloredMap,$x,$y)
   if $y > 2 Then
	  if $coloredMap[$y][$x] == $coloredMap[$y-3][$x] And $coloredMap[$y][$x] == $coloredMap[$y-2][$x] Then
			ConsoleWrite(@LF )	    
			ConsoleWrite(" Row Match 3 right middle")
			;Click the current cell
			MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
			;Click 1 to the right
			MouseClick ( "left" ,$coord[0]  + 18 +( ($x)  * 37), $coord[1] + ( ($y) * 37) - 11 )
			Return True
	  EndIf	 
   EndIf
   Return False
EndFunc


Func solveSingleMatch($crd)
   Local $coloredMap[8][8]
   for $i = 0 To UBound($crd) - 1
	  For $x = 0 To 7 Step 1
		 Switch $crd[$i][$x]
			Case 16775956,16776960
			   $coloredMap[$i][$x] = "Yellow"
			Case 16206352,16471568 ; we also match 15* as red in most cases
			   $coloredMap[$i][$x] = "Red"
			Case 16777215,16514043
			   $coloredMap[$i][$x] = "Silver"
			Case 12749289,12885488,11902199 ,13021688,12029936,12157930
			   $coloredMap[$i][$x] = "Purple"
			Case 5420321,4303909
			   $coloredMap[$i][$x] = "Green"
			Case 16675594
			   $coloredMap[$i][$x] = "Orange"
			Case 6220025,5565436,8249328,5892858,4911103,6353407,6547447,7921905,6874614,7202036
			   $coloredMap[$i][$x] = "Blue"
			Case Else
			   ;If the color code is not matched above then we do a rough check
			   ;This may be wrong so we mark with a * (note this has yet to match a wrong color)
			   $checker = StringLeft(StringFormat("%i",$crd[$i][$x]),2)
			   Switch $checker
			   Case "16"
					 $coloredMap[$i][$x] = "Orange"
				  Case "15"
					 $coloredMap[$i][$x] = "Red"
				  Case "52","75"
					 $coloredMap[$i][$x] = "Blue"
				  Case Else
					 $coloredMap[$i][$x] = $checker
			   EndSwitch
		 EndSwitch
	  Next
   Next


   for $y = 0 To 7
	  For $x = 0 To 7 Step 1
		 ;Stop the loops if any of the functions return true
		 if checkMatchDownRightEnd($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchRightEnd($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchRightMiddle($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchUpEnd($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchBottomMiddle($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchDownEnd($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchUpLeftEnd($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchTopMiddle($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchLeftEnd($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 if checkMatchLeftLeftUpEnd($coloredMap,$x,$y) Then
			ExitLoop(2)
		 EndIf
		 
		 
		 
		 
		 if $y < 7 Then
;~ 			ConsoleWrite($coloredMap[$y][$x] & " , ")
			;Search for and item 1 down and 2 to the right
			if $x < 6 Then
			   if $y < 5 Then
				  if $coloredMap[$y][$x] == $coloredMap[$y+3][$x]  Then
						if $coloredMap[$y][$x] == $coloredMap[$y+2][$x] Then
						   ConsoleWrite(@LF )	    
						   ConsoleWrite(" Row Match 3 down down")
						   MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
						   MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +2) * 37) - 11 )
						   sleep(5)
						   ExitLoop(2)
						   ConsoleWrite(@LF )	    
						EndIf
				  Else
					 ;We need to check 3 down when moving blocks down	
					 ;ConsoleWrite($coloredMap[$y+1][$x]& " , ")
;~ 					 ConsoleWrite($coloredMap[$y+2][$x]& " , ")
;~ 					 ConsoleWrite($coloredMap[$y+3][$x]& " , ")
				  EndIf	   
			   EndIf
			EndIf
			;Search for and item 1 down and 2 to the left
			if $x > 2 Then
;~ 			   ConsoleWrite($coloredMap[$y+1][$x-2]& " , ")
			EndIf
			
			if $y < 6 Then
			   ;Search for and item 2 down and 1 to the right
			   ;Search for and item 1 down and 1 to the right
			   if $x < 6 Then
				  if $coloredMap[$y][$x] == $coloredMap[$y+2][$x+1]  Then
					 if $coloredMap[$y+1][$x+1]  == $coloredMap[$y][$x] Then
						ConsoleWrite(@LF )	    
						ConsoleWrite(" Row Match 3 down right")
						MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
						MouseClick ( "left" ,$coord[0]  + 18 +( ($x + 1 )* 37), $coord[1] + ( ($y +1) * 37) - 11 )
						
						ExitLoop(2)
						;$crd[$y][$x] = PixelGetColor ( $coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
						ConsoleWrite(@LF )	    
					 Else
;~ 						ConsoleWrite($coloredMap[$y+1][$x+1]& " , ")
;~ 						ConsoleWrite($coloredMap[$y+2][$x+1]& " , ")
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
						MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
						MouseClick ( "left" ,$coord[0]  + 18 +( ($x - 1 )* 37), $coord[1] + ( ($y +1) * 37) - 11 )
						
						ExitLoop(2)
						;$crd[$y][$x] = PixelGetColor ( $coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
						ConsoleWrite(@LF )	    
					 Else
;~ 						ConsoleWrite($coloredMap[$y+1][$x-1]& " , ")
;~ 						ConsoleWrite($coloredMap[$y+2][$x-1]& " , ")
					 EndIf
				  EndIf
				  
			   EndIf
			Else
			   ;Search for and item 2 up and 1 to the right
			   if $x < 6 Then
;~ 				  ConsoleWrite($coloredMap[$y-2][$x+1])
			   EndIf
			EndIf
		 Else	 
;~ 			ConsoleWrite($coloredMap[$y][$x] & " , ")				  
			if $x < 5 Then
			   if $coloredMap[$y][$x] == $coloredMap[$y-1][$x+2] Then
				  if $coloredMap[$y-1][$x+1]  == $coloredMap[$y][$x] Then
					 ConsoleWrite(@LF )	    
					 ConsoleWrite(" Row Match 3 up")
					 MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( ($y +1) * 37) - 11 )
					 MouseClick ( "left" ,$coord[0]  + 18 +( $x* 37), $coord[1] + ( $y * 37) - 11 )
					 ExitLoop(2)
					 ConsoleWrite(@LF )	    
				  Else
;~ 					 ConsoleWrite($coloredMap[$y-1][$x+1]& " , ")
;~ 					 ConsoleWrite($coloredMap[$y-1][$x+2]& " , ")
				  EndIf
			   EndIf
			   
			EndIf
			if $x < 6 Then
;~ 			   ConsoleWrite($coloredMap[$y-2][$x+1])
			EndIf
		 EndIf
;~ 		 ConsoleWrite(@LF )	    
   ;~ 	  ExitLoop
	  Next
;~ 	  ConsoleWrite(@LF )	    

   Next   
EndFunc

Local $count = 0
While $count <= 10
;~    $count += 1
   $uncoloredMap = buildColorMap()
   solveSingleMatch($uncoloredMap)
;~    ConsoleWrite("Sleeping")
;~    Sleep(5000)
WEnd
;~ ConsoleWrite($coloredMap[0][0])
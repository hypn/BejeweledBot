Func _GetTotalScreenResolution()
	Local $aRet[2]
	Global Const $SM_VIRTUALWIDTH = 78
	Global Const $SM_VIRTUALHEIGHT = 79
	$VirtualDesktopWidth = DllCall("user32.dll", "int", "GetSystemMetrics", "int", $SM_VIRTUALWIDTH)
	$aRet[0] = $VirtualDesktopWidth[0]
	$VirtualDesktopHeight = DllCall("user32.dll", "int", "GetSystemMetrics", "int", $SM_VIRTUALHEIGHT)
	$aRet[1] = $VirtualDesktopHeight[0]
	Return $aRet
 EndFunc
 
$screenRes = _GetTotalScreenResolution()
Local $coord = PixelSearch(0, 0, $screenRes[0], $screenRes[1], 0x313129)
PixelGetColor ( $coord[0] , $coord[1] )
If Not @error Then
    MsgBox(0, "X and Y are:", $coord[0] & "," & $coord[1])
EndIf
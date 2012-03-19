;Memory Functions from http://www.edgeofnowhere.cc/viewtopic.php?t=346148

Func _MemRead($i_hProcess, $i_lpBaseAddress, $i_nSize, $v_lpNumberOfBytesRead = '')
	Local $v_Struct = DllStructCreate ('byte[' & $i_nSize & ']')
	DllCall('kernel32.dll', 'int', 'ReadProcessMemory', 'int', $i_hProcess, 'int', $i_lpBaseAddress, 'int', DllStructGetPtr ($v_Struct, 1), 'int', $i_nSize, 'int', $v_lpNumberOfBytesRead)
	Local $v_Return = DllStructGetData ($v_Struct, 1)
	$v_Struct=0
	Return $v_Return
EndFunc ;==> _MemRead()

Func _MemWrite($i_hProcess, $i_lpBaseAddress, $v_Inject, $i_nSize, $v_lpNumberOfBytesRead = '')
	Local $v_Struct = DllStructCreate ('byte[' & $i_nSize & ']')
	DllStructSetData ($v_Struct, 1, $v_Inject)
	$i_Call = DllCall('kernel32.dll', 'int', 'WriteProcessMemory', 'int', $i_hProcess, 'int', $i_lpBaseAddress, 'int', DllStructGetPtr ($v_Struct, 1), 'int', $i_nSize, 'int', $v_lpNumberOfBytesRead)
	$v_Struct=0
	Return $i_Call[0]
EndFunc ;==> _MemWrite()

Func _MemOpen($i_dwDesiredAccess, $i_bInheritHandle, $i_dwProcessId)
	$ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', $i_dwDesiredAccess, 'int', $i_bInheritHandle, 'int', $i_dwProcessId)
	If @error Then
		SetError(1)
		Return 0
	EndIf
	Return $ai_Handle[0]
EndFunc ;==> _MemOpen()

Func _MemClose($i_hProcess)
	$av_CloseHandle = DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $i_hProcess)
	Return $av_CloseHandle[0]
EndFunc ;==> _MemClose() 

Func ReadString($OpenProcess, $Address)
	$i = 0
	$end = false
	$string = ''
	Do
		$v_Read = _MemRead($OpenProcess, $Address, 1)
		$char = chr($v_Read)
		$i = $i + 1
		$Address = $Address + 1	
		If hex($v_Read, 8) == "00" Then
			$end = true
		Else
			$string = $string & $char
		EndIf
	until $end
	Return $string
EndFunc

Func ReadByte($OpenProcess, $Address)
	$v_Read = _MemRead($OpenProcess, $Address, 1)
	Return $v_Read
EndFunc





; EXAMPLE OF USE
$Process = 'DIABLO.EXE' ; application executable
$line1_addr = 0x0069F195 ; memory address to read
$PID = ProcessExists($Process) ; get App's process id
$OpenProcess = _MemOpen(0x38, False, $PID) ; open app's process
$line1 = ReadString($OpenProcess, $line1_addr) ; get a line of text from the memory address
MsgBox(0, 'Wirt has for sale:', $line1) ; display it

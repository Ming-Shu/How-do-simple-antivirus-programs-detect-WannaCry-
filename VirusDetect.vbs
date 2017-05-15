Dim fso,n,Index 
Dim Filelist(2)
Filelist(0) = " C:\bait.txt "
Filelist(1) = " C:\bait.jpg "

MsgBox "Detect Start!!",vbOKOnly,"virus detector"

Set fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("Wscript.Shell")

do
	If fso.FileExists("C:\canceldetect.log") Then
		MsgBox "Close detector!!",vbOKOnly,"virus detector"
		Exit Do
      
	Else
		For Index = 0 To Ubound(Filelist) - 1
			If Not fso.FileExists(Filelist(0)) Then
				n = ws.popup("Bad news: Your computer has been hit by a virus.Do you want to shutdown your system right now?",5,"VIRUS WARNING!",vbYesNo+vbExclamation)
			End If
		Next
	End If
	If n = vbNo Then
		MsgBox "Please check your file and we strongly advise to perform shutdown",vbOKOnly+vbExclamation,"Virus Warning!!"
	Else
		ws.run "shutdown.exe -s -f -t 0"
	End If

	wscript.sleep 10000 
loop



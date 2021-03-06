' Convert Simplified Chinese to Traditional
' Using Microsoft Word 'TCSCConverter' to convert SC to TC
' Reference:
'           http://demon.tw/my-work/vbs-tcscconverter-class.html
'           http://discuz.bestdaylong.com/thread-38045-1-1.html
' allenk (kwyshell@gmail.com, allenkuo, kwyshell)

Option Explicit

'On Error Resume Next

Class TCSCConverter
    Private Word, Doc, Content

    Private Sub Class_Initialize()
        Set Word = CreateObject("Word.Application")
    End Sub

    Private Sub Class_Terminate()
        Word.Quit
        Set Word = Nothing
    End Sub

    ' Traditional Chinese To Simplified Chinese
    Public Function TC2SC(str)
        Set Doc = Word.Documents.Add
        Word.Selection.TypeText str
        Doc.Range.TCSCConverter 1, True
        TC2SC = Replace(Doc.Range.Text, vbCr, vbCrLf)
        TC2SC = Left(TC2SC, Len(TC2SC) - 2)
        Doc.Saved = True
        Doc.Close
        Set Doc = Nothing
    End Function

    ' Vesion 2, Allen K, improve the string length limitation of selection
    Public Function TC2SC2(str)
        Set Doc = Word.Documents.Add
        Set Content = Doc.Content
        Content.Text = str
        Content.TCSCConverter 0, True, True
        TC2SC2 = Replace(Content.Text, vbCr, vbCrLf)
        TC2SC2 = Left(TC2SC2, Len(TC2SC2) - 2)
        Doc.Saved = True
        Doc.Close
        Set Doc = Nothing
    End Function

    ' Simplified Chinese To Traditional Chinese
    Public Function SC2TC(str)
        Set Doc = Word.Documents.Add
        Word.Selection.TypeText str
        Doc.Range.TCSCConverter 0, True, True
        SC2TC = Replace(Doc.Range.Text, vbCr, vbCrLf)
        SC2TC = Left(SC2TC, Len(SC2TC) - 2)
        Doc.Saved = True
        Doc.Close
        Set Doc = Nothing
    End Function

    ' Vesion 2, Allen K, improve the string length limitation of selection
    Public Function SC2TC2(str)
        Set Doc = Word.Documents.Add
        Set Content = Doc.Content
        Content.Text = str
        Content.TCSCConverter 0, True, True
        SC2TC2 = Replace(Content.Text, vbCr, vbCrLf)
        SC2TC2 = Left(SC2TC2, Len(SC2TC2) - 2)
        Doc.Saved = True
        Doc.Close
        Set Doc = Nothing
    End Function

End Class

Dim fso, adoRead, adoWrite, objFile, strInputFile, strOutputFile, oldContent, newContent

If Wscript.Arguments.Count < 2 Then
   wscript.echo "Should provide input and output file"
   wscript.Quit
End If

strInputFile    = WScript.Arguments.Item(0)
strOutputFile   = WScript.Arguments.Item(1)

' Does file exist?
Set fso = CreateObject("Scripting.FileSystemObject")
If Err.Number <> 0 Then
   wscript.echo "Fail to instance FSO!"
   wscript.Quit
End If

If fso.FileExists(strInputFile) = False Then
   wscript.echo "File not found!"
   wscript.Quit
End If

' Read file in Text mode (1 for binary)
Set adoRead = CreateObject("ADODB.Stream")
adoRead.Type = 2
adoRead.Charset = "UTF-8"
adoRead.Open
adoRead.LoadFromFile strInputFile
oldContent = adoRead.ReadText
adoRead.Close
Set adoRead = Nothing
If Err.Number <> 0 Then
   wscript.echo "Fail to read file: " & strInputFile
   wscript.Quit
End If

' Convert Strings
Dim objTCSC

Set objTCSC = New TCSCConverter
If Err.Number <> 0 Then
   wscript.echo "Instance TSCC Error! " & Err.Description & "(" & Err.number & ")"
   wscript.Quit
End If

newContent = objTCSC.SC2TC2(oldContent)

' Write file in Text mode (1 for binary)
Set adoWrite = CreateObject("ADODB.Stream")
adoWrite.Type = 2
adoWrite.Charset = "UTF-8"
adoWrite.Open
adoWrite.WriteText newContent
adoWrite.SaveToFile strOutputFile, 2 ' Overwrite
adoWrite.Close
If Err.Number <> 0 Then
   wscript.echo "Fail to write file: " & strOutputFile
   wscript.Quit
End If


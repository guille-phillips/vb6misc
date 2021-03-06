VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Relationship"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public FromPos As Position
Public ToPos As Position

Public CanvasRef As Canvas
Public PositionListRef As Collection

Public Sub RenderRelationship()
    DrawRelationship
End Sub

Public Sub ClearRelationship()
    DrawRelationship CanvasRef.BackColour
End Sub

Public Function WriteDef() As String
    WriteDef = FromPos.Reference & "|" & ToPos.Reference
End Function

Private Sub DrawRelationship(Optional lForeColour As Long = vbBlack)
    Dim sMidPointX As Single
    Dim sMidPointY As Single
    
    Dim sUnitXAxisX As Single
    Dim sUnitXAxisY As Single
    Dim sUnitYAxisX As Single
    Dim sUnitYAxisY As Single
    
    Dim sLength As Single
    Const sSize As Single = 10
    Dim dAngle As Double
    
    Dim sEndPoint1X As Single
    Dim sEndPoint1Y As Single
    Dim sEndPoint2X As Single
    Dim sEndPoint2Y As Single
    
    dAngle = 160 * (Atn(1) * 8) / 360
    
    CanvasRef.ForeColor = lForeColour
    CanvasRef.Line (Canvas.sTopLeftX + FromPos.PosX, Canvas.sTopLeftY + FromPos.PosY)-(Canvas.sTopLeftX + ToPos.PosX, Canvas.sTopLeftY + ToPos.PosY)

    sLength = Sqr((ToPos.PosX - FromPos.PosX) ^ 2 + (ToPos.PosY - FromPos.PosY) ^ 2)
    If sLength <> 0 Then
        sMidPointX = (FromPos.PosX + ToPos.PosX) / 2 + Canvas.sTopLeftX
        sMidPointY = (FromPos.PosY + ToPos.PosY) / 2 + Canvas.sTopLeftY
        
        sUnitXAxisX = (ToPos.PosX - FromPos.PosX) / sLength
        sUnitXAxisY = (ToPos.PosY - FromPos.PosY) / sLength
        sUnitYAxisX = -sUnitXAxisY
        sUnitYAxisY = sUnitXAxisX
        
        sEndPoint1X = sSize * (Cos(dAngle) * sUnitXAxisX + Sin(dAngle) * sUnitYAxisX)
        sEndPoint1Y = sSize * (Cos(dAngle) * sUnitXAxisY + Sin(dAngle) * sUnitYAxisY)
        sEndPoint2X = sSize * (Cos(-dAngle) * sUnitXAxisX + Sin(-dAngle) * sUnitYAxisX)
        sEndPoint2Y = sSize * (Cos(-dAngle) * sUnitXAxisY + Sin(-dAngle) * sUnitYAxisY)
        
        CanvasRef.Line (sMidPointX, sMidPointY)-Step(sEndPoint1X, sEndPoint1Y)
        CanvasRef.Line (sMidPointX, sMidPointY)-Step(sEndPoint2X, sEndPoint2Y)
        
        CanvasRef.Line (sMidPointX + sEndPoint1X, sMidPointY + sEndPoint1Y)-(sMidPointX + sEndPoint2X, sMidPointY + sEndPoint2Y)
    End If
    
End Sub

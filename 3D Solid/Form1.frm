VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   Caption         =   "Form1"
   ClientHeight    =   11145
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12630
   LinkTopic       =   "Form1"
   ScaleHeight     =   11145
   ScaleWidth      =   12630
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Dim oSolid As New Solid
    
    Set oSolid.Paper = Me
    oSolid.Construct 6
    oSolid.Render
End Sub
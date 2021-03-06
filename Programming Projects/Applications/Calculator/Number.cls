VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Number"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Implements IAlgebraic

Public Operand As Long
Public ImaginaryOperand As Long

Private ntNumberType As NumberTypes
Public Property Set OperandA(oOperand As IAlgebraic)
    Set oOperandA = oOperand
End Property

Public Property Get OperandA(oOperand As IAlgebraic)
    Set OperandA = oOperandA
End Property

Public Property Set OperandB(oOperand As IAlgebraic)
    Set oOperandB = oOperand
End Property

Public Property Get OperandB(oOperand As IAlgebraic)
    Set OperandAB = oOperandB
End Property

Private Property Let IAlgebraic_NumberType(RHS As NumberTypes)
    ntNumberType = RHS
End Property

Private Property Get IAlgebraic_NumberType() As NumberTypes
    IAlgebraic_NumberType = ntNumberType
End Property

Private Function IAlgebraic_RealValue() As Double
    IAlgebraic_RealValue = Operand
End Function

Private Function IAlgebraic_ImaginaryValue() As Double
    IAlgebraic_ImaginaryValue = ImaginaryOperand
End Function

Private Sub IAlgebraic_Simplify()
'
End Sub

Private Sub Class_Initialize()
    ntNumberType = NumberTypes.Number
End Sub


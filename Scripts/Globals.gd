extends Node

var KappaResource:Resource
var Titulo:String
var ModelPath:String
var ObjectPath:String
var scaleObject := Vector3(1,1,1)
var rotateObject := Vector3(0,0,0)
var scaleMultiplier := Vector3(1,1,1)
var ModelScale := Vector3(1,1,1)
var TextoPath:String
enum estados{
	NORMAL,
	GRABBING,
	INFO
}
var estadoPlayer = estados.NORMAL
var posicionPlayer

var TempKappaResourse:Resource
var positionCharacter:= Vector3(0,0,0)
var positionCamera:= Vector3(0,3.1, -3.9)
var positionObjects:= [{
	"id":"0",
	"newPosition":Vector3(0,0,0),
	"lastPosition":Vector3(0,0,0),
	"scale":Vector3(1,1,1)
}]



#TODO: Hacer que si rote cuando regrese a la escena
var rotationCharacter:= Vector3(0,0,0)


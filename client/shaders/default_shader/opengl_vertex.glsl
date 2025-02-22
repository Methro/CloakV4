varying lowp vec4 varColor;

void main(void)
{
	gl_Position = mWorldViewProj * inVertexPosition;
<<<<<<< HEAD
#ifdef GL_ES
	varColor = inVertexColor.bgra;
#else
	varColor = inVertexColor;
#endif
=======
	varColor = inVertexColor;
>>>>>>> 5.10.0
}

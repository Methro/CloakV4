<<<<<<< HEAD
uniform lowp vec4 emissiveColor;
=======
uniform lowp vec4 materialColor;
>>>>>>> 5.10.0

varying lowp vec4 varColor;

varying highp vec3 eyeVec;

void main(void)
{
	gl_Position = mWorldViewProj * inVertexPosition;

<<<<<<< HEAD
#ifdef GL_ES
	vec4 color = inVertexColor.bgra;
#else
	vec4 color = inVertexColor;
#endif

	color *= emissiveColor;
=======
	vec4 color = inVertexColor;

	color *= materialColor;
>>>>>>> 5.10.0
	varColor = color;

	eyeVec = -(mWorldView * inVertexPosition).xyz;
}

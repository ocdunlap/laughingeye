// 2D liquid inside 'sphere' shader.

// Original Author: Mirza Beig
// Godot Implementation: RuverQ

// https://twitter.com/TheMirzaBeig
// https://www.youtube.com/@MirzaBeig

// https://twitter.com/RuverQuack

// Feel free troveto use this however you want.
// Modify, learn from it, copy-paste, etc...

// Original Shadertoy: https://www.shadertoy.com/view/Ds3BRN

shader_type canvas_item;

// fV = fill value
uniform float fV;
uniform vec4 tint_color:source_color = vec4(0.0, 0.5,0.99, 1);

void fragment() {
	// this is what is causing it to be in the corner but idk 
    vec2 uv = ((UV / -0.10)) + vec2(1.25,1.25);

    float
		// size of inner fill space
		sdf=length(uv),c=step(sdf,.9),
		
        vB=smoothstep(.1,.9,sin(uv.x+(PI*.4))-.4),
		// last number is the size of the spash ish
		vBA=vB*sin(TIME*1.)*.001,
        
        fW=(sin(((TIME*2.)+uv.x)*2.)*.05)+vBA,
		bW=(sin(((TIME*-2.)+uv.x)*2.+PI)*.05)-vBA,
		
        fA=(sin(TIME*4.)*.05)*vB,
        
		// offset of total "filledness"
        fP=fV * 2.2 +(sin((TIME)*PI)*.1) - 1.1,
		
        fF=step(uv.y,(fA+fW)+fP)*c,
		bF=step(uv.y,(-fA+bW)+fP)*c;

    COLOR =
		vec4((step(sdf,1)-step(sdf,.9))+
		(fF+(clamp(bF-fF,0.,1.)*.8))+
		clamp(pow((sdf+.01)*
		((1.-(fF+bF))*c),5.),0.,1.)) * tint_color;
		
}


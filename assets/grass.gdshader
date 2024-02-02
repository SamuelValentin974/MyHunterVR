shader_type spatial;
render_mode cull_disabled;

uniform vec3 color : source_color;
uniform vec3 color2 : source_color;
uniform sampler2D noise;
uniform float noiseScale = 20.0;

varying vec3 worldPos;
uniform float wind_ambient_strength = 0.01;
uniform float u_camera_bend_strength = 0.1;

void vertex() {
	// Called for every vertex the material is visible on.
	worldPos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	vec3 obj_world_pos = (MODEL_MATRIX * vec4(0.0,0.0,0.0,1.0)).xyz;
	float disp_strength = VERTEX.y;
	
	float disp = (0.075 * sin(2.650 * worldPos.x + worldPos.y + worldPos.z + TIME));
	worldPos.x += wind_ambient_strength * disp_strength *((2.0 * sin(1.0 * (obj_world_pos.x + obj_world_pos.y + obj_world_pos.z + TIME))) + 1.0 + disp);
	//worldPos.y += disp + disp_strength;
	worldPos.z += wind_ambient_strength * disp_strength * ((1.0 * sin(2.0 * (obj_world_pos.x + obj_world_pos.y + obj_world_pos.z + TIME))) + 0.5 + disp);
	
	
	VERTEX = (inverse(MODEL_MATRIX) * vec4(worldPos, 1.0)).rgb;
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 noiseLevel = texture(noise, worldPos.xz / noiseScale).rgb;
	ALBEDO = mix(color, color2, UV.y) * mix(color, color2, noiseLevel.r);
	if (!FRONT_FACING) {
		NORMAL = -NORMAL;
	}
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}

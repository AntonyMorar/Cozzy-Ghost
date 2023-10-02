shader_type spatial;
render_mode depth_draw_opaque, world_vertex_coords;

uniform vec4 outline_color : source_color;
uniform float outline_width = 1.0;

uniform vec4 albedo : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform sampler2D texture_albedo : source_color,filter_linear_mipmap,repeat_enable;
uniform float normal_offset : hint_range(0, 1, 0.001) = 0.02;
uniform float time_influence : hint_range(0, 50) = 3;
uniform float y_div : hint_range(0, 30, .1) = 2.87;

void vertex() {
	
//	vec4 clip_position = PROJECTION_MATRIX * (MODELVIEW_MATRIX * vec4(VERTEX, 1.0));
//	vec3 clip_normal = mat3(PROJECTION_MATRIX) * (mat3(MODELVIEW_MATRIX) * NORMAL);
//
//
//	vec2 offset = normalize(clip_normal.xy) / VIEWPORT_SIZE * clip_position.w * outline_width * 2.0;
//
//	clip_position.xy += offset;
	
//	POSITION = clip_position;
	
	VERTEX.x += cos(VERTEX.y * y_div + round(TIME * time_influence)) * normal_offset;
    VERTEX.y += sin(VERTEX.x * y_div + round(TIME * time_influence)) * normal_offset;
    VERTEX.z += cos(VERTEX.y * y_div + round(TIME * time_influence)) * normal_offset;
}

void fragment() {
	vec2 base_uv = UV;
	
	vec4 albedo_tex = texture(texture_albedo, base_uv);
	albedo_tex *= COLOR;
	ALBEDO = albedo.rgb * albedo_tex.rgb;
//	ALBEDO = outline_color.rgb;
//	if (outline_color.a < 1.0) {
//		ALPHA = outline_color.a;
//	}
}



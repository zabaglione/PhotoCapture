Shader "MyCustomShader/ColorFader"
{
	Properties
	{
		_Color0("Color 0", COLOR) = (1.0, 1.0, 1.0, 1.0)
		_Color1("Color 1", COLOR) = (0.0, 0.0, 0.0, 1.0)
		_ColorMorphValue("Color Morph Value", FLOAT) = 0.0
	}
		SubShader
	{
		Tags{ "RenderType" = "Opaque" }

		Pass
	{
		CGPROGRAM
#pragma vertex vert
#pragma fragment frag

#include "UnityCG.cginc"

		struct appdata
	{
		float4 vertex : POSITION;
		float2 uv : TEXCOORD0;
	};

	struct v2f
	{
		float4 vertex : SV_POSITION;
		float3 color : COLOR;
	};

	float3 _Color0;
	float3 _Color1;
	float _ColorMorphValue;

	v2f vert(appdata v)
	{
		v2f o;
		o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
		o.color = (1.0 - _ColorMorphValue) * _Color0 + (_ColorMorphValue * _Color1);
		return o;
	}

	float4 frag(v2f i) : SV_Target
	{
		return float4(i.color, 1.0);
	}
		ENDCG
	}
	}
}
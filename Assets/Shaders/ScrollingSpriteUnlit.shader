Shader "Custom/ScrollingSpriteUnlit_URP6"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        _ScrollSpeedY ("Vertical Scroll Speed", Float) = 0.2
    }

    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }
        LOD 100

        Blend One OneMinusSrcAlpha
        Cull Off
        ZWrite Off

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
                float4 color : COLOR;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                float4 color : COLOR;
            };

            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);

            float4 _Color;
            float _ScrollSpeedY;

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS);
                OUT.uv = IN.uv;          // DO NOT scroll here (fixes tearing)
                OUT.color = IN.color * _Color;
                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                // Seamless scroll applied per-fragment
                float scrollY = frac(_ScrollSpeedY * _Time.y);
                float2 uv = IN.uv + float2(0, scrollY);

                half4 texColor = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, uv);
                return texColor * IN.color;
            }
            ENDHLSL
        }
    }
}

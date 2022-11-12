Shader "MaskedObject"
{

    Properties
    {
        _Mask("Mask", Int) = 1
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _Glossiness("Smoothness", Range(0,1)) = 0.5
        _Metallic("Metallic", Range(0,1)) = 0.0
        _Snow("Snow", Range(0,2)) = 0.0
    }

        SubShader
        {

        Tags
        {
            "RenderType" = "Opaque"
        }

        Stencil
        {
            Ref[_Mask]
            Comp Equal
        }

        CGPROGRAM

        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 worldNormal;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        half _Snow;

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            float d = dot(IN.worldNormal, fixed3(0, 1, 0));
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            fixed4 white = fixed4(1, 1, 1, 1);
            c = lerp(c, white, d * _Snow);

            o.Albedo = c.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;
        }

        ENDCG

        }

}
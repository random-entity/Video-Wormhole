Shader "Unlit/Wormhole"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _ForceCenter ("Force Center", Vector) = (0, 0, 0, 1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            Cull Off

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
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _ForceCenter;

            v2f vert (appdata v)
            {
                v2f o;
                float4 worldPos = mul(unity_ObjectToWorld, v.vertex);
                float3 dir = worldPos.xyz - _ForceCenter.xyz;
                float sqrDist = dot(dir, dir);
                if(sqrDist < 256) {
                    worldPos.z += 96 / sqrDist;
                    o.vertex = UnityWorldToClipPos(worldPos);
                } else {
                    o.vertex = UnityObjectToClipPos(v.vertex);
                }
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}

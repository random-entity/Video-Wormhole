using UnityEngine;

[ExecuteInEditMode]
public class ForceCenter : MonoBehaviour
{
    [SerializeField] private Material wormholeMaterial;
    void Update()
    {
        wormholeMaterial.SetVector("_ForceCenter", transform.position);
    }
}
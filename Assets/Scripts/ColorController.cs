using UnityEngine;
using System.Collections;

[RequireComponent(typeof(MeshRenderer))]

[ExecuteInEditMode]
public class ColorController : MonoBehaviour
{
    public Color Color0 = Color.red;
    public Color Color1 = Color.blue;
    [Range(0.0f, 1.0f)]
    public float ColorMorphValue = 0.0f;

    private Material myMaterial = null;

    void Start()
    {
        Renderer gameObjectRenderer = this.transform.GetComponent<Renderer>();
        myMaterial = new Material(Shader.Find("MyCustomShader/ColorFader"));
        gameObjectRenderer.sharedMaterial = myMaterial;
    }

    void Update()
    {
        if (myMaterial == null)
        {
            return;
        }

        // Send custom parameters from the CPU to the GPU shader.
        myMaterial.SetColor("_Color0", Color0);
        myMaterial.SetColor("_Color1", Color1);
        myMaterial.SetFloat("_ColorMorphValue", ColorMorphValue);
    }
}
using UnityEngine;

public class Webcam : MonoBehaviour
{
    private WebCamTexture webCamTexture;
    private WebCamDevice[] devices;
    [SerializeField] private int deviceIndex;
    [SerializeField] private Material screenMaterial;

    private void Start()
    {
        devices = WebCamTexture.devices;

        for(int i = 0; i < devices.Length; i++) {
            Debug.Log(i + " : " + devices[i].name);
        }

        webCamTexture = new WebCamTexture();
        webCamTexture.deviceName = devices[deviceIndex].name;
        webCamTexture.Play();

        screenMaterial.SetTexture("_MainTex", webCamTexture);
    }

    // void OnGUI()
    // {
    //     if (GUI.Button(new Rect(0, 0, 100, 100), "switch"))
    //     {
    //         webCamTexture.Stop();
    //         webCamTexture.deviceName = (webCamTexture.deviceName == devices[0].name) ? devices[1].name : devices[0].name;
    //         webCamTexture.Play();
    //     }
    // }
    void Update()
    {

    }
}
using UnityEngine;
using UnityEngine.Video;

[ExecuteInEditMode]
public class VideoControl : MonoBehaviour
{
    [SerializeField] private VideoPlayer videoPlayer;

    public void Play()
    {
        videoPlayer.Play();
    }
}
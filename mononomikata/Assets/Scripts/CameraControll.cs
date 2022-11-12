using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControll : MonoBehaviour
{
    private Camera camera;

    // Start is called before the first frame update
    void Start()
    {
        camera = GetComponent<Camera>();
    }

    // Update is called once per frame
    void Update()
    {
        float sensitiveRotate = 5.0f;
        
        if(Input.GetKey("w"))
        {
            transform.position += transform.forward * 0.03f;
        }

        if(Input.GetKey("d"))
        {
            transform.position += transform.right * 0.03f;
        }

        if (Input.GetKey("a"))
        {
            transform.position -= transform.right * 0.03f;
        }

        if (Input.GetKey("s"))
        {
            transform.position -= transform.forward * 0.03f;
        }

        if(Input.GetMouseButton(0))
        {
            float rotateX = Input.GetAxis("Mouse X") * sensitiveRotate;
            float rotateY = Input.GetAxis("Mouse Y") * sensitiveRotate;
            camera.transform.Rotate(-rotateY, rotateX, 0.0f);
        }

    }
}

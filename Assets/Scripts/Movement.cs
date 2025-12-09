using UnityEngine;

public class Movement : MonoBehaviour
{
    public float speed = 5f; // Movement speed

    void Update()
    {
        // Get input values
        float horizontal = Input.GetAxis("Horizontal"); // A/D or Left/Right → moves on X
        float vertical = Input.GetAxis("Vertical");     // W/S or Up/Down → moves on Y

        // Movement direction (lock Z)
        Vector3 direction = new Vector3(horizontal, vertical, 0f);

        // Apply movement
        transform.Translate(direction * speed * Time.deltaTime, Space.World);

        // Extra safety: lock Z so nothing can move it accidentally
        Vector3 pos = transform.position;
        pos.z = 0f;
        transform.position = pos;
    }
}

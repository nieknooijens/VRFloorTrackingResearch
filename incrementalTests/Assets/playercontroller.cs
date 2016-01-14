using UnityEngine;
using System.Collections;

public class playercontroller : MonoBehaviour {
	public GameObject text3d;
	float stepsize = 10.0f;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown ("joystick 1 button 3")) {
			Vector3 movement = new Vector3 (0.0f, 0.0f, stepsize);
			transform.position = transform.position + movement;
		} else if (Input.GetKeyDown ("joystick 1 button 0")) {
			Vector3 movement2 = new Vector3 (0.0f, 0.0f, - stepsize);
			transform.position = transform.position + movement2;
		} else if (Input.GetKeyDown ("joystick 1 button 1")) {
			stepsize += 0.1f;
			text3d.GetComponent<TextMesh> ().text = stepsize.ToString ();
		} else if (Input.GetKeyDown ("joystick 1 button 2")) {
			stepsize -= 0.1f;
			text3d.GetComponent<TextMesh> ().text = stepsize.ToString ();
		}
	}
}

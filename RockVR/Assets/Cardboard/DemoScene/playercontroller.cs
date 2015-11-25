using UnityEngine;
using System.Collections;

public class playercontroller : MonoBehaviour {

	private Vector3 offset;
	private int gridposX = 0;
	private int gridposY = 0;

	void FixedUpdate() {
		float moveHorizontal = Input.GetAxis ("Horizontal");
		float moveVertical = Input.GetAxis ("Vertical");
		if (moveHorizontal > 0 && gridposX < 3) { // move right
			offset = new Vector3(7.5f,0.0f,0.0f);
			gridposX++;
		} else if (moveHorizontal < 0 && gridposX > 0) { //move left
			offset = new Vector3(-7.5f,0.0f,0.0f);
			gridposX--;
		}

		if (moveVertical > 0 && gridposY < 3) { // move Up
			offset = new Vector3(0.0f,7.5f,0.0f);
			gridposY++;
		} else if (moveVertical < 0 && gridposY > 0) { //move Down
			offset = new Vector3(0.0f,-7.5f,0.0f);
			gridposY--;
		}
		transform.position = transform.position + offset;
	}
}

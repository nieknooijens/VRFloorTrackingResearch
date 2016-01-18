using UnityEngine;
using System.Collections;

public class playercontroller : MonoBehaviour {
	
	public string url; //FIXME hardcoded URL
	public string coordinates = "{0,0}";
	private string previouscoordinates = "{0,0}";
	public WWW mycoord;
	private bool previouslyDone = true;

	void FixedUpdate() {
		if (previouslyDone) {
			previouslyDone = false;
			Debug.Log("sending HTTP request! to:");
			Debug.Log(url);
			mycoord = new WWW(url);
		} else if (mycoord.isDone) {
			Debug.Log("Got response!"); 
			if(mycoord.text.Length > 4) {
				coordinates = mycoord.text;
			}
			Debug.Log(coordinates);
			previouslyDone = true;
		}
		if (previouscoordinates != coordinates) {
			string x = "";
			string y = "";
			int index = 1;
			char nextchar = '0';
			while (nextchar != ',') {
				x += coordinates [index];
				index++;
				nextchar = coordinates [index];
			}
			index++;
			while (nextchar != '}') {
				y += coordinates [index];
				index++;
				nextchar = coordinates [index];
			}
			float newX = 0 + (float.Parse (x) * 2);
			float newZ = 0 - (float.Parse (y) * 2);
			transform.position = new Vector3 (newX, 1.5f, newZ);
			previouscoordinates = coordinates;
		} else {
			float moveHorizontal = Input.GetAxis ("Horizontal");
			float moveVertical = Input.GetAxis ("Vertical");
			Vector3 movement = new Vector3 (moveHorizontal / 10, 0.0f, moveVertical / 10);
			transform.position = transform.position + movement;
		}
		
	}
}

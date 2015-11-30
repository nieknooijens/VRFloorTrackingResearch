using UnityEngine;
using System.Collections;

public class playercontroller : MonoBehaviour {
	
	public string url = "192.168.1.154:1111"; //FIXME hardcoded URL
	public string coordinates = "{0,0}";
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
		int x = System.Convert.ToInt32 (coordinates [1]);
		int y = System.Convert.ToInt32 (coordinates [3]);
		float newX = 0 + (x * 2);
		newX -= 96; //for some reason unity jumps my cardboard main to 96,-96
		float newY = 0 - (y * 2);
		newZ += 96;
		transform.position = new Vector3(newX, 1.5f,newZ);
		
	}
}

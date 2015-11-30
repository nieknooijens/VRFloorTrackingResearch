using UnityEngine;
using System.Collections;
using System;
using System.Net;
using System.IO;

public class playercontroller : MonoBehaviour {
	
	public string url = "http://192.168.1.184:1111"; //FIXME hardcoded URL
	public string coordinates = "{0,0}";
	public WebRequest mycoord;
	private bool previouslyDone = true;
	string sLine = "{0,0}";

	void FixedUpdate() {
			Debug.Log("sending HTTP request! to:");
			Debug.Log(url);
			mycoord = WebRequest.Create(url);
			Stream objStream;
			objStream = mycoord.GetResponse().GetResponseStream();
		StreamReader objReader = new StreamReader(objStream);

			sLine = objReader.ReadLine ();
			Debug.Log("Got response!");
			if(sLine.Length > 4) {
				coordinates = sLine;
			}

		Debug.Log(coordinates);

		int x = System.Convert.ToInt32 (coordinates [1]);
		int y = System.Convert.ToInt32 (coordinates [3]);
		float newX = 0 + (x * 2);
		newX -= 96; //for some reason unity jumps my cardboard main to 96,-96
		float newZ = 0 - (y * 2);
		newZ += 96;
		transform.position = new Vector3(newX, 1.5f,newZ);
		
	}
}

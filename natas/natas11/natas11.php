<?php

// If you xor-encrypt twice, you decrypt theoretically
// because A xor A = 0
// and A xor 0 = A
//
// T xor K xor K = T xor 0 = T
//
// %3d is an equals sign, which is just padding

// showpassword XOR key XOR showpassword XOR key = 0
// will xor the differences. 

ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSRwh6QUcIaAw= // when the color is 000000
ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw= // when the color is ffffff

ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhS/Rwh6QUcI/aAw= // when the color is 000000
ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhS/EV4sFxFe/aAw= // when the color is ffffff

// Goal is to get the data in the cookie to be have showpassword yes
// The key for the xor may not be the same for the password lol
$defaultdata = array( "showpassword"=>"no", "bgcolor"=>"#ffffff");

$data = loadData($defaultdata);

if(array_key_exists("bgcolor",$_REQUEST)) {

	// Sees if the bgcolor from the input box is hex
	// ?: means a non capturing group. doesnt store it or something
	// a-f\d , letters from a to f, and digits
    if (preg_match('/^#(?:[a-f\d]{6})$/i', $_REQUEST['bgcolor'])) {
        $data['bgcolor'] = $_REQUEST['bgcolor'];
    }
}

saveData($data);

function loadData($def) {
    global $_COOKIE;
	$mydata = $def; // mydata = $defaultdata


	// If any of these conditions fail, then defaultdata will be unchanged
	if(array_key_exists("data", $_COOKIE)) {

		// The true makes it an associative array
		$tempdata = json_decode(xor_encrypt(base64_decode($_COOKIE["data"])), true); 
		
		// This happens to the "data" cookie:
		// 1) Decodes it from base64, presumably to something that looks like json
		// 2) applies xor_encrypt to it
		// 3) Turns the json string into an associative array

		
		// If tempdata successfully translated into an array
		// If there is a a showpassword key
		// if there is bgcolor key
		if(is_array($tempdata) && array_key_exists("showpassword", $tempdata) && array_key_exists("bgcolor", $tempdata)) {
			
			// i at the end means it is case insensitive
            if (preg_match('/^#(?:[a-f\d]{6})$/i', $tempdata['bgcolor'])) {
                  $mydata['showpassword'] = $tempdata['showpassword'];
                  $mydata['bgcolor'] = $tempdata['bgcolor'];
            }
        }
    }
    return $mydata;
}

//Input: Array
function saveData($d) {

	// The data in the cookie: 
	// 1) Turns the associative array into a json string
	// 2) Xor encrypt
	// 3) Base64 encode
    setcookie("data", base64_encode(xor_encrypt(json_encode($d))));
}

function xor_encrypt($in) {
    $key = '<censored>';
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
		$outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}



?>

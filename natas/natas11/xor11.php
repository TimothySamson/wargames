<?php
error_reporting(0);
// Is in base64. After decoded, will xor it with 000000
// 00000000 XOR partialkey XOR 000000 = partialkey
// XOR is commutative I hope :)
//
$code1 = "ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSRwh6QUcIaAw=";
$code2 = "ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw=";
$text1 = base64_decode($code1);
$text2 = base64_decode($code2);

$partialKey = '';
for($i=0; $i < strlen($text1); $i++){
	if(($text1[$i] ^ $text2[$i]) != "\0"){
		$partialKey .= $text1[$i] ^ '0';
		print(($i + 1) . " " . $partialKey . "\n");
	}
}

echo ($partialKey)
?>

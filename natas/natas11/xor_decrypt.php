<?php
error_reporting(0);
// Is in base64. After decoded, will xor it with 000000
// 00000000 XOR partialkey XOR 000000 = partialkey
// XOR is commutative I hope :)

$code = "UwwfORkYTzoQBEs9HgVcbUtQQS8CUBRtExBbJR0YSm1LUBt6QUcIekFQRWg=";
//$code = "ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSRwh6QUcIaAw=";
$text = base64_decode($code);

function xor_encrypt($in) {
    $key = 'qw8J';
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
		$outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}


echo(xor_encrypt($text));
$text='{"showpassword":"yes","bgcolor":"#000000"}';
$code = base64_encode(xor_encrypt($text));
echo $code;

?>

<?php
function pdf($data, $name, $orientation = "portrait") {
    if (count($name) > 1) {
		$name = "Orders";
	}else{
		$name = 'Order_'.$name[0]['order_id'];
	}
    $pdf = new DOMPDF;
    $pdf->set_paper("a4",$orientation);
    $pdf->load_html($data);
    $pdf->render();
    $pdf->stream($name.".pdf");
}
?>

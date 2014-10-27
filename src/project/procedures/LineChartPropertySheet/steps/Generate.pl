use strict;
use warnings;
use ElectricCommander;
my $ec = new ElectricCommander({debug => 0});

my $XHTML = '<script type="text/javascript">
//<![CDATA[
$(function() {
';

my $xaxis = 'var xaxis = [';
my $yaxis = 'var yaxis = [';
my $props = $ec->getProperties({path => "$[line_sheet]"});
my $i = 0;
foreach my $prop($props->findnodes("//property")) {
    $xaxis .= ", " if ($i != 0);
    $yaxis .= ", " if ($i != 0);
    my $name = $prop->findvalue("propertyName");
    my $value = $prop->findvalue("value");
    $xaxis .= sprintf("[%d, %f]", $i, $name);
    $yaxis .= sprintf("[%d, %f]", $i, $value);
    $i++;
}
$xaxis .= " ];\n";
$yaxis .= " ];\n";

$XHTML .= $xaxis . $yaxis . '    var options = {
        series: {
            bars: {
                align: "center", 
                barWidth: 0.7
            }
        },
        yaxes: [{position: "left"}, {position: "right"}],
        xaxis: {
            ticks: xaxis
        }
    };
    $.plot("#placeholder", [
                                {
                                    data: yaxis,
                                    label: "$[line_label]",
                                    yaxis: 1,
                                    lines: { show: true},
                                    points: {show: true},
                                    color: "$[line_color]"
                                }

                            ], options);
    // Add the Flot version string to the footer
    $("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
});
//]]>
</script>
<div style="font-family:verdana;">
<div align="center"><h2>$[text_header]</h2></div>
<div align="center">$[text_subheader]</div>
<div id="content">
    <div class="demo-container" style="
        box-sizing: border-box;
        width: 850px;
        height: 450px;
        padding: 20px 15px 15px 15px;
        margin: 15px auto 30px auto;
        border: 1px solid #ddd;
        background: #fff;
        background: linear-gradient(#f6f6f6 0, #fff 50px);
        background: -o-linear-gradient(#f6f6f6 0, #fff 50px);
        background: -ms-linear-gradient(#f6f6f6 0, #fff 50px);
        background: -moz-linear-gradient(#f6f6f6 0, #fff 50px);
        background: -webkit-linear-gradient(#f6f6f6 0, #fff 50px);
        box-shadow: 0 3px 10px rgba(0,0,0,0.15);
        -o-box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        -ms-box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        -moz-box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        -webkit-box-shadow: 0 3px 10px rgba(0,0,0,0.1);">
        <div id="placeholder" class="demo-placeholder" style="width:100%;height:100%;font-size:14px;line-height:1.2em;"></div>
    </div>
</div>
</div>';

my $LIB = $ec->getProperty("/myProject/flot/flot.js")->findvalue("//value")->value();
open(REPORT, ">", "$[output_file]") || die "Could not open file $[output_file]";
print REPORT $LIB . $XHTML;
close(REPORT);

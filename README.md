OVERVIEW:

The "ChartProperties" ElectricCommander/ElectricFlow plugin provides procedures to quickly chart data stored in properties.

USAGE:

You must first install and promote the plugin (available in out/ChartProperties.jar). You can then embed calls to charting procedures from a step by clicking on "Plugin > Reporting > ChartProperties" from the "Procedure Details" page.

Here are the parameters for the "LineChartPropertySheet" step:
<br /><img src="https://raw.githubusercontent.com/electriccommunity/ec-chart-properties/master/out/screenshots/line_chart_property_sheet_parameters.png" alt="Parameters" width="400px"/>

Here is a snapshot of the type of property sheet on which this procedure would operate:
<br /><br /><img src="https://raw.githubusercontent.com/electriccommunity/ec-chart-properties/master/out/screenshots/line_chart_property_sheet_data.png" alt="Data" width="400px"/>

When the step runs, an HTML report will be generated in the workspace.  If it contains the word report and ends with an extension htm(l), a link will appear on the job details page.  Here's the chart generated with the above data:
<br /><br /><img src="https://raw.githubusercontent.com/electriccommunity/ec-chart-properties/master/out/screenshots/line_chart_property_sheet_graph.png" alt="Graph" width="400px"/>

SOURCES:

The sources are available in the src directory. They were built using the Commander SDK v2.0. The documentation for the SDK is available at http://docs.electric-cloud.com.

AUTHOR:

Tanay Nagjee, Electric Cloud Solutions Engineer
tanay@electric-cloud.com

DISCLAIMER:

This module is not officially supported by Electric Cloud.
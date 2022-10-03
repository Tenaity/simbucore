/* 
  Adapts the Json results created by flutter_gherkin into a format that can be used 
  by the cucumber html reporter.
*/


const String escapedSpeechedMark = '\\"';
const String gherkinElement = '"gherkin_reports": "[[{"';
const String gherkinElementClosingBrackets = '}]]"';

String formatJsonForCucumberHtmlReport(String jsonReport) {
  var formattedJson = jsonReport.replaceAll(escapedSpeechedMark, '"');
  formattedJson = formattedJson.replaceAll(gherkinElement, '"');
  formattedJson = formattedJson.replaceAll(gherkinElementClosingBrackets, "");
  return "[$formattedJson]";
}
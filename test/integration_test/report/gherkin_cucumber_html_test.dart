/*
   formatJsonForCucumberHtmlReport
*/

// Package imports:
import 'package:test/test.dart';
import 'package:simbucore/integration_test/gherkin/adapter/gherkin_cucumber_html.dart';

// Project imports:

import 'fixture/file_fixture.dart';

//
// #     #                   #######
// #     # #    # # #####       #    ######  ####  #####
// #     # ##   # #   #         #    #      #        #
// #     # # #  # #   #         #    #####   ####    #
// #     # #  # # #   #         #    #           #   #
// #     # #   ## #   #         #    #      #    #   #
//  #####  #    # #   #         #    ######  ####    #
//

// #######
//    #    ######  ####  #####
//    #    #      #        #
//    #    #####   ####    #
//    #    #           #   #
//    #    #      #    #   #
//    #    ######  ####    #

void main() {
  //TestWidgetsFlutterBinding.ensureInitialized();
  group('Format json for the Cucumber html reporter: ', () {
    removeBackslashes();
    removeGherkinElement();
    removeGherkinElementClosingBrakets();
    wrapWithList();
  });
}

String loadReport() {
  // Read a report from file as its tricky and time consuming to fake it.
  return fileFixture("unformatted_json_report.json");
}

Future<void> removeBackslashes() async {
  return test('Remove back slash escape characters from speech marks',
      () async {
    var formattedJson = formatJsonForCucumberHtmlReport(loadReport());
    expect(formattedJson.contains(escapedSpeechedMark), false);
  });
}

Future<void> removeGherkinElement() async {
  return test('Remove Gherkin element', () {
    var formattedJson = formatJsonForCucumberHtmlReport(loadReport());
    expect(formattedJson.contains(gherkinElement), false);
  });
}

Future<void> removeGherkinElementClosingBrakets() async {
  return test('Remove the Gherking element closing brackets', () {
    var formattedJson = formatJsonForCucumberHtmlReport(loadReport());
    expect(formattedJson.contains(gherkinElementClosingBrackets), false);
  });
}

Future<void> wrapWithList() async {
  return test('Wrap output as a list', () {
    var formattedJson = formatJsonForCucumberHtmlReport(loadReport());
    var firstCharacter = formattedJson.substring(0, 1);
    var lastCharacter = formattedJson.substring(formattedJson.length - 1, formattedJson.length);
    var isWrapped = firstCharacter == "[" && lastCharacter == "]";
    expect(isWrapped, true);
  });
}

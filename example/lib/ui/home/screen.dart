import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String src = 'https://flutter.dev';
  String src2 = 'https://flutter.dev/community';
  String src3 = 'http://www.youtube.com/embed/IyFZznAk69U';
  static ValueKey key = ValueKey('key_0');
  static ValueKey key2 = ValueKey('key_1');
  static ValueKey key3 = ValueKey('key_2');
  bool _isHtml = false;
  bool _blockNavigation = false;
  bool _isMarkdown = false;
  bool _useWidgets = false;
  bool _editing = false;
  bool _isSelectable = false;
  bool _showSummernote = false;

  bool open = false;

  @override
  Widget build(BuildContext context) {
    // EasyWebViewControllerWrapperBase? _controller;
    // EasyWebViewControllerWrapperBase? _controller2;
    // EasyWebViewControllerWrapperBase? _controller3;

    return Scaffold(
        appBar: AppBar(
          title: Text('Easy Web View'),
          leading: IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () {
              setState(() {
                print("Click!");
                open = !open;
              });
            },

            //tooltip: "Menu",
          ),
          actions: <Widget>[
            Builder(builder: (context) {
              return IconButton(
                icon: Icon(_editing ? Icons.close : Icons.settings),
                onPressed: () {
                  if (mounted)
                    setState(() {
                      _editing = !_editing;
                    });
                },
              );
            }),
          ],
        ),
        body: _editing
            ? SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SwitchListTile(
                      title: Text('Html Content'),
                      value: _isHtml,
                      onChanged: (val) {
                        if (mounted)
                          setState(() {
                            _isHtml = val;
                            if (val) {
                              _isMarkdown = false;
                              src = htmlContent;
                            } else {
                              src = url;
                            }
                          });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Block Html Navigation'),
                      value: _blockNavigation,
                      onChanged: (val) {
                        if (mounted)
                          setState(() {
                            _blockNavigation = val;
                          });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Markdown Content'),
                      value: _isMarkdown,
                      onChanged: (val) {
                        if (mounted)
                          setState(() {
                            _isMarkdown = val;
                            if (val) {
                              _isHtml = false;
                              src = markdownContent;
                            } else {
                              src = url;
                            }
                          });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Use Widgets'),
                      value: _useWidgets,
                      onChanged: (val) {
                        if (mounted)
                          setState(() {
                            _useWidgets = val;
                          });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Selectable Text'),
                      value: _isSelectable,
                      onChanged: (val) {
                        if (mounted)
                          setState(() {
                            _isSelectable = val;
                          });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Show Summernote'),
                      value: _showSummernote,
                      onChanged: (val) {
                        if (mounted)
                          setState(() {
                            _showSummernote = val;
                            if (val) {
                              _isMarkdown = false;
                              _isHtml = true;
                              src = summernoteHtml;
                            } else {
                              src = url;
                            }
                          });
                      },
                    ),
                  ],
                ),
              )
            : Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: EasyWebView(
                            src: src,
                            onLoaded: (controller) {
                              // _controller = controller;
                            },
                            isHtml: _isHtml,
                            isMarkdown: _isMarkdown,
                            convertToWidgets: _useWidgets,
                            key: key,
                            widgetsTextSelectable: _isSelectable,
                            webNavigationDelegate: (_) => _blockNavigation
                                ? WebNavigationDecision.prevent
                                : WebNavigationDecision.navigate,
                            crossWindowEvents: [
                              CrossWindowEvent(
                                  name: 'Test',
                                  eventAction: (eventMessage) {
                                    print('Event message: $eventMessage');
                                  }),
                            ],
                            // width: 100,
                            // height: 100,
                          )),
                      Expanded(
                        flex: 1,
                        child: EasyWebView(
                          onLoaded: (controller) {
                            // _controller2 = controller;
                          },
                          src: src2,
                          isHtml: _isHtml,
                          isMarkdown: _isMarkdown,
                          convertToWidgets: _useWidgets,
                          widgetsTextSelectable: _isSelectable,
                          key: key2,
                          webNavigationDelegate: (_) => _blockNavigation
                              ? WebNavigationDecision.prevent
                              : WebNavigationDecision.navigate,
                          // width: 100,
                          // height: 100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: (open) ? 500 : 0,
                            child: EasyWebView(
                                src: src3,
                                onLoaded: (controller) {
                                  // _controller3 = controller;
                                },
                                isHtml: _isHtml,
                                isMarkdown: _isMarkdown,
                                convertToWidgets: _useWidgets,
                                widgetsTextSelectable: _isSelectable,
                                key: key3
                                // width: 100,
                                // height: 100,
                                ),
                          )),
                    ],
                  )
                ],
              ));
  }

  String get htmlContent => """
      <!DOCTYPE html>
      <html>
      <head>
      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
      <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
      <style>
        #editor {
          outline: 0px solid transparent;
          min-height: 100px;
          min-width: 300px;
          color: #182952;
          font-family: verdana;
        }
        table {
          width: 100%;
          max-width: 100%;
        }
        td {
          padding: 13px;
          margin: 0px;
        }
        th {
          padding: 13px;
          margin: 0px;
        }
      </style>
      <script>
        var documentHeight;

        function onLoaded() {
          documentHeight = document.body.scrollHeight;
          document.execCommand(\"styleWithCSS\", false, true);
        }
      </script>
      </head>
      <body onload=\"onLoaded();\">
      <div id=\"editor\"><!DOCTYPE html><html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\"><head>
        <title>
          
        </title>
        <!--[if !mso]><!-->
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
        <!--<![endif]-->
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <style type=\"text/css\">
          #outlook a { padding:0; }
          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }
          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }
          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }
          p { display:block;margin:13px 0; }
        </style>
        <!--[if mso]>
        <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
        </xml>
        <![endif]-->
        <!--[if lte mso 11]>
        <style type=\"text/css\">
          .mj-outlook-group-fix { width:100% !important; }
        </style>
        <![endif]-->
        
      <!--[if !mso]><!-->
        <link href=\"https://fonts.googleapis.com/css?family=Roboto:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">
        <style type=\"text/css\">
          @import url(https://fonts.googleapis.com/css?family=Roboto:300,400,500,700);
        </style>
      <!--<![endif]-->

    
        
    <style type=\"text/css\">
      @media only screen and (min-width:480px) {
        .mj-column-per-100 { width:100% !important; max-width: 100%; }
      }
    </style>
    
  
        <style type=\"text/css\">
        
        
        </style>
        
        
      </head>
      <body style=\"word-spacing:normal;\">
        
        
      <div style=\"\">
        
      
      <!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->
    
      
      <div style=\"margin:0px auto;max-width:600px;\">
        
        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">
          <tbody>
            <tr>
              <td style=\"direction:ltr;font-size:0px;padding:20px 0;padding-bottom:32px;text-align:center;\">
                <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" width=\"600px\" ><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->
    
      
      <div style=\"margin:0px auto;max-width:600px;\">
        
        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">
          <tbody>
            <tr>
              <td style=\"direction:ltr;font-size:0px;padding:20px 0;padding-bottom:0;padding-top:0;text-align:center;\">
                <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"alarm-title-container-outlook\" style=\"vertical-align:top;width:600px;\" ><![endif]-->
            
      <div class=\"mj-column-per-100 mj-outlook-group-fix alarm-title-container\" style=\"background: #eaeefe; border-radius: 4px; border: 1px solid #eaeefe; font-size: 0px; text-align: left; direction: ltr; display: inline-block; vertical-align: top; width: 100%;\">
        
      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">
        <tbody>
          <tr>
            <td style=\"vertical-align:top;padding-top:4px;padding-bottom:4px;\">
              
      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"\" width=\"100%\">
        <tbody>
          
              <tr>
                <td align=\"left\" style=\"font-size:0px;padding:0;padding-top:8px;padding-right:20px;padding-bottom:8px;padding-left:20px;word-break:break-word;\">
                  
      <div style=\"font-family:Roboto;font-size:16px;line-height:1;text-align:left;color:#222222;\">This event is about to begin</div>
    
                </td>
              </tr>
            
        </tbody>
      </table>
    
            </td>
          </tr>
        </tbody>
      </table>
    
      </div>
    
          <!--[if mso | IE]></td><td class=\"content-outlook\" style=\"vertical-align:top;width:600px;\" ><![endif]-->
            
      <div class=\"mj-column-per-100 mj-outlook-group-fix content\" style=\"border: 1px solid #ccc; border-radius: 4px; margin-top: 24px; font-size: 0px; text-align: left; direction: ltr; display: inline-block; vertical-align: top; width: 100%;\">
        
      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"vertical-align:top;\" width=\"100%\">
        <tbody>
          
              <tr>
                <td align=\"left\" style=\"font-size:0px;padding:20px;word-break:break-word;\">
                  
      <div style=\"font-family:Roboto;font-size:20px;font-weight:500;line-height:1;text-align:left;color:#434343;\">Noti check</div>
    
                </td>
              </tr>
            
              <tr>
                <td align=\"left\" style=\"font-size:0px;padding:20px;padding-top:0px;word-break:break-word;\">
                  
      <table cellpadding=\"4px\" cellspacing=\"0\" width=\"100%\" border=\"0\" style=\"color:#434343;font-family:Roboto;font-size:14px;line-height:22px;table-layout:auto;width:100%;border:none;\">
        <tbody><tr><td valign=\"top\" style=\"min-width: 80px;\"><strong>Time</strong></td><td><span style=\"display: inline-block;\">Friday 23 October 2020 12:00 - 12:30</span><span style=\"display: inline-block; color: #787878; font-weight: 400;\">&nbsp;Europe/Paris</span>&nbsp;(<a class=\"link\" href=\"https://dev.open-paas.org/calendar/#/calendar?start=10-22-2020\" style=\"text-decoration: none; color: #4d91c9;\" rel=\"noopener noreferrer\">See in Calendar</a>)</td></tr><tr><td style=\"min-width: 96px;\" valign=\"top\"><strong>Location</strong></td><td>1 thai ha (<a href=\"https://www.openstreetmap.org/search?query=1 thai ha\" rel=\"noopener noreferrer\">See in Map</a>)</td></tr><tr><td valign=\"top\"><strong>Attendees</strong></td><td><ul style=\"padding-inline-start: 16px; margin: 0;\"><li><span style=\"font-weight: 500\">User A</span><span style=\"color: #787878;\">&nbsp;&lt;usera@qa.open-paas.org&gt;</span><span style=\"font-weight: 500\">&nbsp;(Organizer)</span></li><li><span style=\"font-weight: 500\">Lê Nguyễn</span><span style=\"color: #787878;\">&nbsp;&lt;userb@qa.open-paas.org&gt;</span></li><li><span style=\"font-weight: 500\">User C</span><span style=\"color: #787878;\">&nbsp;&lt;userc@qa.open-paas.org&gt;</span></li><li><span style=\"font-weight: 500\">User D</span><span style=\"color: #787878;\">&nbsp;&lt;userd@qa.open-paas.org&gt;</span></li></ul></td></tr><tr><td valign=\"top\"><strong>Notes</strong></td><td>lorem ipsum

*#*#*#*#*#
Please do not edit this section of the description.

This event contains a videoconference.
Join the videoconference: https://dev.open-paas.org/videoconf/109ab64e-7c6b-4366-a81c-069abea94722
*#*#*#*#*#</td></tr>
      </tbody></table>
    
                </td>
              </tr>
            
        </tbody>
      </table>
    
      </div>
    
          <!--[if mso | IE]></td></tr></table><![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
        
      </div>
    
      
      <!--[if mso | IE]></td></tr></table></td></tr></table><![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
        
      </div>
    
      
      <!--[if mso | IE]></td></tr></table><![endif]-->
    
    
      </div>
    
      
    
  </body></html></div>
      </body>
      </html> 
    
""";

  String get markdownContent => """
# This is a heading
## Here's a smaller heading
This is a paragraph
* Here's a bulleted list
* Another item
1. And an ordered list
1. The numbers don't matter
> This is a qoute
[This is a link to Flutter](https://flutter.dev)
""";

  String get embeedHtml => """
<iframe width="560" height="315" src="https://www.youtube.com/embed/rtBkU4pvHcw?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
""";

  String get url => 'https://flutter.dev';

  String summernoteHtml = '''
<html>
  <head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  </head>
  <body>
    <div id="summernote"></div>
    <script>
    window.onload = function () {
      \$('#summernote').summernote({
        height: 400,
        tabsize: 2,
        callbacks: {
          onChange: function() {
            \$('#html-content').text(\$('#summernote').summernote('code'));
            
            window.parent.postMessage(\$('#summernote').summernote('code'), '*');
            if (window.Test != null) {
              window.Test.postMessage(\$('#summernote').summernote('code'));
            }
          }
        },
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture']],
          ['view', ['codeview']]
        ]
      });
    }
    </script>
    <div id="html-content" style="display: none"></div>
  </body>
</html>
''';
}

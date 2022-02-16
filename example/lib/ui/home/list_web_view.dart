import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';

class ListWebView extends StatefulWidget {
  @override
  _ListWebViewState createState() => _ListWebViewState();
}

class _ListWebViewState extends State<ListWebView> {
  bool _isHtml = true;
  bool _blockNavigation = false;
  bool _isMarkdown = false;
  bool _useWidgets = false;
  bool _isSelectable = false;
  bool open = false;

  @override
  Widget build(BuildContext context) {
    // EasyWebViewControllerWrapperBase? _controllerWebVew;

    return Scaffold(
        appBar: AppBar(
          title: Text('List Web View'),
        ),
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.zero,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      key: Key('list_email_content'),
                      itemCount: 2,
                      itemBuilder: (context, index) => EasyWebView(
                            src: htmlContent,
                            onLoaded: (controller) {
                              // _controllerWebVew = controller;
                            },
                            isHtml: _isHtml,
                            isMarkdown: _isMarkdown,
                            convertToWidgets: _useWidgets,
                            key: ValueKey('key_0'),
                            height: MediaQuery.of(context).size.height,
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
                          ))
                ],
              ),
            )));
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
}

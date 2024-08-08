import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrendlyneWidgetScreen extends StatefulWidget {
  const TrendlyneWidgetScreen(this.SymbolName, {super.key});
  final String SymbolName;
  @override
  _TrendlyneWidgetScreenState createState() => _TrendlyneWidgetScreenState();
}

class _TrendlyneWidgetScreenState extends State<TrendlyneWidgetScreen> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    _loadHtmlFromAssets(widget.SymbolName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller != null ? WebViewWidget(controller: _controller!) : Center(child: CircularProgressIndicator()),
    );
  }

  void _loadHtmlFromAssets(String SymbolName) async {
    String htmlContent = '''
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trendlyne Widget</title>
      </head>
      <body>
        <blockquote class="trendlyne-widgets" data-get-url="https://trendlyne.com/web-widget/swot-widget/Poppins/$SymbolName/?posCol=00A25B&primaryCol=006AFF&negCol=EB3B00&neuCol=F7941E" data-theme="light"></blockquote>
        <script async src="https://cdn-static.trendlyne.com/static/js/webwidgets/tl-widgets.js" charset="utf-8"></script>
      </body>
      </html>
      ''';

    if (_controller != null) {
      _controller!.loadRequest(Uri.dataFromString(htmlContent,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    }
  }
}

class TechnicalAnalysisWidgetScreen extends StatefulWidget {
  const TechnicalAnalysisWidgetScreen(this.SymbolName, {super.key});
  final String SymbolName;
  @override
  _TechnicalAnalysisWidgetScreenState createState() => _TechnicalAnalysisWidgetScreenState();
}

class _TechnicalAnalysisWidgetScreenState extends State<TechnicalAnalysisWidgetScreen> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    _loadHtmlFromAssets(widget.SymbolName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller != null ? WebViewWidget(controller: _controller!) : Center(child: CircularProgressIndicator()),
    );
  }

  void _loadHtmlFromAssets(String SymbolName) async {
    String htmlContent = '''
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trendlyne Widget</title>
      </head>
      <body>
        <blockquote class="trendlyne-widgets" data-get-url="https://trendlyne.com/web-widget/technical-widget/Inter/$SymbolName?posCol=00A25B&primaryCol=006AFF&negCol=EB3B00&neuCol=F7941E" data-theme="light"></blockquote>
        <script async src="https://cdn-static.trendlyne.com/static/js/webwidgets/tl-widgets.js" charset="utf-8"></script>
      </body>
      </html>
      ''';

    if (_controller != null) {
      _controller!.loadRequest(Uri.dataFromString(htmlContent,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    }
  }
}

class CheckBeforeBuyWidgetScreen extends StatefulWidget {
  const CheckBeforeBuyWidgetScreen(this.SymbolName, {super.key});
  final String SymbolName;
  @override
  _CheckBeforeBuyWidgetScreenState createState() => _CheckBeforeBuyWidgetScreenState();
}

class _CheckBeforeBuyWidgetScreenState extends State<CheckBeforeBuyWidgetScreen> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    _loadHtmlFromAssets(widget.SymbolName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller != null ? WebViewWidget(controller: _controller!) : Center(child: CircularProgressIndicator()),
    );
  }

  void _loadHtmlFromAssets(String SymbolName) async {
    String htmlContent = '''
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trendlyne Widget</title>
      </head>
      <body>
        <blockquote class="trendlyne-widgets" data-get-url="https://trendlyne.com/web-widget/checklist-widget/Inter/$SymbolName/?posCol=00A25B&primaryCol=006AFF&negCol=EB3B00&neuCol=F7941E" data-theme="light"></blockquote>
        <script async src="https://cdn-static.trendlyne.com/static/js/webwidgets/tl-widgets.js" charset="utf-8"></script>
      </body>
      </html>
      ''';

    if (_controller != null) {
      _controller!.loadRequest(Uri.dataFromString(htmlContent,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    }
  }
}

class TradingViewWidgetScreen extends StatefulWidget {
  const TradingViewWidgetScreen(this.SymbolName, {super.key});
  final String SymbolName;
  @override
  _TradingViewWidgetScreenState createState() => _TradingViewWidgetScreenState();
}

class _TradingViewWidgetScreenState extends State<TradingViewWidgetScreen> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    _loadHtmlFromAssets(widget.SymbolName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller != null ? WebViewWidget(controller: _controller!) : Center(child: CircularProgressIndicator()),
    );
  }

  void _loadHtmlFromAssets(String SymbolName) async {
    String htmlContent = '''
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trendlyne Widget</title>
      </head>
      <body>
        <blockquote class="trendlyne-widgets" data-get-url="https://trendlyne.com/web-widget/technical-widget/Inter/$SymbolName?posCol=00A25B&primaryCol=006AFF&negCol=EB3B00&neuCol=F7941E" data-theme="light"></blockquote>
        <script async src="https://cdn-static.trendlyne.com/static/js/webwidgets/tl-widgets.js" charset="utf-8"></script>
      </body>
      </html>
      ''';

    if (_controller != null) {
      _controller!.loadRequest(Uri.dataFromString(htmlContent,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    }
  }
}

class CompanyProfileWidgetScreen extends StatefulWidget {
  const CompanyProfileWidgetScreen(this.SymbolName, {super.key});
  final String SymbolName;
  @override
  _CompanyProfileWidgetScreenState createState() =>
      _CompanyProfileWidgetScreenState();
}

class _CompanyProfileWidgetScreenState
    extends State<CompanyProfileWidgetScreen> {
  WebViewController? _controller;


  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    _loadHtmlFromAssets(widget.SymbolName);
  }


  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _controller != null ? WebViewWidget(controller: _controller!) : Center(child: CircularProgressIndicator()),
    );
  }

  void _loadHtmlFromAssets(String SymbolName) async {
    String htmlContent = '''
  
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
<div class="tradingview-widget-container">
<div id="tradingview_4418d">
</div>
<div class="tradingview-widget-copyright">
<a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank">
<span class="blue-text">Track all markets on TradingView
</span>
</a>
</div>
<script type="text/javascript" src="https://s3.tradingview.com/tv.js">
</script>
<script type="text/javascript">
new TradingView.widget({
 "width": "100%",
 "height": 1180,
 "symbol": "NSE:$SymbolName",
 "interval": "D",
 "timezone": "Etc/UTC",
 "theme": "dark",
 "style": "1",
 "locale": "en",
 "toolbar_bg": "#121536",


 "backgroundColor": "rgba(18, 21, 54, 1)",
 "enable_publishing": false,
 "save_image": false,
 "container_id": "tradingview_4418d"
 });
</script>
</div>
</body>
</html>
   ''';

    if (_controller != null) {
      _controller!.loadRequest(Uri.dataFromString(htmlContent,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    }
  }
}

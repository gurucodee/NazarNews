import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const htmlData = """
      <p>- Принципы справедливости, справедливости, истины и национальных интересов в памяти государственного флага;</p>
      <p>- Из прогрессивных инициатив, предложений, проектов, научных открытий, и внести свой вклад в осуществление жизнеобеспечения;</p>
      <p>- Различные подразделения (религиозные, политические, региональные и т.д.), и в конечном счете к национальному единству;</p> 
      <p>- Внимательное отношение религиозных вопросов и избежать конфликта;</p> 
      <p>- Проблема заключается в том, чтобы определить детали научных принципов и духовных ценностей жизни, основанных на фактических данных и опыта; </p> 
      <p>- Власть и оппозиция к вопросу справедливого обращения, чтобы перейти к национальным интересам; </p> 
      <p>- Анализ международных вопросов, и их место в русле геополитических интересов, порядочный, идентифицирующих активный вклад; </p>
      <hr>
      <p>
        <img src="asset:assets/images/whatsapp.png" alt="whatsapp">
        +(996) 779 02 83 83
      </p>
      <p>Email: <a mailto="nazarnews.kg@gmail.com">nazarnews.kg@gmail.com</a>
    """;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("${getTranslated(context, 'О нас')}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 100.0,
                  child: Image.asset('assets/images/nazar_news_logo.png'),
                ),
              ),
              Html(
                data: htmlData.toString(),
                style: {
                  "img": Style(width: Width(25.0)),
                  "hr": Style(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  "p": Style(
                    fontWeight: FontWeight.w300,
                    fontSize: FontSize(16.0),
                    margin: Margins.only(top: 20.0, bottom: 30.0),
                  ),
                },
                // onLinkTap: (link) {
                //   print(link);
                // },
              ),
            ],
          ),
        ),
      ),
      // AssetImage('images/nazar_news_logo.png', package: 'assets'),
    );
  }
}

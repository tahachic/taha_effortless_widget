import 'package:flutter/material.dart';
import 'package:taha_effortless_widgets/taha_effortless_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  int carouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TText("Examples"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // T Button
            TButton(
              onTap: () {},
              backgroundColor: Colors.redAccent,
              radius: 10,
              withShadow: true,
              radiusSides: const [RadiusSides.topLeft, RadiusSides.bottomRight],
              child: const TText(
                "Button",
                color: Colors.white,
              ),
            ),
            // T Vertical Space
            const TVerticalSpace(20),
            // T Container
            const TContainer(
              height: 50,
              width: 100,
              radius: 5,
              color: Colors.green,
              child: TText(
                "Hello",
                color: Colors.white,
              ),
            ),
            // T Vertical Space
            const TVerticalSpace(20),
            // T Text Form Field
            TTextFormField(
              controller: controller,
              title: "Name",
              isRequired: true,
            ),
            // T Vertical Space
            const TVerticalSpace(20),
            // T Dotted line
            const TDottedLine(
              lineLength: 100,
              isHorizontal: true,
            ),
            // T Vertical Space
            const TVerticalSpace(20),
            // T Grid View
            Padding(
              padding: const EdgeInsets.all(20),
              child: TGridViewBuilder(
                length: 4,
                verticalSpacing: 10,
                horizontalSpacing: 10,
                maxCrossAxisCount: 2,
                builder: (context, index) => TContainer(
                  height: 80,
                  width: 80,
                  color: index % 2 == 0 ? Colors.amberAccent : Colors.redAccent,
                ),
              ),
            ),
            // Carousel indicators
            TCarouselIndicators(
              activeIndex: carouselIndex,
              length: 3,
            ),
            // T Vertical Space
            const TVerticalSpace(20),
            // T Notch
            const TNotch(),
            // T Rich Text
            const TRichText(
              "First name:",
              "Taha",
              firstTextWeight: FontWeight.normal,
              firstTextSize: 18,
              secondTextWeight: FontWeight.w200,
            ),
            // T Vertical Space
            const TVerticalSpace(20),
            // T Circular Progress
            const TCircularProgress(
              color: Colors.black,
            ),
            // T Vertical Space
            const TVerticalSpace(20),
            // T ExpandableWidget
            const TExpandableWidget(
                title: TText("Expandable"),
                animatedTitleIcon: AnimatedIcons.list_view,
                expandedContent: TContainer(
                  //height: 100,
                  width: 200,
                  child: Column(
                    children: <Widget>[
                      TText(
                        "Expandable Content Expandable Content Expandable Content Expandable Content Expandable Content",
                        maxWidth: 180,
                        maxLines: 10,
                      )
                    ],
                  ),
                )),
            // T Vertical Space
            const TVerticalSpace(100),
          ],
        ),
      ),
    );
  }
}

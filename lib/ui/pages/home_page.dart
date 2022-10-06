import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_riveepod_example/controllers/get_data_controller.dart';
import 'package:app_riveepod_example/data/models/product_model.dart';
import 'package:app_riveepod_example/data/provider/provider.dart';
import 'package:app_riveepod_example/ui/theme/colors.dart';

import '../w_iu_routes.dart';

const paddingH = 15.0;
const fotoUrl = 'https://st3.depositphotos.com/5834486/33631/i/950/depositphotos_336312154-stock-photo-gorgeous-woman-in-a-sexy.jpg';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(dataProvider).getData();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: (data.isLoading) //Si esta cargando
          ? const LoadingWidget() //Muestra un loading mientras cargan los datos
          : (data.isError) //Si hay un error
              ? WidgetError(onTap: data.getData) //Muestra un widget capaz de solicionar el error
              : ContentWidget(
                  //Si no es verdadero ninguna de las dos, se manda a llamar el contenido.
                  data: data,
                  size: size,
                ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.data,
    required this.size,
  }) : super(key: key);

  final DataProvider data;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        children: [
          const TitleGenery(),
          Column(
            children: const [
              _ContentCategoies(), //Contenido de los 4 card de las categorias
              _ToutesCategorie(), //Card del toutes les catégorie
            ],
          ),
          _ContentEnTendence(size: size, data: data),
          const SizedBox(height: 30),
          _CardLestsGo(size: size),
          _ContentEnTendence(size: size, data: data),
          _ContentEnTendence(size: size, data: data),
          _ContentVosRewards(size: size),
          _ContentEnTendence(size: size, data: data),
          _ContentEnTendence(size: size, data: data),
        ],
      ),
    );
  }
}

class _CardLestsGo extends StatelessWidget {
  const _CardLestsGo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 495,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? 200 : paddingH, vertical: 10),
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxHeight: 495, maxWidth: 392, minHeight: 495, minWidth: 392),
      width: 392,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(offset: Offset(0, 7), blurRadius: 20, color: Colors.black12),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(fotoUrl),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                  child: const TitleGenery(
                    text: "let's go",
                    colorText: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ContentCategoies extends StatelessWidget {
  const _ContentCategoies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      childAspectRatio: 2.4,
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: paddingH, right: paddingH),
      children: List.generate(
        4,
        (index) => const _ItemCategories(),
      ),
    );
  }
}

class _ToutesCategorie extends StatelessWidget {
  const _ToutesCategorie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: paddingH),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorGreyCard,
      ),
      child: const TitleGenery(text: 'toutes les catégorie', fontSize: 20),
    );
  }
}

class _ItemCategories extends StatelessWidget {
  const _ItemCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            colorGreyCard,
            Color.fromARGB(255, 243, 243, 243),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: paddingH),
              child: SizedBox(
                width: 80,
                child: TitleGenery(
                  text: 'maillots de bain',
                  padding: EdgeInsets.zero,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Image.network(fotoUrl),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentEnTendence extends StatelessWidget {
  const _ContentEnTendence({
    Key? key,
    required this.size,
    required this.data,
  }) : super(key: key);

  final Size size;
  final DataProvider data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: paddingH, right: paddingH, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleGenery(text: 'en tendance', padding: EdgeInsets.zero),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
            ],
          ),
        ),
        Container(
          height: 270,
          width: size.width,
          margin: const EdgeInsets.only(left: paddingH, top: 10),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.productosModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) {
              final product = data.productosModel[i];
              return _ItemCardTendence(size: size, product: product);
            },
          ),
        )
      ],
    );
  }
}

class _ItemCardTendence extends StatelessWidget {
  const _ItemCardTendence({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 200,
      height: size.height * .32,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorGreyCard,
            Colors.black38,
          ],
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(product.images.first.link),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: TitleGenery(
              text: '${product.price} €',
              colorText: Colors.white,
              fontSize: 18,
              padding: const EdgeInsets.all(20.0),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentVosRewards extends StatelessWidget {
  const _ContentVosRewards({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: paddingH, right: paddingH, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleGenery(text: 'vos rewards', padding: EdgeInsets.zero),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
            ],
          ),
        ),
        Container(
          height: 290,
          width: size.width,
          margin: const EdgeInsets.only(top: 10),
          color: Colors.transparent,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) {
              return _ItemCardVosRewards(size: size);
            },
          ),
        )
      ],
    );
  }
}

class _ItemCardVosRewards extends StatelessWidget {
  const _ItemCardVosRewards({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 200,
      height: size.height * .32,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(offset: Offset(0, 2), blurRadius: 10, color: Colors.black12)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            color: colorPink,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const CircleAvatar(
              backgroundColor: colorPinkF,
              child: Icon(CupertinoIcons.gift, color: Colors.white, size: 30),
            ),
          ),
          const TitleGenery(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
            textAlign: TextAlign.center,
            text: 'Amet minim mollit non dese mollit non',
            fontSize: 17,
            colorText: colorPinkF,
          ),
          const TitleGenery(
            padding: EdgeInsets.symmetric(horizontal: 20),
            textAlign: TextAlign.center,
            text: 'Amet minim mollit non dese mollit non',
            fontSize: 17,
            fontWeight: FontWeight.w500,
            colorText: colorGreyText,
          ),
          const TitleGenery(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            textAlign: TextAlign.center,
            text: 'Valable du 15 juin 2017 au 18 mai 2022',
            fontSize: 13,
            fontWeight: FontWeight.w400,
            colorText: colorPinkF,
          ),
        ],
      ),
    );
  }
}

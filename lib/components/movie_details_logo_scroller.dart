import 'package:flutter/material.dart';
import 'package:FlutterMovieDBApp/constants/constants.dart';

class LogoScroller extends StatelessWidget {
  LogoScroller(this.logoUrls);
  final List<String> logoUrls;

  Widget _buildLogo(BuildContext context, int index) {
    var logo = logoUrls[index];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network( 
          Constants.BACKDROP_IMG_URL + logo,
          width: 160.0,
          height: 120.0,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Production Companies',
            style: textTheme.subtitle1.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(70.0),
          child: ListView.builder(
            itemCount: logoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 0.0, left: 20.0),
            itemBuilder: _buildLogo,
          ),
        ),
      ],
    );
  }
}
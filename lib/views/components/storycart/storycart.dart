import 'package:flutter/material.dart';
import 'package:home/models/story.dart';
import 'package:home/utils/helper.dart';

class StoryCart extends StatelessWidget {
  final Story story;
  StoryCart(this.story);

  Widget bottomButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String date = "";
    if (DateTime.now().difference(story.storyTime).inHours > 24) {
      date = "${DateTime.now().difference(story.storyTime).inDays} day(s) ago";
    } else if (DateTime.now().difference(story.storyTime).inMinutes > 60) {
      date =
          "${DateTime.now().difference(story.storyTime).inHours} hours(s) ago";
    } else {
      date =
          "${DateTime.now().difference(story.storyTime).inMinutes} minutes(s) ago";
    }
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(story.shopLogo),
                  radius: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.shopName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(date)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(story.story),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              //clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(story.storyImage),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomButton(Icons.card_giftcard,
                    "BDT ${Helper.priceFormat(story.unitPrice.toString())}"),
                bottomButton(Icons.table_rows,
                    "${story.availableStock} Available Stock"),
                bottomButton(
                    Icons.shopping_cart_outlined, "${story.orderQty} Order(s)")
              ],
            )
          ],
        ),
      ),
    );
  }
}

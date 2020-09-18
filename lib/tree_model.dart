import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';

class Tree {
  int id;
  String name;
  String latinName;
  Widget description;
  LatLng coordinates;
  String leafImage;
  String treeImage;
  String barkImage;
  String blossomImage;
  String audio;
  bool deciduous;
  String origin;

  Tree(
      this.id,
      this.name,
      this.latinName,
      this.description,
      this.coordinates,
      this.leafImage,
      this.treeImage,
      this.barkImage,
      this.blossomImage,
      this.audio,
      this.deciduous,
      this.origin);
}

List<Tree> trees = [
  Tree(
    0,
    'Start Here',
    '',
    Text(
      '\nYou should start this trail where Redland Road meets Redland Green Road and Woodstock Road. '
      'Head down Woodstock road until the first tree on your right. ',
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.justify,
    ),
    LatLng(51.47177, -2.60810),
    'assets/images/start.png',
    'assets/images/start.png',
    '',
    '',
    'assets/audios/introduction.mp3',
    true,
    '',
  ),
  //re-record
  Tree(
    1,
    'Horse Chestnut',
    'Aesculus hippocastanum',
    Column(
      children: <Widget>[
        Text(
            'This first tree is a Horse Chestnut, otherwise known as a conker tree.'
            '\n\nThey are called Horse Chestnuts because when they detach, the stalk leaves a scar on the twig which is the shape of a horseshoe complete with nail holes'
            '\n\nThese trees were introduced from Turkey in the 16th century and widely planted so that they are a very common site in British parks and woodland.\n\n'),
        Text(
            'They are very easy to spot in Spring with their beautiful towering flowers which look like large candles from a distance. \n'),
        Image.asset(
          'assets/images/horse_chestnut_blossom.jpg',
        ),
        Text(
          '\nTheir leaves are also very distinctive with between 5 and 7 large lobes coming from one point.\n',
        ),
        Image.asset(
          'assets/images/horse_chestnut_leaf.jpg',
        ),
        Text(
            '\nContinue along Woodstock road which is populated with a combination of Horse Chestnut and Tulip Trees. The last tree on the right is tree number 2.\n')
      ],
    ),
    LatLng(51.471659, -2.607617),
    'assets/images/horse_chestnut_leaf.jpg',
    'assets/images/horse_chestnut_tree.jpg',
    '',
    'assets/images/horse_chestnut_blossom.jpg',
    'assets/audios/horse_chestnut.mp3',
    true,
    'Turkey',
  ),
  Tree(
      2,
      'Tulip Tree',
      'Liriodendron tulipifera',
      Column(
        children: <Widget>[
          Text(
              'Tulip trees are named for their flowers in  summer which are thought resemble tulips - these only appear on mature trees, over ten years old. \n\n'
              'They are deciduous and native to eastern North America. They were introduced into British cultivation in the mid-seventeenth century\n\n'
              'Their leaves are quite a distinctive shape with 4 points.\n '),
          Image.asset('assets/images/tulip_tree_leaf.jpg'),
          Text(
              '\nBelow are some photos submitted by local resident Arnold Mayes of a different tulip tree in bloom\n'),
          Image.asset('assets/images/tulip_tree_1.jpeg'),
          SizedBox(height: 18),
          Image.asset('assets/images/tulip_tree_2.jpeg'),
          Text(
              '\nCross over Woodstock road and head towards the church. There are a cluster of trees on your right. Tree number 3 is the leftmost of these trees. '),
        ],
      ),
      LatLng(51.471534, -2.606912),
      'assets/images/tulip_tree_leaf.jpg',
      'assets/images/tulip_tree.jpg',
      '',
      '',
      'assets/audios/tulip_tree.mp3',
      true,
      'North America'),
  Tree(
      3,
      'Rowan',
      'Sorbus aucuparia',
      Column(
        children: <Widget>[
          Text(
              'This deciduous tree is native to the UK and a favourite for wildlife with its creamy flowers and scarlet berries in autumn. '
              '\n\nIt is sometimes known as a Mountain Ash and its leaves are very similar to the ash tree with 5 to 8 pairs of serrated featherlike leaves plus one terminal leaf.\n\n'),
          Image.asset(
            'assets/images/mountain_ash_leaf.jpg',
          ),
          Text(
              '\n\nThey flower in spring with dense clusters of creamy white flowers each with 5 petals.\n\n'),
          Image.asset(
            'assets/images/mountain_ash_blossom.jpg',
          ),
          Text(
              '\n\nWalk past the front of the beautiful church and cross over the road to where you see a bench.')
        ],
      ),
      LatLng(51.471877, -2.606633),
      'assets/images/mountain_ash_leaf.jpg',
      'assets/images/mountain_ash_tree.jpg',
      '',
      'assets/images/mountain_ash_blossom.jpg',
      'assets/audios/rowan.mp3',
      true,
      'Native'),
  Tree(
      4,
      'Silver Maple',
      'Acer saccharinum',
      Column(
        children: <Widget>[
          Text(
              'This lovely throne and bench used to be a towering Silver Maple Tree before it was felled in 2019 when a split was found in the trunk that was thought to be dangerous. '
              '\n\nThe Redland Green Community Group arranged for it to be carved into a bench and seat and as you can see the seat has since sprouted and we hope to eventually have a full sized tree with a seat at the bottom.'
              '\n\nAcross the green you can see a silver Maple in all its unfelled glory.\n\n'),
          Image.asset('assets/images/silver_maple_tree_extra.jpg'),
          Text(
              '\n\nThis deciduous tree gets its name from the silvery sparkle of the underside of the leaf when it blows in the wind.'
              '\n\nSilver Maple trees are native to North America and were first brought here in the 18th Century.'
              '\n\nThe tree is from the family of Acers or Maples who all have these palmate lobed leaves like you find on the Canadian Flag. '
              'The Silver Maple is serrated and has 5 deeply incised lobes. \n\n'
              'The leaves vary from green to deep red.\n\n'),
          Image.asset('assets/images/silver_maple_leaf.jpg'),
          Text(
              '\n\n Turn towards the bowling green and you should spot a distinctive purple tree which is tree number 5'),
        ],
      ),
      LatLng(51.472521, -2.606838),
      'assets/images/silver_maple_leaf.jpg',
      'assets/images/silver_maple_tree.jpg',
      '',
      '',
      'assets/audios/silver_maple.mp3',
      true,
      'North America'),

  Tree(
      5,
      'Purple Cherry Plum',
      'Prunus Cerasifera Pissardii',
      Column(children: <Widget>[
        Text(
            'This tree stands out from the crowd on Redland Green with its deep purple leaves and stem which can appear almost black'
            '\n\nThey are deciduous and native to southeast Europe. They were introduced to the UK in the 1900s.'
            '\n\nThe purple leaves are glossy and serrated with fine hairs underside.\n\n'),
        Image.asset(
          'assets/images/cherry_plum_leaf.jpg',
        ),
        Text(
            '\n\nWalk past the bowling green and then turn right towards the playground. '
            'The tree to the left of the entrance of the playground is the next tree on the trail.')
      ]),
      LatLng(51.47273, -2.606487),
      'assets/images/cherry_plum_leaf.jpg',
      'assets/images/cherry_plum_tree.jpg',
      '',
      '',
      'assets/audios/cherry_plum.mp3',
      true,
      'Southeast Europe'),

  Tree(
      6,
      'Silver Birch',
      'Betula pendula',
      Column(
        children: <Widget>[
          Text(
              'These deciduous trees which are native to Europe are easy to spot by their silver white bark. \n\n'),
          Image.asset(
            'assets/images/silver_birch_bark.jpg',
          ),
          Text(
              '\n\nThey form a light canopy in summer with drooping branches.\n\n'
              'Their leaves are triangular shaped and serrated\n\n'),
          Image.asset(
            'assets/images/silver_birch_leaf.jpg',
          ),
          Text(
              'Go around the playground towards Redland Green Farm and around the corner you will spot the next tree')
        ],
      ),
      LatLng(51.473624, -2.606125),
      'assets/images/silver_birch_leaf.jpg',
      'assets/images/silver_birch_tree.jpg',
      'assets/images/silver_birch_bark.jpg',
      '',
      'assets/audios/silver_birch.mp3',
      true,
      'Europe'),
//rerecord
  Tree(
      7,
      'Double Flowered Cherry',
      'Prunus avium Plena ',
      Column(
        children: <Widget>[
          Text(
              'This is a stunning double flowered Cherry tree and is particularly spectacular in spring'
              'Wild cherries normally produce white flowers with a single row of petals. '
              'This cultivar has been bread to produce double flowers which last three times longer than the wild species.'
              '\n\nThese deciduous trees were introduced in the 16th Century by King Henry VIII who had tasted them in Flanders \n\n'),
          Text(
              'Cherry trees are easy to spot year round by the  shiny bark which is a deep reddish-brown with prominent cream-coloured horizontal lines called lenticels. \n\n'),
          Image.asset(
            'assets/images/cherry_bark.jpg',
          ),
          Text(
              '\n\nThe leaves are oval, green and serrated with pointed tips.\n\n'),
          Image.asset(
            'assets/images/cherry_leaf.jpg',
          ),
          Text(
              '\n\nCarry on towards Redland Green farm and by the corner of the playground is the next tree.')
        ],
      ),
      LatLng(51.473878, -2.60635),
      'assets/images/cherry_leaf.jpg',
      'assets/images/cherry_tree.jpg',
      'assets/images/cherry_bark.jpg',
      'assets/images/cherry_blossom.jpg',
      'assets/audios/cherry.mp3',
      true,
      'Asia'),
  Tree(
      8,
      'Bird Cherry',
      'Prunus padus',
      Column(
        children: <Widget>[
          Text(
              'These deciduous trees are native to northern Europe. They produce reddish brown bitter cherries in the Autumn.'
              '\n\nThey have heavily scented flowers with 5 white petals clustered along short stalks in spring'
              '\n\nTheir leaves can be distinguished from a cherry tree by the pattern of the veins and the fine sharp serrations around the edge.\n\n'),
          Image.asset(
            'assets/images/bird_cherry_leaf.jpg',
          ),
          Text(
              '\n\nReturn to the main path and turn right down the steep path. '
              'Continue along with the dell on your right and then pass the allotments. '
              'Take the steps up to the top where you will see a line of small leaf Lime trees along Cossins Road. '
              'This is where tree number 9 is.'),
        ],
      ),
      LatLng(51.474003, -2.605966),
      'assets/images/bird_cherry_leaf.jpg',
      'assets/images/bird_cherry_tree.jpg',
      '',
      '',
      'assets/audios/bird_cherry.mp3',
      true,
      'Northern Europe'),
  Tree(
      9,
      'Small Leafed Lime',
      'Tilia cordata',
      Column(
        children: <Widget>[
          Text(
              'These deciduous trees are native to the UK and can often be found in ancient woodland. '
              '\n\nThere are three different kinds of lime trees found in the UK - small leaf, large leaf and common which is a hybrid of the two.'
              '\n\nYou can tell them apart by looking at the underside of the leaf. Common lime have has tufts of white hairs at the end of twigs, whereas in small-leaved lime these are rusty red. '
              'Large-leaved lime has hairs all over the underside.'
              '\n\nThe leaves are easy to spot as they are heart shaped with pointed ends and are finely serrated.\n\n'),
          Image.asset(
            'assets/images/lime_leaf.jpg',
          ),
          Text(
              'head back down the hill. The next tree is at the bottom of the slope.')
        ],
      ),
      LatLng(51.475113, -2.608192),
      'assets/images/lime_leaf.jpg',
      'assets/images/lime_tree.jpg',
      '',
      '',
      'assets/audios/small_leaf_lime.mp3',
      true,
      'Native'),
  Tree(
      10,
      'Norway Maple',
      'Acer platanoides',
      Column(
        children: <Widget>[
          Text(
              'This huge beautiful tree is the second in the Maple family along this trail and is easily confused with a Sycamore which we will see later. '
              'Like the silver maple it is deciduous and as the name would suggest it originates from Norway and from right across Central Europe to western Asia'
              '\n\nThe leaves are palmate with five lobes with a few pointed teeth. They are dark green in colour, fading to yellow and occasionally red before falling in autumn.\n\n'),
          Image.asset(
            'assets/images/norway_maple_leaf.jpg',
          ),
          Text(
              '\n\nHead to the far end of the green where there is a small woodland. '
              'In the middle just to the left of the bench is the next tree on the trail.')
        ],
      ),
      LatLng(51.474971, -2.608379),
      'assets/images/norway_maple_leaf.jpg',
      'assets/images/norway_maple_tree.jpg',
      '',
      '',
      'assets/audios/norway_maple.mp3',
      true,
      'Central Europe'),

  Tree(
      11,
      'Hawthorn',
      'Crataegus monogyna',
      Column(
        children: <Widget>[
          Text(
              'Just behind and to the left of the bench you should see a Hawthorn tree.'
              '\n\nThe hawthorn tree is named from the old English term for hedge as it was commonly used to provide a fence of thorns. '
              '\n\nThey are native to northern Europe and this variety is deciduous. '
              '\n\nThey produce haws in the autumn which are small edible berries'
              '\n\nThey are part of the rose family and in spring they have pretty white blossom with 5 petalled flowers.\n\n'),
          Image.asset(
            'assets/images/hawthorn_blossom.jpg',
          ),
          Text(
              '\n\nThe leaf is quite a distinctive shape which is deeply lobed and serrated.\n\n'),
          Image.asset(
            'assets/images/hawthorn_leaf.jpg',
          ),
          Text(
              'Proceed to the far corner of the green where on the slope you will see a small oak tree which is our next tree.')
        ],
      ),
      LatLng(51.475323, -2.609523),
      'assets/images/hawthorn_leaf.jpg',
      'assets/images/hawthorn_tree.jpg',
      '',
      'assets/images/hawthorn_blossom.jpg',
      'assets/audios/hawthorn.mp3',
      true,
      'Native'),
  Tree(
      12,
      'Oak',
      'Quercus',
      Column(
        children: <Widget>[
          Text(
              'This small oak was planted by the Redland Green Community Group and we hope it will one day grow to be a huge oak tree like others on the green.'
              '\n\nOak trees are native to the UK and support more life than any other native species.'
              '\n\nIts leaves are quite distinctive with 4–5 deep lobes with smooth edges and it drops acorns in the autumn'),
          Image.asset(
            'assets/images/oak_leaf.jpg',
          ),
          Text(
              '\n\nWalk back down the hill along the right hand side of the green and you will spot the next tree on your right.')
        ],
      ),
      LatLng(51.474945, -2.609868),
      'assets/images/oak_leaf.jpg',
      'assets/images/oak_tree.jpg',
      '',
      '',
      'assets/audios/oak.mp3',
      true,
      'Native'),
  Tree(
      13,
      'Hornbeam Fastigiata',
      'Carpinus betulus Fastigiata',
      Column(
        children: <Widget>[
          Text(
              'This magnificent tree that looks almost like a child\'s drawing is a particularly lovely variety of Hornbeam.'
              'It grows more neatly and densly than other varieties.'
              '\n\nIt is native to the UK and although it is deciduous it holds on to most of its leaves in winter so that it provides cover for wildlife when there isn\'t much around.'
              '\n\nIts leaves have diagonal ridges and the edges are doubly serrated\n\n'),
          Image.asset(
            'assets/images/hornbeam_leaf.jpg',
          ),
          Text(
              '\n\nHead on down the hill until you reach the next tree on your right.')
        ],
      ),
      LatLng(51.474644, -2.608693),
      'assets/images/hornbeam_leaf.jpg',
      'assets/images/hornbeam_tree.jpg',
      '',
      '',
      'assets/audios/hornbeam.mp3',
      true,
      'Native'),
  Tree(
      14,
      'Lawson cypress',
      'Chamaecyparis lawsoniana',
      Column(
        children: <Widget>[
          Text('This is one of only a very few evergreen trees on the green. '
              'They are native of California and were introduced to Britain in 1854. '
              '\n\nTheir bark is quite a distinctive dark auburn with deep fissures\n\n'),
          Image.asset(
            'assets/images/cypress_bark.jpg',
          ),
          Text(
              '\n\nThey have small scale like leaves with cones at the end. \n\n'),
          Image.asset(
            'assets/images/cypress_leaf.jpg',
          ),
          Text('\n\nContinue down the hill until you see the next tree.')
        ],
      ),
      LatLng(51.474372, -2.607798),
      'assets/images/cypress_leaf.jpg',
      'assets/images/cypress_tree.jpg',
      'assets/images/cypress_bark.jpg',
      '',
      'assets/audios/cypress.mp3',
      false,
      'California'),

  Tree(
      15,
      'Apple',
      'Malus',
      Column(
        children: <Widget>[
          Text(
              'This slightly wonky looking tree is an apple tree which is deciduous. '
              'Though a firm favourite in the UK they are not actually native (unlike crab apple trees) but thought to originate in Central Asia. '
              'They have been cultivated in Europe for thousands of years. '
              '\n\nTheir leaves are dark green and typically oval in shape with serrated edges and slightly furry underneath'),
          Image.asset('assets/images/apple_leaf.jpg'),
          Text(
              '\n\nWalk back down to the path and start walking back up the hill. '
              'You will pass the towering veteran ash trees on your right where the next tree is.')
        ],
      ),
      LatLng(51.474494, -2.607697),
      'assets/images/apple_leaf.jpg',
      'assets/images/apple_tree.jpg',
      '',
      '',
      'assets/audios/apple.mp3',
      true,
      'Central Asia'),
  Tree(
      16,
      'Ash',
      'Fraxinus excelsior',
      Column(
        children: <Widget>[
          Text(
              'These towering Ash trees are thought to be not only some of the oldest on the green, but some of the oldest trees in the vicinity after Prince Rupert ordered all the trees in Bristol to be felled. '
              'These were some of the first trees to be replanted and are thought to date from the 17th Century.'
              '\n\nThey are deciduous and native of the UK and were regarded by the druids as sacred.'
              '\n\nThe ancient bark of these trees is deeply fissured. \n\n'),
          Image.asset(
            'assets/images/ash_bark.jpg',
          ),
          Text(
              '\n\nThe leaves have 3 to 6 pairs of light green leaflets plus one terminal leaf.\n\n'),
          Image.asset(
            'assets/images/ash_leaf.jpg',
          ),
          Text(
              '\n\nContinue up the path. Where it forks take the right hand fork and the next tree is just to your left between the two paths.')
        ],
      ),
      LatLng(51.474143, -2.607119),
      //
      'assets/images/ash_leaf.jpg',
      'assets/images/ash_tree.jpg',
      'assets/images/ash_bark.jpg',
      '',
      'assets/audios/ash.mp3',
      true,
      'Native'),

  Tree(
      17,
      'Paul\'s Scarlet Hawthorn',
      'Crataegus laevigata ',
      Column(
        children: <Widget>[
          Text(
              'This tree is the second type of Hawthorn - a Paul\'s Scarlet variety. \n\n'
              'They are not easy to distinguish from the common Hawthorn unless they are flowering when they have stunning scarlet flowers. '
              '\n\nTheir leaves are very similar to the common hawthorn\n\n'),
          Image.asset('assets/images/scarlet_hawthorn_leaf.jpg'),
          Text(
              'It is easy to see that these trees belong in the rose family when you see their beautiful clusters of flowers in spring.\n\n '),
          Image.asset('assets/images/scarlet_hawthorn_blossom.jpg'),
          Text(
              '\n\nContinue back up the path. At the side of the tennis courts you will see a row of Sycamore Trees where our next tree is located.')
        ],
      ),
      LatLng(51.474272, -2.606862),
      'assets/images/scarlet_hawthorn_leaf.jpg',
      'assets/images/scarlet_hawthorn_tree.jpg',
      '',
      'assets/images/scarlet_hawthorn_tree.jpg',
      'assets/audios/scarlet_hawthorn.mp3',
      true,
      'Hybrid create in UK'),
  Tree(
      18,
      'Sycamore',
      'Acer pseudoplatanus',
      Column(
        children: <Widget>[
          Text(
              'This is a Sycamore tree. They come from the Maple (Acer) family and are easily confused with the Norway Maple. '
              '\nThese deciduous trees originated in Europe and are thought to have been introduced by the Romans.'
              '\n\nPalmate leaves measure 7–16cm and have five lobes. Leaf stalks of younger trees are characteristically red.\n\n'),
          Image.asset('assets/images/sycamore_leaf.jpg'),
          Text(
              '\n\nThe next tree is just a little further up the path on your left.')
        ],
      ),
      LatLng(51.473671, -2.606935),
      'assets/images/sycamore_leaf.jpg',
      'assets/images/sycamore_tree.jpg',
      '',
      '',
      'assets/audios/sycamore.mp3',
      true,
      'Europe'),

  Tree(
      19,
      'London Plane',
      'Platanus x acerifolia ',
      Column(
        children: <Widget>[
          Text(
              'This beautiful deciduous tree is actually a hybrid of the American Sycamore and the Oriental Plane. '
              '\n\nIt was first discovered in the 17th century then widely planted in the 18th. '
              'It can live up to several hundred years and is particularly tolerant of smoke and dust pollution which is probably why it was so popular with the Victorians.'
              '\n\nThe easiest way to identify a London plane is by the scaly plates on the bark which make it look like army camouflage\n\n'),
          Image.asset(
            'assets/images/london_plane_bark.jpg',
          ),
          Text('\n\nThe leaves are quite similar to a maple with 3 to 5 lobes '
              'with a base that is almost straight.\n\n'),
          Image.asset(
            'assets/images/london_plane_leaf.jpg',
          ),
          Text(
              '\n\nThere is a line of stunning London Plane Trees on Redland Green Road leading up to the church. These were planted in around 1905 as part of a housing development as you can see in the photo below.\n\n'),
          Image.asset('assets/images/london_planes_redland_green_road.jpg'),
          Text(
              '\n\nFollow the path round the corner right back to the starting point where you will spot our final tree.')
        ],
      ),
      LatLng(51.473257, -2.60659),
      'assets/images/london_plane_leaf.jpg',
      'assets/images/london_plane_tree.jpg',
      'assets/images/london_plane_bark.jpg',
      '',
      'assets/audios/london_plane.mp3',
      true,
      'Hybrid created in UK'),
  Tree(
      20,
      'Yew',
      'Taxus baccata',
      Column(
        children: <Widget>[
          Text(
              'This Yew tree is another of the few evergreen trees on the green. '
              'These ancient trees are native to Europe and can live up to 3000 years.'
              '\n\nThey have straight sharp needles coloured dark green above and green-grey below. They grow in two rows on either side of each twig.\n\n'),
          Image.asset(
            'assets/images/yew_leaf.jpg',
          ),
          Text('\n\nTheir bark is reddish brown\n\n'),
          Image.asset(
            'assets/images/yew_bark.jpg',
          ),
          Text(
              '\n\nYou have made it to the end of the trail! We hope you enjoyed this trail and found it informative.'),
        ],
      ),
      LatLng(51.472013, -2.60788),
      'assets/images/yew_leaf.jpg',
      'assets/images/yew_tree.jpg',
      'assets/images/yew_bark.jpg',
      '',
      'assets/audios/yew.mp3',
      false,
      'Native'),
];

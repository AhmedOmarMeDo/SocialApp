import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(.15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset('assets/images/night.png'),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: size.width * .09,
                  height: size.height * .05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/chat2.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: size.width * .09,
                  height: size.height * .05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/chat.png'),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .03,
                ),
                Container(
                  height: size.height * .115,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: size.width * .05,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                          radius: size.width*.08,
                          backgroundImage: AssetImage('assets/images/man.jpg'),
                        ),
                          Text(
                            'MeDo',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(thickness: 1.5,),
                ),
                SizedBox(
                  height: size.height * .015,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context,index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Divider(thickness: 1.5,),
                    ),
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: size.width*.057,
                                backgroundImage: AssetImage('assets/images/man.jpg'),
                              ),
                              SizedBox(
                                width: size.width*.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ahmed Omar',style: Theme.of(context).textTheme.headline6,),
                                  SizedBox(
                                    height: size.height*.003,
                                  ),
                                  Text('Java developer',style: Theme.of(context).textTheme.caption.copyWith(fontSize: size.width*.032),),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: IconButton(
                                  icon: Icon(Icons.linear_scale,color: Colors.grey[700],),
                                  onPressed: (){},
                                  iconSize: size.width*.065,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*.005,),
                          Container(
                            width: double.infinity,
                            height: size.height*.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[300].withOpacity(.7),
                            ),
                          ),
                          SizedBox(height: size.height*.01,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/like.png',width: size.width*.07,),
                                    SizedBox(width: size.width*.005,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text('4.1k',style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18),),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset('assets/images/comment.png',width: size.width*.07,),
                                    SizedBox(width: size.width*.008,),
                                    Text('4.1k',style:Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

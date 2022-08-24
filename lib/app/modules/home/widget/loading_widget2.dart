import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
             
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 5),
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.75,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[200]!,
                    enabled: true,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      color: Colors.white,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[200]!,
                              enabled: true,
                              child: Container(
                                color: Colors.white,
                                margin: const EdgeInsets.only(bottom: 10),
                                width: 80,
                                height: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[200]!,
                                enabled: true,
                                child: Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: 80,
                                  height: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[200]!,
                                enabled: true,
                                child: Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: 80,
                                  height: 10,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        enabled: true,
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: const Color.fromARGB(255, 76, 175, 117)
                                  .withOpacity(0.7)),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.bookmark_added_outlined,
                                size: 20,
                                color: Colors.black,
                              ),
                              Text("Redy")
                            ],
                          ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        enabled: true,
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.5)),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            color: Colors.green[800],
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

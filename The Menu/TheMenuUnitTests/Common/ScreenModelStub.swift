
enum Stubs {
    static func makefetchScreenModelStub() -> String {
                """
                {
                    "pageTitle": "The Menu",
                    "components": [
                        {
                            "type": "featuredImage",
                            "data": {
                                "imageUrl": "https://plus.unsplash.com/premium_photo-1667682942148-a0c98d1d70db?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            }
                        }
                    ]
                }
                """
    }
    
    static func makefetchScreenOfTwoModelStub() -> String {
                  """
                  {
                      "pageTitle": "The Menu",
                      "components": [
                          {
                              "type": "featuredImage",
                              "data": {
                                  "imageUrl": "https://plus.unsplash.com/premium_photo-1667682942148-a0c98d1d70db?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                              }
                          },
                          {
                            "type": "commentList",
                            "data": {
                                        "comments": [
                                                  {
                                                    "id": 1,
                                                    "title": "Appetizer",
                                                    "subTitle": "This is a great appetizer!",
                                                    "imageUrl": "https://img.freepik.com/free-photo/pretty-woman-beret-sniffs-fragrant-donut-portrait-girl-with-curly-hair-isolated-red-wall_197531-14359.jpg?w=2000&t=st=1701959556~exp=1701960156~hmac=09c3d07cf36b5b302c459f1d3ba0d717cb6e1ea0f92fe14cc2c0899ca4f5c412",
                                                    "description": "Every meal featured among this menu has a specific meaning behind it.",
                                                    "rating": 5
                                                  }
                            ]
                        }
                  }
                  ]
                  }
                  """
    }
}

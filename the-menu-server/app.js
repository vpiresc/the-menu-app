const express = require("express")
const app = express()

const menuItems = [
    {
        itemId: 1,
        imageUrl: "https://img.freepik.com/free-psd/food-social-media-banner-post-template_202595-365.jpg?w=1380&t=st=1701957548~exp=1701958148~hmac=a21c07ff0d0aae9d627e88a4dd41524cc3c4edb4c947782167ff445c52bde7b9",
        title: "Today Offer",
        description: "This a great menu! Bacon ipsum dolor amet fatback shank leberkas meatball spare ribs t-bone sirloin brisket bacon. Rump ball tip beef chicken landjaeger. Picanha strip steak boudin rump shank. Pastrami ground round spare ribs, pork ball tip kielbasa jowl fatback swine short ribs buffalo sirloin pork loin drumstick.",
        rating: 5
    },
    {
        itemId: 2,
        imageUrl: "https://img.freepik.com/free-psd/food-menu-restaurant-social-media-banner-template_120329-3313.jpg?w=1380&t=st=1701957302~exp=1701957902~hmac=64f914612ee2cf1eb361b01e3763f6a1c1a2202b94e596db35e1d3a2acc30d4e",
        title: "Friday Promo",
        description: "This is a good menu! Banana bread lemon lime minty fruit smash burritos cozy cinnamon oatmeal Indian spiced crunchy smoky maple tempeh glaze seitan coriander cool cucumbers delightful blueberry scones walnut pesto tart scotch bonnet pepper Thai dragon pepper onion heat ",
        rating: 4
    },
    {
        itemId: 3,
        imageUrl: "https://img.freepik.com/premium-psd/psd-food-restaurant-social-media-post-collection_510647-226.jpg?w=1380",
        title: "Limited Time Offer",
        description: "This menu is OK! Bonbon toffee bonbon candy canes chocolate cake candy. Brownie gummi bears chocolate marshmallow powder macaroon. Apple pie sweet roll candy canes candy canes sweet jelly-o gummi bears topping caramels.",
        rating: 3
    },
    {
        itemId: 4,
        imageUrl: "https://img.freepik.com/free-psd/food-social-media-promotion-instagram-banner-post-design-template_202595-475.jpg?w=1380&t=st=1701957552~exp=1701958152~hmac=f05cfe9a7fa2b15a4380be43ad96668300985d16f35ffc8664233b136d91f0b8",
        title: "Pizza Friday",
        description: "This menu is not so good",
        rating: 2
    },
    {
        itemId: 5,
        imageUrl: "https://img.freepik.com/free-psd/delicious-burger-food-menu-social-media-banner-template_120329-3307.jpg?w=1380&t=st=1701957555~exp=1701958155~hmac=58d4c4cbf164717822e275fc2ec4deb58c48dc2d9957e234211d2d5c20fae6fb",
        title: "Best Discount",
        description: "This menu is not good",
        rating: 1
    }
]

app.get("/menu-comments", (req, res) => {

    const model = {
        pageTitle: "Comments",
        components: [
            {
                type: "featuredImage",
                data: {
                    imageUrl: "https://img.freepik.com/premium-vector/burger-social-media-feed-post-template_123371-177.jpg?w=2000"
                }
            },
            {
                type: "list",
                data: {
                    rows: [
                        {
                            id: 1,
                            title: "Appetizer",
                            subTitle: "This is a great appetizer!",
                            imageUrl: "https://img.freepik.com/free-photo/pretty-woman-beret-sniffs-fragrant-donut-portrait-girl-with-curly-hair-isolated-red-wall_197531-14359.jpg?w=2000&t=st=1701959556~exp=1701960156~hmac=09c3d07cf36b5b302c459f1d3ba0d717cb6e1ea0f92fe14cc2c0899ca4f5c412",
                            description: "Every meal featured among this menu has a specific meaning behind it."
                        },
                        {
                            id: 2,
                            title: "Nice discount",
                            subTitle: "This is a great discount!",
                            imageUrl: "https://img.freepik.com/free-photo/attractive-woman-with-afro-hair-surrounded-by-peanut-butter-jellly-sandwiches_273609-36508.jpg?w=2000&t=st=1701959653~exp=1701960253~hmac=6aad1d5f30ff75e91299f171ed0cc8cdfc58dd8dd0ae9765563a5e2d30129559"
                        },
                        {
                            id: 3,
                            title: "I love it!",
                            subTitle: "This is a great!",
                            imageUrl: "https://img.freepik.com/free-photo/young-pretty-woman-eating-pizza-pizza-bar_1303-20333.jpg?w=2000&t=st=1702400419~exp=1702401019~hmac=5db3063133fc5a5a8e12542aa0187b91f10beb089b9d6ea7b7676b4d01a6907e",
                            description: "Ready in under 20 minutes, makes for a satisfying weeknight treat for one."
                        },
                        {
                            id: 4,
                            title: "Nice discount",
                            subTitle: "This is a great discount!",
                            imageUrl: "https://img.freepik.com/free-photo/attractive-woman-with-afro-hair-surrounded-by-peanut-butter-jellly-sandwiches_273609-36508.jpg?w=2000&t=st=1701959653~exp=1701960253~hmac=6aad1d5f30ff75e91299f171ed0cc8cdfc58dd8dd0ae9765563a5e2d30129559"
                        },
                        {
                            id: 5,
                            title: "Appetizer",
                            subTitle: "This is a great appetizer!",
                            imageUrl: "https://img.freepik.com/free-photo/pretty-woman-beret-sniffs-fragrant-donut-portrait-girl-with-curly-hair-isolated-red-wall_197531-14359.jpg?w=2000&t=st=1701959556~exp=1701960156~hmac=09c3d07cf36b5b302c459f1d3ba0d717cb6e1ea0f92fe14cc2c0899ca4f5c412",
                            description: "Every meal featured among this menu has a specific meaning behind it."
                        },
                        {
                            id: 6,
                            title: "I love it!",
                            subTitle: "This is a great!",
                            imageUrl: "https://img.freepik.com/free-photo/young-pretty-woman-eating-pizza-pizza-bar_1303-20333.jpg?w=2000&t=st=1702400419~exp=1702401019~hmac=5db3063133fc5a5a8e12542aa0187b91f10beb089b9d6ea7b7676b4d01a6907e",
                            description: "Ready in under 20 minutes, makes for a satisfying weeknight treat for one."
                        }
                    ],
                    action: {
                        type: "push",
                        destination: "menuItemDetail"
                    }
                }
            }
        ]
    }
    res.json(model)
})

app.get("/menu-item-detail/:itemId", (req, res) => {
    const menuItemId = parseInt(req.params.itemId)
    const item = menuItems.find(item => item.itemId == menuItemId)

    const model = {
        pageTitle: "Menu Item Detail",
        components: [
            {
                type: "featuredImage",
                data: {
                    imageUrl: item.imageUrl
                }
            },
            {
                type: "textRow",
                data: {
                    text: item.description
                }
            },
            {
                type: "rating",
                data: {
                    rating: item.rating
                }
            },
            {
                type: "list",
                data: {
                    rows: [
                        {
                            id: 1,
                            title: "I love it!",
                            subTitle: "This is a great!",
                            imageUrl: "https://img.freepik.com/free-photo/young-pretty-woman-eating-pizza-pizza-bar_1303-20333.jpg?w=2000&t=st=1702400419~exp=1702401019~hmac=5db3063133fc5a5a8e12542aa0187b91f10beb089b9d6ea7b7676b4d01a6907e",
                            description: "Ready in under 20 minutes, makes for a satisfying weeknight treat for one."
                        }
                    ],
                    action: {
                        type: "push",
                        destination: "menuComments"
                    }
                }
            }
        ]
    }
    res.json(model)
}
)

app.get("/menu-list", (req, res) => {

    const model = {
        pageTitle: "Welcome to The Menu",
        components: [
            {
                type: "featuredImage",
                data: {
                    imageUrl: "https://img.freepik.com/premium-vector/burger-social-media-feed-post-template_123371-177.jpg?w=2000"
                }
            },
            {
                type: "carousel",
                data: {
                    items: menuItems.map(item => {
                        return {
                            itemId: item.itemId,
                            imageUrl: item.imageUrl,
                            itemTitle: item.title
                        }
                    }),
                    action: {
                        type: "sheet",
                        destination: "menuItemDetail"

                    }

                }
            },
            {
                type: "list",
                data: {
                    rows: [
                        {
                            id: 1,
                            title: "Appetizer",
                            subTitle: "This is a great appetizer!",
                            imageUrl: "https://img.freepik.com/free-photo/pretty-woman-beret-sniffs-fragrant-donut-portrait-girl-with-curly-hair-isolated-red-wall_197531-14359.jpg?w=2000&t=st=1701959556~exp=1701960156~hmac=09c3d07cf36b5b302c459f1d3ba0d717cb6e1ea0f92fe14cc2c0899ca4f5c412",
                            description: "Every meal featured among this menu has a specific meaning behind it."
                        },
                        {
                            id: 2,
                            title: "Nice discount",
                            subTitle: "This is a great discount!",
                            imageUrl: "https://img.freepik.com/free-photo/attractive-woman-with-afro-hair-surrounded-by-peanut-butter-jellly-sandwiches_273609-36508.jpg?w=2000&t=st=1701959653~exp=1701960253~hmac=6aad1d5f30ff75e91299f171ed0cc8cdfc58dd8dd0ae9765563a5e2d30129559"
                        }
                    ],
                    action: {
                        type: "sheet",
                        destination: "menuComments"
                    }
                }
            },
            {
                type: "featuredImage",
                data: {
                    imageUrl: "https://img.freepik.com/premium-vector/bakery-hand-drawn-ig-stories-set_23-2149486151.jpg?w=2000"
                }
            }
        ]
    }
    res.json(model)
})

app.listen(3000, () => {
    console.log("Server is running...")
})
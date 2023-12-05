const express = require('express')
const app = express()

const menuItems = [
    {
        itemId: 1,
        imageUrl: 'https://images.unsplash.com/photo-1598515213692-5f252f75d785?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description: 'Every meal featured among The Menu movie dishes has a specific meaning behind it.',
        rating: 5
    },
    {
        itemId: 2,
        imageUrl: 'https://images.unsplash.com/photo-1609167830220-7164aa360951?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description: 'The Menu is centered around a unique dinner experience on the island called Hawthorne, where twelve guests dine at an exclusive restaurant owned by celebrity chef Julian Slowik.',
        rating: 4
    },
    {
        itemId: 3,
        imageUrl: 'https://images.unsplash.com/photo-1528738064262-9f834cbdfda1?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description: 'The twelve guests consist of wealthy businessmen, celebrities, food critics and others who can offer such an expensive restaurant experience, standing in stark contrast with the kitchen staff who lives and works on the island with the Chef to earn their living and provide the service the wealthy minority has paid for.',
        rating: 3
    },
    {
        itemId: 4,
        imageUrl: 'https://images.unsplash.com/photo-1530524428108-f983ca74ad0f?q=80&w=3276&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 
        description: 'Every meal featured among The Menu movie dishes has a specific meaning behind it.',
        rating: 2
    },
    {
        itemId: 5,
        imageUrl: 'https://images.unsplash.com/photo-1589378884250-431463f05637?q=80&w=3348&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description: 'Every meal featured among The Menu movie dishes has a specific meaning behind it. The Menu is centered around a unique dinner experience on the island called Hawthorne, where twelve guests dine at an exclusive restaurant owned by celebrity chef Julian Slowik.',
        rating: 1
    }
]

app.get('/menu-item-detail/:itemId', (req, res) => {
    const menuItemId = parseInt(req.params.itemId)
    const item = menuItems.find(item => item.itemId == menuItemId)

    const model = {
        pageTitle: 'Menu Item Detail',
        components: [
            {
            type: 'featuredImage',
            data: {
                imageUrl: item.imageUrl
                }
            },
            {
                type: 'textRow',
                data: {
                    text: item.description
                }
            },
            {
                type: 'rating',
                data: {
                    rating: item.rating
                }
            }
        ]
    }
    res.json(model)
}
)

app.get('/menu-list', (req, res) => {
    
    const model = {
        pageTitle: 'The Menu',
        components: [
            {
                type: 'featuredImage',
                data: {
                    imageUrl: "https://plus.unsplash.com/premium_photo-1667682942148-a0c98d1d70db?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                }
            }, 
            {
            type: 'carousel',
            data: {
                items: menuItems.map(item => {
                    return {
                        itemId: item.itemId,
                        imageUrl: item.imageUrl
                    }
                }),
                action: {
                    type: 'sheet',
                    destination: 'menuItemDetail'

                }

            }
        },
        {
            type: 'featuredImage',
            data: {
                imageUrl: "https://images.unsplash.com/photo-1589378884250-431463f05637?q=80&w=3348&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            }
        },
        {
            type: 'list',
            data: {
                rows: menuItems,
                action: {
                    type: 'push',
                    destination: 'menuItemDetail'
                }
            }
        }
        ]
    }
    res.json(model)
})

app.listen(3000, () => {
    console.log('Server is running...')
})
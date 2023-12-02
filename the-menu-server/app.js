const express = require('express')
const app = express()

app.get('/menu-list', (req, res) => {
    
    const model = {
        pageTitle: 'The Menu',
        components: [
            {
                type: 'featuredImage',
                data: {
                    imageUrl: "https://plus.unsplash.com/premium_photo-1667682942148-a0c98d1d70db?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                }
            }
        ]
    }
    res.json(model)
})

app.listen(3000, () => {
    console.log('Server is running...')
})
const path = require('path')
const express = require('express')
const mysql = require('mysql2')
const cors = require('cors')

const app = express()
app.use(cors())
app.use(express.json())
app.use(express.static(__dirname))

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'))
})

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'kjvkarthik#3010',
    database: 'classroom_management',
    authPlugins: {
        mysql_native_password: () => () => Buffer.from('')
    }
})

db.connect(err => {
    if (err) {
        console.log('Connection Failed:', err)
    } else {
        console.log('Connected to MySQL 🔥')
    }
})

app.get('/students', (req, res) => {
    db.query('SELECT * FROM student', (err, result) => {
        if (err) return res.status(500).json(err)
        res.json(result)
    })
})

app.post('/students', (req, res) => {
    const student = {
        reg_no: req.body.reg_no,
        f_name: req.body.f_name,
        l_name: req.body.l_name,
        email: req.body.email
    }

    db.query(
        'INSERT INTO student (reg_no, f_name, l_name, email) VALUES (?, ?, ?, ?)',
        [student.reg_no, student.f_name, student.l_name, student.email],
        (err, result) => {
            if (err) {
                console.log(err)
                return res.status(500).json({ message: 'Insert failed', error: err })
            }
            res.json({ message: 'Student added successfully' })
        }
    )
})

app.get('/lecturers', (req, res) => {
    db.query('SELECT * FROM lecturer', (err, result) => {
        if (err) return res.status(500).json(err)
        res.json(result)
    })
})

app.post('/lecturers', (req, res) => {
    const lecturer = req.body
    db.query('INSERT INTO lecturer SET ?', lecturer, (err, result) => {
        if (err) return res.status(500).json(err)
        res.json({ message: 'Lecturer added', result })
    })
})

const PORT = process.env.PORT || 8000

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT} 🚀`)
})
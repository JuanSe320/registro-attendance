const { Router } = require('express');

const router = Router();

router.get('/tasks',(req,res) =>{
    res.send('retornando lista de tareas')
})

router.get('/tasks/10',(req,res) =>{
    res.send('retornando una sola tarea')
})

router.post('/tasks',(req,res) =>{
    res.send('creando una tarea')
})

router.delete('/tasks',(req,res) =>{
    res.send('eliminando una tarea')
})

router.put('/tasks',(req,res) =>{
    res.send('actualizar una tarea')
})

module.exports = router;
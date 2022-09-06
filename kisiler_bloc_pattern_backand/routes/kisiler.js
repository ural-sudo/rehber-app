
const express = require('express');
const kisiController = require('../controller/kisiler');
const router = express.Router();


router.post('/post',kisiController.postKisi);
router.get('/get',kisiController.getKisiler);
router.post('/patch',kisiController.updateKisi);
router.delete('/delete',kisiController.deleteKisi);
router.post('/search',kisiController.searchKisi);

module.exports = router;
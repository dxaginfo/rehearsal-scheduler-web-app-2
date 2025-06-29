// Backend entry: server.js
const express = require('express');
const app = express();
app.use(express.json());
app.get('/api/health', (req, res) => res.json({status:'ok'}));
// To be continued: booking, attendance, notifications routes...
app.listen(3001,()=>console.log('Server running on 3001'));

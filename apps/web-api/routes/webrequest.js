const { parsed: { SECONDHOP_URL } } = require('dotenv').config()
const http = require('http');
const newrelic = require('newrelic');
const logger = require('../logger')

const webrequest = (app, fs) => {
  // READ
  app.get('/webrequest', (req, res) => {
    console.log("hit first hop service");
    logger.info('First hop is executed');
    console.log(req.headers);
    logger.info(`URL: ${SECONDHOP_URL}/users`)

    http.get(`${SECONDHOP_URL}/users`, (resp) => {
      let data = '';

      // A chunk of data has been recieved.
      resp.on('data', (chunk) => {
        data += chunk;
      });

      // The whole response has been received. Print out the result.
      resp.on('end', () => {
        console.log('end', data)
        logger.info(data);
        res.send(data);
        newrelic.addCustomAttributes('userID','gqx293795');
      });

    }).on("error", (err) => {
      console.error(err);
      logger.error(err);
    });
  });

  app.get('/billing', async (req, res) => {
    console.log("hit billing route");
    logger.info('billing is executed');
    logger.info(`URL: ${SECONDHOP_URL}/confirmation`)

    await new Promise((resolve) => {
        setTimeout(resolve, random(500, 3000))
    })

    // Deliberately return a server error.
    if ( 1 == random(0, 1) ) {
      http.get(`${SECONDHOP_URL}/confirmation`, (resp) => {
        let data = '';
  
        // A chunk of data has been recieved.
        resp.on('data', (chunk) => {
          data += chunk;
        });
  
        // The whole response has been received. Print out the result.
        resp.on('end', () => {
          console.log('end', data)
          logger.info(data);
          res.send(data);
          newrelic.addCustomAttributes('userID','gqx293795');
        });
  
      }).on("error", (err) => {
        console.error(err);
        logger.error(err);
      });
    } else {
        const error = new Error('Order confirmation failed. Please try again.')
        logger.error(error);
        newrelic.noticeError(error)
        res.status(500).send(error);
    }
  });
};

module.exports = webrequest;

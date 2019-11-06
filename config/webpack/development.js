process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

stats: {
    errors: true;
    errorDetails: true;
    colors: true;
    optimizationBailout: true;
   }
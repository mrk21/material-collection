const path = require('path');
require('dotenv').config();

module.exports = {
  mode: 'development',
  entry: path.resolve(__dirname, 'src/index.tsx'),
  output: {
    path: path.resolve(__dirname, 'lib'),
    filename: 'index.js',
    publicPath: '/lib'
  },
  resolve: {
    extensions: ['.ts', '.tsx', '.js']
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: [{ loader: 'ts-loader' }]
      }
    ]
  },
  devtool: 'source-map',
  devServer: {
    host: `${process.env.DEV_SERVER_HOST || '127.0.0.1'}`,
    contentBase: path.resolve(__dirname),
    historyApiFallback: true,
    proxy: {
      '/api/graphql': `${process.env.APP_URL || 'http://localhost:3000'}`
    }
  }
};

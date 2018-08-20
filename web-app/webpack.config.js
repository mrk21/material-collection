const path = require('path');

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
    contentBase: path.resolve(__dirname),
    historyApiFallback: true,
    proxy: {
      '/graphql': `http://localhost:${process.env.DOCKER_HOST_APP_PORT}`
    }
  }
};

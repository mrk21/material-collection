import { ApolloClient } from 'apollo-client'
import { BatchHttpLink } from 'apollo-link-batch-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

const link = new BatchHttpLink({
  uri: '/api/graphql',
  batchMax: 50,
  fetch: (uri: string, options: any) => {
    const requests = JSON.parse(options.body)
    const opname = requests[0].operationName
    const count = requests.length
    return fetch(`${uri}/${opname}/batches/${count}`, options)
  }
})
const cache = new InMemoryCache()
export const graphqlClient = new ApolloClient({ link, cache })
export default graphqlClient

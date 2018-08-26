import { ApolloClient } from 'apollo-client'
import { BatchHttpLink } from 'apollo-link-batch-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

const link = new BatchHttpLink({ uri: '/graphql', batchMax: 50 })
const cache = new InMemoryCache()
export const graphqlClient = new ApolloClient({ link, cache })
export default graphqlClient

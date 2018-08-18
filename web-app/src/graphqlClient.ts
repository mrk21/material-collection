import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

const link = new HttpLink({ uri: '/graphql' })
const cache = new InMemoryCache()
export const graphqlClient = new ApolloClient({ link, cache })
export default graphqlClient
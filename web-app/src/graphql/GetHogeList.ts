import gql from 'graphql-tag'
import { Query } from "react-apollo";
import Hoge from '../entities/Hoge'

export interface GetHogeListData {
    hoges: Array<Hoge>
}

export interface GetHogeListVariables {}

export const GetHogeList = gql`
    query GetHogeList {
        hoges {
            id
            value
        }
    }
`

export class GetHogeListQuery extends Query<GetHogeListData, GetHogeListVariables> {}

export default GetHogeList
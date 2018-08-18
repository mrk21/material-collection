import * as React from 'react'
import HogeComponent from './HogeComponent'
import GetHogeList, { GetHogeListQuery } from '../graphql/GetHogeList'

export const HogeListComponent = () => (
    <GetHogeListQuery query={ GetHogeList } variables={{}} >
        {({ loading, data, error }) => {
            if (loading) return <div>loading...</div>
            if (error) return <div>error!</div>
            if (!data) return <div>hoges are empty</div>
            return (
                data.hoges.map((hoge) => (
                    <HogeComponent key={ hoge.id } hoge={ hoge } />
                ))
            )
        }}
    </GetHogeListQuery>
)
export default HogeListComponent
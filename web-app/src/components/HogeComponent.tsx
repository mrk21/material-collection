import * as React from 'react'
import Hoge from '../entities/Hoge'

export interface HogeComponentProps {
    hoge: Hoge
}

export const HogeComponent = (props: HogeComponentProps) => {
    return (
        <div>
            <p>{ props.hoge.value }</p>
        </div>
    )
}
export default HogeComponent

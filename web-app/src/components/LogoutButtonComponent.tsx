import * as React from 'react'
import { Redirect } from 'react-router-dom'
import LogoutUser, { LogoutUserMutation } from '../graphql/LogoutUser'

export const LogoutButtomComponent = () => (
  <LogoutUserMutation mutation={LogoutUser}>
    {(logoutUser, { loading, data, error }) => {
      if (data) return <Redirect to="/login" />
      return (
        <div>
          {loading ? <div>submitting...</div> : null}
          {error ? <div>{error.toString()}</div> : null}
          <form
            onSubmit={e => {
              e.preventDefault()
              if (loading) return
              logoutUser()
            }}
          >
            <button type="submit" disabled={loading}>
              logout
            </button>
          </form>
        </div>
      )
    }}
  </LogoutUserMutation>
)

export default LogoutButtomComponent

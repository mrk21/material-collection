import * as React from 'react'
import { Redirect } from 'react-router-dom'
import LoginUser, { LoginUserMutation } from '../graphql/LoginUser'

export const LoginComponent = () => (
  <LoginUserMutation mutation={LoginUser}>
    {(loginUser, { loading, data, error }) => {
      if (data) return <Redirect to="/" />
      let emailNode: HTMLInputElement | null
      let passwordNode: HTMLInputElement | null
      return (
        <div>
          {loading ? <div>submitting...</div> : null}
          {error ? <div>{error.toString()}</div> : null}
          <form
            onSubmit={e => {
              e.preventDefault()
              if (loading) return
              loginUser({
                variables: {
                  email: emailNode ? emailNode.value : '',
                  password: passwordNode ? passwordNode.value : ''
                }
              })
            }}
          >
            <p>
              <label>email:</label>
              <input
                type="text"
                name="email"
                ref={node => (emailNode = node)}
              />
            </p>
            <p>
              <label>password:</label>
              <input
                type="password"
                name="password"
                ref={node => (passwordNode = node)}
              />
            </p>
            <button type="submit" disabled={loading}>
              login
            </button>
          </form>
        </div>
      )
    }}
  </LoginUserMutation>
)

export default LoginComponent

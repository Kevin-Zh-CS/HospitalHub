import React, { Component } from 'react'
import Container from './components/main/container/Container'

const env = require('./.env.js')
const url = env.url;

class Home extends Component {
  constructor() {
    super()
    this.state = {
      bk_count: 0,
      cd_count: 0,
      br_count: 0
    }
  }
  async componentWillMount() {
    const raw = await fetch(url + '/api/count')
    const json = await raw.json()
    if (json.err) {
        alert('发生错误')
    } else {
      this.setState({
        bk_count: json.bkcnt,
        cd_count: json.cdcnt,
        br_count: json.brcnt
      })
    }
  }
  render() {
    return (
      <div style={{
        textAlign: 'center',
        fontSize: 50,
        display: 'flex',
        justifyContent: 'center',
      }}
      >
        <Container/>
      </div>
    )
  }
}

export default Home

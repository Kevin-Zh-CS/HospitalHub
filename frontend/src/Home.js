import React, { Component } from 'react'
import Container from './components/main/container/Container'

const env = require('./.env.js')
const url = env.url;

function Departments(props) {
  return (
    <>

    </>
  )
}

function Hospitals(props) {

}


class Home extends Component {
  constructor() {
    super()
    this.state = {
      departmentList: ["骨科", "外科"],
      hospitalList:["杭州第一人民医院", "杭州骨科"]
    }
  }
  async componentDidMount() {
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
      <div>
        <Departments>

        </Departments>
        <Hospitals>

        </Hospitals>
      </div>
    )
  }
}

export default Home

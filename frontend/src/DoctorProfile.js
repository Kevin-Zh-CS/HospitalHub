import React, { Component } from 'react'
import "./DoctorProfile.css"
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import Box from '@material-ui/core/Box';
import LocationCityIcon from '@material-ui/icons/LocationCity';
import EmojiObjectsIcon from '@material-ui/icons/EmojiObjects';
import AccountBalanceIcon from '@material-ui/icons/AccountBalance';
import EmailIcon from '@material-ui/icons/Email';

const env = require('./.env.js')
const url = env.url;

class Doctor {
    constructor(str) {
        var arr = str.split(',').map(item => item.trim())
        this.bno = arr[0]
        this.category = arr[1]
        this.title = arr[2]
        this.press = arr[3]
        this.year = arr[4]
        this.author = arr[5]
        this.price = arr[6].split('.')[0]
        this.total = arr[7]
        this.stock = arr[7]
    }
}

function StatusBar(props) {
  return (<Box 
          color={props.color}
          bgcolor={props.bgcolor}
          display="flex"
          flexDirection="column"
          justifyContent="center"
          alignItems="center"
          borderRadius="10px"
          width={(props.width) ? props.width : "30%"}
          height="80%"
          marginRight="3%"
          onClick={props.onClick}>
            <Box fontWeight="fontWeightMedium" fontSize="2.5em">{props.maintitle}</Box>
            <Box marginTop="2%" fontSize="2em">{props.content}</Box>
            {props.children}
        </Box>)
}

function Today(props) {
  if (props.online === true) {
    return (
      <Box alignItems="center" justifyContent="space-evenly" borderBottom={1} style={{height:"35vh", display:"flex", flexDirection:"row"}}>
        <StatusBar color="white" bgcolor="success.main" maintitle="今日状态" content="在线"></StatusBar>
        <StatusBar color="white" bgcolor="info.main" maintitle="当前排队人数" content={props.waiting}></StatusBar>
        <StatusBar color="white" bgcolor="primary.main" maintitle="预约挂号" content={"剩余：" + props.remain}>
          <Button style={{width:"18%", height:"28%", display:"block", position:"absolute"}} onClick={() => {alert("todo")}}></Button>
        </StatusBar>
      </Box>
    )
  } else {
    return (
      <Box alignItems="center" justifyContent="space-evenly" borderBottom={1} style={{height:"35vh", display:"flex", flexDirection:"row"}}>
        <StatusBar color="black" bgcolor="warning.main" maintitle="今日状态" content="离线" width="80%"></StatusBar>
      </Box>    
    )
  }
}

function Label(props) {
  return (<Box display="flex" fontSize="1em" flexDirection="row" alignItems="center" marginBottom="0.5em" >
      {props.children}
      <Box marginLeft="0.8em">{props.content}</Box>
  </Box>)
}

function Comments(comments) {
  if (comments.length === 0) {
    return (<Box>暂无评论</Box>)
  } else {
    return (<Box>暂无评论</Box>)
    // TODO LIST
  }
}


class DoctorProfile extends Component {
  constructor() {
    super()

    this.state = {
      doctor: {
        id: "",
        name: "",
        department: "",
        education: "",
        email: "",
        experience: "",
        gender: "",
        avatarURL: "",
        status: "",
        score: ""
      },
      comments: []
    }
  }
 
  async componentDidMount() {
    console.log(this.props.location.pathname.split('/')[2])
    //  split('/')[1])
    const raw = await fetch(url + "/doctor/detail?id=" + this.props.location.pathname.split('/')[2],  {
      method: "GET",
      headers: {
        'content-type': 'text/html'
      }})
      let body = await raw.json()
      let data = body.data
      if (body.status === "fail") alert("load fail")
      console.log(data)
      this.setState({
        doctor:{
          id: data.userId,
          name: data.trueName,
          department: data.departmentName,
          education: data.education,
          email: data.email,
          experience: data.experience,
          gender: data.gender,
          avatarURL: data.portraitUrl,
          status: data.arrangement[0],
          score: data.score,
          left: data.left
        },
        comments: data.commentDOList,
        waiting: data.waiting
      })
  }
  onColumnClick(ev, column) {
    const items = this.state.items
    let newItems = []
    for (let i = 0; i < items.length; i += 1) {
      newItems[i] = { ...items[i] }
    }
    const field = column.fieldName
    newItems = newItems.sort((a, b) => a[field] - b[field])
    this.setState({
      items: newItems,
    })
  }
  getSelectionDetails() {
    const selected = this.selection.getSelection().map(item => item.id)
    return selected
  }

  onInputChange = (event, text) => {
    let q = this.state.book
    q[event.target.labels[0].outerText] = text
    if (event.target.labels[0].outerText === 'total') {
        q['stock'] = text
    }
    console.log(this.state.book)
    this.setState({
      book: q
    })
  }

  async post() {
    const raw = await fetch(url + '/api/insertBook', {
        method: "POST",
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(this.state.book)
      })
      const items = await raw.json()
      if (!items.err) {
        console.log(items)
        alert("Insertion Complete")
      } else {
          alert(items.err)
      }
  }

  async onQueryClick() {
    for (let i in this.state.book) {
        if (this.state.book[i] === "") {
            alert("Attributes Can't not be empty")
            return
        }
    }
    this.post()
  }
  async onBatchChange(event, text) {
    await event;
    let books = []
    books = text.split('\n').filter(item => item.length > 0 && item.split(',').length === 8).map(item => new Doctor(item.trim()))
    this.setState({
        books: books
    })
  }

  async onBatchClick() {
    if (this.state.books.length === 0) {
        alert("Invalid files")
        return
    }
    const raw = await fetch(url + '/api/insertBooks', {
        method: "POST",
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(this.state.books)
      })
    const items = await raw.json()
    if (!items.err) {
        this.setState({
            type: "success",
            message: items.length + ' books imported. ' 
        })
    } else {
        this.setState({
            type: "error",
            message: items.err
        })
        console.log(items.err)
    }
  }

  render() {
    return (
      <div style={{display:"flex", flexDirection:"row",  alignItems:"flex-start", marginLeft: 10, marginRight: 10}}>

          <div class="doctorInfo" style={{display:"flex", flexDirection:"column", alignItems:"center", width:"30vw", marginRight:"1em", backgroundColor:""}}>
            <Avatar style={{marginTop:"10vh", marginBottom:"1em", width:"20vh", height:"20vh"}}>
              <img src={this.state.doctor.avatarURL} class="rounded"/>
            </Avatar>
            <Box fontSize="1.5em" fontWeight="fontWeightBold" marginBottom="1em">{this.state.doctor.name}</Box>

            <Box display="flex" flexDirection="column" width="90%">
              <Label content={this.state.doctor.department}>
                <AccountBalanceIcon></AccountBalanceIcon>
              </Label>
              <Label content={this.state.doctor.experience}>
                <EmojiObjectsIcon></EmojiObjectsIcon>
              </Label>
              <Label content={this.state.doctor.education}>
                <LocationCityIcon></LocationCityIcon>
              </Label>
              <Label content={this.state.doctor.email}>
                <EmailIcon></EmailIcon>
              </Label>
              <Box marginTop="1.2em" width="90%">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
              </Box>
            </Box>
          </div>

          <Box display="flex" flexDirection="column" width="100%">
            <div style={{display:"flex", flexDirection:"column", borderBottom:"1px", borderColor:"black",width:"100%"}}>
                <Today online={this.state.doctor.status} waiting={this.state.waiting} remain={this.state.doctor.left}></Today>
            </div>
            <Comments></Comments>
          </Box>
      </div>
    )
  }
}

export default DoctorProfile

import React, { Component } from 'react'
import { Nav } from 'office-ui-fabric-react/lib/Nav'
import { Panel, PanelType } from 'office-ui-fabric-react/lib/Panel'
import { Fabric } from 'office-ui-fabric-react/lib/Fabric'
import 'office-ui-fabric-react/dist/css/fabric.min.css'
import injectSheet from 'react-jss'
import IconButton from '@material-ui/core/IconButton';


import {
  HashRouter as Router,
  Route,
} from 'react-router-dom'
import { initializeIcons } from 'office-ui-fabric-react/lib/Icons';

import Home from './Home'
import DoctorProfile from './DoctorProfile'
import Login from './components/main/login/Login'
import Register from './components/main/register/Register'
import Footer from './components/main/footer/Footer'
import { Typography } from '@material-ui/core'

initializeIcons();
const styles = {
  App: {
    display: 'flex',
    flexDirection: 'column',
  },
  Header: {
    backgroundColor: '#000',
    color: '#FFF',
    display: 'flex',
    fontSize: 20,
    padding: 5,
    alignItems: 'center',

  },
  Icon: {
    color: '#FFF',
    marginRight: 20,
    marginLeft: 20,
    alignItems: 'center',
    display: 'flex',
    cursor: 'pointer',
  },
  grow: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: 10,
  },
  subject: {
    alignItems: 'center',
  }
}

class App extends Component {
  constructor() {
    super()

    this.state = {
      showPanel: false,
    }

    this.menu = [{
      links: [
        {
          name: 'Home',
          url: '#/',
        },
        {
          name: '医院详情',
          url: '#/HospitalInfo', // TODO
        },
        {
          name: '医生详情',
          url: '#/DoctorProfile',
        },
        {
          name: '工作台',
          url: '#/Workbench', // TODO 工作台
        },
        {
          name: '行程',
          url: '#/Schedule', // TODO
        },
        {
          name: '患者个人界面',
          url: '#/PatientAccount', // TODO 
        },
      ],
    }]
  }

  showPanel() {
    this.setState({
      showPanel: true,
    })
  }
  render() {
    return (
      <Router>
        <Fabric>
          <div className={this.props.classes.App}>
            <header className={this.props.classes.Header}>
              <i className={`${this.props.classes.Icon} ms-Icon ms-Icon--CollapseMenu`} onClick={this.showPanel.bind(this)} aria-hidden="true" />
              <Typography className={this.props.classes.subject}>Hospital Hub</Typography>
              <div className={this.props.classes.grow} />
              <IconButton
                edge="end"
                aria-label="register"
                // aria-controls={menuId}
                aria-haspopup="true"
                color="inherit"
              >
                <Register></Register>
              </IconButton>
              <IconButton
                edge="end"
                aria-label="login"
                aria-haspopup="true"
                color="inherit"
                onClick={() => { }}
              >
                <Login></Login>
              </IconButton>
            </header>

            <Panel
              isOpen={this.state.showPanel}
              type={PanelType.smallFixedNear}
              headerText="Menu"
              closeButtonAriaLabel="Close"
              isLightDismiss
              onDismiss={() => this.setState({ showPanel: false })}
              onRenderFooterContent={() => (
                <div className={this.props.classes.Side}>
                  <Nav groups={this.menu} expandedStateText={'expanded'} collapsedStateText={'collapsed'} />
                </div>
              )}
            />
            <div className={this.props.classes.Content}>
              <Route exact path="/" component={Home} />
              <Route path="/DoctorProfile" component={DoctorProfile} />
            </div>
          </div>
        </Fabric>
      </Router>
    )
  }
}

export default injectSheet(styles)(App)

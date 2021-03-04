import Login from 'ant-design-pro/lib/Login';
import { Alert, Checkbox } from 'antd';

const { Tab, UserName, Password, Mobile, Captcha, Submit } = Login;

class LoginDemo extends React.Component {
  state = {
    notice: '',
    type: 'tab2',
    autoLogin: true,    // var: 自动登录
  };
  onSubmit = (err, values) => {
    console.log('value collected ->', {
      ...values,
      autoLogin: this.state.autoLogin,
    });
    if (this.state.type === 'tab1') {
      this.setState(
        {
          notice: '',   // 提示
        },
        () => {
          if (!err && (values.username !== 'admin' || values.password !== '888888')) {  // 这里应该对username和password做查询处理
            setTimeout(() => {
              this.setState({
                notice: 'The combination of username and password is incorrect!',
              });
            }, 500);
          }
        }
      );
    }
  };
  onTabChange = key => {
    this.setState({
      type: key,
    });
  };
  changeAutoLogin = e => {
    this.setState({
      autoLogin: e.target.checked,
    });
  };
  render() {
    return (
      <div className="login-warp">
        <Login
          defaultActiveKey={this.state.type}
          onTabChange={this.onTabChange}
          onSubmit={this.onSubmit}
        >
          <Tab key="tab1" tab="Account">
            {this.state.notice && (
              <Alert
                style={{ marginBottom: 24 }}
                message={this.state.notice}
                type="error"
                showIcon
                closable
              />
            )}
            <UserName name="username" />
            <Password name="password" />
          </Tab>
          <Tab key="tab2" tab="Mobile">
            <Mobile name="mobile" />
            <Captcha onGetCaptcha={() => console.log('Get captcha!')} name="captcha" />
          </Tab>
          <div>
            <Checkbox checked={this.state.autoLogin} onChange={this.changeAutoLogin}>
              Keep me logged in
            </Checkbox>
            <a style={{ float: 'right' }} href="">
              Forgot password
            </a>
          </div>
          <Submit>Login</Submit>
          <div>
            <a style={{ float: 'right' }} href="">
              Register
            </a>
          </div>
        </Login>
      </div>
    );
  }
}

ReactDOM.render(<LoginDemo />, mountNode);
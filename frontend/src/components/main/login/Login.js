import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Modal from '@material-ui/core/Modal';
import Backdrop from '@material-ui/core/Backdrop';
import Fade from '@material-ui/core/Fade';
import AccountCircle from '@material-ui/icons/AccountCircle';
// import clsx from 'clsx';
// import { makeStyles } from '@material-ui/core/styles';
import IconButton from '@material-ui/core/IconButton';
import Input from '@material-ui/core/Input';
// import FilledInput from '@material-ui/core/FilledInput';
// import OutlinedInput from '@material-ui/core/OutlinedInput';
import InputLabel from '@material-ui/core/InputLabel';
import InputAdornment from '@material-ui/core/InputAdornment';
// import FormHelperText from '@material-ui/core/FormHelperText';
import FormControl from '@material-ui/core/FormControl';
// import TextField from '@material-ui/core/TextField';
import Visibility from '@material-ui/icons/Visibility';
import VisibilityOff from '@material-ui/icons/VisibilityOff';
// import IconButton from '@material-ui/core/IconButton';
import Divider from '@material-ui/core/Divider';
import ArrowDropUpIcon from '@material-ui/icons/ArrowDropUp';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import Button from '@material-ui/core/Button';

const url = "http://47.111.80.33:9800"

const useStyles = makeStyles((theme) => ({
  button: {
    margin: theme.spacing(4),
  },
  buttonWrapper: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center'
  },
  modal: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  paper: {
    backgroundColor: theme.palette.background.paper,
    border: '2px solid #000',
    boxShadow: theme.shadows[5],
    padding: theme.spacing(2, 4, 3),
  },
  margin: {
    margin: theme.spacing(1)
  },
  withoutLabel: {
    marginTop: theme.spacing(3)
  },
  textField: {
    marginLeft: theme.spacing(1),
    marginRight: theme.spacing(1),
    marginBottom: theme.spacing(1)
  }
}));

export default function Login() {
  const classes = useStyles();
  const [values, setValues] = React.useState({
    password: '',
    showPassword: false,
  });
  const [open, setOpen] = React.useState(false);

  const handleOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleChange = (prop) => (event) => {
    setValues({ ...values, [prop]: event.target.value });
  };

  const handleClickShowPassword = () => {
    setValues({ ...values, showPassword: !values.showPassword });
  };

  const handleMouseDownPassword = (event) => {
    event.preventDefault();
  };

  Login = async () => {
    const raw = await fetch(url + "/doctor/detail?id=" + this.props.location.pathname.split('/')[2],  {
      method: "GET",
      headers: {
        'content-type': 'text/html'
      },
      body: {
        'accountId': this.state.username,
        'encodedPassword': btoa(this.state.password)
      }
    })
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



  return (
    <div>
      {/* <button type="button" onClick={handleOpen}>
        react-transition-group
      </button> */}
      <AccountCircle onClick={handleOpen}></AccountCircle>
      <Modal
        aria-labelledby="transition-modal-title"
        aria-describedby="transition-modal-description"
        className={classes.modal}
        open={open}
        onClose={handleClose}
        closeAfterTransition
        BackdropComponent={Backdrop}
        BackdropProps={{
          timeout: 500,
        }}
      >
        <Fade in={open}>
          <div className={classes.paper}>
            <h2 id="transition-modal-title">登陆到 Hospital Hub</h2>
            <Divider />
            <FormControl
              fullWidth
              className={classes.margin}
              variant="filled"
            >
              <InputLabel htmlFor="filled-adornment-password">账号</InputLabel>
              <Input id="standard-basic" label="账号" onChange={handleChange("account")} />
            </FormControl>

            <FormControl
              fullWidth
              className={classes.margin}
              variant="filled"
            >

              <InputLabel htmlFor="filled-adornment-password">密码</InputLabel>
              <Input
                id="filled-adornment-password"
                type={values.showPassword ? "text" : "password"}
                value={values.password}
                onChange={handleChange("password")}
                endAdornment={
                  <InputAdornment position="end">
                    <IconButton
                      aria-label="toggle password visibility"
                      onClick={handleClickShowPassword}
                      onMouseDown={handleMouseDownPassword}
                      edge="end"
                    >
                      {values.showPassword ? <Visibility /> : <VisibilityOff />}
                    </IconButton>
                  </InputAdornment>
                }
              />
            </FormControl>

            <Divider />
            <div className={classes.buttonWrapper}>
              <div>
                <Button
                  variant="contained"
                  color="primary"
                  className={classes.button}
                  endIcon={<ArrowDropUpIcon />}
                  onClick={Login}
                >
                  登陆
            </Button>
              </div>
              <div>


                <Button
                  variant="contained"
                  color="primary"
                  className={classes.button}
                  endIcon={<ChevronRightIcon />}
                  onClick={() => { }}
                // 换出注册页面
                >
                  去注册
            </Button>
              </div>
            </div>

          </div>

        </Fade>
      </Modal>
    </div>
  );
}

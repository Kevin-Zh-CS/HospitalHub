import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Modal from '@material-ui/core/Modal';
import Backdrop from '@material-ui/core/Backdrop';
import Fade from '@material-ui/core/Fade';
// import AccountCircle from '@material-ui/icons/AccountCircle';
// import clsx from 'clsx';
// import { makeStyles } from '@material-ui/core/styles';
// import IconButton from '@material-ui/core/IconButton';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import InputAdornment from '@material-ui/core/InputAdornment';
import FormControl from '@material-ui/core/FormControl';
// import Visibility from '@material-ui/icons/Visibility';
// import VisibilityOff from '@material-ui/icons/VisibilityOff';
import Divider from '@material-ui/core/Divider';
import ArrowDropUpIcon from '@material-ui/icons/ArrowDropUp';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import Button from '@material-ui/core/Button';
import LocalHospitalIcon from '@material-ui/icons/LocalHospital';
import PhoneIcon from '@material-ui/icons/Phone';
import WcIcon from '@material-ui/icons/Wc';
import Select from '@material-ui/core/Select';
import MenuItem from '@material-ui/core/MenuItem';
import EmailIcon from '@material-ui/icons/Email';
import DescriptionIcon from '@material-ui/icons/Description';
import AddLocationIcon from '@material-ui/icons/AddLocation';
import Visibility from '@material-ui/icons/Visibility';
import VisibilityOff from '@material-ui/icons/VisibilityOff';
import IconButton from '@material-ui/core/IconButton';
import FingerprintIcon from '@material-ui/icons/Fingerprint';
import { Grid } from '@material-ui/core';
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
        marginBottom: theme.spacing(1),

    }
}));

export default function Login() {
    const classes = useStyles();
    const [values, setValues] = React.useState({
        password: '',
        showPassword: false,
        passwordConfirm: '',
        showPasswordConfirm: false
    });
    const [open, setOpen] = React.useState(false);

    const [gender, setgender] = React.useState('');

    const handleGenderChange = (event) => {
        setgender(event.target.value);
    };

    const handleOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    const handleInputChange = (prop) => (event) => {
        setValues({ ...values, [prop]: event.target.value });
    };

    const handleClickShowPassword = () => {
        setValues({ ...values, showPassword: !values.showPassword });
    };

    const handleMouseDownPassword = (event) => {
        event.preventDefault();
    };

    const handleClickShowPasswordConfirm = () => {
        setValues({ ...values, showPasswordConfirm: !values.showPasswordConfirm });
    };

    const handleMouseDownPasswordConfirm = (event) => {
        event.preventDefault();
    };


    return (
        <div>
            {/* <button type="button" onClick={handleOpen}>
        react-transition-group
      </button> */}
            <LocalHospitalIcon onClick={handleOpen}></LocalHospitalIcon>
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
                        <h2 id="transition-modal-title">加入 Hospital Hub</h2>
                        <Divider />


                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <PhoneIcon />
                                </Grid>
                                <Grid item>
                                    <InputLabel htmlFor="phoneNumber">手机号</InputLabel>
                                    <Input id="phoneNumber" label="手机号" onChange={handleInputChange("phoneNumber")} />
                                </Grid>
                            </Grid>
                        </div> */}

                        <FormControl className={classes.margin} fullWidth>
                            <InputLabel htmlFor="phoneNumber">手机号</InputLabel>
                            <Input
                                id="phoneNumber"
                                startAdornment={
                                    <InputAdornment position="start">
                                        <PhoneIcon />
                                    </InputAdornment>
                                }
                                onChange={handleInputChange("phoneNumber")}
                            />
                        </FormControl>

                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <FingerprintIcon />
                                </Grid>
                                <Grid item>
                                    <InputLabel htmlFor="trueName">真实姓名</InputLabel>
                                    <Input id="trueName" label="真实姓名" onChange={handleInputChange("trueName")} />
                                </Grid>
                            </Grid>
                        </div> */}


                        <FormControl className={classes.margin} fullWidth>
                            <InputLabel htmlFor="trueName">真实姓名</InputLabel>
                            <Input
                                id="trueName"
                                startAdornment={
                                    <InputAdornment position="start">
                                        <FingerprintIcon />
                                    </InputAdornment>
                                }
                                onChange={handleInputChange("trueName")}
                            />
                        </FormControl>

                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <WcIcon />
                                </Grid>
                                <Grid item>
                                    <FormControl >
                                        <InputLabel id="genderLabel">性别</InputLabel>
                                        <Select
                                            labelId="genderLabel"
                                            id="genderSelecter"
                                            value={gender}
                                            onChange={handleGenderChange}
                                            label="性别"

                                        >
                                            <MenuItem value={'male'}>男</MenuItem>
                                            <MenuItem value={'female'}>女</MenuItem>
                                        </Select>
                                    </FormControl>
                                </Grid>
                            </Grid>
                        </div> */}

                        
                        <FormControl variant="outlined" className={classes.margin} fullWidth>
                            <InputLabel id="genderLabel">
                                <InputAdornment position="start">
                                    <WcIcon />
                                </InputAdornment>
                            </InputLabel>

                            <Select
                                labelId="genderLabel"
                                id="genderSelecter"
                                value={gender}
                                onChange={handleGenderChange}
                                label="性别"

                            >
                                <MenuItem value={'male'}>男</MenuItem>
                                <MenuItem value={'female'}>女</MenuItem>
                            </Select>
                        </FormControl>

                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <EmailIcon />
                                </Grid>
                                <Grid item>
                                    <InputLabel htmlFor="trueName">邮箱</InputLabel>
                                    <Input id="email" label="邮箱" onChange={handleInputChange("email")} />
                                </Grid>
                            </Grid>
                        </div> */}

                        
                        <FormControl className={classes.margin} fullWidth>
                            <InputLabel htmlFor="email">邮箱</InputLabel>
                            <Input
                                id="email"
                                startAdornment={
                                    <InputAdornment position="start">
                                        <EmailIcon />
                                    </InputAdornment>
                                }
                                onChange={handleInputChange("email")}
                            />
                        </FormControl>

                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <DescriptionIcon />
                                </Grid>
                                <Grid item>
                                    <InputLabel htmlFor="history">病史</InputLabel>
                                    <Input id="history" label="病史" onChange={handleInputChange("history")} />
                                </Grid>
                            </Grid>
                        </div> */}


                        <FormControl className={classes.margin} fullWidth>
                            <InputLabel htmlFor="history">病史</InputLabel>
                            <Input
                                id="history"
                                startAdornment={
                                    <InputAdornment position="start">
                                        <DescriptionIcon />
                                    </InputAdornment>
                                }
                                onChange={handleInputChange("history")}
                            />
                        </FormControl>



                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <AddLocationIcon />
                                </Grid>
                                <Grid item>
                                    <InputLabel htmlFor="address">常住地址</InputLabel>
                                    <Input id="address" label="常住地址" onChange={handleInputChange("address")} />
                                </Grid>
                            </Grid>
                        </div> */}

                        <FormControl className={classes.margin} fullWidth>
                            <InputLabel htmlFor="address">常住地址</InputLabel>
                            <Input
                                id="address"
                                startAdornment={
                                    <InputAdornment position="start">
                                        <AddLocationIcon />
                                    </InputAdornment>
                                }
                                onChange={handleInputChange("address")}
                            />
                        </FormControl>

                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <InputLabel htmlFor="password">密码</InputLabel>
                                    <Input
                                        id="password"
                                        type={values.showPassword ? "text" : "password"}
                                        value={values.password}
                                        onChange={handleInputChange("password")}
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
                                </Grid>
                            </Grid>
                        </div> */}

                        <FormControl fullWidth className={classes.margin}
                        >

                            <InputLabel htmlFor="password">密码</InputLabel>
                            <Input
                                id="password"
                                type={values.showPassword ? "text" : "password"}
                                value={values.password}
                                onChange={handleInputChange("password")}
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

                        {/* <div className={classes.margin}>
                            <Grid container spacing={1} alignItems="flex-end">
                                <Grid item>
                                    <InputLabel htmlFor="passwordConfirm">确认密码</InputLabel>
                                    <Input
                                        id="passwordConfirm"
                                        type={values.showPasswordConfirm ? "text" : "password"}
                                        value={values.passwordConfirm}
                                        onChange={handleInputChange("passwordConfirm")}
                                        endAdornment={
                                            <InputAdornment position="end">
                                                <IconButton
                                                    aria-label="toggle password visibility confirm"
                                                    onClick={handleClickShowPasswordConfirm}
                                                    onMouseDown={handleMouseDownPasswordConfirm}
                                                    edge="end"
                                                >
                                                    {values.showPasswordConfirm ? <Visibility /> : <VisibilityOff />}
                                                </IconButton>
                                            </InputAdornment>
                                        }
                                    />
                                </Grid>
                            </Grid>
                        </div> */}

                        <FormControl fullWidth className={classes.margin}
                        >

                            <InputLabel htmlFor="passwordConfirm">确认密码</InputLabel>
                            <Input
                                id="passwordConfirm"
                                type={values.showPasswordConfirm ? "text" : "password"}
                                value={values.passwordConfirm}
                                onChange={handleInputChange("passwordConfirm")}
                                endAdornment={
                                    <InputAdornment position="end">
                                        <IconButton
                                            aria-label="toggle password visibility confirm"
                                            onClick={handleClickShowPasswordConfirm}
                                            onMouseDown={handleMouseDownPasswordConfirm}
                                            edge="end"
                                        >
                                            {values.showPasswordConfirm ? <Visibility /> : <VisibilityOff />}
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
                                    endIcon={<ChevronRightIcon />}
                                    onClick={() => { }}
                                // 换出注册页面
                                >
                                    注册
                                </Button>
                            </div></div>
                    </div>


                </Fade>
            </Modal>
        </div>
    );
}

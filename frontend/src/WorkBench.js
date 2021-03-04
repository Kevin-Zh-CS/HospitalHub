const { Component } = require("react");
const env = require('./.env.js')
const url = env.url;


class WorkBench extends Component {

    componentDidMount() {
        
    }

    constructor(props) {
        super(props)
    
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

    render () {
        return (
            <Box>
                工作台
            </Box>
        )
    }
}

export default WorkBench
import React from "react"
import PropTypes from "prop-types"
import { BrowserRouter as Router, Route} from "react-router-dom"
import ForumDetail from "./shared/ForumDetail"
import ForumTable from "./shared/ForumTable"
class Forum extends React.Component {

  constructor(props){
    super(props);
    
    this.state = {
      forums: this.props.forums
    };
  }
  

  render () {
    return (
      <Router basename={Routes.root_path()}>
        <Route path="/" exact component={()=> <ForumTable/>}/>
        <Route path="/dashboard/forums/:id" component={()=> <ForumDetail/>}/>
      </Router>
    );
  }
}

export default Forum

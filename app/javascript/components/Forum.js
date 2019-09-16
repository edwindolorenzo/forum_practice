import React from "react"
import PropTypes from "prop-types"
class Forum extends React.Component {

  constructor(props){
    super(props);
    
    this.state = {
      forums: this.props.forums
    };
  }
  

  render () {
    console.log(this.state.forums)
    return (
      <React.Fragment>
      </React.Fragment>
    );
  }
}

export default Forum

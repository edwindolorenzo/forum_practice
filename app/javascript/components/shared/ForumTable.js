import React from "react"
import PropTypes from "prop-types"
import {Link} from "react-router-dom"
import axios from "axios";
class ForumTable extends React.Component {

  constructor(props){
    super(props);

    this.state = {
      forums: []
    }
  }

  componentWillMount(){
    this.getData()
  }

  getData(){
    const url = Routes.root_path({format: "json"})
    axios.get(url)
      .then(response =>{
        this.setState({
          forums: response.data
        });
      })
  }

  render () {
    const {forums} = this.state
    return (
      <div className="container" >
          <h1>Welcome to Forum</h1>
          <div className="col-md-12">
            {forums.map( forum =>
              <div className="card" style={{padding: "10px", margin: "5px"}} key={forum.id}>
                <div className="card-body">
                  <div className="row">
                    <div className="col-md-2">
                    </div>
                    <div className= "col-md-10">
                      <h1>
                        <Link to={`/dashboard/forums/${forum.id}`}>{forum.title}</Link>
                      </h1>
                      <p>{forum.body}</p>
                      <div style={{textAlign: "right"}}>
                        Created by: {forum.id}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            )
            }
          </div>
      </div>
    );
  }
}

export default ForumTable

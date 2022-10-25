import React from "react";
import "./App.css";
import { BrowserRouter as Router, Route } from "react-router-dom";
import Fib from "./Fib";

function App() {
  return (
    <Router>
      <div className="App">
        <h2>Calculator fibonacci</h2>
        <div>
          <Route exact path="/" component={Fib} />
        </div>
      </div>
    </Router>
  );
}

export default App;

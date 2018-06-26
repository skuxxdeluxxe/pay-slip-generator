import React, {Component} from 'react';
import './App.css';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';
import Paper from 'material-ui/Paper';
import PaySlipRenderer from "./components/PaySlipRenderer";

const style = {
    marginLeft: 12,
};

class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            paySlip: undefined,
            error: undefined
        };
    };

    generatePaySlip() {
        fetch('http://localhost:5000/generate', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({firstName: this.firstName.getValue(), lastName: this.lastName.getValue(), paymentPeriod: this.paymentPeriod.getValue(),
                annualSalary: this.annualSalary.getValue(), superRate: this.superRate.getValue()})
        })
            .then(response => response.json())
            .then(data => this.setState(data));
    }

    onEnterPress = e => {
        if (e.key === 'Enter') {
            //this.generatePaySlip();
        }
    };

    render() {
        const paySlipRenderer = this.state.paySlip !== undefined ? <PaySlipRenderer paySlip={this.state.paySlip} error={this.state.error}/> : null;

        return (
            <MuiThemeProvider>
                <div className="centerize">
                    <Paper zDepth={1} className="content">
                        <h2>Pay Slip Generator</h2>
                        <TextField ref={ref => this.firstName = ref} onKeyUp={this.onEnterPress.bind(this)}
                                   hintText="First Name"/>
                        <TextField ref={ref => this.lastName = ref} onKeyUp={this.onEnterPress.bind(this)}
                                   hintText="Last Name"/>
                        <TextField ref={ref => this.paymentPeriod = ref} onKeyUp={this.onEnterPress.bind(this)}
                                   hintText="Payment Period"/>
                        <TextField ref={ref => this.annualSalary = ref} onKeyUp={this.onEnterPress.bind(this)}
                                   hintText="Annual Salary"/>
                        <TextField ref={ref => this.superRate = ref} onKeyUp={this.onEnterPress.bind(this)}
                                   hintText="Super Rate"/>
                        <RaisedButton  label="Generate" style={style} onClick={this.generatePaySlip.bind(this)}/>
                        {paySlipRenderer}
                    </Paper>
                </div>
            </MuiThemeProvider>
        );
    }
}

export default App;
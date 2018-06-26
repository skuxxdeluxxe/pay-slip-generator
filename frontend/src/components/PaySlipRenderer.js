import React, {Component} from 'react';
import PropTypes from 'prop-types';
import _ from 'lodash'

class PaySlipRenderer extends Component {

    propTypes = {
        paySlip: PropTypes.string.isRequired,
        error: PropTypes.string.isRequired
    };

    render() {
        const green = _.isEmpty(this.props.paySlip) ? 0 : 255;
        const red = _.isEmpty(this.props.error) ? 0 : 255
        const textColor = {
            backgroundColor: 'rgb(' + red + ', ' + green + ', 0)',
            padding: '15px'
        };

        if(_.isEmpty(this.props.error)) {
            return <div style={textColor}>"Generated Payslip: {this.props.paySlip}"</div>
        }

        return <div style={textColor}>"{this.props.error}"</div>
    }
}

export default PaySlipRenderer;
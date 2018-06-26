import React, {Component} from 'react';
import PropTypes from 'prop-types';

class Polarity extends Component {

    propTypes = {
        payslip: PropTypes.string.isRequired
    };

    render() {
        const green = 255 //Math.round((this.props.polarity + 1) * 128);
        const red = 0;
        const textColor = {
            backgroundColor: 'rgb(' + red + ', ' + green + ', 0)',
            padding: '15px'
        };

        return <div style={textColor}>"{this.props.payslip}"</div>
    }
}

export default Polarity;
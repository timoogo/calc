import React, { Component } from 'react';
import {
    View,
    Text
} from 'react';
import TouchableHighlight from './TouchableHighlight';
import Style from './Style';



 class InputButton extends Component {

    render() {
        return (
            <TouchableHighlight style={Style.inputButton}
                                underlayColor="#193441"
                                onPress={this.props.onPress}>
                <Text style={Style.inputButtonText}>{this.props.value}</Text>
            </TouchableHighlight>
        )
    }

}
export default InputButton
import axios from 'axios';
import {API_base_URL} from './constants';

let instance = axios.create({
    baseURL: API_base_URL
})

export default instance
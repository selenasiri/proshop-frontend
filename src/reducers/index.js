import { combineReducers} from 'redux'
import { productListReducer, productDetailsReducer } from './productReducers'
import { cartReducer } from './cartReducers'
import { userLoginReducer, userRegisterReducer, userDetailsReducer, userUpdateProfileReducer } from './userReducers'

const rootReducer = combineReducers({
  productList: productListReducer,
  productDetails: productDetailsReducer,
  cart: cartReducer,
  userLogin: userLoginReducer,
  userRegister: userRegisterReducer,
  userDetails: userDetailsReducer,
  userUpdateProfile: userUpdateProfileReducer,
})

const cartItemsFromStorage = localStorage.getItem('cartItems') 
  ? JSON.parse(localStorage.getItem('cartItems')) 
  : []

const userInfoFromStorage = localStorage.getItem('userInfo') 
  ? JSON.parse(localStorage.getItem('userInfo')) 
  : null

const initialState = {
  cart: { cartItems: cartItemsFromStorage },
  userLogin: { userInfo: userInfoFromStorage },
}

export {rootReducer, initialState} 
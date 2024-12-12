
import {BrowserRouter, Routes,Route, Navigate} from 'react-router-dom'
import Home from './pages/Home'
import SendToken from './pages/SendToken'
import Test from './pages/test'

function App() {

  

  return (
    <>
      <BrowserRouter>

    <Routes>

      <Route exact path='/' element={<Home/>} ></Route>
      <Route exact path='/send-token' element={<SendToken/>} ></Route>
      <Route exact path='/test' element={<Test/>} ></Route>
 

    </Routes>
      </BrowserRouter>
      
    </>
  )
}

export default App

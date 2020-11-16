import React from 'react'
import { Link, useParams  } from 'react-router-dom'
import { Row, Col, Image, ListGroup, Card, Button } from 'react-bootstrap'
import Rating from '../components/Rating'
import products from '../products'

const ProductScreen = () => {
  const {id} = useParams()
  const product = products.find(p => p._id === id)

  console.log(product)

  return (
    <>
      <Link className="btn btn-light my-3" to="/">Go Back</Link>
    </>
  )
}

export default ProductScreen

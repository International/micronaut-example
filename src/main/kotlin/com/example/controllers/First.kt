package com.example.controllers

import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get

@Controller("/hello")
class First {
  @Get("/")
  fun sayHi():String {
    return "hi"
  }
}
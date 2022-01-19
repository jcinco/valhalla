package com.example.valhallaassignment.data.datasource.remote.rest

import com.example.valhallaassignment.data.model.CommentResponseItem
import com.example.valhallaassignment.data.model.PostResponseItem
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path

interface Posts {

    @GET("/posts")
    fun getPosts(): Call<List<PostResponseItem>>

    @GET("/posts/{postId}/comments")
    fun getComments(@Path("postId") postId: Int): Call<List<CommentResponseItem>>
}
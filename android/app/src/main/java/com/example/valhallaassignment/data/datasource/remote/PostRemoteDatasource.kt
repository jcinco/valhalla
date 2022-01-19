package com.example.valhallaassignment.data.datasource.remote

import com.example.valhallaassignment.data.model.CommentResponseItem
import com.example.valhallaassignment.data.model.PostResponseItem

interface PostRemoteDatasource {
    fun getPosts(callback: (List<PostResponseItem>?) -> Unit?)
    fun getComments(postId: Int, callback: (List<CommentResponseItem>?) -> Unit?)
}
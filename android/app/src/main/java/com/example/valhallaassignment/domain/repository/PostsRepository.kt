package com.example.valhallaassignment.domain.repository

import com.example.valhallaassignment.domain.entity.Comment
import com.example.valhallaassignment.domain.entity.Post

interface PostsRepository {
    fun getPosts(onResult: (List<Post>?, Exception?) -> Unit?)
    fun getComments(postId: Int, onResult: (List<Comment>?, Exception?) -> Unit?)
}
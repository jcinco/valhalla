package com.example.valhallaassignment.data.repository

import android.content.Context
import com.example.valhallaassignment.data.datasource.remote.PostRemoteDatasource
import com.example.valhallaassignment.domain.entity.Comment
import com.example.valhallaassignment.domain.entity.Post
import com.example.valhallaassignment.domain.repository.PostsRepository

class PostsRepositoryImpl(
    val context: Context,
    val datasource: PostRemoteDatasource): PostsRepository {

    override fun getPosts(callback: (List<Post>?, Exception?) -> Unit?) {
        this.datasource.getPosts {
            it?.let {
                val final = it.map { res ->
                    Post(
                        id = res.id,
                        title = res.title,
                        body = res.body
                    )
                }
                callback(final, null)
            } ?: run {
                callback(listOf(), Exception("Failed to get posts"))
            }
        }
    }

    override fun getComments(postId: Int, callback: (List<Comment>?, Exception?) -> Unit?) {
        this.datasource.getComments(postId) {
            it?.let {
                val final = it.map {
                    Comment(
                        postId = it.postId,
                        name = it.name,
                        email = it.email,
                        body = it.body
                    )
                }
                callback(final, null)
            } ?: run {
                callback(listOf(), Exception("Failed to get comments"))
            }
        }
    }

}
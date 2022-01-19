package com.example.valhallaassignment.data.datasource.remote

import android.content.Context
import com.example.valhallaassignment.data.datasource.remote.rest.Posts
import com.example.valhallaassignment.data.datasource.remote.rest.RetrofitFactory
import com.example.valhallaassignment.data.model.CommentResponseItem
import com.example.valhallaassignment.data.model.PostResponseItem
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class PostRemoteDatasourceImpl(context: Context): PostRemoteDatasource {
    private val BASE_URL: String = "https://jsonplaceholder.typicode.com/"

    private var rest: Posts

    init {
        this.rest = RetrofitFactory.getInstance(context)
            .createClient(BASE_URL)
            .create(Posts::class.java)
    }

    override fun getPosts(callback: (List<PostResponseItem>?) -> Unit?) {
        val listener = object: Callback<List<PostResponseItem>> {
            override fun onResponse(
                call: Call<List<PostResponseItem>>,
                response: Response<List<PostResponseItem>>
            ) {
                callback(response.body() ?: listOf())
            }

            override fun onFailure(call: Call<List<PostResponseItem>>, t: Throwable) {
                callback(listOf())
            }

        }
        this.rest.getPosts().enqueue(listener)
    }


    override fun getComments(postId: Int, callback: (List<CommentResponseItem>?) -> Unit?) {
        this.rest.getComments(postId).enqueue(
            object: Callback<List<CommentResponseItem>> {
                override fun onResponse(
                    call: Call<List<CommentResponseItem>>,
                    response: Response<List<CommentResponseItem>>
                ) {
                    callback(response.body())
                }

                override fun onFailure(call: Call<List<CommentResponseItem>>, t: Throwable) {
                    callback(null)
                }

            }
        )
    }
}
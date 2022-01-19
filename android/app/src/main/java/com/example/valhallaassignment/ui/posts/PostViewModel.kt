package com.example.valhallaassignment.ui.posts

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.valhallaassignment.domain.entity.Post
import com.example.valhallaassignment.domain.repository.PostsRepository

class PostViewModel: ViewModel() {
    lateinit var repository: PostsRepository
    var isBusy: MutableLiveData<Boolean> = MutableLiveData(false)
    var posts: MutableLiveData<List<Post>> = MutableLiveData(listOf())

    fun loadPosts() {
        isBusy.value = true
        this.repository.getPosts { posts, exception ->
            this.isBusy.value = false
            if (exception == null) {
                this.posts.value = posts
            }
        }
    }
}
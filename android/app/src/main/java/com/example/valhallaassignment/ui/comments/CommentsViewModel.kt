package com.example.valhallaassignment.ui.comments

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.valhallaassignment.domain.entity.Comment
import com.example.valhallaassignment.domain.entity.Post
import com.example.valhallaassignment.domain.repository.PostsRepository

class CommentsViewModel: ViewModel() {
    lateinit var repository: PostsRepository
    var post: MutableLiveData<Post> = MutableLiveData()
    var isBusy: MutableLiveData<Boolean> = MutableLiveData(false)
    var comments: MutableLiveData<List<Comment>> = MutableLiveData(listOf())

    fun handlePost(post: Post?) {
        post?.let {
            this.post.value = it
            this.loadComments(it.id ?: -1)
        } ?: run {
            throw Exception("Null post info.")
        }
    }

    fun loadComments(postId: Int) {
        isBusy.value = true
        repository.getComments(postId) { comments, ex ->
            this.isBusy.value = false
            comments?.let {
                this.comments.value = it
            } ?: run {
                throw ex ?: java.lang.Exception("Failed to fetch comments")
            }

        }
    }

}
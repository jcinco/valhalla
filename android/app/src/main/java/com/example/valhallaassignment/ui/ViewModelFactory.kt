package com.example.valhallaassignment.ui

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.valhallaassignment.ui.comments.CommentsViewModel
import com.example.valhallaassignment.ui.posts.PostViewModel
import java.lang.IllegalArgumentException

object ViewModelFactory : ViewModelProvider.Factory {
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(PostViewModel::class.java)) {
            return PostViewModel() as T
        }
        else if (modelClass.isAssignableFrom(CommentsViewModel::class.java)) {
            return CommentsViewModel() as T
        }
        throw IllegalArgumentException("Unknown view model class")
    }

}
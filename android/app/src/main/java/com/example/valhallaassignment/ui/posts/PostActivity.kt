package com.example.valhallaassignment.ui.posts

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ProgressBar
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.valhallaassignment.R
import com.example.valhallaassignment.data.datasource.remote.PostRemoteDatasourceImpl
import com.example.valhallaassignment.data.repository.PostsRepositoryImpl
import com.example.valhallaassignment.databinding.ActivityMainBinding
import com.example.valhallaassignment.domain.entity.Post
import com.example.valhallaassignment.ui.ViewModelFactory
import com.example.valhallaassignment.ui.comments.CommentsActivity


class PostActivity : AppCompatActivity() {
    protected val viewModel: PostViewModel by lazy {
        ViewModelProvider(this, ViewModelFactory).get(PostViewModel::class.java)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initializeDependencies()
        setupDatabinding()

        this.viewModel.loadPosts()
    }

    fun initializeDependencies() {
        this.viewModel.repository = PostsRepositoryImpl(
            applicationContext,
            PostRemoteDatasourceImpl(applicationContext)
        )
    }

    fun setupDatabinding() {
        val binding = DataBindingUtil.setContentView<ActivityMainBinding>(this, R.layout.activity_main)
        binding.setLifecycleOwner(this)
        binding.viewModel = this.viewModel
        this.viewModel.posts.observe(this) { posts ->
            val rvPosts = findViewById<RecyclerView>(R.id.recyclerView)
            rvPosts?.also {
                it.layoutManager = LinearLayoutManager(applicationContext)
                (it.layoutManager as LinearLayoutManager).orientation = LinearLayoutManager.VERTICAL
                it.setHasFixedSize(true)
                it.adapter = PostAdapter(posts) { post, action ->
                    showDetails(post)
                }
            }
        }
    }

    fun showDetails(post: Post) {
        val intent = Intent(this, CommentsActivity::class.java)
        intent.putExtra("post", post)
        startActivity(intent)
    }
}
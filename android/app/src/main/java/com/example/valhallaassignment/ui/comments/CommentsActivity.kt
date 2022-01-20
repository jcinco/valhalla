package com.example.valhallaassignment.ui.comments

import android.os.Bundle
import android.os.PersistableBundle
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.valhallaassignment.R
import com.example.valhallaassignment.data.datasource.remote.PostRemoteDatasourceImpl
import com.example.valhallaassignment.data.repository.PostsRepositoryImpl
import com.example.valhallaassignment.databinding.ActivityDetailsBinding
import com.example.valhallaassignment.domain.entity.Post
import com.example.valhallaassignment.ui.ViewModelFactory


class CommentsActivity: AppCompatActivity()  {
    protected val viewModel: CommentsViewModel by lazy {
        ViewModelProvider(this, ViewModelFactory).get(CommentsViewModel::class.java)
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        this.setupDatabinding()
        this.initializeDependencies()

        if (this.intent.hasExtra("post")) {
            val post = this.intent.getParcelableExtra<Post>("post")
            this.viewModel.handlePost(post)
        }
        else {
            finish()
        }
    }

    fun initializeDependencies() {
        this.viewModel.repository = PostsRepositoryImpl(
            applicationContext,
            PostRemoteDatasourceImpl(applicationContext)
        )
    }

    fun setupDatabinding() {
        val binding = DataBindingUtil.setContentView<ActivityDetailsBinding>(this, R.layout.activity_details)
        binding.setLifecycleOwner(this)
        binding.viewModel = this.viewModel

        this.viewModel.comments.observe(this) {
            val rvComments = findViewById<RecyclerView>(R.id.rvComments)
            rvComments.layoutManager = LinearLayoutManager(applicationContext)
            (rvComments.layoutManager as LinearLayoutManager).orientation = LinearLayoutManager.VERTICAL
            rvComments.setHasFixedSize(true)
            rvComments.adapter = CommentsAdapter(it)
        }
    }
}
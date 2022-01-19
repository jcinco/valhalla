package com.example.valhallaassignment.ui.posts

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.RecyclerView
import com.example.valhallaassignment.R
import com.example.valhallaassignment.databinding.PostItemBinding
import com.example.valhallaassignment.domain.entity.Post

class PostAdapter(
    val posts: List<Post>,
    var clickListener: (post: Post, action: Int)->Unit?
): RecyclerView.Adapter<PostAdapter.PostViewHolder>() {
    lateinit var context: Context
    override fun getItemCount(): Int = posts.count()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PostViewHolder {
        return PostViewHolder(
            DataBindingUtil.inflate(
                LayoutInflater.from(parent.context),
                R.layout.post_item,
                parent,
                false
            ),
            clickListener
        )
    }

    override fun onBindViewHolder(holder: PostViewHolder, position: Int) {
        val post = posts[holder.adapterPosition]
        holder.itemPostItemBinding.post = post
    }

    inner class PostViewHolder(
        val itemPostItemBinding: PostItemBinding,
        val clickListener: (post: Post, action: Int) -> Unit?
    ): RecyclerView.ViewHolder(itemPostItemBinding.root) {}
}
package com.example.valhallaassignment.ui.comments

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.RecyclerView
import com.example.valhallaassignment.R
import com.example.valhallaassignment.databinding.CommentItemBinding
import com.example.valhallaassignment.domain.entity.Comment

class CommentsAdapter(
    val comments: List<Comment>
): RecyclerView.Adapter<CommentsAdapter.CommentViewHolder>() {
    override fun getItemCount(): Int = comments.count()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CommentViewHolder {
        return CommentViewHolder(
            DataBindingUtil.inflate(
                LayoutInflater.from(parent.context),
                R.layout.comment_item,
                parent,
                false
            )
        )
    }

    override fun onBindViewHolder(holder: CommentViewHolder, position: Int) {
        val comment = comments[holder.adapterPosition]
        holder.itemCommentBinding.comment = comment
    }

    inner class CommentViewHolder(
        val itemCommentBinding: CommentItemBinding
    ) : RecyclerView.ViewHolder(itemCommentBinding.root) {}
}
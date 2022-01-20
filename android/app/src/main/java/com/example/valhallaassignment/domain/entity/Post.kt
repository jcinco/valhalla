package com.example.valhallaassignment.domain.entity

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class Post(
    val id: Int?,
    val title: String?,
    val body: String?
) : Parcelable

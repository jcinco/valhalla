package com.example.valhallaassignment.data.datasource.remote.rest

import android.content.Context
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.converter.scalars.ScalarsConverterFactory


class RetrofitFactory(val context: Context) {
    companion object {
        @Volatile private var _instance: RetrofitFactory? = null
        fun getInstance(context: Context):RetrofitFactory = _instance ?: synchronized(this) {
            _instance ?: RetrofitFactory(context).also{ _instance = it}
        }
    }

    /**
     * Creates an instance of Retrofit for a given URL
     *
     * @param String - the base url
     * @return Retrofit - Instance of retrofit associated to the url
     */
    fun createClient(baseUrl: String): Retrofit {
        val retrofit: Retrofit = Retrofit.Builder()
            .baseUrl(baseUrl).client(OkHttpClient())
            .addConverterFactory(ScalarsConverterFactory.create())
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        return retrofit
    }

}
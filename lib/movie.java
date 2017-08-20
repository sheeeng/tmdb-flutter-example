package com.yourcompany.tmdb;

import android.database.Cursor;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/*
UDACITY_REVIEW
Awesome job implementing Parcelable!
By doing so, you can optimize your app to save dynamic data/state efficiently. Well done! :clap:
*/

/*
 * https://developers.themoviedb.org/3/movies/get-now-playing
 * https://developers.themoviedb.org/3/movies/get-popular-movies
 * https://developers.themoviedb.org/3/movies/get-top-rated-movies
 * https://developers.themoviedb.org/3/movies/get-upcoming
 */

public class Movie {
    private static final String TAG = Movie.class.getSimpleName();

    private String poster_path;
    private boolean adult;
    private String overview;
    private String release_date;
    private int[] genre_ids;
    private int id;
    private String original_title;
    private String original_language;
    private String title;
    private String backdrop_path;
    private Double popularity;
    private int vote_count;
    private boolean video;
    private Double vote_average;

    public Movie() {

    }

    public Movie(JSONObject movie) throws JSONException {
        //Log.d(TAG, movie.toString());

        this.poster_path = movie.getString("poster_path");
        this.adult = movie.getBoolean("adult");
        this.overview = movie.getString("overview");
        this.release_date = movie.getString("release_date");

        JSONArray jsonArray = movie.optJSONArray("genre_ids");
        if (jsonArray == null) {
            this.genre_ids = new int[0];
        } else {
            this.genre_ids = new int[jsonArray.length()];
            for (int i = 0; i < jsonArray.length(); ++i) {
                this.genre_ids[i] = jsonArray.getInt(i);
            }
        }

        this.id = movie.getInt("id");
        this.original_title = movie.getString("original_title");
        this.original_language = movie.getString("original_language");
        this.title = movie.getString("title");
        this.backdrop_path = movie.getString("backdrop_path");
        this.popularity = movie.getDouble("popularity");
        this.vote_count = movie.getInt("vote_count");
        this.video = movie.getBoolean("video");
        this.vote_average = movie.getDouble("vote_average");
    }

    public String getPosterPath() {
        return poster_path;
    }
    public Boolean getAdult() { return adult; }
    public String getOverview() {
        return overview;
    }
    public String getReleaseDate() {
        return release_date;
    }
    public int[] getGenreIds() { return genre_ids; }
    public int getId() { return id; }
    public String getOriginalTitle() { return original_title; }
    public String getOriginalLanguage() { return original_language; }
    public String getTitle() {
        return title;
    }
    public String getBackdropPath() { return backdrop_path; }
    public Double getPopularity() { return popularity; }
    public int getVoteCount() { return vote_count; }
    public Boolean getVideo() { return video; }
    public Double getVoteAverage() { return vote_average; }
}
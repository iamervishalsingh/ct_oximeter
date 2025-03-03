package com.vishalteam.oximeter;

public interface SearchResponse {

    void onSearchStarted();

    void onDeviceFounded(SearchData var1);

    void onSearchStopped();

    void onSearchCanceled();
}

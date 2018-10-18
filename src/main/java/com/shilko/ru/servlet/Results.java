package com.shilko.ru.servlet;

import java.util.ArrayList;
import java.util.List;

public class Results {

    {
        results = new ArrayList<ResultRow>();
    }

    public Results() {}

    public class ResultRow {
        double x,y,z;
        boolean match;
    }
    private List<ResultRow> results;

    public List<ResultRow> getResults() {
        return results;
    }

    public void setResults(List<ResultRow> results) {
        this.results = results;
    }
}

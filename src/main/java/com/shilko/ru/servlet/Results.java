package com.shilko.ru.servlet;

import java.util.ArrayList;
import java.util.List;

public class Results {

    {
        results = new ArrayList<ResultRow>();
    }

    public Results() {}

    private List<ResultRow> results;

    public void add(ResultRow resultRow) {
        results.add(resultRow);
    }

    public List<ResultRow> getResults() {
        return results;
    }

    public void setResults(List<ResultRow> results) {
        this.results = results;
    }
}

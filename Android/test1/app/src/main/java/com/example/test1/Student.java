package com.example.test1;

import java.io.Serializable;

public class Student implements Comparable<Student>, Serializable {
    private String id;
    private String name;
    private Double point;
    private Double toan;
    private Double ly;
    private Double hoa;

    public Double getToan() {
        return toan;
    }

    public void setToan(Double toan) {
        this.toan = toan;
    }

    public Double getLy() {
        return ly;
    }

    public void setLy(Double ly) {
        this.ly = ly;
    }

    public Student(String id, String name, Double toan, Double ly, Double hoa) {
        this.id = id;
        this.name = name;
        this.toan = toan;
        this.ly = ly;
        this.hoa = hoa;
    }

    public Double getHoa() {
        return hoa;
    }

    public void setHoa(Double hoa) {
        this.hoa = hoa;
    }

    public Student() {
    }

    public Student(String id, String name, Double point) {
        this.id = id;
        this.name = name;
        this.point = point;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPoint() {
        return toan + ly + hoa;
    }

    public void setPoint(Double point) {
        this.point = point;
    }

    public String GetFirstName() {
        int lastspace = name.lastIndexOf(" ");
        String firstname = "";
        if (lastspace != -1) {
            firstname = name.substring(lastspace + 1);
        } else firstname = name;
        return firstname.toLowerCase();
    }

    @Override
    public int compareTo(Student o) {

        return GetFirstName().compareTo(o.GetFirstName());
    }
}



package model;

public class Member {
    private String personalID;
    private String memberName;
    private String birthDay;

    public Member() {
    }

    public Member(String personalID, String memberName, String birthDay) {
        this.personalID = personalID;
        this.memberName = memberName;
        this.birthDay = birthDay;
    }

    public String getPersonalID() {
        return personalID;
    }

    public void setPersonalID(String personalID) {
        this.personalID = personalID;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }
}

package model;

public class HouseHoldBook {
    private String houseHoldId;
    private String ownerName;
    private int memberNumber;
    private String startDay;
    private String address;

    public HouseHoldBook() {
    }

    public HouseHoldBook(String houseHoldId, String ownerName, int memberNumber, String startDay, String address) {
        this.houseHoldId = houseHoldId;
        this.ownerName = ownerName;
        this.memberNumber = memberNumber;
        this.startDay = startDay;
        this.address = address;
    }

    public String getHouseHoldId() {
        return houseHoldId;
    }

    public void setHouseHoldId(String houseHoldId) {
        this.houseHoldId = houseHoldId;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public int getMemberNumber() {
        return memberNumber;
    }

    public void setMemberNumber(int memberNumber) {
        this.memberNumber = memberNumber;
    }

    public String getStartDay() {
        return startDay;
    }

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

<%--
  Created by IntelliJ IDEA.
  User: Gia Nguyen Store
  Date: 8/5/2022
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Accompanied Service List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../style/bootstrap/normalize.css">
    <link rel="stylesheet" href="../style/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../style/datatables/css/dataTables.bootstrap4.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
</head>
<body>
<form action="/contract">
<table class="table table-hover">
    <thead>
    <tr>
        <th>#</th>
        <th>Dịch vụ</th>
        <th>Khách hàng</th>
        <th>Ngày bắt đầu</th>
        <th>Ngày kết thúc</th>
        <th>Tiền đặt cọc</th>
        <th>Tổng tiền</th>
        <th>Các dịch vụ đi kèm</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>Room twin 01</td>
        <td>le la</td>
        <td> 12-12-2012</td>
        <td>23-12-2012</td>
        <td>350</td>
        <td>30050</td>
        <td>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createContract">
                +
            </button>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Danh sách các dịch vụ đi kèm
            </button>
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>House princess</td>
        <td> do van oai</td>
        <td> 12-10-2021</td>
        <td>03-12-2021</td>
        <td>350</td>
        <td>55550</td>
        <td>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createContract1">
                +
            </button>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Danh sách các dịch vụ đi kèm
            </button>
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>Room twin 02</td>
        <td>ha van</td>
        <td> 23-06-2013</td>
        <td>12-09-2014</td>
        <td>500</td>
        <td>56230</td>
        <td>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createContract2">
                +
            </button>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Danh sách các dịch vụ đi kèm
            </button>
        </td>
    </tr>
    </tbody>
    <div class="modal fade" id="createContract" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel">Contract</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="h3 text-warning fw-bold"> Tạo hợp đồng mới</p>
                    <input type="hidden" name="action" readonly>
                    <div>
                        <div class="row">
                            <div class="col-lg-3">Ngày bắt đầu :</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_bat_dau" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Ngày kết thúc</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_ket_thuc" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tien" class="form-label">Tiền </label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tien"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tong_tien" class="form-label">Tổng tiền </label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tong_tien"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Khách hàng thuê dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn khách hàng</option>
                                        <option>Diamond</option>
                                        <option>Platinum</option>
                                        <option>Gold</option>
                                        <option>Silver</option>
                                        <option>Member</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">Dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn dịch vụ</option>
                                        <option>Villa</option>
                                        <option>House</option>
                                        <option>Room</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ Bỏ</button>
                        <button type="button" class="btn btn-primary">Tạo hợp đồng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="createContract1" tabindex="-1" aria-labelledby="exampleModalLabe1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel1">Contract</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="h3 text-warning fw-bold"> Tạo hợp đồng mới</p>
                    <input type="hidden" name="action" readonly>
                    <div>
                        <div class="row">
                            <div class="col-lg-3">Ngày bắt đầu</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_bat_dau" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Ngày kết thúc</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_ket_thuc" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tien1" class="form-label">Tiền </label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tien1"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tong_tien1" class="form-label">Tổng tiền :</label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tong_tien1"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Khách hàng thuê dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn khách hàng</option>
                                        <option>Diamond</option>
                                        <option>Platinum</option>
                                        <option>Gold</option>
                                        <option>Silver</option>
                                        <option>Member</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">Dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn dịch vụ</option>
                                        <option>Villa</option>
                                        <option>House</option>
                                        <option>Room</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ Bỏ</button>
                        <button type="button" class="btn btn-primary">Tạo hợp đồng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="createContract2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel2">Contract</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="h3 text-warning fw-bold"> Tạo hợp đồng mới</p>
                    <input type="hidden" name="action" readonly>
                    <div>
                        <div class="row">
                            <div class="col-lg-3">Ngày bắt đầu</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_bat_dau" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Ngày kết thúc</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_ket_thuc" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tien2" class="form-label">Tiền </label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tien2"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tong_tien2" class="form-label">Tổng tiền </label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tong_tien2"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Khách hàng thuê dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn khách hàng</option>
                                        <option>Diamond</option>
                                        <option>Platinum</option>
                                        <option>Gold</option>
                                        <option>Silver</option>
                                        <option>Member</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">Dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn dịch vụ</option>
                                        <option>Villa</option>
                                        <option>House</option>
                                        <option>Room</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-9">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#createContract3">+
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ Bỏ</button>
                    <button type="button" class="btn btn-primary">Thêm Hợp Đồng</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="createContract3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel3">Contract</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="h3 text-warning fw-bold"> Cập nhật hợp đồng mới</p>
                    <input type="hidden" name="action" readonly>
                    <div>
                        <div class="row">
                            <div class="col-lg-3">Ngày bắt đầu :</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_bat_dau" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Ngày kết thúc</div>
                            <div class="col-lg-8"><input type="datetime-local" name="ngay_ket_thuc" class="form-control"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tien3" class="form-label">Tiền </label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tien3"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="tong_tien4" class="form-label">Tổng tiền </label></div>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="tong_tien4"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3">Khách hàng thuê dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn khách hàng</option>
                                        <option>Diamond</option>
                                        <option>Platinum</option>
                                        <option>Gold</option>
                                        <option>Silver</option>
                                        <option>Member</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">Dịch vụ</div>
                            <div class="col-lg-8">
                                <div>
                                    <select>
                                        <option>Chọn dịch vụ</option>
                                        <option>Villa</option>
                                        <option>House</option>
                                        <option>Room</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ Bỏ</button>
                        <button type="button" class="btn btn-primary">Tạo hợp đồng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</table></form>
<script src="../style/jquery/jquery-3.5.1.min.js"></script>
<script src="../style/datatables/js/jquery.dataTables.min.js"></script>
<script src="../style/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="../style/bootstrap/bootstrap.bundle.min.js"></script>

</body>
</html>

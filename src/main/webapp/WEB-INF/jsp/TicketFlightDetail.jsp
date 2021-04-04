<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade bd-example-modal-lg" id="detailModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalTitle">航班详细信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            航班编号：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="flightNoH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            飞机型号：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="aircraftH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            出发时间：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="scheduledDepartureH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            到达时间：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="scheduledArrivalH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            出发城市：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="departureCityH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            到达城市：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="arrivalCityH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            座位数：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="seatTotalH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            剩余座位数：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="seatEmptyH5"></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 offset-2">
                        <h5>
                            价格：
                        </h5>
                    </div>
                    <div class="col-4">
                        <h5 id="amountH5"></h5>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<script>
    function onDetail(id) {
        $("#flightNoH5").html(ticketData[id].flight.flightNo);
        $("#aircraftH5").html(ticketData[id].flight.aircraft);
        $("#scheduledDepartureH5").html(ticketData[id].flight.scheduledDeparture);
        $("#scheduledArrivalH5").html(ticketData[id].flight.scheduledArrival);
        $("#departureCityH5").html(ticketData[id].flight.departureCity);
        $("#arrivalCityH5").html(ticketData[id].flight.arrivalCity);
        $("#seatTotalH5").html(ticketData[id].flight.seatTotal);
        $("#seatEmptyH5").html(ticketData[id].flight.seatEmpty);
        $("#amountH5").html(ticketData[id].flight.amount);
        $("#detailModal").modal("show");
    }
</script>
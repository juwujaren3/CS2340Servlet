<%@ page import="database.Place" %>
<%@ page import="database.City" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%  final City currCity = (City) session.getAttribute("activeCity");
    List<Place> cityEvents = (currCity != null) ? currCity.getEvents() : new ArrayList<Place>();
    int eventCount = 0;
    if (cityEvents != null) {
        eventCount = cityEvents.size();
    }
%>

<div class="container">
    <div class="col-md-12">
        <h1 style="text-align: center; font-family: 'Lobster">Summary View</h1>

        <div class="well">
            <div id="myCarousel" class="carousel slide">
                <!-- Carousel items -->
                <div class="carousel-inner">

                    <div class="item active">
                        <div class="row">
                            <div class="col-sm-3"><a href="#x"><img src="../images/event.png" alt="Image" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-3"><a href="#x"><img src="../images/lodging.jpg" alt="Image" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-3"><a href="#x"><img src="../images/city.jpg" alt="Image" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-3"><a href="#x"><img src="http://placehold.it/500x500" alt="Image" class="img-responsive"></a>
                            </div>
                        </div>
                    </div>
                    <%
                        for (int curEventID = 0; curEventID < numberOfEvents; curEventID++) {
                        Place event = events.get(curEventID);
                        String panelColor = (curEventID % 2 == 0) ? "alert-success" : "alert-info";
                    %>
                        <% if (numberOfEvents % 2 == 0 && curEventID % 2 == 0) { %>
                        <div class="item">
                            <div class="row">
                        <% } else if (numberOfEvents % 2 != 0 && curEventID % 2 == 0) { %>
                        <div class="item">
                            <div class="row">
                        <% } %>
                                <div class="col-md-6">
                                    <div class="panel-body <%=panelColor%>">
                                        <h3 style="font-family: 'Monda'">
                                            <a href="<%=event.getURL()%>" target="_blank"><%=curEventID + 1%>. <%=event.getName()%>
                                            </a>
                                        </h3>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Address</th>
                                                    <th>Phone Number</th>
                                                    <th>Rating</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><div style="width: 200px;"><%=event.getFormattedAddress()%></div></td>
                                                    <td><%=event.getPhoneNumber()%></td>
                                                    <td><%=event.getRating()%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <% String checkIn = event.getCheckIn();
                                            String checkOut = event.getCheckOut();
                                            if (checkIn != null && checkOut != null) { %>
                                        <div class="alert alert-<%=panelColor%>" style="overflow-x: auto">
                                            <label>Start:&nbsp;&nbsp;</label><%=checkIn%>
                                            <span style="margin-left: 5px; margin-right: 5px;"><b>|</b></span>
                                            <label>End:&nbsp;&nbsp;</label><%=checkOut%>
                                        </div>

                                        <%  } %>
                                    </div>

                                </div>
                        <% if (numberOfEvents % 2 == 0 && (curEventID % 2 != 0 )) { %>
                            </div>
                        </div>
                        <% } else if (numberOfEvents % 2 != 0 && (curEventID % 2 != 0 || curEventID == numberOfEvents - 1)) { %>
                            </div>
                        </div>
                        <% } %>
                    <% } %>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>
            <!--/myCarousel-->
        </div>
        <!--/well-->
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#myCarousel').carousel({
            interval: 10000
        });

        $('#myCarousel').on('slid.bs.carousel', function() {
            //alert("slid");
        });


    });
</script>
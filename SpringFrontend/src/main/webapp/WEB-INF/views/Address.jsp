<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@include file="HeadScript.jsp"%>
<%@include file="NavBar.jsp"%>
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" role="form">
        <fieldset>

          <!-- Form Name -->
          <legend>Select a delivery address
</legend>
<p>Is the address you'd like to use displayed below? If so, click the corresponding "Deliver to this address" button. </p>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Line 1</label>
            <div class="col-sm-10">
              <input type="text" placeholder="Address Line 1" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Line 2</label>
            <div class="col-sm-10">
              <input type="text" placeholder="Address Line 2" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">City</label>
            <div class="col-sm-10">
              <input type="text" placeholder="City" class="form-control">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">State</label>
            <div class="col-sm-4">
              <input type="text" placeholder="State" class="form-control">
            </div>

            <label class="col-sm-2 control-label" for="textinput">Postcode</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Post Code" class="form-control">
            </div>
          </div>



          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Country</label>
            <div class="col-sm-10">
              <input type="text" placeholder="Country" class="form-control">
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-primary">Deliver to this address</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
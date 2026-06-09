<!-- Styles -->
<style>
#GrafikPerkembangan {
  width: 100%;
  height: 400px;
}
</style>

<div class="row">
  <div class="col-md-12">
    <table class="table table-bordered table-striped mb-3 mt-2" id="tabel_perkembangan">
      <thead>
        <tr>
          <th width="5%">No</th>
          <th>Perkembangan</th>
          <th width="10%">Jumlah</th>
        </tr>
      </thead>
      <tbody>
        
      </tbody>
    </table>
    <hr>
    <script>
      $(document).ready(function(){

      $('#tabel_perkembangan').DataTable({
          processing: true,
          searching: true,
          ajax: {
              url: "{{ asset('admin/statistik/perkembangan') }}",
              dataSrc: ""
          },
          columns: [
              {
                  data: null,
                  render: function (data, type, row, meta) {
                      return meta.row + 1;
                  }
              },
              { data: "nama_perkembangan" },
              { data: "value" }
          ],
          dom: 'Bfrtip',
          buttons: [
              {
                  extend: 'excelHtml5',
                  title: 'Data Perkembangan'
              },
              {
                  extend: 'pdfHtml5',
                  title: 'Data Perkembangan'
              },
              {
                  extend: 'print',
                  title: 'Data Perkembangan'
              }
          ]
      });
      });
    </script>
  </div>
  <div class="col-md-12">
    <!-- Chart code -->
    <script>
    am5.ready(function() {
    // Create root element
    // https://www.amcharts.com/docs/v5/getting-started/#Root_element
    var root = am5.Root.new("GrafikPerkembangan");
    // Set themes
    // https://www.amcharts.com/docs/v5/concepts/themes/
    root.setThemes([
      am5themes_Animated.new(root)
    ]);
    // Create chart
    // https://www.amcharts.com/docs/v5/charts/xy-chart/
    var chart = root.container.children.push(am5xy.XYChart.new(root, {
      panX: true,
      panY: true,
      wheelX: "panX",
      wheelY: "zoomX",
      pinchZoomX: true,
      paddingLeft:0,
      paddingRight:1
    }));
    // Add cursor
    // https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
    var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
    cursor.lineY.set("visible", false);
    // Create axes
    // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
    var xRenderer = am5xy.AxisRendererX.new(root, { 
      minGridDistance: 30, 
      minorGridEnabled: true
    });
    xRenderer.labels.template.setAll({
      rotation: -45,
      centerY: am5.p50,
      centerX: am5.p100,
      paddingRight: 15
    });
    xRenderer.grid.template.setAll({
      location: 1
    })
    var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
      maxDeviation: 0.3,
      categoryField: "nama_perkembangan",
      renderer: xRenderer,
      tooltip: am5.Tooltip.new(root, {})
    }));
    var yRenderer = am5xy.AxisRendererY.new(root, {
      strokeOpacity: 0.1
    })
    var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
      maxDeviation: 0.3,
      renderer: yRenderer
    }));
    // Create series
    // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
    var series = chart.series.push(am5xy.ColumnSeries.new(root, {
      name: "Series 1",
      xAxis: xAxis,
      yAxis: yAxis,
      valueYField: "value",
      sequencedInterpolation: true,
      categoryXField: "nama_perkembangan",
      tooltip: am5.Tooltip.new(root, {
        labelText: "{valueY}"
      })
    }));
    series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5, strokeOpacity: 0 });
    // Label jumlah di ujung bar
    series.bullets.push(function () {
      return am5.Bullet.new(root, {
        locationY: 1,
        sprite: am5.Label.new(root, {
          text: "{valueY}",
          fill: am5.color(0x000000),
          centerX: am5.p50,
          centerY: am5.p100,
          dy: -10,
          populateText: true
        })
      });
    });
    series.columns.template.adapters.add("fill", function (fill, target) {
      return chart.get("colors").getIndex(series.columns.indexOf(target));
    });
    series.columns.template.adapters.add("stroke", function (stroke, target) {
      return chart.get("colors").getIndex(series.columns.indexOf(target));
    });
    var exporting = am5plugins_exporting.Exporting.new(root, {
      menu: am5plugins_exporting.ExportingMenu.new(root, {}),
      filePrefix: "grafik_perkembangan"
    });
    // Set data
    fetch("{{ url('admin/statistik/perkembangan') }}")
    .then(response => response.json())
    .then(function(data){
      // isi data ke chart
      xAxis.data.setAll(data);
      series.data.setAll(data);
      // export pakai data yang sama
      exporting.set("dataSource", data);
    });
    xAxis.data.setAll(data);
    series.data.setAll(data);
    var exporting = am5plugins_exporting.Exporting.new(root, {
      menu: am5plugins_exporting.ExportingMenu.new(root, {}),
      dataSource: data,
      filePrefix: "grafik_perkembangan"
    });
    // Make stuff animate on load
    // https://www.amcharts.com/docs/v5/concepts/animations/
    series.appear(1000);
    chart.appear(1000, 100);
    }); // end am5.ready()
    </script>
    <!-- HTML -->
    <div id="GrafikPerkembangan"></div>
  </div>
</div>


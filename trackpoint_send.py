import gpxpy
import liblo
import time

gpx_file = open('2386872.gpx', 'r')
gpx_data = gpxpy.parse(gpx_file)
gpx_file.close()
points = gpx_data.tracks[0].segments[0].points

print min([i.latitude for i in points])
print max([i.latitude for i in points])

for index in range(len(points) - 1):
    lat = points[index].latitude
    nextlat = points[index+1].latitude
    lon = points[index].longitude
    nextlon = points[index+1].longitude
    delta = (points[index+1].time - points[index].time).seconds

    liblo.send(('127.0.0.1', '57120'), '/test')
    print float(nextlat - lat)
    time.sleep(delta)

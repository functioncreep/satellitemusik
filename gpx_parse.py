import xml.etree.ElementTree as ET

tree = ET.parse('2378861.gpx')
root = tree.getroot()

print root.tag
print root.attrib

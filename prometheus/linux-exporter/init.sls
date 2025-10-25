# This system is Linux and amd64
{% if grains['kernel'] == 'Linux' and grains['cpuarch'] == 'x86_64' %}
# Download the file with a source sha256sum
linux_exporter_file:
    file.managed:
        - name: /opt/node_exporter-1.9.1.linux-amd64.tar.gz
        - source: https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
        - source_hash: https://github.com/prometheus/node_exporter/releases/download/v1.9.1/sha256sums.txt
        - mode: '0755'
        - unless: test -f /opt/node_exporter-1.9.1.linux-amd64.tar.gz

# Push the systemd service file
node_exporter_service_file:
    file.managed:
        - name: /usr/lib/systemd/system/node_exporter.service
        - source: salt://prometheus/linux-exporter/files/node_exporter.service
        - mode: '0644'
        - template: jinja
        - context:
            node_exporter_path: node_exporter-1.9.1.linux-amd64

# This system is Linux and arm64
{% elif grains['kernel'] == 'Linux' and grains['cpuarch'] == 'arm64' %}
linux_exporter_file:
    file.managed:
        - name: /opt/node_exporter-1.9.1.linux-amd64.tar.gz
        - source: https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-armv7.tar.gz
        - source_hash: https://github.com/prometheus/node_exporter/releases/download/v1.9.1/sha256sums.txt
        - mode: '0755'
        - unless: test -f /opt/node_exporter-1.9.1.linux-armv7.tar.gz

{% else %}
# This system is not Linux or not a supported architecture
{% endif %}

# Extract the downloaded file
linux_exporter_extract:
    cmd.run:
        - name: tar -xzf /opt/node_exporter-1.9.1.linux-amd64.tar.gz -C /opt/
        - unless: test -d /opt/node_exporter-1.9.1.linux-amd64

# Enable and start the node_exporter service
node_exporter_service:
    service.running:
        - name: node_exporter
        - enable: True
        - require:
            - file: node_exporter_service_file

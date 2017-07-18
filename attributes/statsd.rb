default['dataloop']['agent']['statsd']['listener']['address'] = '0.0.0.0'
default['dataloop']['agent']['statsd']['listener']['port'] = 8125

default['dataloop']['agent']['statsd']['behavior']['flushInterval'] = 10
default['dataloop']['agent']['statsd']['behavior']['ingesterQueueSize'] = 100000
default['dataloop']['agent']['statsd']['behavior']['deleteIdleStats'] = 'false'
default['dataloop']['agent']['statsd']['behavior']['deleteGauges'] = 'false'
default['dataloop']['agent']['statsd']['behavior']['deleteTimers'] = 'false'
default['dataloop']['agent']['statsd']['behavior']['deleteSets'] = 'false'
default['dataloop']['agent']['statsd']['behavior']['deleteCounters'] = 'false'
default['dataloop']['agent']['statsd']['behavior']['keyNameSanitize'] = 'true'


default['dataloop']['agent']['statsd']['graphite']['globalPrefix'] = 'stats'
default['dataloop']['agent']['statsd']['graphite']['prefixCounter'] = 'counters'
default['dataloop']['agent']['statsd']['graphite']['prefixTimer'] = 'timers'
default['dataloop']['agent']['statsd']['graphite']['prefixGauge'] = 'gauges'
default['dataloop']['agent']['statsd']['graphite']['prefixSet'] = 'sets'

default['dataloop']['agent']['statsd']['aggregation']['percentThreshold'] = "[ 90, 95, 99 ]"
default['dataloop']['agent']['statsd']['aggregation']['histograms']['response_time'] = "[0.1, 1.0, 10.0, inf]"
default['dataloop']['agent']['statsd']['aggregation']['histograms']['e2e_time'] = "[1.0, 10.0, 100.0, inf]"

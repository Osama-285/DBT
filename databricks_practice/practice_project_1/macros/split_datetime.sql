{% macro split_datetime(col) %}
extract(year from {{ col }}) as year,
extract(month from {{ col }}) as month,
extract(day from {{ col }}) as day,
extract(hour from {{ col  }}) as hour,
extract(minute from {{ col }}) as minute
{% endmacro %}
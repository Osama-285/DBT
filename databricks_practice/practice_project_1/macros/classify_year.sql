{% macro classify_year(total_sales) %}
    case
        when {{ total_sales }} < 60000 then 'Low Value Year'
        when {{ total_sales }} >= 60000 and {{ total_sales }} < 80000 then 'MID value Year'
        when {{ total_sales }} >= 90000 then 'High value Year'
        else 'Other'
    end
{% endmacro %}
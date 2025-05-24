{% macro generate_schema_name(custom_schema_name, node) %}
  {%- if custom_schema_name is not none and custom_schema_name != "" -%}
    {{ return(custom_schema_name) }}
  {%- else -%}
    {{ return(target.schema) }}
  {%- endif -%}
{% endmacro %}

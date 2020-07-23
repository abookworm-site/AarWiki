# Oracle & Java 数据类型对比


|SQL数据类型| JDBC类型代码| 标准的Java类型| Oracle扩展的Java类型|
|----|----|----|----|
| |**1.0标准的JDBC类型如下**| |
|CHAR|java.sql.Types.CHAR|java.lang.String|oracle.sql.CHAR|
|VARCHAR2|java.sql.Types.VARCHAR|java.lang.String|oracle.sql.CHAR|
|LONG|java.sql.Types.LONGVARCHAR|java.lang.String|oracle.sql.CHAR|
|NUMBER|java.sql.Types.NUMERIC|java.math.BigDecimal|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.DECIMAL|java.math.BigDecimal|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.BIT|boolean|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.TINYINT|byte|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.SMALLINT|short|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.INTEGER|int|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.BIGINT|long|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.REAL|float|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.FLOAT|double|oracle.sql.NUMBER|
|NUMBER|java.sql.Types.DOUBLE|double|oracle.sql.NUMBER|
|RAW|java.sql.Types.BINARY|byte[]|oracle.sql.RAW|
|RAW|java.sql.Types.VARBINARY|byte[]|oracle.sql.RAW|
|LONGRAW|java.sql.Types.LONGVARBINARY|byte[]|oracle.sql.RAW|
|DATE|java.sql.Types.DATE|java.sql.Date|oracle.sql.DATE|
|DATE|java.sql.Types.TIME|java.sql.Time|oracle.sql.DATE|
|TIMESTAMP|java.sql.Types.TIMESTAMP|javal.sql.Timestamp|oracle.sql.TIMESTAMP|
| |**2.0 标准的JDBC类型如下**| |
|BLOB|java.sql.Types.BLOB|java.sql.Blob|oracle.sql.BLOB|
|CLOB|java.sql.Types.CLOB|java.sql.Clob|oracle.sql.CLOB|
|用户定义的对象|java.sql.Types.STRUCT|java.sql.Struct|oracle.sql.STRUCT|
|用户定义的参考|java.sql.Types.REF|java.sql.Ref|oracle.sql.REF|
|用户定义的集合|java.sql.Types.ARRAY|java.sql.Array|oracle.sql.ARRAY|
| |**Oracle扩展如下**| |
|BFILE|oracle.jdbc.OracleTypes.BFILE|N/A|oracle.sql.BFILE|
|ROWID|oracle.jdbc.OracleTypes.ROWID|N/A|oracle.sql.ROWID|
|REF CURSOR|oracle.jdbc.OracleTypes.CURSOR|java.sql.ResultSet|oracle.jdbc.OracleResultSet|
|TIMESTAMP|oracle.jdbc.OracleTypes.TIMESTAMP|java.sql.Timestamp|oracle.sql.TIMESTAMP|
|TIMESTAMP WITH TIME ZONE|oracle.jdbc.OracleTypes.TIMESTAMPTZ|java.sql.Timestamp|oracle.sql.TIMESTAMPTZ|
|TIMESTAMP WITH LOCAL TIME ZONE|oracle.jdbc.OracleTypes.TIMESTAMPLTZ|java.sql.Timestamp|oracle.sql.TIMESTAMPLTZ|



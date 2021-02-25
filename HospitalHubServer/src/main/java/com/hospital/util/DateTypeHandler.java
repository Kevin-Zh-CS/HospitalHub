package com.hospital.util;

import java.util.Date;

public class DateTypeHandler extends ListTypeHandler<Date> {

    public DateTypeHandler() {
        super("timestamp");
    }
}

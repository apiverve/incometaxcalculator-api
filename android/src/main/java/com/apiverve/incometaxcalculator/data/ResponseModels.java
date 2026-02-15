// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     IncomeTaxCalculatorData data = Converter.fromJsonString(jsonString);

package com.apiverve.incometaxcalculator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static IncomeTaxCalculatorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(IncomeTaxCalculatorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(IncomeTaxCalculatorData.class);
        writer = mapper.writerFor(IncomeTaxCalculatorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// IncomeTaxCalculatorData.java

package com.apiverve.incometaxcalculator.data;

import com.fasterxml.jackson.annotation.*;

public class IncomeTaxCalculatorData {
    private long year;
    private String filingStatus;
    private long income;
    private long standardDeduction;
    private long taxableIncome;
    private double totalTax;
    private String effectiveRate;
    private String marginalRate;
    private double incomeAfterTax;
    private Bracket[] brackets;

    @JsonProperty("year")
    public long getYear() { return year; }
    @JsonProperty("year")
    public void setYear(long value) { this.year = value; }

    @JsonProperty("filing_status")
    public String getFilingStatus() { return filingStatus; }
    @JsonProperty("filing_status")
    public void setFilingStatus(String value) { this.filingStatus = value; }

    @JsonProperty("income")
    public long getIncome() { return income; }
    @JsonProperty("income")
    public void setIncome(long value) { this.income = value; }

    @JsonProperty("standardDeduction")
    public long getStandardDeduction() { return standardDeduction; }
    @JsonProperty("standardDeduction")
    public void setStandardDeduction(long value) { this.standardDeduction = value; }

    @JsonProperty("taxableIncome")
    public long getTaxableIncome() { return taxableIncome; }
    @JsonProperty("taxableIncome")
    public void setTaxableIncome(long value) { this.taxableIncome = value; }

    @JsonProperty("totalTax")
    public double getTotalTax() { return totalTax; }
    @JsonProperty("totalTax")
    public void setTotalTax(double value) { this.totalTax = value; }

    @JsonProperty("effectiveRate")
    public String getEffectiveRate() { return effectiveRate; }
    @JsonProperty("effectiveRate")
    public void setEffectiveRate(String value) { this.effectiveRate = value; }

    @JsonProperty("marginalRate")
    public String getMarginalRate() { return marginalRate; }
    @JsonProperty("marginalRate")
    public void setMarginalRate(String value) { this.marginalRate = value; }

    @JsonProperty("incomeAfterTax")
    public double getIncomeAfterTax() { return incomeAfterTax; }
    @JsonProperty("incomeAfterTax")
    public void setIncomeAfterTax(double value) { this.incomeAfterTax = value; }

    @JsonProperty("brackets")
    public Bracket[] getBrackets() { return brackets; }
    @JsonProperty("brackets")
    public void setBrackets(Bracket[] value) { this.brackets = value; }
}

// Bracket.java

package com.apiverve.incometaxcalculator.data;

import com.fasterxml.jackson.annotation.*;

public class Bracket {
    private double rate;
    private String ratePercent;
    private long rangeMin;
    private long rangeMax;
    private long taxableAmount;
    private double taxAmount;

    @JsonProperty("rate")
    public double getRate() { return rate; }
    @JsonProperty("rate")
    public void setRate(double value) { this.rate = value; }

    @JsonProperty("ratePercent")
    public String getRatePercent() { return ratePercent; }
    @JsonProperty("ratePercent")
    public void setRatePercent(String value) { this.ratePercent = value; }

    @JsonProperty("rangeMin")
    public long getRangeMin() { return rangeMin; }
    @JsonProperty("rangeMin")
    public void setRangeMin(long value) { this.rangeMin = value; }

    @JsonProperty("rangeMax")
    public long getRangeMax() { return rangeMax; }
    @JsonProperty("rangeMax")
    public void setRangeMax(long value) { this.rangeMax = value; }

    @JsonProperty("taxableAmount")
    public long getTaxableAmount() { return taxableAmount; }
    @JsonProperty("taxableAmount")
    public void setTaxableAmount(long value) { this.taxableAmount = value; }

    @JsonProperty("taxAmount")
    public double getTaxAmount() { return taxAmount; }
    @JsonProperty("taxAmount")
    public void setTaxAmount(double value) { this.taxAmount = value; }
}
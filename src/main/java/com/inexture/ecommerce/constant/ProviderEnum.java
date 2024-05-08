package com.inexture.ecommerce.constant;

public enum ProviderEnum {
    IN_HOUSE("in house");

    private final String value;

    ProviderEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}


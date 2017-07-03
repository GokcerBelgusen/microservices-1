package io.scalecube.configuration.api;

import java.util.Arrays;
import java.util.Map;


public class FetchResponse {
  
  

  public static class Builder {

    private Object value;

    private String key;

    public FetchResponse build() {
      return new FetchResponse(this.key, this.value);
    }
    
    public Builder value(Object value) {
      this.value = value;
      return this;
    }

    public Builder key(String key) {
      this.key=key;
      return this;
    }

  }

  private Object value;

  private String key;
  
  public FetchResponse(String key, Object value) {
    this.value = value;
    this.key=key;
  }

  public static  Builder builder() {
    return new Builder();
  }

  public Object value() {
    return this.value;
  }

  
  @Override
  public String toString() {
    return "FetchResponse [value=" + value + ", key=" + key + "]";
  }
}

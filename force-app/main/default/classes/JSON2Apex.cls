public class JSON2Apex {
    
    
    
    public static void consumeObject(JSONParser parser) {
        Integer depth = 0;
        do {
            JSONToken curr = parser.getCurrentToken();
            if (curr == JSONToken.START_OBJECT || 
                curr == JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == JSONToken.END_OBJECT ||
                curr == JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }

    public class CreatedBy {
        public Attributes attributes {get;set;} 
        public String FirstName {get;set;} 

        public CreatedBy(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'attributes') {
                            attributes = new Attributes(parser);
                        } else if (text == 'FirstName') {
                            FirstName = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CreatedBy consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public Integer totalSize {get;set;} 
    public Boolean done {get;set;} 
    public List<Records> records {get;set;} 

    public JSON2Apex(JSONParser parser) {
        while (parser.nextToken() != JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                    if (text == 'totalSize') {
                        totalSize = parser.getIntegerValue();
                    } else if (text == 'done') {
                        done = parser.getBooleanValue();
                    } else if (text == 'records') {
                        records = new List<Records>();
                        while (parser.nextToken() != JSONToken.END_ARRAY) {
                            records.add(new Records(parser));
                        }
                    } else {
                        System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class Attributes {
        public String type_Z {get;set;} // in json: type
        public String url {get;set;} 

        public Attributes(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'url') {
                            url = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Attributes consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Records {
        public Attributes attributes {get;set;} 
        public String Phone {get;set;} 
        public String Name {get;set;} 
        public CreatedBy CreatedBy {get;set;} 
        public String CreatedById {get;set;} 

        public Records(JSONParser parser) {
            while (parser.nextToken() != JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != JSONToken.VALUE_NULL) {
                        if (text == 'attributes') {
                            attributes = new Attributes(parser);
                        } else if (text == 'Phone') {
                            Phone = parser.getText();
                        } else if (text == 'Name') {
                            Name = parser.getText();
                        } else if (text == 'CreatedBy') {
                            CreatedBy = new CreatedBy(parser);
                        } else if (text == 'CreatedById') {
                            CreatedById = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Records consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    
    public static JSON2Apex parse(String json) {
        return new JSON2Apex(System.JSON.createParser(json));
    }
    }
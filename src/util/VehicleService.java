package util;

/**
 * Created by parashan on 7/27/2017.
 */
public class VehicleService {
    String model_number;
    String owner_name;
    int service_id;
    int reading;
    String service_type;
    public VehicleService(String model_number, String owner_name, int service_id, int reading, String service_type) {
        this.model_number = model_number;
        this.owner_name = owner_name;
        this.service_id = service_id;
        this.reading = reading;
        this.service_type = service_type;
    }

    public VehicleService() {
    }

    public String getModel_number() {
        return model_number;
    }

    public void setModel_number(String model_number) {
        this.model_number = model_number;
    }

    public String getOwner_name() {
        return owner_name;
    }

    public void setOwner_name(String owner_name) {
        this.owner_name = owner_name;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public int getReading() {
        return reading;
    }

    public void setReading(int reading) {
        this.reading = reading;
    }

    public String getService_type() {
        return service_type;
    }

    public void setService_type(String service_type) {
        this.service_type = service_type;
    }
}

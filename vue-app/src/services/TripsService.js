import http from "../http-common";



class TripsService {
    getAll() {
        return http.get("/trips");
      }

      create(data) {
        return http.post("/trips", data);
      }
}

export default new TripsService();
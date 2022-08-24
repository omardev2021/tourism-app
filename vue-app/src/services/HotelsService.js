import http from "../http-common";

class HotelsService {
    getAll() {
        return http.get("/hotels");
      }

      create(data) {
        return http.post("/hotels", data);
      }
}

export default new HotelsService();
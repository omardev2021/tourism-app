import http from "../http-common";



class ActivitiesService {
    getAll() {
        return http.get("/activities");
      }

      create(data) {
        return http.post("/activities", data);
      }
}

export default new ActivitiesService();
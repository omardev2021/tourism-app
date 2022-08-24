import http from "../http-common";

class BookingsService {
    getAll() {
        return http.get("/bookings");
      }

      create(data) {
        return http.post("/bookings", data);
      }

      confirm(id) {
        return http.post(`/confirm/${id}`);
      }

      reject(id) {
        return http.post(`/reject/${id}`);
      }
}

export default new BookingsService();
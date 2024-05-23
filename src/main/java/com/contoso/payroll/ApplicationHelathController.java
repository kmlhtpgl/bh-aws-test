import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApplicationHealthController {

    @GetMapping("/public-health")
    public Health health() {
        return Health.up().build();
    }
}

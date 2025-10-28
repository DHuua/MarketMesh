package Hero.MarketMesh.configuration;

import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.OpenAPI;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI marketMeshOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("MarketMesh API")
                        .description("API documentation for the MarketMesh project")
                        .version("1.0.0"));
    }
}

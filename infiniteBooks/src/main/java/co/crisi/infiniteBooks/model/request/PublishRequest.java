package co.crisi.infiniteBooks.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class PublishRequest {
    private String type;
    private String title;
}

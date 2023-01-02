package com.ute.newspaper.entities;

import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Getter @Setter
@ToString
public class User {
    private int id;
    @NonNull private String username;
    @NonNull private String password;
    @NonNull private String name;
    @NonNull private String email;
    @NonNull private LocalDateTime birthday;
    private String penname;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private LocalDateTime expr;
    @NonNull private String permission;
    private boolean enable;
}

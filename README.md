# Flyway

Flyway 공식문서에는 Flyway를 `Flyway is an open-source database migration tool.` 로 **데이터베이스 마이그레이션 도구입니다.** 

### Flyway 프로퍼티

- **`flyway.baseline-version` :** 마이그레이션을 시작할 버전 (기본값 1)
- **`flyway.baselineOnMigrate` :** flyway_schema_history가 없다면 true 있다면 false(기본값 false)
- **`flyway.enabled` :** flyway 활성화 여부 (기본값 true)
- **`flyway.locations` :** 마이그레이션 스크립트 위치 (기본값 classpath:db/migration)
- **`flyway.url` :** 마이그레이션 할 데이터베이스의 JDBC url. (기본값 1차 데이터 소스 사용)
- **`flyway.user`:** 마이그레이션 할 데이터베이스의 로그인 사용자(기본값 1차 데이터 소스 사용)
- **`flyway.password` :** 마이그레이션 할 데이터베이스의 사용자 패스워드(기본값 1차 데이터 소스 사용)

### Flyway 구조 파악

Flyway를 등록하려는 시점의 db 스키마 구조를 입력해야한다. 이 파일을 기준으로 flyway가 DB 버전 관리를 하게 된다. (예: V1__init.sql)

- V1(**숫자:버전**) __ (`_` **2개를 작성해야한다!**)init(**관련 설명**).sql
![image](https://user-images.githubusercontent.com/105543967/197503448-c645d9eb-ad4c-4259-94bd-e9c439957d03.png)


### Prefix

- V(Versioned): 현재버전을 새로운 버전으로 업데이트
- U(Undo): 현재 버전을 이전버전으로 되돌리는 경우
- R(Repeatable): 버전에 관계 없이 매번 실행하는 경우

### Version

스크립트의 버전을 이전보다 꼭 높게 적어야 한다.

- V와 U는 버전을 명시한다.
- R은 버전을 명시하지 않는다. (매번 실행되기 때문이다)

### **Separator**

무조건 __(언더바 2개)로 작성

### **Description**

스크립트 내용에 맞게 자유롭게 적는다.

단어 구분은 _(언더바 1개)로 한다.

### 에러

```
SQL State  : 42001 Error Code : 42001
```

- sql문에서 ‘를 사용해서 에러가 났었다. 반드시 `로 사용하자!
- 또한 기존 테이블 내용과 새롭게 추가된 스키마 사이 추가되는 과정에서 중복된 내용이 있거나 관리되는 스키마 내용이 다를 때 에러가 발생한다.

```
org.springframework.beans.factory.BeanCreationException: Error creating bean with name '**flywayInitializer**' defined in class path resource [org/springframework/boot/autoconfigure/flyway/FlywayAutoConfiguration$FlywayConfiguration.class]: Invocation of init method failed; nested exception is org.flywaydb.core.api.exception.FlywayValidateException: Validate failed: **Migrations have failed validation**
**Detected failed migration to version 1** (init).
Please remove any half-completed changes then run repair to fix the schema history.
Need more flexibility with validation rules? Learn more: [https://rd.gt/3AbJUZE](https://rd.gt/3AbJUZE)
```

- **한번 flyway로 서비스를 모두 올린 후 일부 파일을 수정하여 checksum이 틀어지게 되어 발생하는 에러이다**
- flyway_schema_history 테이블에서 해당 row를 포함한 이후 row를 삭제하고 다시 올린다
- checksum을 강제로 수정하고 (repair 또는 수동으로 수정) success를 1로 돌린다

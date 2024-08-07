-- +goose Up
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id VARCHAR(26) NOT NULL PRIMARY KEY COMMENT 'ユーザーID',
    nickname VARCHAR(255) NOT NULL COMMENT 'ユーザー名',
    cognito_sub VARCHAR(255) NOT NULL UNIQUE COMMENT 'cognito識別子',
    email VARCHAR(255) NOT NULL COMMENT 'メールアドレス',
    status VARCHAR(2) NOT NULL COMMENT '会員ステータス',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    created_by INT NOT NULL COMMENT '作成者',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    updated_by INT NOT NULL COMMENT '更新者'
) COMMENT '会員';

-- +goose Down
DROP TABLE IF EXISTS users;
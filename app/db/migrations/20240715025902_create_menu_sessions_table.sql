-- +goose Up
DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
    id VARCHAR(26) NOT NULL PRIMARY KEY COMMENT 'メニューID',
    user_id VARCHAR(26) NOT NULL COMMENT '会員ID',
    menu_id VARCHAR(26) NOT NULL COMMENT 'メニューID',
    workout_date DATETIME NOT NULL COMMENT 'トレーニング日付',
    workout_time TIME NOT NULL COMMENT 'トレーニング時間',
    memo VARCHAR(2048) COMMENT 'メモ',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    created_by VARCHAR(26) NOT NULL COMMENT '作成者',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    updated_by VARCHAR(26) NOT NULL COMMENT '更新者',
    CONSTRAINT fk_s_u FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (menu_id) REFERENCES menus(id)
);

-- +goose Down
ALTER TABLE sessions DROP FOREIGN KEY fk_s_u;
DROP TABLE IF EXISTS sessions;
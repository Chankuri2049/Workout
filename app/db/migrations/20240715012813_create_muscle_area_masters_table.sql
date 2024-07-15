-- +goose Up
DROP TABLE IF EXISTS muscle_area_masters;
CREATE TABLE muscle_area_masters (
    id VARCHAR(26) NOT NULL PRIMARY KEY COMMENT '種目ID',
    main_area VARCHAR(255) NOT NULL COMMENT 'メイン部位',
    sub_area VARCHAR(255) COMMENT 'サブ部位',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) COMMENT '部位マスタ';


-- +goose Down
DROP TABLE IF EXISTS muscle_area_masters;
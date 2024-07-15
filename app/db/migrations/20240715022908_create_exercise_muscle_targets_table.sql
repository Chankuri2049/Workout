-- +goose Up
DROP TABLE IF EXISTS exercise_muscle_targets;
CREATE TABLE exercise_muscle_targets (
    id VARCHAR(26) NOT NULL PRIMARY KEY COMMENT '種目部位ID',
    exercise_id VARCHAR(26) NOT NULL COMMENT '種目ID',
    muscle_area_master_id VARCHAR(26) NOT NULL COMMENT '部位マスタID',
    target_order INT NOT NULL COMMENT '優先順位',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    created_by VARCHAR(26) NOT NULL COMMENT '作成者',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    updated_by VARCHAR(26) NOT NULL COMMENT '更新者',
    CONSTRAINT fk_emt_e FOREIGN KEY (exercise_id) REFERENCES exercises(id),
    CONSTRAINT fk_emt_mam FOREIGN KEY (muscle_area_master_id) REFERENCES muscle_area_masters(id)
) COMMENT '種目部位';

-- +goose Down
ALTER TABLE exercise_muscle_targets DROP FOREIGN KEY fk_emt_e;
ALTER TABLE exercise_muscle_targets DROP FOREIGN KEY fk_emt_mam;
DROP TABLE IF EXISTS exercise_muscle_targets;
-- +goose Up
DROP TABLE IF EXISTS menu_exercises;
CREATE TABLE menu_exercises (
    id VARCHAR(26) NOT NULL PRIMARY KEY COMMENT 'メニューID',
    menu_id VARCHAR(26) NOT NULL COMMENT 'プランID',
    exercise_id VARCHAR(26) NOT NULL COMMENT '種目ID',
    sets INT NOT NULL COMMENT 'セット数',
    reps INT NOT NULL COMMENT 'レップス数',
    rest_time TIME NOT NULL COMMENT '休憩時間',
    display_order INT NOT NULL COMMENT '表示順',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    created_by VARCHAR(26) NOT NULL COMMENT '作成者',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    updated_by VARCHAR(26) NOT NULL COMMENT '更新者',
    CONSTRAINT fk_me_m FOREIGN KEY (menu_id) REFERENCES menus(id),
    CONSTRAINT fk_me_e FOREIGN KEY (exercise_id) REFERENCES exercises(id)
);

-- +goose Down
ALTER TABLE menu_exercises DROP FOREIGN KEY fk_me_m;
ALTER TABLE menu_exercises DROP FOREIGN KEY fk_me_e;
DROP TABLE IF EXISTS menu_exercises;
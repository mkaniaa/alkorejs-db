/*****************************************************************************
** Author      : Marek Kania
** Create Date : 2020-07-05
** Description : Script creates table for keeping information about all participants.
*****************************************************************************/

SET search_path = :schema, public;

-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS participant (
    id                      BIGSERIAL NOT NULL,
    name                    TEXT NOT NULL,
    surname                 TEXT,
    phone                   TEXT,
    email                   TEXT,
    birth_date              DATE,
    pesel                   TEXT,
    city                    TEXT,
    tshirt_size             TEXT,
    tshirt_cut              TEXT,
    in_fb_goup              BOOLEAN,
    fb_nickname             TEXT,
    CONSTRAINT participant_pk PRIMARY KEY (id),
    CONSTRAINT participant_verify_tshirt_cut CHECK (tshirt_cut IN ('M', 'W') OR tshirt_cut IS NULL),
    CONSTRAINT participant_verify_tshirt_size
    CHECK (tshirt_size IN ('XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL', 'XXXXL') OR tshirt_cut IS NULL)
);

COMMENT ON TABLE participant IS 'Table keeps information about all participants.';

COMMENT ON COLUMN participant.tshirt_cut IS 'Cut of a tshirt for participant" M - men''s cut, W - women''s cut.';
/*
 * TestLink Open Source Project - http://testlink.sourceforge.net/ 
 * This script is distributed under the GNU General Public License 2 or later. 
 * 
 * SQL script: Update schema MySQL database for TestLink 1.9 from version 1.8 
 * "/ *prefix* /" - placeholder for tables with defined prefix, used by sqlParser.class.php.
 *
 * @filesource	db_schema_update.sql
 *
 * Important Warning: 
 * This file will be processed by sqlParser.class.php, that uses SEMICOLON to find end of SQL Sentences.
 * It is not intelligent enough to ignore  SEMICOLONS inside comments, then PLEASE
 * USE SEMICOLONS ONLY to signal END of SQL Statements.
 *
 * @internal revisions
 * @since 1.9.4
 * 20120430 - franciscom - issue trackers tables
 * 20120211 - franciscom - new views
 * 20110815 - franciscom - improvements on cookie_string generation (after Julian indications)
 * 20110808 - franciscom - manual migration from 1.9.1 (DB 1.4) to 1.9.4 (DB 1.5)
 */

# ==============================================================================
# ATTENTION PLEASE - replace /*prefix*/ with your table prefix if you have any. 
# ==============================================================================


/* testprojects */
ALTER TABLE /*prefix*/testprojects ADD COLUMN reqmgr_integration_enabled tinyint(1) NOT NULL default '0' AFTER issue_tracker_enabled;



/* new rights */
INSERT INTO /*prefix*/rights  (id,description) VALUES (33,'reqmgrsystem_management');
INSERT INTO /*prefix*/rights  (id,description) VALUES (34,'reqmgrsystem_view');


/* update rights on admin role */
INSERT INTO /*prefix*/role_rights (role_id,right_id) VALUES (8,33);
INSERT INTO /*prefix*/role_rights (role_id,right_id) VALUES (8,34);
/* ----- END ----- */
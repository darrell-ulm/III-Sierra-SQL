select 'b' || rm.record_num || 'a' AS bnum, 
       ldr.record_type_code
--       vc.field_content
from
(select record_type_code,
   record_id
from sierra_view.leader_field
where 
-- record_type_code != 'a'
record_type_code IN ('f', 'o', 'r')
--   and bib_level_code ~ '[bis]'
) ldr

-- inner join sierra_view.control_field cf
--   on ldr.record_id = cf.record_id
--   and cf.control_num = '6'
--   and cf.p00 ~ '[at]'
--   and (cf.p16 ~'[01defhijps]' OR cf.p17 ~ '[abcd]')
-- 
inner join sierra_view.bib_record br
  on ldr.record_id = br.record_id
  and br.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
  on ldr.record_id = rm.id

--uncomment section below to limit to e-resource records in collections
--inner join sierra_view.varfield vc 
--  on tmp.record_id = vc.record_id 
--  and vc.marc_tag = '773' 
--  and vc.field_content like '%online collection%'

-- inner join sierra_view.control_field cf
--   on tmp.record_id = cf.record_id
--   and cf.control_num = '7'
--   and cf.p00 = 's'
-- --        and 
-- --        cf.p04 = 'p'
-- 
-- -- where tmp.tl ~ 'p.'
-- 
-- limit 5
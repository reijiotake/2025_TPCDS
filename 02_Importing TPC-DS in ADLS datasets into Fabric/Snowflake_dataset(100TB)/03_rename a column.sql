----colになっているの有無にかかわらず、列名を小文字にしたいのですべてのテーブルをoldにする----
EXEC sp_rename 'call_center', 'call_center_old';
EXEC sp_rename 'catalog_page', 'catalog_page_old';
EXEC sp_rename 'catalog_returns', 'catalog_returns_old';
EXEC sp_rename 'catalog_sales', 'catalog_sales_old';
EXEC sp_rename 'customer', 'customer_old';
EXEC sp_rename 'customer_address', 'customer_address_old';
EXEC sp_rename 'customer_demographics', 'customer_demographics_old';
EXEC sp_rename 'date_dim', 'date_dim_old';
EXEC sp_rename 'household_demographics', 'household_demographics_old';
EXEC sp_rename 'income_band', 'income_band_old';
EXEC sp_rename 'inventory', 'inventory_old';
EXEC sp_rename 'item', 'item_old';
EXEC sp_rename 'promotion', 'promotion_old';
EXEC sp_rename 'reason', 'reason_old';
EXEC sp_rename 'ship_mode', 'ship_mode_old';
EXEC sp_rename 'store', 'store_old';
EXEC sp_rename 'store_returns', 'store_returns_old';
EXEC sp_rename 'store_sales', 'store_sales_old';
EXEC sp_rename 'time_dim', 'time_dim_old';
EXEC sp_rename 'warehouse', 'warehouse_old';
EXEC sp_rename 'web_page', 'web_page_old';
EXEC sp_rename 'web_returns', 'web_returns_old';
EXEC sp_rename 'web_sales', 'web_sales_old';
EXEC sp_rename 'web_site', 'web_site_old';




-------1-call_centerでうまくいくか試し⇒うまくいった----
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[call_center]
(
	[cc_call_center_sk] [int] NULL,
	[cc_call_center_id] [varchar](8000) NULL,
	[cc_rec_start_date] [date] NULL,
	[cc_rec_end_date] [date] NULL,
	[cc_closed_date_sk] [int] NULL,
	[cc_open_date_sk] [int] NULL,
	[cc_name] [varchar](8000) NULL,
	[cc_class] [varchar](8000) NULL,
	[cc_employees] [int] NULL,
	[cc_sq_ft] [int] NULL,
	[cc_hours] [varchar](8000) NULL,
	[cc_manager] [varchar](8000) NULL,
	[cc_mkt_id] [int] NULL,
	[cc_mkt_class] [varchar](8000) NULL,
	[cc_mkt_desc] [varchar](8000) NULL,
	[cc_market_manager] [varchar](8000) NULL,
	[cc_division] [int] NULL,
	[cc_division_name] [varchar](8000) NULL,
	[cc_company] [int] NULL,
	[cc_company_name] [varchar](8000) NULL,
	[cc_street_number] [varchar](8000) NULL,
	[cc_street_name] [varchar](8000) NULL,
	[cc_street_type] [varchar](8000) NULL,
	[cc_suite_number] [varchar](8000) NULL,
	[cc_city] [varchar](8000) NULL,
	[cc_county] [varchar](8000) NULL,
	[cc_state] [varchar](8000) NULL,
	[cc_zip] [varchar](8000) NULL,
	[cc_country] [varchar](8000) NULL,
	[cc_gmt_offset] [decimal](5,2) NULL,
	[cc_tax_percentage] [decimal](5,2) NULL
);

INSERT INTO call_center
SELECT * FROM call_center_old;


-------2-catalog_pageでもうまくいくか試し⇒うまくいった----
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[catalog_page]
(
	[cp_catalog_page_sk] [int] NULL,
	[cp_catalog_page_id] [varchar](8000) NULL,
	[cp_start_date_sk] [int] NULL,
	[cp_end_date_sk] [int] NULL,
	[cp_department] [varchar](8000) NULL,
	[cp_catalog_number] [int] NULL,
	[cp_catalog_page_number] [int] NULL,
	[cp_description] [varchar](8000) NULL,
	[cp_type] [varchar](8000) NULL
);

INSERT INTO catalog_page
SELECT * FROM catalog_page_old;


----小さいテーブル---

---customer----
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[customer]
(
	[c_customer_sk] [int] NULL,
	[c_customer_id] [varchar](8000) NULL,
	[c_current_cdemo_sk] [int] NULL,
	[c_current_hdemo_sk] [int] NULL,
	[c_current_addr_sk] [int] NULL,
	[c_first_shipto_date_sk] [int] NULL,
	[c_first_sales_date_sk] [int] NULL,
	[c_salutation] [varchar](8000) NULL,
	[c_first_name] [varchar](8000) NULL,
	[c_last_name] [varchar](8000) NULL,
	[c_preferred_cust_flag] [varchar](8000) NULL,
	[c_birth_day] [int] NULL,
	[c_birth_month] [int] NULL,
	[c_birth_year] [int] NULL,
	[c_birth_country] [varchar](8000) NULL,
	[c_login] [varchar](8000) NULL,
	[c_email_address] [varchar](8000) NULL,
	[c_last_review_date] [varchar](8000) NULL
);

INSERT INTO customer
SELECT * FROM customer_old;

---customer_address-(7 min 45 sec 612 ms)---
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[customer_address]
(
	[ca_address_sk] [int] NULL,
	[ca_address_id] [varchar](8000) NULL,
	[ca_street_number] [varchar](8000) NULL,
	[ca_street_name] [varchar](8000) NULL,
	[ca_street_type] [varchar](8000) NULL,
	[ca_suite_number] [varchar](8000) NULL,
	[ca_city] [varchar](8000) NULL,
	[ca_county] [varchar](8000) NULL,
	[ca_state] [varchar](8000) NULL,
	[ca_zip] [varchar](8000) NULL,
	[ca_country] [varchar](8000) NULL,
	[ca_gmt_offset] [decimal](5,2) NULL,
	[ca_location_type] [varchar](8000) NULL
)

INSERT INTO customer_address
SELECT * FROM customer_address_old;


---customer_demographics-(13 sec 905 ms)---

CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[customer_demographics]
(
	[cd_demo_sk] [int] NULL,
	[cd_gender] [varchar](8000) NULL,
	[cd_marital_status] [varchar](8000) NULL,
	[cd_education_status] [varchar](8000) NULL,
	[cd_purchase_estimate] [int] NULL,
	[cd_credit_rating] [varchar](8000) NULL,
	[cd_dep_count] [int] NULL,
	[cd_dep_employed_count] [int] NULL,
	[cd_dep_college_count] [int] NULL
);

INSERT INTO customer_demographics
SELECT * FROM customer_demographics_old;


----date_dim--(3 sec 731 ms)--

CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[date_dim]
(
	[d_date_sk] [int] NULL,
	[d_date_id] [varchar](8000) NULL,
	[d_date] [date] NULL,
	[d_month_seq] [int] NULL,
	[d_week_seq] [int] NULL,
	[d_quarter_seq] [int] NULL,
	[d_year] [int] NULL,
	[d_dow] [int] NULL,
	[d_moy] [int] NULL,
	[d_dom] [int] NULL,
	[d_qoy] [int] NULL,
	[d_fy_year] [int] NULL,
	[d_fy_quarter_seq] [int] NULL,
	[d_fy_week_seq] [int] NULL,
	[d_day_name] [varchar](8000) NULL,
	[d_quarter_name] [varchar](8000) NULL,
	[d_holiday] [varchar](8000) NULL,
	[d_weekend] [varchar](8000) NULL,
	[d_following_holiday] [varchar](8000) NULL,
	[d_first_dom] [int] NULL,
	[d_last_dom] [int] NULL,
	[d_same_day_ly] [int] NULL,
	[d_same_day_lq] [int] NULL,
	[d_current_day] [varchar](8000) NULL,
	[d_current_week] [varchar](8000) NULL,
	[d_current_month] [varchar](8000) NULL,
	[d_current_quarter] [varchar](8000) NULL,
	[d_current_year] [varchar](8000) NULL
);

INSERT INTO date_dim
SELECT * FROM date_dim_old;


----household_demographics-(2 sec 286 ms)---
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[household_demographics]
(
	[hd_demo_sk] [int] NULL,
	[hd_income_band_sk] [int] NULL,
	[hd_buy_potential] [varchar](8000) NULL,
	[hd_dep_count] [int] NULL,
	[hd_vehicle_count] [int] NULL
);

INSERT INTO household_demographics
SELECT * FROM household_demographics_old;


----income_band--(1 sec 796 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[income_band]
(
	[ib_income_band_sk] [int] NULL,
	[ib_lower_bound] [int] NULL,
	[ib_upper_bound] [int] NULL
);

INSERT INTO income_band
SELECT * FROM income_band_old;



----inventory--(2 min 9 sec 997 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[inventory]
(
	[inv_date_sk] [int] NULL,
	[inv_item_sk] [int] NULL,
	[inv_warehouse_sk] [int] NULL,
	[inv_quantity_on_hand] [int] NULL
);

INSERT INTO inventory
SELECT * FROM inventory_old;



----item- (30 sec 247 ms)---
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[item]
(
	[i_item_sk] [int] NULL,
	[i_item_id] [varchar](8000) NULL,
	[i_rec_start_date] [date] NULL,
	[i_rec_end_date] [date] NULL,
	[i_item_desc] [varchar](8000) NULL,
	[i_current_price] [decimal](7,2) NULL,
	[i_wholesale_cost] [decimal](7,2) NULL,
	[i_brand_id] [int] NULL,
	[i_brand] [varchar](8000) NULL,
	[i_class_id] [int] NULL,
	[i_class] [varchar](8000) NULL,
	[i_category_id] [int] NULL,
	[i_category] [varchar](8000) NULL,
	[i_manufact_id] [int] NULL,
	[i_manufact] [varchar](8000) NULL,
	[i_size] [varchar](8000) NULL,
	[i_formulation] [varchar](8000) NULL,
	[i_color] [varchar](8000) NULL,
	[i_units] [varchar](8000) NULL,
	[i_container] [varchar](8000) NULL,
	[i_manager_id] [int] NULL,
	[i_product_name] [varchar](8000) NULL
)
;

INSERT INTO item
SELECT * FROM item_old;


----promotion---(4 sec 129 ms)-
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[promotion]
(
	[p_promo_sk] [int] NULL,
	[p_promo_id] [varchar](8000) NULL,
	[p_start_date_sk] [int] NULL,
	[p_end_date_sk] [int] NULL,
	[p_item_sk] [int] NULL,
	[p_cost] [decimal](15,2) NULL,
	[p_response_target] [int] NULL,
	[p_promo_name] [varchar](8000) NULL,
	[p_channel_dmail] [varchar](8000) NULL,
	[p_channel_email] [varchar](8000) NULL,
	[p_channel_catalog] [varchar](8000) NULL,
	[p_channel_tv] [varchar](8000) NULL,
	[p_channel_radio] [varchar](8000) NULL,
	[p_channel_press] [varchar](8000) NULL,
	[p_channel_event] [varchar](8000) NULL,
	[p_channel_demo] [varchar](8000) NULL,
	[p_channel_details] [varchar](8000) NULL,
	[p_purpose] [varchar](8000) NULL,
	[p_discount_active] [varchar](8000) NULL
)
;

INSERT INTO promotion
SELECT * FROM promotion_old;



----reason-(9 min 28 sec 718 ms)---
DROP TABLE reason;
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[reason]
(
	[r_reason_sk] [int] NULL,
	[r_reason_id] [varchar](8000) NULL,
	[r_reason_desc] [varchar](8000) NULL
);

INSERT INTO reason
SELECT * FROM reason_old;


----ship_mode-- (6 sec 461 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[ship_mode]
(
	[sm_ship_mode_sk] [int] NULL,
	[sm_ship_mode_id] [varchar](8000) NULL,
	[sm_type] [varchar](8000) NULL,
	[sm_code] [varchar](8000) NULL,
	[sm_carrier] [varchar](8000) NULL,
	[sm_contract] [varchar](8000) NULL
);

INSERT INTO ship_mode
SELECT * FROM ship_mode_old;


----store- (2 sec 333 ms)---
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[store]
(
	[s_store_sk] [int] NULL,
	[s_store_id] [varchar](8000) NULL,
	[s_rec_start_date] [date] NULL,
	[s_rec_end_date] [date] NULL,
	[s_closed_date_sk] [int] NULL,
	[s_store_name] [varchar](8000) NULL,
	[s_number_employees] [int] NULL,
	[s_floor_space] [int] NULL,
	[s_hours] [varchar](8000) NULL,
	[s_manager] [varchar](8000) NULL,
	[s_market_id] [int] NULL,
	[s_geography_class] [varchar](8000) NULL,
	[s_market_desc] [varchar](8000) NULL,
	[s_market_manager] [varchar](8000) NULL,
	[s_division_id] [int] NULL,
	[s_division_name] [varchar](8000) NULL,
	[s_company_id] [int] NULL,
	[s_company_name] [varchar](8000) NULL,
	[s_street_number] [varchar](8000) NULL,
	[s_street_name] [varchar](8000) NULL,
	[s_street_type] [varchar](8000) NULL,
	[s_suite_number] [varchar](8000) NULL,
	[s_city] [varchar](8000) NULL,
	[s_county] [varchar](8000) NULL,
	[s_state] [varchar](8000) NULL,
	[s_zip] [varchar](8000) NULL,
	[s_country] [varchar](8000) NULL,
	[s_gmt_offset] [decimal](5,2) NULL,
	[s_tax_precentage] [decimal](5,2) NULL
);

INSERT INTO store
SELECT * FROM store_old;



----time_dim--(3 sec 402 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[time_dim]
(
	[t_time_sk] [int] NULL,
	[t_time_id] [varchar](8000) NULL,
	[t_time] [int] NULL,
	[t_hour] [int] NULL,
	[t_minute] [int] NULL,
	[t_second] [int] NULL,
	[t_am_pm] [varchar](8000) NULL,
	[t_shift] [varchar](8000) NULL,
	[t_sub_shift] [varchar](8000) NULL,
	[t_meal_time] [varchar](8000) NULL
);

INSERT INTO time_dim
SELECT * FROM time_dim_old;

----warehouse--(3 sec 919 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[warehouse]
(
	[w_warehouse_sk] [int] NULL,
	[w_warehouse_id] [varchar](8000) NULL,
	[w_warehouse_name] [varchar](8000) NULL,
	[w_warehouse_sq_ft] [int] NULL,
	[w_street_number] [varchar](8000) NULL,
	[w_street_name] [varchar](8000) NULL,
	[w_street_type] [varchar](8000) NULL,
	[w_suite_number] [varchar](8000) NULL,
	[w_city] [varchar](8000) NULL,
	[w_county] [varchar](8000) NULL,
	[w_state] [varchar](8000) NULL,
	[w_zip] [varchar](8000) NULL,
	[w_country] [varchar](8000) NULL,
	[w_gmt_offset] [decimal](5,2) NULL
);

INSERT INTO warehouse
SELECT * FROM warehouse_old;

----web_page--(2 sec 400 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[web_page]
(
	[wp_web_page_sk] [int] NULL,
	[wp_web_page_id] [varchar](8000) NULL,
	[wp_rec_start_date] [date] NULL,
	[wp_rec_end_date] [date] NULL,
	[wp_creation_date_sk] [int] NULL,
	[wp_access_date_sk] [int] NULL,
	[wp_autogen_flag] [varchar](8000) NULL,
	[wp_customer_sk] [int] NULL,
	[wp_url] [varchar](8000) NULL,
	[wp_type] [varchar](8000) NULL,
	[wp_char_count] [int] NULL,
	[wp_link_count] [int] NULL,
	[wp_image_count] [int] NULL,
	[wp_max_ad_count] [int] NULL
);

INSERT INTO web_page
SELECT * FROM web_page;

----web_site-- (3 sec 934 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[web_site]
(
	[web_site_sk] [int] NULL,
	[web_site_id] [varchar](8000) NULL,
	[web_rec_start_date] [date] NULL,
	[web_rec_end_date] [date] NULL,
	[web_name] [varchar](8000) NULL,
	[web_open_date_sk] [int] NULL,
	[web_close_date_sk] [int] NULL,
	[web_class] [varchar](8000) NULL,
	[web_manager] [varchar](8000) NULL,
	[web_mkt_id] [int] NULL,
	[web_mkt_class] [varchar](8000) NULL,
	[web_mkt_desc] [varchar](8000) NULL,
	[web_market_manager] [varchar](8000) NULL,
	[web_company_id] [int] NULL,
	[web_company_name] [varchar](8000) NULL,
	[web_street_number] [varchar](8000) NULL,
	[web_street_name] [varchar](8000) NULL,
	[web_street_type] [varchar](8000) NULL,
	[web_suite_number] [varchar](8000) NULL,
	[web_city] [varchar](8000) NULL,
	[web_county] [varchar](8000) NULL,
	[web_state] [varchar](8000) NULL,
	[web_zip] [varchar](8000) NULL,
	[web_country] [varchar](8000) NULL,
	[web_gmt_offset] [decimal](5,2) NULL,
	[web_tax_percentage] [decimal](5,2) NULL
);

INSERT INTO web_site
SELECT * FROM web_site;




---大きいテーブル（小さい順）----

----web_returns-- (3 min 11 sec 396 ms)--
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[web_returns]
(
	[wr_returned_date_sk] [int] NULL,
	[wr_returned_time_sk] [int] NULL,
	[wr_item_sk] [int] NULL,
	[wr_refunded_customer_sk] [int] NULL,
	[wr_refunded_cdemo_sk] [int] NULL,
	[wr_refunded_hdemo_sk] [int] NULL,
	[wr_refunded_addr_sk] [int] NULL,
	[wr_returning_customer_sk] [int] NULL,
	[wr_returning_cdemo_sk] [int] NULL,
	[wr_returning_hdemo_sk] [int] NULL,
	[wr_returning_addr_sk] [int] NULL,
	[wr_web_page_sk] [int] NULL,
	[wr_reason_sk] [int] NULL,
	[wr_order_number] [bigint] NULL,
	[wr_return_quantity] [int] NULL,
	[wr_return_amt] [decimal](7,2) NULL,
	[wr_return_tax] [decimal](7,2) NULL,
	[wr_return_amt_inc_tax] [decimal](7,2) NULL,
	[wr_fee] [decimal](7,2) NULL,
	[wr_return_ship_cost] [decimal](7,2) NULL,
	[wr_refunded_cash] [decimal](7,2) NULL,
	[wr_reversed_charge] [decimal](7,2) NULL,
	[wr_account_credit] [decimal](7,2) NULL,
	[wr_net_loss] [decimal](7,2) NULL
);

INSERT INTO web_returns
SELECT * FROM web_returns_old;



----catalog_returns- (7 min 54 sec 907 ms)---
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[catalog_returns]
(
	[cr_returned_date_sk] [int] NULL,
	[cr_returned_time_sk] [int] NULL,
	[cr_item_sk] [int] NULL,
	[cr_refunded_customer_sk] [int] NULL,
	[cr_refunded_cdemo_sk] [int] NULL,
	[cr_refunded_hdemo_sk] [int] NULL,
	[cr_refunded_addr_sk] [int] NULL,
	[cr_returning_customer_sk] [int] NULL,
	[cr_returning_cdemo_sk] [int] NULL,
	[cr_returning_hdemo_sk] [int] NULL,
	[cr_returning_addr_sk] [int] NULL,
	[cr_call_center_sk] [int] NULL,
	[cr_catalog_page_sk] [int] NULL,
	[cr_ship_mode_sk] [int] NULL,
	[cr_warehouse_sk] [int] NULL,
	[cr_reason_sk] [int] NULL,
	[cr_order_number] [bigint] NULL,
	[cr_return_quantity] [int] NULL,
	[cr_return_amount] [decimal](7,2) NULL,
	[cr_return_tax] [decimal](7,2) NULL,
	[cr_return_amt_inc_tax] [decimal](7,2) NULL,
	[cr_fee] [decimal](7,2) NULL,
	[cr_return_ship_cost] [decimal](7,2) NULL,
	[cr_refunded_cash] [decimal](7,2) NULL,
	[cr_reversed_charge] [decimal](7,2) NULL,
	[cr_store_credit] [decimal](7,2) NULL,
	[cr_net_loss] [decimal](7,2) NULL
);

INSERT INTO catalog_returns
SELECT * FROM catalog_returns_old;


----store_returns----
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[store_returns]
(
	[sr_returned_date_sk] [int] NULL,
	[sr_return_time_sk] [int] NULL,
	[sr_item_sk] [int] NULL,
	[sr_customer_sk] [int] NULL,
	[sr_cdemo_sk] [int] NULL,
	[sr_hdemo_sk] [int] NULL,
	[sr_addr_sk] [int] NULL,
	[sr_store_sk] [int] NULL,
	[sr_reason_sk] [int] NULL,
	[sr_ticket_number] [bigint] NULL,
	[sr_return_quantity] [int] NULL,
	[sr_return_amt] [decimal](7,2) NULL,
	[sr_return_tax] [decimal](7,2) NULL,
	[sr_return_amt_inc_tax] [decimal](7,2) NULL,
	[sr_fee] [decimal](7,2) NULL,
	[sr_return_ship_cost] [decimal](7,2) NULL,
	[sr_refunded_cash] [decimal](7,2) NULL,
	[sr_reversed_charge] [decimal](7,2) NULL,
	[sr_store_credit] [decimal](7,2) NULL,
	[sr_net_loss] [decimal](7,2) NULL
);

INSERT INTO store_returns
SELECT * FROM store_returns_old;


----web_sales----
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[web_sales]
(
	[ws_sold_date_sk] [int] NULL,
	[ws_sold_time_sk] [int] NULL,
	[ws_ship_date_sk] [int] NULL,
	[ws_item_sk] [int] NULL,
	[ws_bill_customer_sk] [int] NULL,
	[ws_bill_cdemo_sk] [int] NULL,
	[ws_bill_hdemo_sk] [int] NULL,
	[ws_bill_addr_sk] [int] NULL,
	[ws_ship_customer_sk] [int] NULL,
	[ws_ship_cdemo_sk] [int] NULL,
	[ws_ship_hdemo_sk] [int] NULL,
	[ws_ship_addr_sk] [int] NULL,
	[ws_web_page_sk] [int] NULL,
	[ws_web_site_sk] [int] NULL,
	[ws_ship_mode_sk] [int] NULL,
	[ws_warehouse_sk] [int] NULL,
	[ws_promo_sk] [int] NULL,
	[ws_order_number] [bigint] NULL,
	[ws_quantity] [int] NULL,
	[ws_wholesale_cost] [decimal](7,2) NULL,
	[ws_list_price] [decimal](7,2) NULL,
	[ws_sales_price] [decimal](7,2) NULL,
	[ws_ext_discount_amt] [decimal](7,2) NULL,
	[ws_ext_sales_price] [decimal](7,2) NULL,
	[ws_ext_wholesale_cost] [decimal](7,2) NULL,
	[ws_ext_list_price] [decimal](7,2) NULL,
	[ws_ext_tax] [decimal](7,2) NULL,
	[ws_coupon_amt] [decimal](7,2) NULL,
	[ws_ext_ship_cost] [decimal](7,2) NULL,
	[ws_net_paid] [decimal](7,2) NULL,
	[ws_net_paid_inc_tax] [decimal](7,2) NULL,
	[ws_net_paid_inc_ship] [decimal](7,2) NULL,
	[ws_net_paid_inc_ship_tax] [decimal](7,2) NULL,
	[ws_net_profit] [decimal](7,2) NULL
);

INSERT INTO web_sales
SELECT * FROM web_sales_old;


----catalog_sales----
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[catalog_sales]
(
	[cs_sold_date_sk] [int] NULL,
	[cs_sold_time_sk] [int] NULL,
	[cs_ship_date_sk] [int] NULL,
	[cs_bill_customer_sk] [int] NULL,
	[cs_bill_cdemo_sk] [int] NULL,
	[cs_bill_hdemo_sk] [int] NULL,
	[cs_bill_addr_sk] [int] NULL,
	[cs_ship_customer_sk] [int] NULL,
	[cs_ship_cdemo_sk] [int] NULL,
	[cs_ship_hdemo_sk] [int] NULL,
	[cs_ship_addr_sk] [int] NULL,
	[cs_call_center_sk] [int] NULL,
	[cs_catalog_page_sk] [int] NULL,
	[cs_ship_mode_sk] [int] NULL,
	[cs_warehouse_sk] [int] NULL,
	[cs_item_sk] [int] NULL,
	[cs_promo_sk] [int] NULL,
	[cs_order_number] [bigint] NULL,
	[cs_quantity] [int] NULL,
	[cs_wholesale_cost] [decimal](7,2) NULL,
	[cs_list_price] [decimal](7,2) NULL,
	[cs_sales_price] [decimal](7,2) NULL,
	[cs_ext_discount_amt] [decimal](7,2) NULL,
	[cs_ext_sales_price] [decimal](7,2) NULL,
	[cs_ext_wholesale_cost] [decimal](7,2) NULL,
	[cs_ext_list_price] [decimal](7,2) NULL,
	[cs_ext_tax] [decimal](7,2) NULL,
	[cs_coupon_amt] [decimal](7,2) NULL,
	[cs_ext_ship_cost] [decimal](7,2) NULL,
	[cs_net_paid] [decimal](7,2) NULL,
	[cs_net_paid_inc_tax] [decimal](7,2) NULL,
	[cs_net_paid_inc_ship] [decimal](7,2) NULL,
	[cs_net_paid_inc_ship_tax] [decimal](7,2) NULL,
	[cs_net_profit] [decimal](7,2) NULL
);

INSERT INTO catalog_sales
SELECT * FROM catalog_sales_old;


----store_sales----
CREATE TABLE [ WH_FabricPerformance_snow100].[dbo].[store_sales]
(
	[ss_sold_date_sk] [int] NULL,
	[ss_sold_time_sk] [int] NULL,
	[ss_item_sk] [int] NULL,
	[ss_customer_sk] [int] NULL,
	[ss_cdemo_sk] [int] NULL,
	[ss_hdemo_sk] [int] NULL,
	[ss_addr_sk] [int] NULL,
	[ss_store_sk] [int] NULL,
	[ss_promo_sk] [int] NULL,
	[ss_ticket_number] [bigint] NULL,
	[ss_quantity] [int] NULL,
	[ss_wholesale_cost] [decimal](7,2) NULL,
	[ss_list_price] [decimal](7,2) NULL,
	[ss_sales_price] [decimal](7,2) NULL,
	[ss_ext_discount_amt] [decimal](7,2) NULL,
	[ss_ext_sales_price] [decimal](7,2) NULL,
	[ss_ext_wholesale_cost] [decimal](7,2) NULL,
	[ss_ext_list_price] [decimal](7,2) NULL,
	[ss_ext_tax] [decimal](7,2) NULL,
	[ss_coupon_amt] [decimal](7,2) NULL,
	[ss_net_paid] [decimal](7,2) NULL,
	[ss_net_paid_inc_tax] [decimal](7,2) NULL,
	[ss_net_profit] [decimal](7,2) NULL
);

INSERT INTO store_sales
SELECT * FROM store_sales_old;



















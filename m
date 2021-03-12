Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB93C43603
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60A7764F84
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbhCLSSA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:18:00 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:46551 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232702AbhCLSRx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:53 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBqjk018941;
        Fri, 12 Mar 2021 13:17:48 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2UveiqgAOB10w+fgBl3xiWfTBg7Czl8MCww32Zib6YrgHeUaumbc/D/hSWJtEUKfc00NnGwCdzyqX/qbDaerNvhK2z5v3EOWgnNAfEDS9TAxj5KR/wjJpjq4j4Yd31xKUKENtd6uFGh2M8W+vgC9FJ24gWWduRRUJIbAASZXrVPQW2zFDi186HgpWCg/kJmj7MOr+6nAQPohTTPch/FZ0vKeslh/mUVIrZVsR2iMVlTCPWkgEve2QQ9Pe3M55GYvo6b3q7hme7rcz7tty/EHYEGr4/pWCEuMebsC/QEGm9hO9W56Qq9JIBK3DnZiRARU7uAWnexx+nWIhFleBT8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdSwWEV4RbAI9uD10J0StMfnGHQ26PdsOansVSiTJvg=;
 b=BN3xzYqbZg4jzMIdLeeVhbHPwkmbvzCBJxrwXld/XhhC32z/WrMKGdU0ot2p01jciLEds1+TE+5wsOzFq8JXFfSBMuhFKoRoSweyHuwl92tKDoJvfHaZkILNkSlyqOijf3O0Gjwly7GeVTaQulsTPonbw2P81z6DCuGOXS4h7yQ4/YtZ2/GeZElytUIG8j9esW834SaDNRmjr8Ap88xeZxiS2BI4CPlhPm2pBZfNag/L/NYNkLBBi2tcy9Z7ZktmNXBud4Ge71C9nSSiEJ01aiygjXiZV2ItrXx53mhz22/8Si37RyIKM0mfqP3PGiOHa4fvCK36n73kJo04RTJ7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdSwWEV4RbAI9uD10J0StMfnGHQ26PdsOansVSiTJvg=;
 b=MzX3XWhuPl5rRCMPqTMfeE6jJFsTNzhIxfzaJVD2n3LUBED4X37lbuUPL4VQ/CNzXwatyA6s2Mab+ldo4YqYupEw4RouqrWUKf7MiubRPjxKmoiGrMbJufIAX+9sU28DoGGSMOzcagihnUrdY1sUdX4Sq24cGdVPJoPHGKX6cyo=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Fri, 12 Mar
 2021 18:17:46 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:46 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 6/9] clk: si5341: Allow different output VDD_SEL values
Date:   Fri, 12 Mar 2021 12:17:07 -0600
Message-Id: <20210312181710.3998978-7-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312181710.3998978-1-robert.hancock@calian.com>
References: <20210312181710.3998978-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d33d205c-dd66-40b3-a0bf-08d8e58322d8
X-MS-TrafficTypeDiagnostic: YT1PR01MB4409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB440907158890E97C6D7C0C79EC6F9@YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frQai8kG78j+9uUGdMxVQ/arV8W1584U3Zv42kHNMmQytIGhWNBsBhNvlS0U9Hr61fpRElazewVnVBsRz8zF62a92VJQFgEkNjiKtgcbbl5zA7Kvq12TH+LaHq3GAz7HGMmPbNtVnWmqHpbigEylHGoFdk9muSuHF+YLWD6vY1Z6DiOI6Nq4WOg669uIEfVG5bjTY/hA0U87wUE5JznkjhY/p+x1F5eKNaiORAdNtswUzx/5JPIAteZep0DAJFRwD2ZVZyk+8juPOixA6yDfVDP9hQsod7gn2vZvpoIsaSIFYk7rYYbx4MuKkhnRBS+jQiIeWkO12rY+4KxcsjnwqbvDWKcUnlPocK7p1oa0JzBgcTaAv+G9IUeX+dGnmY2MaPp0auFzfJZtykVZhGN4dOIOdLVLA94u4cU8aj78n1VpO310Rx/LqfClLdg/69HveDWD0YJJWkYPLdlDIIxotqysHrddLfqu5lOEnKv1HjPDJCh4z9Bw1WwJy3L2NZOonUBXjvSVqQEfy6giIIyW8TLaUokLGI8lxt9PdzlR8R3ZKs6IfJ5G6YprYwDyiMxKy31OhyWgKHEqrSSfZNE2EafiY39xQUJ6S2K2qT/XZjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(366004)(69590400012)(186003)(44832011)(956004)(26005)(1076003)(16526019)(478600001)(52116002)(66476007)(6506007)(4326008)(83380400001)(66556008)(8936002)(316002)(2616005)(66946007)(5660300002)(8676002)(6666004)(86362001)(107886003)(6486002)(2906002)(36756003)(6512007)(461764006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yJ1KWYbI4HtrvID0p9Z3G+UwOKJSSarM8YlA9XyEMud9kBPFiYSNXISaxaBU?=
 =?us-ascii?Q?UCcX+mOR+BVWlLzuVd4SCC2IouGKJLaiJQnf9BJfcthmRyYQ6XO2TKZxZy4+?=
 =?us-ascii?Q?+QvARmdCOnzqptrJ0e2B9OG+kXCZHNEOJSlB/VVXK6Ggonn9cb93aBq1mHPd?=
 =?us-ascii?Q?0bzDjzbnu/o0uMhTMPmCdoquek5lHXukqcOUrhwS5wWT67wtQ10CoxBn33+x?=
 =?us-ascii?Q?04vaPWE6fK7um+d7GL6ub4lA19MKk4lninkeG53cFm3t91jD2znGqp8J9l8T?=
 =?us-ascii?Q?hTSaQwcdSHCgh9wQ5EOmKrWjBCi2q7oh1CuZ1di6eJyJbH2jEcguTtUPELzx?=
 =?us-ascii?Q?mZO8HAo+9MVK2M6IutUvdawA6siC67xrNxN3+HlqmG+E8OCkwbJRKqxUAF+k?=
 =?us-ascii?Q?AOmEHh5KAVqlmhfgKkMJhK/Af5bldFMwWPerEnP6y/CBv8KbZSt9OSI/D3dQ?=
 =?us-ascii?Q?mxI9KV0UTBobn+FAA0pYM0lLQ7SbhLfGII5g3Y/V+qgE2WxPNckkvGIP5Sr7?=
 =?us-ascii?Q?jozDJVq/UyD2m03g5J1BdIf08ocE+hSwF6UUB4YE6GwYGRf5gvEkHM+zk8zS?=
 =?us-ascii?Q?gB65M6k/Du/Q5uR22VGKix8hfKEkSGBqRxsoWUq7du+qLTWNcWVE98gptcwU?=
 =?us-ascii?Q?xRCE6daTT9s3ZBc0DZaM7Vxo2VF2/78JO+xs0WXI1m+bgYGS5Jf1QJKyZU3t?=
 =?us-ascii?Q?gwDLGpBpHiKc0SRigHDf+wZHdwLdWSgAFihqwv606UOA2zTzaHksazEDApIM?=
 =?us-ascii?Q?cCHUNpzwFqXqFjfIABx0iaB3fzlvxeB/0qvfaiMplPY9VKHDSkoUY9a/d2HP?=
 =?us-ascii?Q?MsL9Ugy1p/lYpaLJSRkOaOhMeeoitB6dPlhBRUwVvT9LVbVOvco15o5iobrq?=
 =?us-ascii?Q?61FwMxsjaImnHo1iVoVOv2QpuFtRGl/ZnJTaXBm3WWm1tnwLgbyEHvFaQ0zn?=
 =?us-ascii?Q?Bpglx1goq3EP2g1xFNAJnvrrOFbdL7Wj2Lg3+CuARXQ67LAMZ+HxsCPBKUSY?=
 =?us-ascii?Q?1ZMXzaEleqoe39PxUhMmA0tkvjvplCY8TXP/J+F8lOzc/QaV/DAMAEE58G+a?=
 =?us-ascii?Q?6Ei6M1L1gOgBRcwdH67ENvIjJzWa2hTr4ZGRmlhvZTu5GXEBxpZ5zcRO7fv8?=
 =?us-ascii?Q?jCJxVIMn3HDXDjha9jKBTaJB3/U5DT+n4v3VM0wkG42CBkkYC03aYD6R3bip?=
 =?us-ascii?Q?BuG50YWWsexbN40GkrR9I2bUqcpaRDSh1m/sxUiQ6wfuekQlXy05wV0vICZ5?=
 =?us-ascii?Q?9d573oOD/OqZukBNADfKYuEpakty3MbfQ2vCb42AwwN/LHpR1mWgWmgtayfi?=
 =?us-ascii?Q?/yHNCvWyHc/Z3Vbk1kmIvpKp?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33d205c-dd66-40b3-a0bf-08d8e58322d8
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:46.2293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk/QmnE0LTEdsGZjWS5i2f8w5VKIheu1eZQdGo7mbBMtapfJIGvZ9SpzAiJpOE9J1cJ2RlJ3g2zaQpd6Ve1hQRwTh2zPvB3yG9rcUOzlz6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4409
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_09:2021-03-12,2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120134
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver was not previously programming the VDD_SEL values for each
output to indicate what external VDD voltage was used for each. Add
ability to specify a regulator supplying the VDD pin for each output of
the device. The voltage of the regulator is used to automatically set the
VDD_SEL value appropriately. If no regulator is specified and the chip is
being reconfigured, assume 2.5V which appears to be the chip default.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 136 +++++++++++++++++++++++++++++++--------
 1 file changed, 110 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index eb22f4fdbc6b..ed790a35eb83 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -19,6 +19,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <asm/unaligned.h>
 
@@ -59,6 +60,7 @@ struct clk_si5341_synth {
 struct clk_si5341_output {
 	struct clk_hw hw;
 	struct clk_si5341 *data;
+	struct regulator *vdd_reg;
 	u8 index;
 };
 #define to_clk_si5341_output(_hw) \
@@ -84,6 +86,7 @@ struct clk_si5341 {
 struct clk_si5341_output_config {
 	u8 out_format_drv_bits;
 	u8 out_cm_ampl_bits;
+	u8 vdd_sel_bits;
 	bool synth_master;
 	bool always_on;
 };
@@ -136,6 +139,8 @@ struct clk_si5341_output_config {
 #define SI5341_OUT_R_REG(output)	\
 			((output)->data->reg_rdiv_offset[(output)->index])
 
+#define SI5341_OUT_MUX_VDD_SEL_MASK 0x38
+
 /* Synthesize N divider */
 #define SI5341_SYNTH_N_NUM(x)	(0x0302 + ((x) * 11))
 #define SI5341_SYNTH_N_DEN(x)	(0x0308 + ((x) * 11))
@@ -1248,11 +1253,11 @@ static const struct regmap_config si5341_regmap_config = {
 	.volatile_table = &si5341_regmap_volatile,
 };
 
-static int si5341_dt_parse_dt(struct i2c_client *client,
-	struct clk_si5341_output_config *config)
+static int si5341_dt_parse_dt(struct clk_si5341 *data,
+			      struct clk_si5341_output_config *config)
 {
 	struct device_node *child;
-	struct device_node *np = client->dev.of_node;
+	struct device_node *np = data->i2c_client->dev.of_node;
 	u32 num;
 	u32 val;
 
@@ -1261,13 +1266,13 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
 	for_each_child_of_node(np, child) {
 		if (of_property_read_u32(child, "reg", &num)) {
-			dev_err(&client->dev, "missing reg property of %s\n",
+			dev_err(&data->i2c_client->dev, "missing reg property of %s\n",
 				child->name);
 			goto put_child;
 		}
 
 		if (num >= SI5341_MAX_NUM_OUTPUTS) {
-			dev_err(&client->dev, "invalid clkout %d\n", num);
+			dev_err(&data->i2c_client->dev, "invalid clkout %d\n", num);
 			goto put_child;
 		}
 
@@ -1286,7 +1291,7 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 				config[num].out_format_drv_bits |= 0xc0;
 				break;
 			default:
-				dev_err(&client->dev,
+				dev_err(&data->i2c_client->dev,
 					"invalid silabs,format %u for %u\n",
 					val, num);
 				goto put_child;
@@ -1299,7 +1304,7 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
 		if (!of_property_read_u32(child, "silabs,common-mode", &val)) {
 			if (val > 0xf) {
-				dev_err(&client->dev,
+				dev_err(&data->i2c_client->dev,
 					"invalid silabs,common-mode %u\n",
 					val);
 				goto put_child;
@@ -1310,7 +1315,7 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
 		if (!of_property_read_u32(child, "silabs,amplitude", &val)) {
 			if (val > 0xf) {
-				dev_err(&client->dev,
+				dev_err(&data->i2c_client->dev,
 					"invalid silabs,amplitude %u\n",
 					val);
 				goto put_child;
@@ -1327,6 +1332,34 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
 		config[num].always_on =
 			of_property_read_bool(child, "always-on");
+
+		config[num].vdd_sel_bits = 0x08;
+		if (data->clk[num].vdd_reg) {
+			int vdd = regulator_get_voltage(data->clk[num].vdd_reg);
+
+			switch (vdd) {
+			case 3300000:
+				config[num].vdd_sel_bits |= 0 << 4;
+				break;
+			case 1800000:
+				config[num].vdd_sel_bits |= 1 << 4;
+				break;
+			case 2500000:
+				config[num].vdd_sel_bits |= 2 << 4;
+				break;
+			default:
+				dev_err(&data->i2c_client->dev,
+					"unsupported vdd voltage %d for %s\n",
+					vdd, child->name);
+				goto put_child;
+			}
+		} else {
+			/* chip seems to default to 2.5V when not set */
+			dev_warn(&data->i2c_client->dev,
+				"no regulator set, defaulting vdd_sel to 2.5V for %s\n",
+				child->name);
+			config[num].vdd_sel_bits |= 2 << 4;
+		}
 	}
 
 	return 0;
@@ -1452,9 +1485,33 @@ static int si5341_probe(struct i2c_client *client,
 		}
 	}
 
-	err = si5341_dt_parse_dt(client, config);
+	for (i = 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
+		char reg_name[10];
+
+		snprintf(reg_name, sizeof(reg_name), "vdd%d", i);
+		data->clk[i].vdd_reg = devm_regulator_get_optional(
+			&client->dev, reg_name);
+		if (IS_ERR(data->clk[i].vdd_reg)) {
+			err = PTR_ERR(data->clk[i].vdd_reg);
+			data->clk[i].vdd_reg = NULL;
+			if (err == -ENODEV)
+				continue;
+			goto cleanup;
+		} else {
+			err = regulator_enable(data->clk[i].vdd_reg);
+			if (err) {
+				dev_err(&client->dev,
+					"failed to enable %s regulator: %d\n",
+					reg_name, err);
+				data->clk[i].vdd_reg = NULL;
+				goto cleanup;
+			}
+		}
+	}
+
+	err = si5341_dt_parse_dt(data, config);
 	if (err)
-		return err;
+		goto cleanup;
 
 	if (of_property_read_string(client->dev.of_node, "clock-output-names",
 			&init.name))
@@ -1462,21 +1519,23 @@ static int si5341_probe(struct i2c_client *client,
 	root_clock_name = init.name;
 
 	data->regmap = devm_regmap_init_i2c(client, &si5341_regmap_config);
-	if (IS_ERR(data->regmap))
-		return PTR_ERR(data->regmap);
+	if (IS_ERR(data->regmap)) {
+		err = PTR_ERR(data->regmap);
+		goto cleanup;
+	}
 
 	i2c_set_clientdata(client, data);
 
 	err = si5341_probe_chip_id(data);
 	if (err < 0)
-		return err;
+		goto cleanup;
 
 	if (of_property_read_bool(client->dev.of_node, "silabs,reprogram")) {
 		initialization_required = true;
 	} else {
 		err = si5341_is_programmed_already(data);
 		if (err < 0)
-			return err;
+			goto cleanup;
 
 		initialization_required = !err;
 	}
@@ -1485,11 +1544,11 @@ static int si5341_probe(struct i2c_client *client,
 		/* Populate the regmap cache in preparation for "cache only" */
 		err = si5341_read_settings(data);
 		if (err < 0)
-			return err;
+			goto cleanup;
 
 		err = si5341_send_preamble(data);
 		if (err < 0)
-			return err;
+			goto cleanup;
 
 		/*
 		 * We intend to send all 'final' register values in a single
@@ -1502,19 +1561,19 @@ static int si5341_probe(struct i2c_client *client,
 		err = si5341_write_multiple(data, si5341_reg_defaults,
 					ARRAY_SIZE(si5341_reg_defaults));
 		if (err < 0)
-			return err;
+			goto cleanup;
 	}
 
 	/* Input must be up and running at this point */
 	err = si5341_clk_select_active_input(data);
 	if (err < 0)
-		return err;
+		goto cleanup;
 
 	if (initialization_required) {
 		/* PLL configuration is required */
 		err = si5341_initialize_pll(data);
 		if (err < 0)
-			return err;
+			goto cleanup;
 	}
 
 	/* Register the PLL */
@@ -1527,7 +1586,7 @@ static int si5341_probe(struct i2c_client *client,
 	err = devm_clk_hw_register(&client->dev, &data->hw);
 	if (err) {
 		dev_err(&client->dev, "clock registration failed\n");
-		return err;
+		goto cleanup;
 	}
 
 	init.num_parents = 1;
@@ -1564,13 +1623,17 @@ static int si5341_probe(struct i2c_client *client,
 			regmap_write(data->regmap,
 				SI5341_OUT_CM(&data->clk[i]),
 				config[i].out_cm_ampl_bits);
+			regmap_update_bits(data->regmap,
+				SI5341_OUT_MUX_SEL(&data->clk[i]),
+				SI5341_OUT_MUX_VDD_SEL_MASK,
+				config[i].vdd_sel_bits);
 		}
 		err = devm_clk_hw_register(&client->dev, &data->clk[i].hw);
 		kfree(init.name); /* clock framework made a copy of the name */
 		if (err) {
 			dev_err(&client->dev,
 				"output %u registration failed\n", i);
-			return err;
+			goto cleanup;
 		}
 		if (config[i].always_on)
 			clk_prepare(data->clk[i].hw.clk);
@@ -1580,7 +1643,7 @@ static int si5341_probe(struct i2c_client *client,
 			data);
 	if (err) {
 		dev_err(&client->dev, "unable to add clk provider\n");
-		return err;
+		goto cleanup;
 	}
 
 	if (initialization_required) {
@@ -1588,11 +1651,11 @@ static int si5341_probe(struct i2c_client *client,
 		regcache_cache_only(data->regmap, false);
 		err = regcache_sync(data->regmap);
 		if (err < 0)
-			return err;
+			goto cleanup;
 
 		err = si5341_finalize_defaults(data);
 		if (err < 0)
-			return err;
+			goto cleanup;
 	}
 
 	/* wait for device to report input clock present and PLL lock */
@@ -1601,14 +1664,14 @@ static int si5341_probe(struct i2c_client *client,
 	       10000, 250000);
 	if (err) {
 		dev_err(&client->dev, "Error waiting for input clock or PLL lock\n");
-		return err;
+		goto cleanup;
 	}
 
 	/* clear sticky alarm bits from initialization */
 	err = regmap_write(data->regmap, SI5341_STATUS_STICKY, 0);
 	if (err) {
 		dev_err(&client->dev, "unable to clear sticky status\n");
-		return err;
+		goto cleanup;
 	}
 
 	/* Free the names, clk framework makes copies */
@@ -1616,6 +1679,26 @@ static int si5341_probe(struct i2c_client *client,
 		 devm_kfree(&client->dev, (void *)synth_clock_names[i]);
 
 	return 0;
+
+cleanup:
+	for (i = 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
+		if (data->clk[i].vdd_reg)
+			regulator_disable(data->clk[i].vdd_reg);
+	}
+	return err;
+}
+
+static int si5341_remove(struct i2c_client *client)
+{
+	struct clk_si5341 *data = i2c_get_clientdata(client);
+	int i;
+
+	for (i = 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
+		if (data->clk[i].vdd_reg)
+			regulator_disable(data->clk[i].vdd_reg);
+	}
+
+	return 0;
 }
 
 static const struct i2c_device_id si5341_id[] = {
@@ -1644,6 +1727,7 @@ static struct i2c_driver si5341_driver = {
 		.of_match_table = clk_si5341_of_match,
 	},
 	.probe		= si5341_probe,
+	.remove		= si5341_remove,
 	.id_table	= si5341_id,
 };
 module_i2c_driver(si5341_driver);
-- 
2.27.0


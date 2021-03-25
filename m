Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6D4C433F1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5993361A26
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhCYT2X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:23 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:51730 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230153AbhCYT2F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:05 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQvEF022964;
        Thu, 25 Mar 2021 15:27:59 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2056.outbound.protection.outlook.com [104.47.60.56])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xbcgw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbU6A1tEEXLeZDfNoQqFQ/9+LFmaiNkhAd0cE4X65aNbCMBT3oFQQzVEJA6eujW+kOYIhlYZjfHybo0EGFwgZDzJxYjjOTjwYfPtr3Wxaqs2Zqp4Dm0zAoHDGrkSkzbd2Tv9IujO2eEClb8sTcts1KKjhzxpDy/rglDbXDAHsHcMr8WrhsSiBV7oP/+Y/s7A4bX8gPENvXbURL9C/vLX5ub0WbZQGWNmYujYAee7Kj55iHBu3xivyFHdrhRgS7YuOeGYmlIcPZegCcGSZaB9AD2y2yrPhAMjZpe0kej2tlWLKQWWqngzKtsFbTsHCQLp5JQRSqvLkbqsqgm84mPxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAnGJlmAZ13TI0FLxLZUXINAyX5faF+NNEQK8Vgo+5M=;
 b=H5T+CIJRDGaBseFCp6v9qHEbEa9xtRDU/SdUhXYIe5U9yYHhOUdeznw56koO1GgOufJFHpx4hra2Of1Uh0F+18rRwhrdqmwiTKtxicdOo/zECPRDsNztxUp/D+c9b3C/fycbc6p2oliGHTBL1NIKK4zYA4e7d4hDFk7U/goUeSudDCoimyBrdu7GWrxkXBgK41OW3q46AX6fvUSwe9PxOcn90J725hfx88E5AiA2qpijf2DXesc13v+JNxulSQjMeFgSTInsh5TFFz0yoaPcA7t7xYyxl+a49aXeu4u/aYFjvacChT+TmiyyM9e3d30ExNZftXhX2SYytnyJKdTadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAnGJlmAZ13TI0FLxLZUXINAyX5faF+NNEQK8Vgo+5M=;
 b=lbYPxMtRuPXxMcII21NtFYySkrT+SjtCRigrqAjdeUs/6fOrGpVe+d+bU+v7adUkNtChg/JudNskR9aVoar6nNP6ieLOrujAPGNu9UPFVyT030jGR0AyqvjUwXe00BBx2/B5Fq/4kB8hEKEzMm6VI0rk9hACKkyKO8rHCM96pEU=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:27:57 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:56 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 6/9] clk: si5341: Allow different output VDD_SEL values
Date:   Thu, 25 Mar 2021 13:26:40 -0600
Message-Id: <20210325192643.2190069-7-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210325192643.2190069-1-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:300:93::11) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae26018-a44d-4bdc-5af4-08d8efc417f2
X-MS-TrafficTypeDiagnostic: YT1PR01MB2793:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB27939EBFCE25A4D0F155B4FDEC629@YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reE338XWVkQy4uyC/sE5QyxNR0uSh7RB7qPii93tOGqCFkph3jBlCvKfuCtIN2H3LxmlGzB4DkuYqeEjFKiQ2tDlSyKknrrztUXjLa2aW47YJQ+KWMVaTPo2QzYMBa4sW60rHHOAtITVHB97TpPHExXZ1CKPUYzP4AAqbhe1nz0TLnFrE44Lj/+2lfPwkAUVt9v3jrdzrK2Q0jCJiA2skSIY7bFeNZonUp9cXk01Rqi8F+xNAgjii+S2YIc/TLTMtNGqtjO0pPETQE38wQ02vaUYrH6TVX0iI50Ze5g6gYY51tnSRZczQqCBbuwTX+MkSwlebxvCfGWLYM5YyB3gaYX/OA9oHz7lmkH0Pc+oE2uxVyrZV49QJRA1q9mFwQwY1EF9INsX0eMqZc5yaXPUClcTu49JMDa1WTX48SSy2CWyj/DbrC3BN9rKnYtqfedDrKlvzGO0Su5gyvfk5LUrWhccmjEIQQzPg8e9Vnln0tdO8nP98DvNqpihOlJLP3TQasLtL17vTGfXcNyD3WUS4zZ+kGxZdwsZcvHgUOaH6wfBtPhVrPj5P1bjc6l5dqsn8tOtyJuEHCxqCkLlS7aQZuUGTrNR7ZT2e3g2KE7qoDD76aLS+lUhfiD4P0ZukHNTvPe/iyqK94812RIJTdW2VQ65d4p72bagYmYeDJITq7psspyEv5sgyzHDJtJBIz54Q8OCsrkYO8CCa/t2gb0lCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(16526019)(1076003)(44832011)(2906002)(66946007)(6512007)(26005)(8676002)(66476007)(52116002)(316002)(6506007)(69590400012)(66556008)(186003)(2616005)(956004)(107886003)(86362001)(38100700001)(4326008)(478600001)(6666004)(5660300002)(6486002)(36756003)(8936002)(83380400001)(461764006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BkP+/eP8zh7Hs3TlSMUWJ0dZrGMVRVSOolMJYZYEG6E8TIvH+Ij+XgcvmAYM?=
 =?us-ascii?Q?0rlkaHU+KHqTB2K7/b+YTOqaVWtgmdiN3MApb/Co6nsTzhTikHAkEhCR762v?=
 =?us-ascii?Q?nSgDjPJqxecedfgW7/Gcl31aznsumuTC2os6xukBXeKPlKkzE+doOEFJXqVu?=
 =?us-ascii?Q?76FoSUWLgo4+y998E5doS2OCczf5RcsLrg1r5CzE5r4Xo0tqDZTbxILp0aja?=
 =?us-ascii?Q?4iWvxSW/LDOsWIx25q+gm2gHhtPbxTQjWJMsJakQTbNilbw6LbpN0WDNvgqF?=
 =?us-ascii?Q?RJnQjrQ9cyruDsFwVWWhO/72IcDpw+lxwhg459iE0lFMdGTylHZ7lT+X0z0C?=
 =?us-ascii?Q?3O6a1c9Z20mwRRjuuZqOZD/kDfgxvlwicO2dlUI9uFgTZtlIeN3ASdYhqQ+9?=
 =?us-ascii?Q?PyF2A4saWa+H0vbjXmW1DLKjnZA5Ni8JGX+6rlh44jPeofc/VAK61hgg/Fj5?=
 =?us-ascii?Q?RhtjLSlJTfvebjC3uDPpA61mrQWlzUqTXAKeS/eNRt25mBICARSLy65Zgtqx?=
 =?us-ascii?Q?R9ybC/fdQ+QxyrASr50Geu3vXTyzuETtTCsEDhxaLQ/rTfPRSoPn0F0mH6FR?=
 =?us-ascii?Q?FLBlqZUHCtg42/McMdptJw4i2a07mTmPEGkO3+u8PB1YZibkKzLGemfJYDDZ?=
 =?us-ascii?Q?7PWYmSpL4E01xdxFIA6gm5lPDTS0SQshw14oYBceJ9PU09mN3l3eznbnTW2X?=
 =?us-ascii?Q?LW7OU0SHMdSXaN2Xyc1KnXpHCRKCb3e9wOZXDYix8FE9nuM0YGh3A38msxB2?=
 =?us-ascii?Q?3w7dVahsZvqCdDtGyzbXjC1Vu5nqBbdjS6qZ1SEpg/DWMObccU7p4uTQ2c7R?=
 =?us-ascii?Q?29/KSSUMtATzR7hZKA0fLJlf0vHA5lMmUSRWG5vAploq/um0fBumiU4raS7z?=
 =?us-ascii?Q?aB0nDRUrfez5175eETrpWVLtNXKmMJ2VSLK7m7/uHLzaATarOrwZUbWSJscp?=
 =?us-ascii?Q?xRwZyQEoeVkqVsvBDAL2Foyur75fDfd4RU1zDIMEooc/1t/eYFEBoM65n6/T?=
 =?us-ascii?Q?eTsX0/BXTFKHshGiioq04IuNk/ZT6vj7XeFfWti8Iwdu1xMWUvfinUWgrZTw?=
 =?us-ascii?Q?nefVJrATu7eAV0YqutS4kjuguOB06BQlbkdOMWk3NSc+Cu8Wu3fEyJY3XPLD?=
 =?us-ascii?Q?MtABp8MpJpGeiLkFNqosBhoeICDWztUIgX6x+6EzRB4VArc1E1hPGLJKZMAK?=
 =?us-ascii?Q?qUYb/QXZQKTFMVxozk/nrb7RzAKnDNJWO0enl0Aj2Xk6PcFpI2Fm+z7okl1n?=
 =?us-ascii?Q?aQjjElU8i5Za0uFgCaeY83ZerHAxetmA8YZNmRbHSsOjHAg8p3obl4/eVyR0?=
 =?us-ascii?Q?AEWTZaJY1p31Fo5DvboyDHNZ?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae26018-a44d-4bdc-5af4-08d8efc417f2
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:56.9321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTW672f5OWIAIr5r78yx4b0tiXcNsoPAzDdJ3Aguvafg3DupKYfckh721vpNRZFeHcykl6EyuWGNmQMh3dDjfqHAp5fkXBrKNbmjdT//3AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2793
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_07:2021-03-25,2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250142
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver was not previously programming the VDD_SEL values for each
output to indicate what external VDDO voltage was used for each. Add
ability to specify a regulator supplying the VDDO pin for each output of
the device. The voltage of the regulator is used to automatically set the
VDD_SEL value appropriately. If no regulator is specified and the chip is
being reconfigured, assume 2.5V which appears to be the chip default.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 136 +++++++++++++++++++++++++++++++--------
 1 file changed, 110 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index eb22f4fdbc6b..28ac7085f362 100644
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
+	struct regulator *vddo_reg;
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
+		if (data->clk[num].vddo_reg) {
+			int vdd = regulator_get_voltage(data->clk[num].vddo_reg);
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
+					"unsupported vddo voltage %d for %s\n",
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
+		snprintf(reg_name, sizeof(reg_name), "vddo%d", i);
+		data->clk[i].vddo_reg = devm_regulator_get_optional(
+			&client->dev, reg_name);
+		if (IS_ERR(data->clk[i].vddo_reg)) {
+			err = PTR_ERR(data->clk[i].vddo_reg);
+			data->clk[i].vddo_reg = NULL;
+			if (err == -ENODEV)
+				continue;
+			goto cleanup;
+		} else {
+			err = regulator_enable(data->clk[i].vddo_reg);
+			if (err) {
+				dev_err(&client->dev,
+					"failed to enable %s regulator: %d\n",
+					reg_name, err);
+				data->clk[i].vddo_reg = NULL;
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
+		if (data->clk[i].vddo_reg)
+			regulator_disable(data->clk[i].vddo_reg);
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
+		if (data->clk[i].vddo_reg)
+			regulator_disable(data->clk[i].vddo_reg);
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


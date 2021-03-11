Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8093C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AE3164F26
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhCKWp7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:45:59 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:25427 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229574AbhCKWpp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:45:45 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BMLkgU009817;
        Thu, 11 Mar 2021 17:25:18 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
        by mx0c-0054df01.pphosted.com with ESMTP id 376bes9m86-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMrwj9cwIDzG5yNp6qNao5abXV+PZUYLqClVkNZLQOPT059+pdETryiAOgZewLuEvRzp3lGOq86Zo7tYX4pfxITQYlTU0aj3mddW+ZQ2fxLM1zNfFYJkyp18bFeMGISfytGFdQrHJq8S0Hi0YjV3/QJGxa6MUWcdj/9qC00DGfL98lXkXT1sWiDjyR2Tk9jT0kXrhArpp99S+I0ZOUbV2JdXpQdTZYdH3IGxiHuZITeVfE6zd/NOJgZ6cv4syBXaokly42QplxjszNXvsyS7z+M1XFgQzl/Aq8wRxvZh8FVQfcPdPe0VV4A+2X32jkzlci+G74ufbHqS8QlsHD4E3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjcKKyNUvpP2gbc3MnQKFtCAOrmz+UNMPDn966oOCRE=;
 b=iJqm2RW1XC3sMm47/reR1sYlEn0R5EihGLp6oiQzf9VEpIxfzMngy9sBTNS15LZ8zWyce8gXmkBHHI6P3QKsGUDKv3S+oGunAsAWlTcQ7xKTR0tlNJTpJHcv7XOhMG0bQr5bkgbdZyNg/53dP1nkDXX1QgF9BmKecUMji+9Zydm8l4XBtMcuM0FAUhBDLvKYUYIEjLuiTLbYujBrqqul3r0W2LNP/37qo++usq3cjJlPwkfeexGrIcLSTffHnhctcBjfW+G9aRawgwhGEEP1YRcJzFTsLsRRw3xJz7tngxjCNUuYQZ+5rM/gi5/WPbZKvtsxFEOyPke7z8QLNYkQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjcKKyNUvpP2gbc3MnQKFtCAOrmz+UNMPDn966oOCRE=;
 b=G6wSr4HKq0YxsDCjEYxOoC9sIbn7rP26J5LgAzlvKqRz5P9cDW9GfB28iCOUeD6tTXDHIkAtQJ18kRKFbcbYk3Jya7XHt/x0bWfRNBN1sp2wzE8Vmtr0TYgJyCGENVehV6A2Hiyp5Soq0EQ6iWi21PYjw2cxPq5HM1PapvIZfAI=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:17 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:17 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 6/9] clk: si5341: Allow different output VDD_SEL values
Date:   Thu, 11 Mar 2021 16:24:33 -0600
Message-Id: <20210311222436.3826800-7-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311222436.3826800-1-robert.hancock@calian.com>
References: <20210311222436.3826800-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR12CA0055.namprd12.prod.outlook.com
 (2603:10b6:300:103::17) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 954eef2f-b666-4fd4-5a06-08d8e4dc8c22
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB09601F8C234B095333A139E7EC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0/CpYj90o+aXCXhvv/6nBh6RxLmeX3oTH1iXYTbxoBThCdrXGN31BIpH5XU3YGmMS3u72kukRpk+5Q8dHhJv72KEG/+KHrTP76PgzTaVzqcvT2L79oN1kRwFhHWvErgbuFn8Or37EO3CVNkii8SNLBLSAZoXRAvSIx/b76Gzaf7tsmb6t0BEXbS4YOPpJlEUOq/ZANHb55Qx4YKjk4CRgEDlYTMEF4UYOcxR4oNixsCbN4XLO/8Mehf7HmsbOwDt0xog9NZQazkvON4L4o4SDurfydNu2bO7qfN8d8xPsp4Q0TPwz2cvXJ8RvDMlkdSUz5jslLq1OqpLpi3Gpx/lhWelzLUyOVm37HclAcYGtPxuaW/EU5lGJf3XDzSOf3bHOM2LhK9yKTanEzzlNsrxMsarQKSS+mxg1AlbcVSQ8puJ5QKwso1ze8qa8MLEvxiilbVDIDUd4UBuuMlEy2bCwpjZsckPdgGLXZUqSY8Bl/LnKtb4a38jHBLipuwPOZnq7OaDRa4o9y82ZofT0ZKxyWGG2FMS3GSe6nLZdD2BCtHxww4JKC2dkqoGaRObgdlkWBakv+D9RDMiUNUm4Mh8yTa5jBtlMuJomfImQbJ5l4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(86362001)(461764006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vMREDbY3WIQ+Xt+V7wkxXwom0Bipb99ltqQ//T6WB/xU0gMqecbxjtCDXzgS?=
 =?us-ascii?Q?KxxtV5MjZPc2+ghU+ILwvox4rUoWzWKcxiw/JivrPEcdMLnFc13anjcfLP1o?=
 =?us-ascii?Q?RJw/dVoc9NXCm6GTt2OGao2hm+XaslHNIloscvl0LVTIiJ5yVSs2v7XFJEFR?=
 =?us-ascii?Q?zzIVLdKisPSE7TtBFQVDrO4R9tCRl1X2LB7Vdp/I1UJx8qWCJeTvyQkwihzY?=
 =?us-ascii?Q?MimVkTXWVoXZxbmH7oVNbE9dvt5Xa5nUDIQ9CvBx5YKJznpCkHsOwZoNF/0L?=
 =?us-ascii?Q?sncKAiZrd9amjv0KrI2EpW7RkCrhZMzR4h8/InhwVhLAIVOWnJovn9jyrGFk?=
 =?us-ascii?Q?7ei9xXAMXsp186rWL97tcdOZekGR7j9IKCi8PIZ8z5jlV+oehUYAykTLwIK1?=
 =?us-ascii?Q?kAyR7c13GZwhkMEk7ZJEVPb+x8Ud8dOIs0fyQnB7dw/MkUhpfLls31nJZiuF?=
 =?us-ascii?Q?H465FlQrqpwpppgq0C0wpxGNXkSgdx69UknuiAN+4V5jbbry2uJB/Q3YSCgU?=
 =?us-ascii?Q?ZFizzH91Ilyh/ynF7iLBOqP79fOR5bjRxNN4yWrkB00AHlgksxL2VuICm0L3?=
 =?us-ascii?Q?QmS6kH1s1YYXesMAyVeVNWP3N5EVlV+zm6MSQ7oT1+J4vbR50Av47mKx3ivs?=
 =?us-ascii?Q?BiEkp7yCS0UYPVsZoo1Wsiwnfxt3Xaavr4ibLBRWFkIUetFJQWfX089qZToo?=
 =?us-ascii?Q?DWVcKE+QUvKX/yae4e1Cfvqz1uxzWuCoM+5lyH85CgBTMVRS5CCC/v67gDK6?=
 =?us-ascii?Q?OH319NQ3wG72Ntp3ifCQSYEQN88dVzMK5yS3E2+v/75I4ZpRnoGxgWW6TjRa?=
 =?us-ascii?Q?/K18mWeYg++7mpwTA0XMjdolCvG3rrpgbAjFUoac6aVPDyprIvCvKBGcHEw9?=
 =?us-ascii?Q?9DF0Xgbg2dWSnSa/q64hsd1suM0dmO2H8k3C6nJXbCpGi+o0q5OaqXW1pBrM?=
 =?us-ascii?Q?iAJ1pMLjs5lpcGLLJ9tv5c4eHlXFRicyFrrs4QMC15AHBnZhzrfqkMKY6mE5?=
 =?us-ascii?Q?JOyanltO4FPnAYFJB+mRA3JSD5KlelgdtQXWPvSLRbW3rN86SD6bDg3Wscz2?=
 =?us-ascii?Q?M+TFeJtNzRbfL5C2mZ10ZfKfZdl0+nmqHuKnLJ46u44dptD31/3QtIDVx0Cc?=
 =?us-ascii?Q?5YJNBGTjQRhFEOjymGNL16Dz+xvv+akNP8D8JbMQzsaozj3fmnKviMkCGh1f?=
 =?us-ascii?Q?U7jkDVIZaYDYxWpFN+nOa8K15nVEjW6T1tnnkuPeGSVavRwrpi2aEbXHlhoK?=
 =?us-ascii?Q?Zk6Xt0lyhAXB3F8yvMkvg7rSrq0TLdDTSlQ+iWHqNpwQ3lLiomO8G+Y9yGbd?=
 =?us-ascii?Q?dJffdDxtAUwdV7d7Cnh6HCgA?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954eef2f-b666-4fd4-5a06-08d8e4dc8c22
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:16.9273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aetl636mKYUmL6N+y7FVZt1eobcPGO0zrSxzwrTQBk5mJ44NUcgx0dmveSXXD2plbzCXFRlX9kFWhObLFnuSy6EZuqMgMHM36F3r7kYWG4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB0960
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_12:2021-03-10,2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110117
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
index b758cc9987ca..f01a20fdf005 100644
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
@@ -1247,11 +1252,11 @@ static const struct regmap_config si5341_regmap_config = {
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
 
@@ -1260,13 +1265,13 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
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
 
@@ -1285,7 +1290,7 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 				config[num].out_format_drv_bits |= 0xc0;
 				break;
 			default:
-				dev_err(&client->dev,
+				dev_err(&data->i2c_client->dev,
 					"invalid silabs,format %u for %u\n",
 					val, num);
 				goto put_child;
@@ -1298,7 +1303,7 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
 		if (!of_property_read_u32(child, "silabs,common-mode", &val)) {
 			if (val > 0xf) {
-				dev_err(&client->dev,
+				dev_err(&data->i2c_client->dev,
 					"invalid silabs,common-mode %u\n",
 					val);
 				goto put_child;
@@ -1309,7 +1314,7 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
 		if (!of_property_read_u32(child, "silabs,amplitude", &val)) {
 			if (val > 0xf) {
-				dev_err(&client->dev,
+				dev_err(&data->i2c_client->dev,
 					"invalid silabs,amplitude %u\n",
 					val);
 				goto put_child;
@@ -1326,6 +1331,34 @@ static int si5341_dt_parse_dt(struct i2c_client *client,
 
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
@@ -1473,9 +1506,33 @@ static int si5341_probe(struct i2c_client *client,
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
@@ -1483,21 +1540,23 @@ static int si5341_probe(struct i2c_client *client,
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
@@ -1506,11 +1565,11 @@ static int si5341_probe(struct i2c_client *client,
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
@@ -1523,19 +1582,19 @@ static int si5341_probe(struct i2c_client *client,
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
@@ -1548,7 +1607,7 @@ static int si5341_probe(struct i2c_client *client,
 	err = devm_clk_hw_register(&client->dev, &data->hw);
 	if (err) {
 		dev_err(&client->dev, "clock registration failed\n");
-		return err;
+		goto cleanup;
 	}
 
 	init.num_parents = 1;
@@ -1585,13 +1644,17 @@ static int si5341_probe(struct i2c_client *client,
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
@@ -1601,7 +1664,7 @@ static int si5341_probe(struct i2c_client *client,
 			data);
 	if (err) {
 		dev_err(&client->dev, "unable to add clk provider\n");
-		return err;
+		goto cleanup;
 	}
 
 	if (initialization_required) {
@@ -1609,11 +1672,11 @@ static int si5341_probe(struct i2c_client *client,
 		regcache_cache_only(data->regmap, false);
 		err = regcache_sync(data->regmap);
 		if (err < 0)
-			return err;
+			goto cleanup;
 
 		err = si5341_finalize_defaults(data);
 		if (err < 0)
-			return err;
+			goto cleanup;
 
 		/* allow time for PLL to lock */
 		msleep(250);
@@ -1621,13 +1684,13 @@ static int si5341_probe(struct i2c_client *client,
 
 	err = si5341_check_healthy(data);
 	if (err)
-		return err;
+		goto cleanup;
 
 	/* clear sticky alarm bits from initialization */
 	err = regmap_write(data->regmap, SI5341_STATUS_STICKY, 0);
 	if (err) {
 		dev_err(&client->dev, "unable to clear sticky status\n");
-		return err;
+		goto cleanup;
 	}
 
 	/* Free the names, clk framework makes copies */
@@ -1635,6 +1698,26 @@ static int si5341_probe(struct i2c_client *client,
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
+int si5341_remove(struct i2c_client *client)
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
@@ -1663,6 +1746,7 @@ static struct i2c_driver si5341_driver = {
 		.of_match_table = clk_si5341_of_match,
 	},
 	.probe		= si5341_probe,
+	.remove		= si5341_remove,
 	.id_table	= si5341_id,
 };
 module_i2c_driver(si5341_driver);
-- 
2.27.0


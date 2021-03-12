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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14927C43332
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E805064F51
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbhCLSR7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:17:59 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:52790 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232603AbhCLSRu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:50 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBq92018951;
        Fri, 12 Mar 2021 13:17:45 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXDLmuqKVtUgmzvjT0/CWrRmUWp4lQle4zOWmXEP9+64nF3zPUuJARx64tRb9rVXTcZjGfMjdKP5PEkz9S12dvdtM6priMomaWjlA4UKJDDmb3b2ySdVjS2IDTTWFlojrvLxtvtLo78eSumjjVV+f16aja4oChN4wDGOohs82POfab31ABuTqypyvDLPw8A/L0ub7VAZONG9o0T5o3g0vnGzWORihNOO0Qg7NAeLwaDjQ8BoWQ3HGY9AI0LneNE9NZ0jr4UUW/XNRgUEyT6wwFMme31IkyMowWgNhCI7EPW0PCqTZm9a6rK6EgxeXUgGX7eYh+IqazZz4HRErmBVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M/wdsb3W/mqkD7bMBikg5jCY8Ip2YnH014mUcQveE4=;
 b=FftNb3iMgQW3tSSPqRXmU7TMj7lP3XoGFHIYfW7yomY3x9UGPP+XFyByOwHQpxusEEHK+6ZrAGgzCroh/XHxPDXN9sEuvkO8Iiq6IkGM7mqhAcLYhyajwijMV220FWiJ8yJhPuwFQ5jM/vzjQtCgZaBHojyFx8Wlm7QaM8NcZRa2KVJgYeOib89IrgNmxIZoLI/EOhw3r+ANkL4xeGvobsOSnUv/4Tt7MHzBoDzfADGQml3rnmofJcoI4Qgc7Deso3O/nLvqw2zYzKSp511TtPTacDRklkZrA4jwXuzT6/s41R3uOpDpowMlfLu7wZp70AN0ON/fYudHerYkMCbr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M/wdsb3W/mqkD7bMBikg5jCY8Ip2YnH014mUcQveE4=;
 b=q9NdCZp2NRbDeK3jr7DFCBYChs5ECwoPu0ZAYFu0oBk2AFA5Wjd+PQ3RaoAcgiXmYZF67xqU1OYud5xo3QAB2defb3s8j3rKW4pl7oq1C6ryGwIfuQwAt/h+A3mT7OqgePmQcSXykBGz027C/ivWYCw51yXO853SJ0mtHDkr0HA=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 18:17:43 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:43 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 4/9] clk: si5341: Check for input clock presence and PLL lock on startup
Date:   Fri, 12 Mar 2021 12:17:05 -0600
Message-Id: <20210312181710.3998978-5-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 508e3471-f51e-4d78-5821-08d8e5832156
X-MS-TrafficTypeDiagnostic: YT1PR01MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB4439AF2597678E55D1B5B036EC6F9@YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ebE9cRaHd/FP9phPtAaBfVGX/jVYMhHywgEzgxJ5kaIoOvUwh5rc/9EhFF6vTKr5TqtmGmL9SloDi9DzUU5phTqqYKAmQLDPeCkVZ6TRYvH69EqCtw4eBYk1XL/v44+kJwpeo7QmH/ChOpHxZPIkn3xFJh47XoyuYq4by6VLfXjVFrmIOvQ+hra5po4WeALmdEbgg3sSLRupPf1A171AgXEZ1mLhE5A2K+AFAcZtRiovS6dGd7w8yUs8eQGTjY3ahz3HGE+bwwzUFobi4TtqAauG20hlaWd+lzY9KDBbKN2mk7RSpvM9lJ+uzm2j5varhrYxRowJKknOoq73CN1pcg6M0i6EomRgw6l6CRz55wjr9SvuHD/jxbpIShgLzGDxHZb2P257zD/ff1TF0K8uCamhVwtm4aFlKYQXM+Spw+fA0avj+qIGh+HSl0ITxs9Au+suvaflIEYjFm/k2wVziBAsTMRlNaFxZ+vrnPoc8OBEGQ+Y21S7oTBs53LaW+e4VhNVkasmuoRCQB6ka+JOhAeTpzjwhEKoqPwOWbS/bpz5P5uMFnfjWiByxBUxKrxg6u7TctfyT1j4lvnZgnZtDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(2616005)(8936002)(44832011)(8676002)(69590400012)(956004)(26005)(107886003)(16526019)(4326008)(36756003)(186003)(6486002)(2906002)(6666004)(83380400001)(86362001)(316002)(5660300002)(6506007)(478600001)(6512007)(66946007)(66556008)(66476007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w0E7NoBEVR5veqVe3+oG5iLApcE6vavzKffnNBVkNXLO3DUZzQjoCEmmNaOe?=
 =?us-ascii?Q?rgrukNd29GFTkMc/25oPLj8OpsY/4UXeo5M8caL4gJEF57Z23AJQLjb5D0pt?=
 =?us-ascii?Q?7NTj0En7caq7am/eZM7PWVkS+fzNDkfo5PArnGajk3XaxujOpm9foUJirwtr?=
 =?us-ascii?Q?ayOsbVmoSCVEZHSk10g0Lsic92BSEcBrW+mDOylmxZnmsJme1kCfUpe6LBSX?=
 =?us-ascii?Q?ZsAPc4/Ykn4Stu6xLP+UJAM2Re4YTpFUlbBRd2pBgckyv/2k3PWdmsaWcGd/?=
 =?us-ascii?Q?GUeNrAG4QE1cD/ArX4bx9SYga+L0KQx9Vy0G2nS6utFD2jgTX1hzmS/VSm+V?=
 =?us-ascii?Q?4v+/s6TvEPkOxbArs005EHHNHxLlNLs64yNb5wNOgLZK0UmRHwApRj3jtUpp?=
 =?us-ascii?Q?cpLGSmJfF3DgclBZ4VqiRYkMYta8O8+5irIzs67QlaNwqOPsJuO0BTsvdvMw?=
 =?us-ascii?Q?LEWqkvTKFaw5nEbJaonM0rJNIWkF5J+9izqXbGZGxMLHPedR6UlOYxcc3U7L?=
 =?us-ascii?Q?AbIbIou1sYUuxU8Gm/spyON4hnMfDzYkPhHywLJs4TUwQKnLoa7goqRpkMSo?=
 =?us-ascii?Q?lLwD8pV6qHfpfiZOzT0IE9N+mVCQvgbhP5qln4FQlsTYniEbngw1lAIu7vh+?=
 =?us-ascii?Q?vvW3wMA+ztYY93IC4k1Qu3BjPxI9T5p3ZphjaA9AWGI8LwxvQHePi1kZT1Fk?=
 =?us-ascii?Q?iUx/JdNYoqcCDBM+4B7ie/+iYSyb5nr5H6f6CfFTCSBKrDY2YnORgbf8+P8F?=
 =?us-ascii?Q?srEIrJKjVbPDof4LoVRiaL+Gcr00Qf+Ln32z2ARqM7+aJqecMhqUuw6A4uXm?=
 =?us-ascii?Q?6R3LXR2Ez73xakyghAEzI0Bn0GYkc8PKvbt2ZX7xJSdt5C414ZA9Too8/iqA?=
 =?us-ascii?Q?Q7WrZ4PnPzcPOrXyi1Bnu0ncWL4c3JrXo574oBGqmzXQIPUWIUvjzm5nf0Fb?=
 =?us-ascii?Q?uGP9F84OgqiBowVGBIg13amKBZHms6cRk4++zG7JZdWVW2h432yqlxFFYipe?=
 =?us-ascii?Q?NEDPYHHqLvh1Nx2blC1kgR3naUU6MNQ9LZp0tg1LxtK81fnB1AbmPcmI5bqh?=
 =?us-ascii?Q?HLzfVZqOY4BV8w9hBBTVz1OrMy5kl6hVOG+RMzimBtOiIje8G2qc413N++qZ?=
 =?us-ascii?Q?I5hrmHmpx65b9WiVJTkYgl/337xhw5GF2K+HX8huxRQIVR1dwzW4aWHwd1dz?=
 =?us-ascii?Q?dsaZ3d0SWEohfycKMu2INwLhKgmzCp9yr2C4XlNM4OE2J6ERwyBx38x7Wmue?=
 =?us-ascii?Q?jupJPQOrhy6MJe2kt5OzTdbLYjT7oxB5zhF2hA0u6OIkwZZbN0M/6Gq8L9eZ?=
 =?us-ascii?Q?Bl3gLh07dJ/nP/0r6/tQBYzs?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508e3471-f51e-4d78-5821-08d8e5832156
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:43.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExlDSS6hGsSnpaGUG3Mzow7K2AoM492zNrOD+LG6S54o6ei4ToBulUn5sILRLzXcugdMezQRdt7NaPzJ1moUdBJscDUDt9eHkIs0vFJQFOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4439
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

After initializing the device, wait for it to report that the input
clock is present and the PLL has locked before declaring success.

Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index ac1ccec2b681..da40b90c2aa8 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -92,6 +92,9 @@ struct clk_si5341_output_config {
 #define SI5341_PN_BASE		0x0002
 #define SI5341_DEVICE_REV	0x0005
 #define SI5341_STATUS		0x000C
+#define SI5341_LOS		0x000D
+#define SI5341_STATUS_STICKY	0x0011
+#define SI5341_LOS_STICKY	0x0012
 #define SI5341_SOFT_RST		0x001C
 #define SI5341_IN_SEL		0x0021
 #define SI5341_DEVICE_READY	0x00FE
@@ -99,6 +102,12 @@ struct clk_si5341_output_config {
 #define SI5341_IN_EN		0x0949
 #define SI5341_INX_TO_PFD_EN	0x094A
 
+/* Status bits */
+#define SI5341_STATUS_SYSINCAL	BIT(0)
+#define SI5341_STATUS_LOSXAXB	BIT(1)
+#define SI5341_STATUS_LOSREF	BIT(2)
+#define SI5341_STATUS_LOL	BIT(3)
+
 /* Input selection */
 #define SI5341_IN_SEL_MASK	0x06
 #define SI5341_IN_SEL_SHIFT	1
@@ -1416,6 +1425,7 @@ static int si5341_probe(struct i2c_client *client,
 	unsigned int i;
 	struct clk_si5341_output_config config[SI5341_MAX_NUM_OUTPUTS];
 	bool initialization_required;
+	u32 status;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1583,6 +1593,22 @@ static int si5341_probe(struct i2c_client *client,
 			return err;
 	}
 
+	/* wait for device to report input clock present and PLL lock */
+	err = regmap_read_poll_timeout(data->regmap, SI5341_STATUS, status,
+		!(status & (SI5341_STATUS_LOSREF | SI5341_STATUS_LOL)),
+	       10000, 250000);
+	if (err) {
+		dev_err(&client->dev, "Error waiting for input clock or PLL lock\n");
+		return err;
+	}
+
+	/* clear sticky alarm bits from initialization */
+	err = regmap_write(data->regmap, SI5341_STATUS_STICKY, 0);
+	if (err) {
+		dev_err(&client->dev, "unable to clear sticky status\n");
+		return err;
+	}
+
 	/* Free the names, clk framework makes copies */
 	for (i = 0; i < data->num_synth; ++i)
 		 devm_kfree(&client->dev, (void *)synth_clock_names[i]);
-- 
2.27.0


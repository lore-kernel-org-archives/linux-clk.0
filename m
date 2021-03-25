Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E79C433F7
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CECD6619E4
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhCYT2Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:24 -0400
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:38479 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230182AbhCYT2H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:07 -0400
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQTYY008186;
        Thu, 25 Mar 2021 15:28:01 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2050.outbound.protection.outlook.com [104.47.60.50])
        by mx0c-0054df01.pphosted.com with ESMTP id 37ddy6a5ms-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:28:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K43+p7iPhH3UJyfEbz8CNIWzRQ0DUemilCpX5CHkCsXmxsaeQdRwQHpKH7S3h5hXY4UCoJmiBne2HBzb6UejKfch0zqBMKk11yKtIj0QkFeDCrWB362vUqMQ+VZTUJ44zPPz0mLv28LrOZBWoBZvQgwcuvlYARWwbTE4eWWc0UCtu5yt5BOEViniWAgvdpKdCdcj3YKddQr5UNlqGaBCzfDTdCWtVqaXluU3nya7cudUkh/pT5KKtoTqtm70+RbpCm/vWP4AUUx8cw5Iw0O0xnutdy3RgILJsqa5CX6P+F4o2nDIYYibetbBeJyWs1AXwljTs8j5HBzNuMegEuSB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCQsOOJXoBFjhu0F4uZ8aQ7LBB3NLqch7yOwiL1MPoI=;
 b=J/SFbQ5zbWQtBdMLhcI6k4lHOdaXJ6NMubIpEu1LuBhjuw3c8ixfk2BLiy6/lhDiutYanTMVPxB+8oNAzMM1GQmLfWSB1dewism8+6IWA0O8bFtxVT0sShjlSvphCwX6gw2jNJh+MZSCOc6RgkvdOuepcyvtQPsoCzp/6CmJ59AvaA2ELVTJRkvdjP0l/gi3SfTbTrY2u4d57fZHqMzrcJzJqpl5DGT1ekOYN/thOsMrmd85ncLM8J5qLhRkVl4tLN02Ybom9nl8O/Y95vUoWaRSMHrMXhuMU1k0mHscUvNzdKnrdGGes33W8XQUcf2JTWhDzguT49hy16DjLpf/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCQsOOJXoBFjhu0F4uZ8aQ7LBB3NLqch7yOwiL1MPoI=;
 b=FIUvIfJ4MLy0lWfn7jjSClMhylxuTqjMnEiDXj5zOjWIUjAUYFGO6QVPrxEFpnFiit/eXMIIy3/SJsxN2pc4jSUKRLrkyPX2vD+VKiVhvMPSVdSm3PjAjlg32iS6MsdgZYqi0ValfeFu3q+Wu7NugJsnAjPTZbysFNsojR3D8KU=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:27:59 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:59 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 8/9] clk: si5341: Add silabs,iovdd-33 property
Date:   Thu, 25 Mar 2021 13:26:42 -0600
Message-Id: <20210325192643.2190069-9-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0356cc1a-1101-473f-16f0-08d8efc41990
X-MS-TrafficTypeDiagnostic: YT1PR01MB2793:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB27934E07D7274999FACE15F0EC629@YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4I+PDgujxZ2kdXylm+sLeCfaHEblsyeMDfYl1o+O8EbQVP42/KR7CI6hO/U2jllT5LpSfWdZ99bT9FqPjQj530SypWFJiOuLKE0luZ8AyEeqLFBA+ik60JaYSiHhlMwBsMK3wiLey0E31x7+jDj8ND4DtBJ7JtHuxK7bNTSZsi++CX8XuJmwD7lkI3CqxOwaM51p70LWvf6e53mOuKNsLrNzC9y2mamEUFkn1p/BSEcGG+/BI2o7tzOY04H4zrJKDY5od/K8V5BgXCYrIhxhp8fSlqoxfDlas9peCymq3Z9bZA//EFRO1KHskSRE377ZmJY6KgqcRTK+AsOYJPG7auVIWY4RKFRblZYX16wEtg4ZK4N0Dah29NM/xPxnv2TrRhUyJd89SEs89lXH8fYKm23Rc8kkSbEJs3YnmpIwOa6QAZ0neua6TAppH6rsLH3IXMwj99VuuVfHL8Su1Dv5mgHiaXkZapZw3m6Mi7O/BaqyVw738GvRBQr1KQHQs80RlqsZNLvJU8Z5jry5uRDi1at1vMirCejgAeeQEdU225O8pYbGov594omXG+8+NBMuG3hlOTn7Pvpbh5402Ut5EGcu+rjILTL1FP1KwZP+clueugiRGhhtAp3fuHLQiGTeOpZ5z9xSKXogOoG7feLlw7khxRpy3sMTvjmXhIvs7DaB6IrldM65bclwd/rOG6o1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(16526019)(1076003)(44832011)(2906002)(66946007)(6512007)(26005)(8676002)(66476007)(52116002)(316002)(6506007)(69590400012)(66556008)(186003)(2616005)(956004)(107886003)(86362001)(38100700001)(4326008)(478600001)(6666004)(5660300002)(6486002)(36756003)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yRSwCIEGyLe7c1Uu5DxcwGeDxaRX7nLfECJaKb2rv3VpBMCXGLfYELxBkRZi?=
 =?us-ascii?Q?x4EQ5cpKHArvKbE6ScPh2QMfOGNd4HR3ovajPlU9A5Cp1swH4Hsgmas/4x0f?=
 =?us-ascii?Q?IXcaut0cs9IdqA47iVQpD6bJVtp+qIMmk5qD+4+UFMbHxdIvFgWvMXLvq0F9?=
 =?us-ascii?Q?Y4bg1z9iD0SOlIX60n6tIDsHrVAbuKzDL7AslD7zWwkFQv+3HWze8qgRJAq3?=
 =?us-ascii?Q?6OVJpUpMq3Mz1AUB5NIgC2+KbDKUUh1fvcrV+SLEIcuJxudq5HHGpyCacYEU?=
 =?us-ascii?Q?bSMszuFseTZINgIiodBjAbR7PCgTNCh6QYLYk+52zS1zLn3UqQFwRu6IYsZs?=
 =?us-ascii?Q?+u4Xmc9tidPehYpnp5dzKFIHFBBVQem3dKC4pl/xp3lu4Zd8pdKHRJ+KMB0M?=
 =?us-ascii?Q?zBbVKTi4Mc2SNKrJIu2PtZU7bY1XEncQ/TLn7TWDJHqNkYiXqonvBUtkGQha?=
 =?us-ascii?Q?x6cLFfo8ku2dwUQaej9s6AS1kn114lDJWWMBOTyXKlvWfxximjMCiqFUjhzO?=
 =?us-ascii?Q?BmOaXDrXw/5PIoNfMu9UfIkIEVLNknXBY2seYqYNDIdYx719R0r8xXrOnssD?=
 =?us-ascii?Q?gW7+gGgp53kqZrg9/6UxIp3HuD0NxOdf4Ke6P/zsjYQg1OjDo74y66UxZU5y?=
 =?us-ascii?Q?SLS9c3hdRTIBWNCcSCpT/BSbGl8xEzaR9SNrAI9mgYvEonV2UqJHNBH2087g?=
 =?us-ascii?Q?XT1inNSQVecZ/ZDdMR5HQ3IDY3SRjxfgOeUBGRp0C81OUDKo/2OeGb4yzKe0?=
 =?us-ascii?Q?BS2KvXa5E5xgP2m1qc0AExYikwnHUXP9W6kwaZ4ZudW82EXL1ud+tGO9bSyA?=
 =?us-ascii?Q?ahKbjEvKNVLboSRVam2VAashQgl/65z1FLYQeV5f6Xo8wpDMpqn5OUce2V24?=
 =?us-ascii?Q?dRVtyq3NMlbW3bRNeniPqcnJMu4JrYWSo31FlChKbhr/bNiuXKJOEsOvzIqT?=
 =?us-ascii?Q?xAnm3LuhKan+8L+temdBJS2vAJl//qrQSsMZC8kr/Hb4W8W9ZlapYmUWEVM4?=
 =?us-ascii?Q?JXR6k22XiGnjOSqdhYVu9GkUnUrGYWOiYEZ/vqbKAOSMexv5ZN8a+XzaSx4B?=
 =?us-ascii?Q?EsDfswrYU3RmLWKFZDkVhcsMZnH6JuZM5ae6idpV0zXPcwx+qCcJqI1xOmxW?=
 =?us-ascii?Q?rp/a9x79cONOOVawzjEqywqp96OaMSdruP9NUtKbVZZbVET0H7Qz3PUz0cHg?=
 =?us-ascii?Q?jtqW4ZJUwZIvfZ3GtOco/tyVegeJUKHP6JMLDLn2I2kHUm3WV+GjRU85lwoz?=
 =?us-ascii?Q?MJSwT2bDtLGDbK/CIVh6900s6Gx8Wyaxc+NRvOvpzgR1aChXKnfT9upvgyTs?=
 =?us-ascii?Q?w2e0Rn7gM9Ds7hWhtRcs1PgX?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0356cc1a-1101-473f-16f0-08d8efc41990
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:59.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f75hwiJ+cayfa/TccYza3SOi40jOjxBVnqET23yBqoQRo5nnkMns/Uxf7Qm+am638CsIN146QhT7527YfVq9lXmFxCQuAoiemRI8p40/kuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2793
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_07:2021-03-25,2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250142
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a property to allow specifying that the external I2C IO pins are using
3.3V voltage thresholds rather than 1.8V.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index c5ab4a5ae6a5..d4aa67a4dc66 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -81,6 +81,7 @@ struct clk_si5341 {
 	u8 num_synth;
 	u16 chip_id;
 	bool xaxb_ext_clk;
+	bool iovdd_33;
 };
 #define to_clk_si5341(_hw)	container_of(_hw, struct clk_si5341, hw)
 
@@ -103,6 +104,7 @@ struct clk_si5341_output_config {
 #define SI5341_IN_SEL		0x0021
 #define SI5341_DEVICE_READY	0x00FE
 #define SI5341_XAXB_CFG		0x090E
+#define SI5341_IO_VDD_SEL	0x0943
 #define SI5341_IN_EN		0x0949
 #define SI5341_INX_TO_PFD_EN	0x094A
 
@@ -351,7 +353,6 @@ static const struct si5341_reg_default si5341_reg_defaults[] = {
 	{ 0x0804, 0x00 }, /* Not in datasheet */
 	{ 0x090E, 0x02 }, /* XAXB_EXTCLK_EN=0 XAXB_PDNB=1 (use XTAL) */
 	{ 0x091C, 0x04 }, /* ZDM_EN=4 (Normal mode) */
-	{ 0x0943, 0x00 }, /* IO_VDD_SEL=0 (0=1v8, use 1=3v3) */
 	{ 0x0949, 0x00 }, /* IN_EN (disable input clocks) */
 	{ 0x094A, 0x00 }, /* INx_TO_PFD_EN (disabled) */
 	{ 0x0A02, 0x00 }, /* Not in datasheet */
@@ -1160,6 +1161,11 @@ static int si5341_finalize_defaults(struct clk_si5341 *data)
 	int res;
 	u32 revision;
 
+	res = regmap_write(data->regmap, SI5341_IO_VDD_SEL,
+			   data->iovdd_33 ? 1 : 0);
+	if (res < 0)
+		return res;
+
 	res = regmap_read(data->regmap, SI5341_DEVICE_REV, &revision);
 	if (res < 0)
 		return res;
@@ -1544,6 +1550,8 @@ static int si5341_probe(struct i2c_client *client,
 	}
 	data->xaxb_ext_clk = of_property_read_bool(client->dev.of_node,
 						   "silabs,xaxb-ext-clk");
+	data->iovdd_33 = of_property_read_bool(client->dev.of_node,
+					       "silabs,iovdd-33");
 
 	if (initialization_required) {
 		/* Populate the regmap cache in preparation for "cache only" */
-- 
2.27.0


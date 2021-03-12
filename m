Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A996DC433E9
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8750D64F4E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhCLSS2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:18:28 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:47104 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232740AbhCLSR5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:57 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBq94018951;
        Fri, 12 Mar 2021 13:17:50 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/StQG6VCp3cmumLDbQbcC36dk92Qhu5B20vEsIGHETtnXe5pIiVAWuFma8J3xrRbxBCy8FNzI7QfJ++uIZDDOJ9++Ad60trAlcW6H6s1cIPsnSmbtEXpjLTn5kdI16RU/u2JH4IaU+YdZGsOlVOVkeK1g5KSKx5zbvndje9TGr5op6/bpWrmrdgb+X1WzCn4iP/+o5I2rj+NGkBYXULFQTlIjYIBE2g/bEC6CCeftygu5VXnJjBgAqJX+tD+CGxWdiIlVGUP0lOZ4pcimxFOBR9LJwe6VFaYOLoT9iIKzr5WmN8Tex10zfej4AIh/hCbeOpoTObbI98EWIgfz9U4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhg+ydb2PbzLdBSyChmEHLHg2jAFYYhntmJ8CNVXyN4=;
 b=kou/V5vCnAD48R4D7dO5ZxOfYBphPZQCroB0r0NwG3Fofeoo1xzNlPz6DFsftX10XupQ3wEpAczDpgya8xivgE9cGbe8X1XCMjzeuC91BL6fCYFItbkzi13v/Yiwp3GiF3+n5hcKQsCYWCXR0kgImG5jHsZa92hvKua+RTrjGbFQCVH9LZKX3KzXUZbNXw28ifGMv1kbYXWP5hBcjchJdLDt/PJGxjMhKOuIjyANmDojlPo28hpVB8VQfVErefBvuPUBzTeN0Q6PCr55soRrFJvg/TEehAtNVRSLELnNQZoJqrLZz0Mt7TvvpxgTMc2mJqJHUj+1qN9i7aVq+KP+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhg+ydb2PbzLdBSyChmEHLHg2jAFYYhntmJ8CNVXyN4=;
 b=2l16hacmPJOzkm6M55EW/5Zkv5z29wQmjslFVzloPGYsb1siy2JLRy91bsQ+3dMApvG+zSByjfFdG1Tup7w1uvcETRofjVTpkyD6aqzxlWK1RaTl/qvwBDQ7HzCsB2hvLUz/dqmxGC3QUXskk3GqotsBMzRgIlYKbJZm4esnpX8=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Fri, 12 Mar
 2021 18:17:49 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:49 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 8/9] clk: si5341: Add silabs,iovdd-33 property
Date:   Fri, 12 Mar 2021 12:17:09 -0600
Message-Id: <20210312181710.3998978-9-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8fbc1f8-2d2b-46ef-8fd1-08d8e5832482
X-MS-TrafficTypeDiagnostic: YT1PR01MB4409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB440911BDED8A9C4AEA5132C8EC6F9@YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSUNwR+TisXZZL5DY/SnnZvT7RXJy+BhaLyOLkBTcEjGksDHOuQILgE4mroRZ1a8OmgVzF8iLgRJJ0MzuNU1DvIdRwh7iX7OBtXnc8gfaMQJYk/E1jRn5chXmcdtxOvRVA1QHYnoSHcBcMb9WCpyYaNdnDHlHzIdhUCrjWf5ioPhKBGTC4LwUtfUE29kNQvtJ98oDTpR61PRMJsfos9ikqxLIoJ6QG1MtbsPs8u07eQ1srIHAYUhxfBQoW/IBZqCqvWHKbJsq/kTI1SOTUXjxlboLvR4/LZ0Y28VfOYWXVghyXnYzc75OLWRt+aZlBrqK6KeV+S+uAw5K3rIBaARxS8ZK9Mpa/Jfh3CvSotUKRTmiSY+7XAt4KzeQ5TzjpvzPU78GVhmNibXzv1KPEbaWF8K68njgD+KYlU8FTE8AMrVHDtpqfSd/H+bT9oozAsIfyvlC5P93V3YQUiihtGy+YMRxjwBd77XMMpWB65uY/sk5o1d0DgMuJddpc+NhIYsUaOARDrwII+g6upmWdJeqUfRWcQRw1mfYF1jqhZfgfFiqZMeOL6HAk7zyVAvThqLFgIv/ZEweWwonba0n3tDNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(366004)(69590400012)(186003)(44832011)(956004)(26005)(1076003)(16526019)(478600001)(52116002)(66476007)(6506007)(4326008)(83380400001)(66556008)(8936002)(316002)(2616005)(66946007)(5660300002)(8676002)(6666004)(86362001)(107886003)(6486002)(2906002)(36756003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W9S++6ZxdQBMS5k7oGyEbiNAWW2bUjreWWuvbEVuMSLjZLKvS2L0c4g0n9GG?=
 =?us-ascii?Q?nB0N+KISp2K+Hxc1+iEYnrUTrmfpWfpeQXcGDeIepXJEo2jo2GEfqrOhhJht?=
 =?us-ascii?Q?liPswhYYYWZ8BQAoGAR0VWr7/ep/5CAo5R8jLPVVOyA7DeH9C9NAXH94Ukat?=
 =?us-ascii?Q?HDTCpfuyiHiy4mFwcKDbH1z8HQIa4BCl+5sWUvgtjDFqUPiozcpdl6b46Pju?=
 =?us-ascii?Q?3vuj3WlQh7A22fjxRuCROicLtXB4E0y69gNzQXjmBbwXQ5JjegULlE4zs2sH?=
 =?us-ascii?Q?QpdRy92oxf+LGEKzBaavOUnCwF86K8s0EHKzBee2xWFWw5AdDTM+JoVFwIH0?=
 =?us-ascii?Q?ZwfD6ezCVFoo7UFuswqqMUx/xdWVs/4uwU75H/Zzycb0G0PoCdpIGMk8C9Ph?=
 =?us-ascii?Q?7yn+z5ckckzwWk9Uws5304cAyQaeiWh6NEnNyz51Xo+GFghbAJ25jIPkJ47b?=
 =?us-ascii?Q?tkrtrJnNLWWSQYuGFhX+duB/QZWS0iCU/XBvZvBs79936491SAfZT15gSHVM?=
 =?us-ascii?Q?v1B53v3IYNi7kr4ifK3iHAeKBs8wUalfkoAWM8up2VEgJ9IdKZSkDFanr/gR?=
 =?us-ascii?Q?Bs5VcD97MR5IYzzgTPCbGMcjtTmP8pSG3cRzDzq+KYSTI+GUkWe4vhJCfCpg?=
 =?us-ascii?Q?O9W6LBvuFBqHpVKPl4ZZmhjLbri0dLy0q/C4eYlwmGhJfj7wb27xUfk2EG1S?=
 =?us-ascii?Q?f6JI8flinZEky3HtxpABhy3jqiF7/HLJ0hF/wTVRuX/YNsq+ZPDObDEszWdA?=
 =?us-ascii?Q?yGk79ek2/JyDYSJP0LniYMw3cfNkYtarHEWUW85dm5w2dRWMY88RZCg6/Y9o?=
 =?us-ascii?Q?uwLB5m0jWoxsjTi22f/5lpHDebbdbofHO+DDCiRkZ1Op5/nWGbEeM5NZiAWM?=
 =?us-ascii?Q?PD1B8hjuu5GhobBEH4E+LMBXsYRXwA1KUAGS4jwafAaNt8Jl/oRSvJF6iwZY?=
 =?us-ascii?Q?OyVJalVTMCf9vSdI/CwmGa53dN5E8tOsc7yz+o7GodojtSHIVaT8Hfrfmghe?=
 =?us-ascii?Q?jq/VzDyVtu4YYGl5FUPNMd9EyhxQVNu9P4g143nDqV7nu0qVq8OLsW6bCyAu?=
 =?us-ascii?Q?2X/nzRtlOSd4kHkbDAwVvAfemKpRG6Lg659SUWGo/wzgCjO98ax4Tl1ZBq4W?=
 =?us-ascii?Q?PH5o8z8AKfW8gYxnyVNx6/YndUbZM7/4bNldrSrnwBff6VuHDmwiJsDcV7/w?=
 =?us-ascii?Q?ZtCutJ95k6pHMmsjlh80FUr80yxucWucrYu+BYQTihG8cyGrvAEDNsalZSqF?=
 =?us-ascii?Q?pA3J+FKqv1yeLYVe94Qzr24xm5PLxtD5xpEolMj4VwBYudFICOuVX/mlCa4V?=
 =?us-ascii?Q?kYR6R0XOe+sM9H6HWG+RyV9O?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fbc1f8-2d2b-46ef-8fd1-08d8e5832482
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:49.0437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrSA71gqRmAH7TLysigx+tYqsYrvdIOWrNhko0MKnhVSEG58Mzf22c4BJxO5U2hQy63ek43LLk5F2f6bzUlJ1Tiy8a2+3ZXGh83MzMJPUwY=
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

Add a property to allow specifying that the external I2C IO pins are using
3.3V voltage thresholds rather than 1.8V.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 689f8c2b0b57..966b034a318f 100644
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


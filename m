Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25079C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C869D64F8D
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCKWtQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:49:16 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:12950 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230489AbhCKWsu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:48:50 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BML8bX021370;
        Thu, 11 Mar 2021 17:25:16 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2053.outbound.protection.outlook.com [104.47.61.53])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymh9da-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdMMrR4SEzPDHK1g9meLEwTFjCzikryLd/+EdhT8nnnSREB1l8FrcPC4q66BZpSZy95fVtei5Up++3B1HvE1mS76tVTxvJxLLazD55t/G73p1j0NyJDJ5cbb/ePGHK2OeBoTjYt9gU+H9GKuKzBaIyNhCDWNK+/+/XbYhC9cswlTelwaz3g0QNkfinmfHDQ93hFTNeKeaLxtWaX2qjG1RO8MBwpK/VoEMn1vZNLwYmwOq9FGmRIPiIyqb1a+TBPtf1b0G15Gvrwrfw1uRlhyRyLNM/XZs1XELZiQLmEZCpjgmi3uaXsd2urh5MIXPkzV3aZ94iSC1BUXFeHM826nNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WI8epYpgU2pi0jjIskqWRC4Qtf7HC/xj56GE9mczrxA=;
 b=KDanZPW1y2i5lGnVZO2u8twSDwea3XXntdgwuLTK4wnoLN3jDgwirHpVFHjgBvszbB3E7ZKBHIbnD7jlf4lbk6G59OWor33sbYbW55y0+/awdnWi7IlVGBaH0Xby0r0XKk3xkhS2Upjf7A3G8Vz1bm5Hpn3NVs0hOCQNo9q/jOkFJC0jkEne234vLcyz6ADFWTtZK9vTJaixSGJTBhZANCENGHzNwCjiVwpnboO8Q6pIok/ww2gHuYUW4oAYCz0rVE/Rt33pXxPxdaQxkmj8knZJGad3sctN2u4MtUSARwCKhx0D7ggVZbIPzKOpxV2aYUTmbjS4i0bbVhoR4byvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WI8epYpgU2pi0jjIskqWRC4Qtf7HC/xj56GE9mczrxA=;
 b=mLxpi/fB36wnFlz5DwMB2+3yM9St4yEwk/atqyp/p8n59Z4jD466w8SwwzOS+srqMZhhyEjMrimCYJ/NzxB1mZ3l5Q+qesGwAPwyYwFix+GtylceMDnkDGqILSpXh9wzkTVEx2fai8MB0wBn8I0I2pq3eNILqXKCwPX4NrqGQRk=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:15 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:15 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 5/9] clk: si5341: Update initialization magic
Date:   Thu, 11 Mar 2021 16:24:32 -0600
Message-Id: <20210311222436.3826800-6-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 176a753a-dd76-4241-7db7-08d8e4dc8b5b
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB09604CD61E33F84B32F9B32AEC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HdT60spqS618uwhabsMkDv81bGcFrspRz/E4O1W6bt6WJgVGrmmGMOkjzOJ1L2NuxMSubj+T2CW9O8Zaozzrp+65mmehbdGpv8DBuTMuH376/h5uA+CRzKCCUiBDFnDJZsbx7vY2VuN9zooOpAVRxEDvtxyxOZRKJx4vwh9GG8/J7E4pq42DxQOlhI6AhJLJtnKPFTTcmdqww5Zm4ajK52k+o7fSAOztVe9a/THNN6bhMmj/zDiwneNLbmpuMZtqEypWxS7mLB12KYiuy3Ph9mdO1kzLDgAfn6444sup4NEjrCje968Q01Pk0lt5YGDe7bWou0rUNbRaJVMWSy0MKOiex+qhGOKeFLV9l/uq0jh+l3q2Su+LH1zcVKiVRRQ0NVDky8OTdW/n0Dd/vjja6y7l0MbvUywfIYV5KjfIN3dOPtC9+2w3Iu0aVscZuXoDk1+bXoE5yB5F2xdbURW97fQltryykfA5xU0nuB4p9/rAJP9bRFmGc1KF+tFtwFLNIbWtdMznxi8P4SI0JdrMhVgKlR0nkbMS7TM4G8eNe/Ablh3dZrEDB7MtxXLKxBFvnsRdVSNgq/eEbQP3Flezsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(15650500001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nv+I10JsK7GFY5kaCQhzIhigpws5RdO6AtglYKjI2QgVswewKIB4ub+1ZrRX?=
 =?us-ascii?Q?M44RvnGiK5i1IX1+0up4CaJ6irBEpXey6eTNwslnsfW4LIH8H1IZ8fvEB3/O?=
 =?us-ascii?Q?FKAgLF7rau2wy06C6EaZQKzU89ZejbqJeJNUKeOTTb45RumnT5kxSSF5SBi3?=
 =?us-ascii?Q?6wM9stpAfGz9S+dfW5VzX9kaN9fWTebf46QSQOsKe5ihqRuzri85DLbQnfJv?=
 =?us-ascii?Q?tp3dtuz3jnE8N1Am5zMtwM/6eOkTbuJQjvgIh4v4FJ1TPwGFkwxLHzGkl0M6?=
 =?us-ascii?Q?KKvBybocie8VLcGfocvWk4WnnRnVcvIAsUjetEvWv+29C+0maa1Umc5lDbgH?=
 =?us-ascii?Q?Xi9MGeviGUW9quno9IPShdyKAo0cL7ByTzpFSsTlC8UqD6pfUadG5NJIZw6W?=
 =?us-ascii?Q?dx7UvC+CAk7kwyANFSphniTE1XbpYwoByGs0DybzemRhw5yCvtUjTt6oCVkq?=
 =?us-ascii?Q?FuzXq9ZwlcG9nulfDsT7J+MyYkDrGAbSsn8pSSWYZdvzJfoVpDHmXVTFiwLq?=
 =?us-ascii?Q?n2DA8DnZ9sDJLO7QFQYCJGJho2oicof31wJVLVybZPmqAzBoAxktsfaAY8TO?=
 =?us-ascii?Q?qGyasZaKX4TquAw/4KxWmCpx6xB53uqxkvkoJ+XjBMnCH6K6k15VCMTNI7xp?=
 =?us-ascii?Q?3fJQLD7b2DBT+fFGO4qVNZGdPncvqUakBdZywPIv7rHEA0J8TvdGrfmC/D4g?=
 =?us-ascii?Q?ZcOm5hhGG3CWyz3hGnTvLU5o55bVABV1UI3X2uLcFN1MgDUFco7M/XJRRUO+?=
 =?us-ascii?Q?uFVergj+WNM6ZUeMuXWTogGsJtBeNq9Oc9HpJdTv4LiGbMVI/uP13cpc97lF?=
 =?us-ascii?Q?bm9Qj6POhxm65e7NNZOH6S7GE2w5NDD7j9bxb6u6xUAMW+CQnPOPpzRqhT7X?=
 =?us-ascii?Q?crTP3Fpf9P/WBTX7lkczZ0GMzZKqZ4bJeGcnkhV9ay80tpcy4nopU7LnH0fh?=
 =?us-ascii?Q?dMEgRi+jaCj958Nv1HwYYdef/JGwgQZC/SVrGgqyFuCaTlywEoFrTVOpQWUK?=
 =?us-ascii?Q?tCdWiFJJROv66uJCzHLiEjuK0Usfs2Vz9864b0W5Yriipm1DdmB78X0uiHV9?=
 =?us-ascii?Q?Z10q0b5xhBqT/3AqjCFJHh1fL+L4Zfj3uoDbrz6qAwsMK7mnCD76eEaCkXhr?=
 =?us-ascii?Q?AIMjGo5i6mLqnBrVlTCWx1uHinaF+LVgxJI6/IRhshtQ3kbS/b22f4J4MNAx?=
 =?us-ascii?Q?PzcxCMweJb6QbJhmKLg359Kxe6T2mMJGOVG/gTaZOLPinsqomIsfPJo2qzBO?=
 =?us-ascii?Q?24CU+zIDDiJpphp0NDn2/sS54MU7WjfHrcpJYJy9YEREZF4g8Qj+PFZXUISD?=
 =?us-ascii?Q?6b2AOyO8X5rlWmPgzNnbTbEf?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176a753a-dd76-4241-7db7-08d8e4dc8b5b
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:15.6781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5oex0CpWUgsp5OsDPrDRakBaPVsja97R/mmSdkHWsrDhgjM66f2egLKlkAr12tD313DoqssqccfIcUcec31O5e0Zjux0arphSlml8uVMUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB0960
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_12:2021-03-10,2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=881 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110117
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the default register settings to include the VCO_RESET_CALCODE
settings (set by the SiLabs ClockBuilder software but not described in
the datasheet). Also update part of the initialization sequence to match
ClockBuilder and the datasheet.

Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 5221e431f6cb..b758cc9987ca 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -350,6 +350,8 @@ static const struct si5341_reg_default si5341_reg_defaults[] = {
 	{ 0x094A, 0x00 }, /* INx_TO_PFD_EN (disabled) */
 	{ 0x0A02, 0x00 }, /* Not in datasheet */
 	{ 0x0B44, 0x0F }, /* PDIV_ENB (datasheet does not mention what it is) */
+	{ 0x0B57, 0x10 }, /* VCO_RESET_CALCODE (not described in datasheet) */
+	{ 0x0B58, 0x05 }, /* VCO_RESET_CALCODE (not described in datasheet) */
 };
 
 /* Read and interpret a 44-bit followed by a 32-bit value in the regmap */
@@ -1104,7 +1106,7 @@ static const struct si5341_reg_default si5341_preamble[] = {
 	{ 0x0B25, 0x00 },
 	{ 0x0502, 0x01 },
 	{ 0x0505, 0x03 },
-	{ 0x0957, 0x1F },
+	{ 0x0957, 0x17 },
 	{ 0x0B4E, 0x1A },
 };
 
-- 
2.27.0


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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6DBC43619
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 919CB64F6E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhCLSR6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:17:58 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:45757 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232602AbhCLSRt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:49 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBom3018929;
        Fri, 12 Mar 2021 13:17:43 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kc-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC7H8VPQ4b9Oh+bALbcdlwz0QYgeRF4o21Z1t0W+sh0ZkxK/w1x/HcF4kjcJKvaf3PRnHi4kdC53/D3+/nubdz+mJ5cCgfDWMnwlK11VUrdSVGA83CPDKJsNmO7XwWUbGQWoRKL1O5LOQjycr6ptQ8PtacUnvN290rU3tkizf92EGN+nQn4CDTxKshmM12kKrzzNjLzhh5zOLB6aSc3bd3u6QZ6iONu8d9TiCy2Hhn/WegyOOEfr4S4txYFLVopYZLFDPsBW+ADKDYub/0mnWP0A3KzTHlZkRrY/c4CVHw/YlYRgzKLj52qH7fm2Au2P3cMwYnOpkJzFDn+HNRC+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx4j3QhKkPc4qgBW8L+J/EEFbL7uoAIZCm+ICqFashE=;
 b=CPGZBDzVdlsNcuW8t3q5+wslZAyh50VkeAfQFS0OGLUSoxGc/H9hKuuCGBTxEUNfhCBJXjPeT9rnonXjvJ4AvCbdNHUsZw2FlORp5jqt/p/5EuvEAf2RGgXfW1bd/RzPYPwHVkYkOfRXgTd1fazQtKllSnMkKEMuu7FWecbiWerOeyc5jO/QP9OUG2+2srGO4q/eqoc46P/3OxWLo6E0qObcr93zymCoBGcau/gcTXNXCVTAnuT8c9AROtOodOPaAJ2sKWXTg9NR8F36Ycl8pWQ8CxChZU9P4Lt4XKD/7rbSU6C5BjEvH7rLKHXSJNjYUfnxJJaMvHaI6BmjCK82GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx4j3QhKkPc4qgBW8L+J/EEFbL7uoAIZCm+ICqFashE=;
 b=4k41D7Fr0j1D7ooD25BvaNwXlFvCQSnc9LTjvcqw6B73V0TPQBKLYCdgoYLGLbYWBZJ80UcgMahCFp+YN7rG3HWuW1NC80fu97SL/ZTLbiKv8bCiz1L3ORe69/6F00x49Lox+Rzexxb3aAcD7whOuZvsV5Nnh3pL1zjJqdPm1PA=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 18:17:42 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:42 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 3/9] clk: si5341: Avoid divide errors due to bogus register contents
Date:   Fri, 12 Mar 2021 12:17:04 -0600
Message-Id: <20210312181710.3998978-4-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d8f3cff-d722-4090-cbd3-08d8e58320b1
X-MS-TrafficTypeDiagnostic: YT1PR01MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB4439D4DB16E816D9761BFEEEEC6F9@YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tlRAwPpoi6P9exp6WeLWO+XphitEbxFFiJR/obqovnhrstc16Fj36f4fcOOD4o1YzhuJRjm4e3ejhjpm76+ZOyeuD1VI+LrYLxkZZQz0W2UMhQlOTLNpXPccb+y0fuCKNJKBXVIscaCytFof9izg8uhQ2COvZhkf7tp1sdJvzkj7+gfW1lwML72pvZHZvGkfUh9ozfLvbEmc/8ZxpXC+3NA8q+//yq7lhiJb3HlhxlkT/an7DAAyU8+ygOHmOoTUpq99T5iOHYtpoxO6uz7hA9lYmxxNgkOc7tjnu/CT991fTmuB1jke1P7ehnzzLywVjEIggJZWzm4byavclGUU2pWyq55ys05DYFQkRJXPfOoyoHD3damtbiNZdrrdlqltMcaXasdc8SgzQf1urMH5f5RfLYTJgKvFzJ4w3aGDWaUnNg+GOXBPLrlx2T8fC/UOLZpUJo3gBtM+beuX/Op+Ru/Pb0rw7HxVz5igLDkUTUVkaN3K7klQwHw/FRQFdfju/HAODy0S5AvtavM1+937FwnvXAPq0uXlgUoum3J2rOEW+OKYwGISDoI54H8i1um3jaMZHCLNgavpBMsvS3Y8lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(2616005)(8936002)(44832011)(8676002)(69590400012)(956004)(26005)(107886003)(16526019)(4326008)(36756003)(186003)(6486002)(2906002)(6666004)(83380400001)(86362001)(316002)(5660300002)(6506007)(478600001)(6512007)(66946007)(66556008)(66476007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XxZJM9bkD3aBY/xePdKZk3e9ErdY5MsNAx7+U4NXONolEY9xhUR6/ovNYaHX?=
 =?us-ascii?Q?9ESrbx5JjrW28Y2GottvVT1YDJgBGqfzapvdt6veQcGJXtnsFwi4zICl5W+l?=
 =?us-ascii?Q?FqP/zgF61SZr0cOMib/W64TuOftPqcQ8nzrHGerNuaojIaQjQa6kFraiBqyW?=
 =?us-ascii?Q?xXISZmg+uQC2aihlq3qft6U7M6dRxE85ILOCOGy3+sdJ++3n2F2yIwYSr6kl?=
 =?us-ascii?Q?yhcFASCGZZfspR0tt6IZz/O19+jI8vKlBP7oyFx3vyFbCmK3Xo2UhtZG3Hfp?=
 =?us-ascii?Q?f5C8//PpHqxj4GdV5RvAFUCpMf3u0Lckot+NvPJUDec812L2/I8iYTsXudKL?=
 =?us-ascii?Q?Y/W0J2d1j161W8tGVcM4lw1z6USMLVuqUulkBAvXTIS+9a7zw1nsBo7VbsK9?=
 =?us-ascii?Q?dC6Ju5EIKmgcapbhZE1FU/+NapvCR2Tbh3q0OSoya6HI8vdlL7EaRx+TTnqf?=
 =?us-ascii?Q?hPDkGAS9rA1WMi3S+aSkNxKVLHb2FQ8s2uVmf8oPCw2k4vX5zbhbMhgjT7BA?=
 =?us-ascii?Q?kMwS2pIcylkADXfyyuBtpGX51OkFNht8cflsvmfTA6EUmJY+G7gFRLJBN6aG?=
 =?us-ascii?Q?yZCoZH4Yy4UFXnjiYjWCSDTGYRb3mRrxSnyr1HXspvBNJpbBI/8t1ylCdHgL?=
 =?us-ascii?Q?UViTgqEGA1Sdvoa8CLXotg75sA153BG5mwt4cwJ0/o4ERqRBswFoXMYHDTjb?=
 =?us-ascii?Q?FNXbfrIpj81OAEqYDwXYsVMsSXaSxb2e+StBeho7G1zoWi0cTp25EqnDLvyE?=
 =?us-ascii?Q?C3bQniztrw2UXJQVevWqUj8hPYQcI1T0tGer+LaM6tV6AlGsEsHV9PVxVrgi?=
 =?us-ascii?Q?YraeW09OdU9AHu3GmbU7YiZ2X6EC33Kv/dwUD9DRMDw25pgk5SMyyymZN/pF?=
 =?us-ascii?Q?mkFfMD+54ExZ2b0ZP+xp3nnys3ycyZ3HvFw2c2pA3UxgBYljJv0x1m4KZzLM?=
 =?us-ascii?Q?0vjKEWAzRaxeMdVRNZmP84C3+QPiDUJ0As008VdS8kizxyWRLC/cA7Y+G1Jv?=
 =?us-ascii?Q?ULKILEXfAhxPxvnSmjC2/+2zMcphA29pLFazH+DZSB22IIo7rNUrwoK8FPFA?=
 =?us-ascii?Q?E5z+kmG1fesUb7wc3nB81zIjLx9H+M6GS8VT5UHALyZCxbPrwVW9ysBV2sbn?=
 =?us-ascii?Q?BuBuVxLZ/ATjImtslbmk0QB7YmY1Q20OkI2WYqXCAgiIxQ4vm09XSZoZtRHu?=
 =?us-ascii?Q?JtBGvebJweAQygCI7ePqInRLsCz8lAIVbzMxuPyBvIFhRtcLp4Ba9Oj9XMma?=
 =?us-ascii?Q?xSGXjUgFkvAEDGyoNGmdR96XL8igIQXlbi0lxU8itP6E5bLjW4lKE8FZtxuE?=
 =?us-ascii?Q?xI6leq8f2N8H/xJ+aoVrHQWx?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8f3cff-d722-4090-cbd3-08d8e58320b1
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:42.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJzAgsSrXAZvB3xiXVo9TOIWrkoJ1+Msd8dIcm56R/TsB5ruM6JM57fYSKMjC0ZYRSPVWtnCr7tI0s1RO6iXByBzdQNZnPFrOey08ZdjOes=
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

If the Si5341 is being initially programmed and has no stored NVM
configuration, some of the register contents may contain unexpected
values, such as zeros, which could cause divide by zero errors during
driver initialization. Trap errors caused by zero registers or zero clock
rates which could result in divide errors later in the code.

Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index b8a960e927bc..ac1ccec2b681 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -624,6 +624,9 @@ static unsigned long si5341_synth_clk_recalc_rate(struct clk_hw *hw,
 			SI5341_SYNTH_N_NUM(synth->index), &n_num, &n_den);
 	if (err < 0)
 		return err;
+	/* Check for bogus/uninitialized settings */
+	if (!n_num || !n_den)
+		return 0;
 
 	/*
 	 * n_num and n_den are shifted left as much as possible, so to prevent
@@ -807,6 +810,9 @@ static long si5341_output_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 {
 	unsigned long r;
 
+	if (!rate)
+		return 0;
+
 	r = *parent_rate >> 1;
 
 	/* If rate is an even divisor, no changes to parent required */
@@ -835,11 +841,16 @@ static int si5341_output_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long parent_rate)
 {
 	struct clk_si5341_output *output = to_clk_si5341_output(hw);
-	/* Frequency divider is (r_div + 1) * 2 */
-	u32 r_div = (parent_rate / rate) >> 1;
+	u32 r_div;
 	int err;
 	u8 r[3];
 
+	if (!rate)
+		return -EINVAL;
+
+	/* Frequency divider is (r_div + 1) * 2 */
+	r_div = (parent_rate / rate) >> 1;
+
 	if (r_div <= 1)
 		r_div = 0;
 	else if (r_div >= BIT(24))
-- 
2.27.0


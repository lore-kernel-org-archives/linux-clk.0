Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB6CC433F4
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABDD961A26
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhCYT2W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:22 -0400
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:43233 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230140AbhCYT2E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:04 -0400
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQscn008256;
        Thu, 25 Mar 2021 15:27:56 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2057.outbound.protection.outlook.com [104.47.60.57])
        by mx0c-0054df01.pphosted.com with ESMTP id 37ddy6a5mq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjWpS7V4AB3xJsRqGkdOEux/HiuzD+BgEe/RgiF7MwX7uHYp2YeqyQsGZ4gY3gWfGgmUWdtvAYMD59tLXG5zeLPjuspEFGsyGD368ABP8BE6CA0h5XwMzTtEBeNDJGRi7bxfJOBVC7H4lhdvBy+zabfPp/0wGWTc+IVekp3N8HMhhkhf00etkQbNg95ateLWcDbCXaO8iLZLelr05TA4FY/T4A7tudiI4G7/lSnMCBwHhv7TuE8jSEz4UIow1CneICiLrSS1StYce2TzwmeaeI3VNkI6X3D6+nSg3lEBJREcX85ZuIELiLLZBNakIpHBnrXgSgy9ziVHNpzqALLBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blLvoNM8Ox52kNXwQqqZCFCIqhsWBEdzVRv5nHs+CB4=;
 b=TwUgf48aPfLHo4aIJa8meTPPJWfPU/SSZyzoLQ1MwkiwOPinxWVj/O3ILmPRWt0YwVAe0je+VLuUFus6JYcSLSDERYMM2dXHWUYojDUiCfHJfWN3/3Z8Pg7s71HZuAxYcPlkn/W0lc27ydpBIGVTfjmAZPlK39Dqvt1i9TBbzQhbFMZa8j0ZkwH3EK8BsDHG5xShITnj541ys0kEGrTU+MLzhO75Nqgrox4/88MUtPmCyLdRvDdbJt7L2TR9TjJgpTS4pHSZl0mRP54/SdevHH8jCKCSLUXY1VQn+uVDinmsvUwUsyl3oJeZV5wZ0QqEjUUYMiouxWB10AzyX0a4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blLvoNM8Ox52kNXwQqqZCFCIqhsWBEdzVRv5nHs+CB4=;
 b=CHfCaCkDORmvuP3/qW1zzuTVZEoWnz9nSJ2VkCbrM21sowqBBLSbgptuB4qTY1MnsL+/OZdiv8gel3q/BNRy6ZdUAc5ZrZpTtF3Pa5oYAknbfgZUhaIhFWdBZHSxiEdfomVFs1aNNyLnBm7UmHXENYFjGuAp7Nw/nqOH9k2GMKI=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:27:55 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:55 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 5/9] clk: si5341: Update initialization magic
Date:   Thu, 25 Mar 2021 13:26:39 -0600
Message-Id: <20210325192643.2190069-6-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05e33962-43f8-4c5c-ad40-08d8efc416fc
X-MS-TrafficTypeDiagnostic: YT1PR01MB2793:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB2793F68230B23F420C9167DFEC629@YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gNJnyE16VIQVHIE++809BQFCdbLgVlpYiOvDAbgQcnoixG4/T409MsHRZ49g7aZsJOc2z5kpc6R3eCKsYWnG1lJnZm5Qo7aHe5aBrDQcd0LvmXOLHSC+YIxJxFSCi/PM/W+cSp+c9l4ZaXbrfoigyp/JXohHpMiFyMAFA60GCmA2Zapem9cor87GDJTMyesOdzWC+susclf1oKqCq/Ebg95KZQGJQKh+0vI5HfJ90ukssoS4QtXGfsUAMeJEbUJO05s+aw26Un9feyIov2uy3kFNkQmJ7lSl4wKoRT6Mya0QAD8QDj7yrbIRO9JaM3FDFyZrckpw4Ezd2WuAgUkhurTXf0WEH1Ldg1ITWdP7HVAHz6juuOMs7J6inabBMw0nee1pFyOAam2b54WkU2KxcmLC+7Pel4UqrxkMXNzadPI/pVBm8mWC/eCdmjrhnMPFrv57otb83qd0C2dYL86Wd4nSSMofztt9mZ+YlTcgmQt4UBJO8Y6kUzY2+ts6veC9X1R/TuhKRZgRvhRF9U/jUX99AT9G+CHq8eLheUkTsQbkGQ6UNtSj+3zZ+3HK198QDYZwmU4wWxR0TrERcx7B68xEdrdbEw/qbUpM9qVY7uwOqrKeX6wFyVK5nPKmIFUKQcot3XLzqw2rB0z2STcpWGS8nRPxJ//2IyuhPElVwhTwPsFrbLoA8Ke8o8WSCLoD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(16526019)(1076003)(44832011)(2906002)(66946007)(6512007)(26005)(8676002)(66476007)(52116002)(316002)(15650500001)(6506007)(69590400012)(66556008)(186003)(2616005)(956004)(107886003)(86362001)(38100700001)(4326008)(478600001)(6666004)(5660300002)(6486002)(36756003)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?E9VevWIZ9MBRHTki+mFp87/s7hMkpPD/YvdtZUFupeFqMrOZrzZRBgYneoTa?=
 =?us-ascii?Q?Y0gNDw2cWU91qGlH+wwZqMMK89qsznu2B87ifClhlxRa3vs1Bbbj4bmXoXcj?=
 =?us-ascii?Q?zbf0XqY5jbF6fNk4u8VX72Hbsk5ohpwwPfGaM38t4bhI7m01Q4BMxBMD809g?=
 =?us-ascii?Q?Aq1+hqAbh4NDafPDYb2onyQ6UG7xqYwHvYNrP9wFa97B/peqmyyim1SDfeRT?=
 =?us-ascii?Q?mXu66NjQSWRIMkmLnIjn1q8bWqK2j+0dee95CdLw+Oi6T9Qeaz60oQDEGBNP?=
 =?us-ascii?Q?M4g0/cg8tRyXFcmNa3Qdn4WaPbIBd/DzEIru8yGlzkuah1f0q8w8rvB1TxCP?=
 =?us-ascii?Q?AJ3/61B814ImldwpYu0qQ34jThWg+HBR8CYnZaiCApyXGkQ92dqcptIqWdGA?=
 =?us-ascii?Q?5WvuVWWifkpL25TAsOIR7ve95zEZo40ssq43Ehu5qpZZzrrxZpl71gyyD0/E?=
 =?us-ascii?Q?pR2k6ZB2ShLT8GtI956oVR5lovmtLSsGUAChT0zB2naR8axyLm9eOM/AO+vk?=
 =?us-ascii?Q?rHGFDd68X37MTPjhPUz7E5m3GQPsEfEFKJ2uK2PMn9ftVjPI12FSRWGun6Gi?=
 =?us-ascii?Q?yA8J6eNgRQArIkKEZxHilojY3ZNiGPR16rSroXZyoy7TRsYKvFFMMgbH4iY2?=
 =?us-ascii?Q?LEWh1bynyDRcMp2C19sKjDacvgFIyaBkNAC/yd0cnEvKhFpzWEUikPn141w9?=
 =?us-ascii?Q?eZhGP7VRCOFrvfWKvE5Dajm5M3K3q2vJEQsyQ3qiBrREOeMZnMQJ6agKaYUf?=
 =?us-ascii?Q?18CZgX2Ew5UOtTGmyfrl2sE7lwjn2vU0tjqInkk5gJWZmJviJEFgIKMG+sjS?=
 =?us-ascii?Q?vdb7aiwxtJLVVlPgapZJod53tL7aU2ZW1v0dcm0s/gsHOoRNHTqWk0MPgKWl?=
 =?us-ascii?Q?c8s+jXjkXemqKJ3s1uR6UKyWG7JINUjD2m82cxbyXBoavEyK6ewwfgZr8ffd?=
 =?us-ascii?Q?bzinOE0YTd4g910WDV6oMs/Yh38+woDAZjNT3Ulgbo/B5A+b/oV51Xa8n/5A?=
 =?us-ascii?Q?F+LA4x//GNRhHEDvRDlvj3Gw6PkvOYUuVLKa0tKs/GGdCAfWkGNvWm7/VVCi?=
 =?us-ascii?Q?8VZGOydYcZdG5C2hlhrIWz4gWIwZ1ZYyLI3/wTSQKLiqv+K0mkFw/R6Ic4Wi?=
 =?us-ascii?Q?5YMHL2ejM0smRyS+c9vLXTyz+maxUe5CS/9Nu3eQ/+cajjCxC9S+Afrx4CkX?=
 =?us-ascii?Q?Z+OHCl0BpZoRRkZs+am6jLOURBmcdBffGknVN1ILxtHSaOVxoAdwaKHA9LeW?=
 =?us-ascii?Q?9IqPbw2tOe2ZZB8cT0QBgg6nw3dxCr2Zsj3+bAYVhJLevebYE2d9yjfYGij7?=
 =?us-ascii?Q?WfmlR34MCY6iAV7MwHcZC+sm?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e33962-43f8-4c5c-ad40-08d8efc416fc
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:55.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrVkJVG6HgwSYfpbVoSvXN7Cvh0aWi3TvMhnLPhpoXPymub6bSzUNPDkQoj4seFiEit1ifyvwwVZuurY7zUnVgMIXac/38mouN8g4GAawDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2793
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_07:2021-03-25,2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=891 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250142
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
index da40b90c2aa8..eb22f4fdbc6b 100644
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


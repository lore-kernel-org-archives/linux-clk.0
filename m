Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BD1C433E4
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F665619E4
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhCYT2V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:21 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:20015 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230082AbhCYT2A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:00 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQvEE022964;
        Thu, 25 Mar 2021 15:27:54 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2057.outbound.protection.outlook.com [104.47.60.57])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xbcgu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqIAcLzw76oqGg200THdwN2aC6DCc+9Qvrwc3kQ4wPg6m0sHIO/amAzg2nzfqDeLYkvgWkL/onyiovSTVfWHv0lISLQ5QZaVTDUGrbiunUMiqSQZd+eQD1sn/iqx0CKxo3jXIsP5nnpvCjoFhKBn0nwnQJSEXfKJyQB0LFZuRMj150qDLHVaeqkXHEYM0R2KVhSjcikwYNUL5uKNN3H+/Ga1tykj/3opfvzwah8s5IBqj3seoKskNmdFe3jtyoEiVY1IbjMD4QYy1WAyd8WnVq4YEtf8OC75o/oL/IG2EKYBUVGmD8E3XAIdbSTRHEo2t1GK9YxR4G05dSWUVgZl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx4j3QhKkPc4qgBW8L+J/EEFbL7uoAIZCm+ICqFashE=;
 b=G3ze2MyksEDwgxh6efrtEILGd4/PC1I44ORTdtd5rxlDnIlZ8z9Nt7SkOmjbr2mWv/L9ueTYmO2lCVoa/ivtT8o0wfe6b4h46Q1newSyPhagGwtL8IxDSQk/cSwxTjWkISmCQ57lrR/iuURSgH6Y9E46XvdZtuiahr9YydvsqgdXotw6XQGZb73yclIM2CvGZSZpxp5TW/IQl+aDohGgJshjcXWr3VRy13Q3UzHdM3aSua3G1QD9ecC9t/CXLfIrF/98YQno/h4iaODInNkO507L0gvMnNjfVCj1nPmgw4migvbFdIv5lGUTPtStjqlrk2vJCJC5K+bGvhBmjrdyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx4j3QhKkPc4qgBW8L+J/EEFbL7uoAIZCm+ICqFashE=;
 b=P1WbKU/Sf4dMJpOCh487i+1UP+K22564RMbyfyc2iRNJ4dFm3AdsBHtR+DmFqnlqX+yI5ErIXtv/IgefCjkaNgykDnoa/xOMshGZAQCgRXwp0ssIUQADFcLGuD9BsRYdnzPHNHypldCr5rlWc9vURDhHebg5cHvV8l8wy1RrwmE=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0735.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.27; Thu, 25 Mar
 2021 19:27:52 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:52 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 3/9] clk: si5341: Avoid divide errors due to bogus register contents
Date:   Thu, 25 Mar 2021 13:26:37 -0600
Message-Id: <20210325192643.2190069-4-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf6d60d7-bc5b-4958-3ae1-08d8efc41561
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB07352A11EBAB59701589307EEC629@YTXPR0101MB0735.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avzYQSR3dzCnfR8DDx9MrpmWDt5kaOPBPWgN91Rf2NIxLrrK6tExBgwENiaXV4TCOmVZd3j8HR1W6fQbNP/OmEJPifTMhI1O8vKAYbgoROqt09rNDCXc7NvvrV/Tb6PAgc2jvAqSyQHTwxoKGQlMJWPkScc2gwygSqet9bd01SvlTpt0AtGgeiJC8+4yM+anO8VdcQnpGlLmeWz9HBbmNWNUJ51fcWgJZSvAfBnzw6+x1CyPVpM6s8pm47LvDxD2LKH8TIDCGW/0FMvIqbBKhB4gt021De9WtNOfi1QT0meeI+uuVZosWFOLu5PU1dh26c3bDhfjfYxG4W13MWr7wc7wnQbrAymiKl8zRU58lMnBldZFMU58A/M1yWrY005nuACcBAqoamP4ScNvmnjnHhDYiKFTwYXMZMg5ifwdVWnL697LeY1oQtkk8GgDss+ioDykc2whwUa1uTXArZz4M+FnsDoXhRoKuwobZdGPIQbWz6+Iqgdo6Qm3Ud8KxBBguqWUw9+Hm9DL7nET4aNOIfI1Cw8eT8elP2jpkD6Fmq1UUTnKZFOHPbguvBe0cgInKXL+mE2l7kKoeGS28ouiHxhnDPN6RfhBp3pbyopz+TxnYQZixKJNBgLEFatBXhfVpk4qmkPuUGpxKI11cQ3JbosXssSOReyKzrmqoMxLo27dbEmUngTwJkkyZjwJ2tf6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(107886003)(6506007)(956004)(316002)(38100700001)(2906002)(52116002)(69590400012)(6486002)(66476007)(16526019)(6666004)(186003)(86362001)(66946007)(66556008)(4326008)(5660300002)(36756003)(83380400001)(1076003)(44832011)(8936002)(26005)(478600001)(6512007)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p0SkVGVE5pDzSTRxgbacz1MvNdAF+7upXgnsqvjaXz1ZOWrlCxUtE+QMXX1a?=
 =?us-ascii?Q?3d8TPWlz7yGFsNV6E5cOAk22VLOkDPrvvknSljuACUyvjG1KnYC/pk0ye+LL?=
 =?us-ascii?Q?vJIdJAh4MK08lEWWuJXTLft084XGP4o0ER3o9F8PchbJCC26/z+wqqEu7bCh?=
 =?us-ascii?Q?fiTYD2vUdeb1KhnT9zHR37Z33sJClMJgJTBUkEhCF3xuWMRKsSBCqwegX1zk?=
 =?us-ascii?Q?bZbELidu0mh0oF8s35y3XbcrnpB/AU7YJCrf58ebNHbR/V3jWMHrZe4GJQ7F?=
 =?us-ascii?Q?JOe6EAc4bePBBDjd/slSRCaszfWMvUBa5IaMaHu3J3CuJxYF+KUhdS8oqWhz?=
 =?us-ascii?Q?hlKBCd/oyw0lwHAXEHgd0JmBGeatZQORtGVKl+gcIBTVcX1oMVE61WZNlSAw?=
 =?us-ascii?Q?3lVmWLVFkA6aOYe0zERb7ubx/GGb8a/J79MUzz65xrip4yzAbdthlJSHiTM0?=
 =?us-ascii?Q?4EeINqs9gpmG4i8K0UxKtzIGvJaeKjy+6xbEc4wPQ3jqPT5qVF4nVbrLrQL+?=
 =?us-ascii?Q?AgS8tdy2VFDHLN5/UkHdC/I4uUebKCsQ4wTnusiTvR3UAVeIcV47ruz54hrP?=
 =?us-ascii?Q?tBg20y350tt6CXFt1qq7SbUUgn0FU70aIOnl9skM8TTE1X/PRJdFhvZj9qSE?=
 =?us-ascii?Q?RKMN/MYfAaRPRAnMFVfZwwcntz1Pz16cET3iZ3R7IMC4I2Qk5CAUA5w2HuOC?=
 =?us-ascii?Q?uMaVsXmMGo0kvmD+yOHxSjsOqocDvlyjLj3ggVKH/ZZo6ZC6Z0nuiFdcmRQ6?=
 =?us-ascii?Q?XL2iR1JVo7aAJowPL2Brmu/w1JLpX1WwS+JVh9fslzJ0EkFSKHrLeQmoHApA?=
 =?us-ascii?Q?Nru4fvFqjzwHGNWGRkqVkQoVg/avvYOTux2+8gCanFp3SACQMOHbDlfK9hG8?=
 =?us-ascii?Q?RNFf6gYjVt+Ojgd83cBwLIPMWse+yhl3j5h4y4sNl4K66YYLRCDctsCuwy5H?=
 =?us-ascii?Q?+D6wGSx4gfgQ2YBMw55gKhNjVhXUYbqG2IHVqXxPvOAa+Y9UAST2bfY6NUfA?=
 =?us-ascii?Q?79o5RSI7Ies6zFywvxmuDKpz5wKn0FEA8X/KvSVGm7OTz8M4ORcHuTRTtmY4?=
 =?us-ascii?Q?BLPwlX62oUOMhsEl2/+VX+nIsSm2tUcakOfdECCGqlL2tI1XC/lCQExNHHKn?=
 =?us-ascii?Q?DzrD4rOj7zWqEazngrEt5hWMIV2pwv3LlRxEkj1XiRvNhuVrGXRBBfJbcST8?=
 =?us-ascii?Q?0InD4nHM+hsdhGQ2vv9r8ozKnfUb1AaqnuHM3pMfC7EJixTNxGdiUJmFPC0d?=
 =?us-ascii?Q?KpaGL5vZSO1GNEhF1qrQd2V6LlRuCXkjfehP4XZFtYKxgwknOw8qvMaco58w?=
 =?us-ascii?Q?HOhE8ZXe+NItRuuZ9AnqJnGE?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6d60d7-bc5b-4958-3ae1-08d8efc41561
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:52.5626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHuz2gj/vC8FLZGEIvtQt+AAokIK68oxGikhMjZ3sxAje0H4Q0DOpEjCt521tG0s+KXYbs9RPPOqn12+t5TtMDL6w8iDcd0mh3gl3CJKxtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB0735
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


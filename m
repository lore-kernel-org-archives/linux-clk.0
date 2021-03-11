Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C3BC43381
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24EC964F93
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCKWrE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:47:04 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:58525 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229517AbhCKWqu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:46:50 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BML6JO021367;
        Thu, 11 Mar 2021 17:25:13 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymh9d7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxNRXec3/gbEjXFciauJj+xXASxGxaqa86HLaMtV1c0NNXnRWN5x87agwQXVr87DQU/EWuzf/kgOxMBhSwkSpU+ueSjdZJQIuPMCRBBv69cIaAxgso9TYuG3vk+vDKYBN90cQ0yBW3ODhnj39XkrHwKxWO+BaWA47P8PICkeF4e4zIjkOjKtGIzhIs7nLmRigvrI+7l83HQS8bWRqCzEBbp/fA+sRx7lgTeN+KvAsnsEGVxFpChnnjb8HCmf0hvLYM5tazniC1pM/Uoh42ur86phggHHoSHN7ZV4oL3RtPx0OApLj8HmlogjbXoyVBVECf2/4ypqjpx7O9NLEBGS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BjrsK/Q9NiLvydn53QHJGCbH0b57OHokfQajY2Hf/E=;
 b=gNx7ujGpkMbD270um9EUYqI8J/vS8G5iUDIKLOr83WlXd8fW4OqDm2Sb+Ic8rowhJCCmFclV8LnmvRCzrgTaudKMvb0PMgwdgRjeHM2SCFVBo3zlNXUYxJmtm5fuj8uZ1DxmiBrxG3Vlgo3LXOwp0UmoLEBBOIOuSNXQ9SgSSW6IbrSn8/lQfkqgA+8Q+ThBJ4spPGShQzKCOr66oGJbMVP7FXWw3ahkK6zYd7jfheQey4rGRDg976dHVYUSjx+Bj+JlWGwkRkOTmDb22MHjV53/PBTl7T8DlNMKuvsVhRdBQivf8xFucHF4ytRNhwtak0UKgxAwhpqyBNWZtX9icg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BjrsK/Q9NiLvydn53QHJGCbH0b57OHokfQajY2Hf/E=;
 b=Nf+KP1hwBOTPcli/h9hi9CDcja3U6fnLRyRkKYlhzzigFKhgcqFvCbMjjMzwkf/X3PNjFW/Peeypn+rVtTogyOXefcrUtO9L/dMGg0QNEri/cPxpMIzYHWt0iSUXQeboik15O0eIsJDp4MzCVsPMkSur0VkPmhKm+bIRo8yIQN8=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:12 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:12 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 3/9] clk: si5341: Avoid divide errors due to bogus register contents
Date:   Thu, 11 Mar 2021 16:24:30 -0600
Message-Id: <20210311222436.3826800-4-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0392d1c0-5ba2-49ea-bd49-08d8e4dc8945
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB0960A6B96004C4AC5C6D7615EC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LX+07PK6Gi5RrcTWOfdLs/QlpTfSNnyimz87y5jy2CBW10PQfDU41wsyazouAqmOmnkCmAzIO1l50D3U+fd6bTcH2Wg5fygitVrI/31xdZbk2hb4hXZzeZHTLbAbVwPLFFr5lHFJeX015yC+NfyRGPuLr3ya15X9BtdNECitoiC8s8WVioTfDz7TcwswzRyB1YC51fDqdd5Q6Q4YnIed6fnXEP2VOoFP13JWnokumri0CL6dY+FBKRuMWAp31zVIVUvNeAgJvKSsgu4iVFnEiAO6CdKfvQEJB6LGZp/eDCe5IScIjwcbzgoUAFrsF5x3MNnMMhX0BWH42EdCqsZWq/GfObvJKdbhYtfboR9veQeT/k1h3x0bZnQXMXQVVrvWOHa7mbViSWQ7kmlZkGekxEXPuGBinD8STnU2kBYnC8c+ThClxpGxAGM6e/GOtvc3CpRPApByDQHr1xEEetRNH+MRjpldGIGIeTfye4wAZdy21u9fRgRaty2y4cDF25aHl2ufXvuwRjXfmNUGYhUicUb6i5IJDL+Vhjjk1GQ9C8LiyGu+YasSzd2ZdB85e+EPPE90LbmemKgtKspoH2vXZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XgLm6T7zZNZNxM7GXzxzin12I4wx1yolZdj384InLuJEXgvlMEG4yMfmGmBG?=
 =?us-ascii?Q?5EqheU3CIanpR0EIfCGtc+wyg70yLdH2yZiQMUmrhxS9wKy7DnclBfozc5sa?=
 =?us-ascii?Q?MmA9mPaLF8l38Jc96+17TTx5bJyfGppu2gTasuOPDw8TljUB/p0tM0N/7Tho?=
 =?us-ascii?Q?8V06C6Z01PnKwWZjG/S+Ude/sK1ihqPB1ufn6WZ1Jgk5/e2NgzdYgB5+WGXY?=
 =?us-ascii?Q?R/IKm26362MDIX8Wy8tYlaYYDrSZpTCmJEJa6KayPfjcmJTVxcCpIkVQpG3B?=
 =?us-ascii?Q?CcGoi8u1L+BqbRAM2+R55lBaSlqEwgjxrZIvMFPKzJSSb6qnkSBlPg+R3zXB?=
 =?us-ascii?Q?XpG4fnpvVHOwcFmId3NPdWU5yJCRtybng0lTNjE38kvYrFXvhc+74zLsOsHl?=
 =?us-ascii?Q?3oKIiKEyFhjxnF7i3XeTjTcaSZChIlcOfLCVCZKILyJx5ngx1P8Aw+PITVpF?=
 =?us-ascii?Q?+U5o0J8EytCB4wOSnuITYwbGhMzzR7OuxCynnyvMhHwHJvjFknyBz2ru9e4v?=
 =?us-ascii?Q?O4s3xlUaS1BhljvtLPrdPg+zVJxQkIcjhl+N6LU5ccDyn5dF/iSSU9JpVwoV?=
 =?us-ascii?Q?uaYKnkGhBrehUHg6opKQnS5Mgoj5bHTVKFZ5jIDou6BcFHxVTrOPJwVzSWhV?=
 =?us-ascii?Q?sDS3Y/l4JG2EAwbz0kslVu8u//az+O2s9jX1R5icT6ADDU+Ui6ue9bRqVq1o?=
 =?us-ascii?Q?bzDawLtupxh/qxeeNM+I1/FKVFLUPFimN9NS/d2WsspAg8Lrn7AzE8W5Df9A?=
 =?us-ascii?Q?CAdnyZHHoVM6jFUFLeaz5Srw6L4twCLdHMfm2t8+EF0l5N8C2THvoYtLMGHH?=
 =?us-ascii?Q?lozlDUL7B2KrHUUJJ5Z3DNtjasIHw2/sVgb6DFrPeSv7i9wdo6YpbV1Z+scr?=
 =?us-ascii?Q?lPQumyRGdcvcnDuNSoqhVZ8WjD0Gas48RaDq4d0GpZfwtwoRAjqRKBLywVpw?=
 =?us-ascii?Q?AMLHxAFRZe3m9CwePBBuiri0DcWhV5v1ciFEWpY+i+wMpThIbAzVPOQAU5ln?=
 =?us-ascii?Q?5nnA5rubq6of4FoN4TLay8ymlBKvaCiqgKQjObw8P23yJCr10v0nNw4N2U2N?=
 =?us-ascii?Q?PyaQNi5XRsGKkDXAmhCowLTAKWFRmfKamirMzBkJh0rept/4+3ZboDwdI/o3?=
 =?us-ascii?Q?7oqyu1oU6tYUKsXZOAP/1MH5JhBrzXamSSklvlfP0/fHdYvBfeERhk8Xkrdv?=
 =?us-ascii?Q?4buBbiVIajJe5oeE6LKByhGwDYQKjpleXuckypcYnRoqd2mP5XAEGIh9ABRv?=
 =?us-ascii?Q?VK2KRfKQ6/BtrH7W+QWBVnqTCT9wK4gRZIbnnLjYpgfOWbsav4u8T/xKgtPs?=
 =?us-ascii?Q?87eHh7FiG7Trf3spGKNhLZSQ?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0392d1c0-5ba2-49ea-bd49-08d8e4dc8945
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:12.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1YJhE1UALKnRkv69kkWjZ91f3ejjUNR092m9QFNQaVooo7n9WtRKA7z6FlBYy+2shrBYZpX6j33fuGxi4qTxwkzIpKmAHQ93hM+03EEN+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB0960
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_12:2021-03-10,2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110117
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
index f210860fb96e..2d69b2144acf 100644
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


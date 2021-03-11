Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBB6C433E9
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0655964F8C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCKWrF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:47:05 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:62494 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229488AbhCKWqu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:46:50 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BML6JP021367;
        Thu, 11 Mar 2021 17:25:20 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2050.outbound.protection.outlook.com [104.47.61.50])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymh9db-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmc31xUzTCBbIxFn5YtG4Jim2hcQ1aoxfRSr+oti81LA8Tzheqxp2obJZBg7+R7c4z9DxTbpaBKD8uak2spAozqmAbWydb1sIPdF8IibLzHN2AfmjdSMJ7ht9mNaQo7Cpz5Zn5KdM426GbwP0cBExSaTaezIPG+hmYZx6/oytGCRrdaFpN91cQLu4H4GtDflR1YGh9ONRl1wOpPeDAWZUiHEof7mjL8VXKBENDmw4ODhkFdHoP2x9fiHljXuEMS3LQBLjDiTENpUnrKItGNxaW/aSq+SVhQY70jwmz/HlfglcfIU5s3Loqmn8/J7sLAnYHqOzmgyjL5WBJNt2oLvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FR/y+NIOUN/8kXh0R0C3pk2hi3mpXcOY+2ysPa2OmQ=;
 b=OEkkCHy523YBkBF1NYwqVN3G6iEj0ehQjOF/EA46FVAxUrNBdcNgWKHQFMrOVcmdKaPywZ4945iPxIKe6GmNXTYPhzYL/ILGfrE8VPGkm34r7i7xWQdyzveh6TCRmxADf20TwPQiWHiEF1eV9UjkW7Ho4Pcs+xfv4uinG2Z9+GjZbnhXQDGVWpEuOuQyWXj1eRnOVXjddrJ73Hhp9A3qF8pCOSeANgBIln6ffoYehoKuJbOhBjdCglqV3E5QEZ5qsrU7QCbq0OTw0l9xVdy0mr9nTWACmFfCfeor6EF7npM50KMf8f7gPBIDrNf6XSaLK9ak2+j7w1kxKYarECpfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FR/y+NIOUN/8kXh0R0C3pk2hi3mpXcOY+2ysPa2OmQ=;
 b=iXG8gginxvdJeyjdEnoHW0OkKsolSayr0cZAtlVr2eUurr2t9F2dFpuGnKPJI9puGtmSmKjjtoPXBeDqQP6G+h5XuoiDvyjU5H9mmpklJhJLiGQHsjFewdaEr6QL73qqgKobZ8igCAlyJL+5XpIaerocyabtjUMEIYZu8KfRMrA=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:19 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:19 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 8/9] clk: si5341: Add silabs,iovdd-33 property
Date:   Thu, 11 Mar 2021 16:24:35 -0600
Message-Id: <20210311222436.3826800-9-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 618170d7-5e62-44b4-b492-08d8e4dc8d9c
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB0960211CEAB73BA2D2C71718EC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+niPmsGG9d1ClgQ8Au9mP2hsZ5FDU7RqvCTQDPbEBvX02v36ySt7G4WFX5Q9j8fTuKAAvwmBMb4zxh49M2odOjpjZO9zVJ1mLF1gyifpmNxLeHBWxz895Sg+lbg6aAwOsBHPsYrMwRzMOtWepjhkCg/HxWSrDKKiKhdA5FfH6utlh3fco7MgA+3oe9qINGAUU5/vdNZ4PtVzIdJW8S3sQLzs5cRXMUstrqBCr6gDiai1CJh907tVh8wOdfHZpaEPae3di83oivpXFLlv7HUKpsY/Id9wFtPK/FeluI8XVAxpM0uWK2SvfVbqw1v+0x4tQU7rcVXZnh8SSmALuYoz9xJ3PhUpXyv4Qaqw2Tny9oKSZcdJKQr7uWLLGCOMEiXxyYSY6fqCZHeZCVflaSOzEy8ds1duIgP1PbwXk/VYyP/h267g3x4i+N/lZl9hA+yiVDHXYN5orz1YYAoDOZqz6KXo7oa2A4enbwPySuPLmDdssVSPMECuS4mYJ82Np1iROCf/Uq4hZ8s8iz213YyUGUQf3MGxTz41TVM1H+yGikCFlOHkp15YakYjdkCjNh21Hr1llO6ailioJv/ErrMrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?G2mX+RA66AyQIluqOMWxpzJ19OH7W4+nCjt8jXI/joVZ+YVcdLOaJKXusGA9?=
 =?us-ascii?Q?lODAVBeLMSSFQHTL3/TOOGeqPrKZLg3wdIvhCXSvVPo6C2v7Gz+GoeTDTScQ?=
 =?us-ascii?Q?W+zy2VXggRw6jppYRkqWmnRxZj1FSwsdBH/+1SKbdM5eQbwTfHQFPtnmdT22?=
 =?us-ascii?Q?bTI5JXhg50eYrG9NIFkh+PMfS3hBs/k6+4xJUi7p9zB3cntU7TgBigzR8eg6?=
 =?us-ascii?Q?alvB/kM3bvTeUaRvNdsUyylQPMJaBm3Gdhke43jDjXZ5bvlgPyHCI3sHkn6p?=
 =?us-ascii?Q?3irCQRgQ/FeeRzCok4dL7IFeV7P6PIQuzpnCq1rlr1K7d4C+eDLqh/EeyHUl?=
 =?us-ascii?Q?rVt+mrzC0aVUSiIizgOqUVSqmmYHqKKgFWDt9pcLHRcDO7qTY7k9Sd+FsL5k?=
 =?us-ascii?Q?/aY0lfJrqLorYWxLuhWR+/xDQtGyr2OWzz9mW/hDZ1EBDYh7v+mrK+u7lFjh?=
 =?us-ascii?Q?ACicc+A1BVGLgWe9yPJP9LlJyjEfVZpTOv4lE3BBfubL24VUezZtHVbl8lLq?=
 =?us-ascii?Q?Eo8AE/1247NesmogEnsA/yMehr9nlq0uglIoxbTxzGw2uchJxXg73AvNfCmA?=
 =?us-ascii?Q?25uoa2eZSKSCH/aRJTyD53wRTOGqwpPkWfpQO5PjT0ttF2hPo4rEzKu8IXZk?=
 =?us-ascii?Q?5un92EL8So8synTFSreECY0CSmrKayFEzqW1g/2pHTNUVcoo6AHW/+LHrAAZ?=
 =?us-ascii?Q?YLX176sktPcf/UL0lU+xN7ModZQlOkykDVHExi334JCmZwZdEnXBcG+KvtLU?=
 =?us-ascii?Q?iEYtDSXrHP8kQrf+goqzB4xbQy6M9EU/f5JO3XKy0EqZBt3fEAMrrMnbsdUK?=
 =?us-ascii?Q?VIvRGxX7ETw5qUWu72jToGBFIBRCHKntL9I1WiDWns9ZF6LIRmRTSRAT00FN?=
 =?us-ascii?Q?TD0wss2LRsAfoBpHzkgjqi91uChX+XJ3aXbYNqt1+tqRPmvkyDToVM58qi42?=
 =?us-ascii?Q?xX6aJ38bnaIyxNRht0aRH4rffk3k0pphgvMyOjVOW+mCZ37mXTjT4ig3/fxY?=
 =?us-ascii?Q?qMZ+b6kymaYwFgeE+xChSutaqdDec8JATjBOKrPaaNkRIk7ttVV6MPPzDCiz?=
 =?us-ascii?Q?cLYZ1g9egMorAAmY/8FrXw4IYnRCzKiCw58Ylt+lXTSj05fbyS244xvS3bfU?=
 =?us-ascii?Q?echMNPKMfWD8MGb8y+x/ivxPJF99mqAzc4ooNbUL687MgzTFu+CZQ7EXiwEM?=
 =?us-ascii?Q?ulwwGDTtpc6xh33eDrGqVALy7qIwJBuBqLAC9PEOdKBQVljsXdjfj704SMkh?=
 =?us-ascii?Q?OjUgOe9zt9xqPhnh61RQQleRMv9ntabLfvMWXp9zPpKAYVstw2qHlKXcM/d/?=
 =?us-ascii?Q?hSOu0lYxfeJkHzMmdmqriI4S?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618170d7-5e62-44b4-b492-08d8e4dc8d9c
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:19.4789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StP4Md7Mg9VT5APjRnopMp2uc2wQOy8ENt0za87XY8i4sHtERlypjC1ed+jmZCVoBijPLwhpxQsNXfn8qw34qy8bbfurzSc1mM8gXSAdAac=
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

Add a property to allow specifying that the external I2C IO pins are using
3.3V voltage thresholds rather than 1.8V.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 11740855bcde..4cd80ef389d2 100644
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
@@ -1565,6 +1571,8 @@ static int si5341_probe(struct i2c_client *client,
 	}
 	data->xaxb_ext_clk = of_property_read_bool(client->dev.of_node,
 						   "silabs,xaxb-ext-clk");
+	data->iovdd_33 = of_property_read_bool(client->dev.of_node,
+					       "silabs,iovdd-33");
 
 	if (initialization_required) {
 		/* Populate the regmap cache in preparation for "cache only" */
-- 
2.27.0


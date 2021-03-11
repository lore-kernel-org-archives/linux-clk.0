Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A9BC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2E6064F8F
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhCKWrF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:47:05 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:48815 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229441AbhCKWqv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:46:51 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BML6JN021367;
        Thu, 11 Mar 2021 17:25:11 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymh9d6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzzvtZxs3q460VYLtpLUY8NmmZSfIV0ppsY3mCFNYnTrApS0BFUrxwMiOGl6+1/LZEqGj6if596CD0u3UKWomlhUihytxufTQh0zihvE7EDTXbNJroE0QuAlGDIV9GVi+64MYF1++xWYpM3gmG22jrCJFP62repO6FAozlpgIi/hhLHIcwShXlk74ZUX46arqQ2RicbBhT6A0ROj4MA+BBC9dwzCMVLh2hmJmTbIAZTkAwVWHqDcWN3GNMY/aaiyq9xcUi1NI9OuYmvq2brwHkb48gV7bZscEqcMOPpaxDgYxu/Bi6tJERdYJyvFlDlcora6V49cl4ga0727Pz8XDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yvqzXTGVgOj6vXGuRJuwLpO5ghDU654jPwR8E80KQg=;
 b=Y89QQ2BM8ne2zqrd1AIQUKTsEtrtAzrGLRjQjRGUcNaD1iIPS4+C8dLW5oMFn8dv8BqbD/tX+8oCNnKNIFl6Lu51U48LzQ5vq7cnhkws2b6e+1x5dhnbzXANP0kTq/zvOKiAcUUzCQGS56bKfw2vuVcMgKzXeaimdGCdSPVhmrf4NhkUTAlBBRZPvXswe/GmIGOqlLf4IL2PdRr+IPHno4lN+h3h3nK129nge15RU5bTNGJlRbj6lTDOwl494ZEcXs9hLLrIUpEYU5hNaD/q+v0re/fP+SSWeB3uFoWx+IHlZtL4c8MEHi4F1c+VmToCxw+m+8O9e1CWTrsTl+cGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yvqzXTGVgOj6vXGuRJuwLpO5ghDU654jPwR8E80KQg=;
 b=XKd2PHiyJ4TpW1hKXHwZyB77rMjyv6b0G6ApheSqB+rDu3xMMletq1m+ryxTfd7BaH0v6v7YaRv5ugPvVZc2tlF6xQ3OIyYVGXaAnXBJsA+QayBvqL1rpRh6pHj4Ev+ORkQqFrSfOl7zhgy9i3zuuzy1Na0q+8C2BGI4MaBdSJk=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:10 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:10 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 2/9] clk: si5341: Wait for DEVICE_READY on startup
Date:   Thu, 11 Mar 2021 16:24:29 -0600
Message-Id: <20210311222436.3826800-3-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 253d0560-e162-4b11-edc7-08d8e4dc8881
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB09603CB00922BB879D39BB7AEC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xl2thOMdC39jWB9WMKIj5iJHLuhDrNG2IHIqNWmXCGjlwcN//TZ2QIpjC+kDdYmlEqgYjUyRJi+hMM+sNYkyFaIIWgp/ikU/upt2Q6R6o357wPiHbaumTmNee6RQmrM6Mey2C9UaV6PE/U+GScod2gJA9mMDNXeEe4Dd6wKPuRcqWcp/FWX6NJV60jbkVRdUJBbTS0btnJ0eSE+vASnH7JalY81ebbxWwq5qpancFQy1LXuV5RZPZOpkDCqgjU6+rlaCtF/y97Fbc6hWpsJ+tQkiYA3xkVINMXYVvT7kXwU+eP2X16tKu6j0donVLQxSXgh+O9f1n0g18EpEFankYrKOvdKTguGuCDtQqGTfKAt+JMAVVWiMNZf6NcBky1mokQHzSFaJIEK1LRrVUdJlLs7HXWJwnAlQ/HkZGi4fxkB0i5BPqCFxD00z3gVnVI//tc5TpRZ8QKRACHqfTTVlOjJHE9PgYIWTnHkxqTpfsprcbC4Dsm8B8o092tzrIAUdYVwMLD69kp2+y3utqgtvQAqHS5VgndOpP7j9/H2wEP8vTXqFv+YYtrBsDSQoSBK5LyxiOQIP3S9CUoqPbLaNjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uNH44cfGbWcfK0FA+1ppnUcJl6BiliIXWhR5pbauS/h+lJvwYiFNHZHCPLyK?=
 =?us-ascii?Q?pvizk2m+ai6oAvuXLhBRaGqlbEkvl8Qu9Te2yE+aMmLBwI/maAHRl5k1MY9y?=
 =?us-ascii?Q?u6DHwBm9JnmxLOHmXW40BitGV3uwcIiWTjgVqqnS98BEGuc5hYk4dQLYNUwx?=
 =?us-ascii?Q?g6XOrcOUaiYlQFonA73ETWcNA565zRdE3XIgIZMgd7yvg8oDan24uM9BMzGr?=
 =?us-ascii?Q?OPegxmtGwvWhZ0GimHM0D0FllNK/+2T0BpUF6v+QdbpFfcWbLx9m5KmJWKgr?=
 =?us-ascii?Q?tScLDl9VokeGTvaY6ykoxhPTvTP/WCBtLZhM57B381jtIvgd+Hzu0YoGJoNp?=
 =?us-ascii?Q?h+xJQq/p3qm3RZuRAO/g4OWZ3oSS/OWpsCVPQUm8AFQDhQYGaVtrk/gKuXYa?=
 =?us-ascii?Q?yxk6QjqtbCb8FBX0+T9kPniuJgBMfMEL+xVmunjRryafeqADeFIhfxrvXuEq?=
 =?us-ascii?Q?wVh5pRcqZXvbVuZ25p8g9opz8uwKetwPn1hgLuayFbCgPoh9h9It4Ne7u2XX?=
 =?us-ascii?Q?BOYu8hAeFXc+Zii9a9eAHoyHPscSLvVHyqkyr+OQDaGWX4xy2tD90y7STYAA?=
 =?us-ascii?Q?NSg1SEdRC2vqjJJ4MnUkycVADA9l9tezMcpywDbHz11mLYH7bcz7lQp8Mo9T?=
 =?us-ascii?Q?R8UHavvPTD4OEHfyy0Jpv3I1lO8yzoXB2hmly0J2ed/sUo+SpRPIvgYjSHPK?=
 =?us-ascii?Q?e/GTcoDwg6DRj1KzR33y/LAivyj8OCSKA8wl/enBnp0jE3GBNxdKgDftUbVV?=
 =?us-ascii?Q?ISXJYcPCEVPgMpM4DVdC2t2H2vIFKajwjqt7i8KmtTWrlHSxS6iSROQLBs/r?=
 =?us-ascii?Q?rDKDo4xoTDTS1uM1Z1v2Mx6MJZESfx+jeXyXdmLBqfpjvi832asQEPD6EiqU?=
 =?us-ascii?Q?uj/j1XCOJo0RiHOepPX3Nn70theA9Fin36W38Ho3+rZ3Eh+bjYf2I+TBEfjI?=
 =?us-ascii?Q?2C2OvikzH6fzVOzgLGMnec5CsPddthDCwa9PATBJfiBcLts+YWr935eQsi4w?=
 =?us-ascii?Q?D6w24knSYvOOQ37hWvkFwz93tRgtaiaumbb342NyCvgRQMRQMfTEMnliZEXI?=
 =?us-ascii?Q?r9qjYtAc0INt8NBiRQ06OJ628YgI0/RIOnXqD0uEwWiE3uPDyEYliWXgwpQf?=
 =?us-ascii?Q?NtSczID+qFBSCxFYuL+1UiX2e72UXApteQjEKdF4XDGT42RyNfjsrE7pk/3o?=
 =?us-ascii?Q?R2BN1eJDTrCvjfBAaUh6vYpA1Q22h1sCChordg4iWbZMcLCA3P+VF7aiTQrB?=
 =?us-ascii?Q?4hN8ilZL7hVG9b1CYpK7usUKfwf8QHxQts3sYO8eislV1DiiX7A/8V8a7Ycn?=
 =?us-ascii?Q?Yd4HFcW7O0M0qOcj2mits7cD?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253d0560-e162-4b11-edc7-08d8e4dc8881
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:10.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02BIH8NR3E80mxMrnlCiA3lZ9o8ssdDv/cnAaL+Y9ka37Ws22Cd5mfCWKo56uaAjF44hb/Z3sT66RvS9fBnEyUEh7Pi5vkYpJWzlw0rgfWc=
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

The Si5341 datasheet warns that before accessing any other registers,
including the PAGE register, we need to wait for the DEVICE_READY register
to indicate the device is ready, or the process of the device loading its
state from NVM can be corrupted. Wait for DEVICE_READY on startup before
continuing initialization. This is done using a raw I2C register read
prior to setting up regmap to avoid any potential unwanted automatic PAGE
register accesses from regmap at this stage.

Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index e0446e66fa64..f210860fb96e 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -94,6 +94,7 @@ struct clk_si5341_output_config {
 #define SI5341_STATUS		0x000C
 #define SI5341_SOFT_RST		0x001C
 #define SI5341_IN_SEL		0x0021
+#define SI5341_DEVICE_READY	0x00FE
 #define SI5341_XAXB_CFG		0x090E
 #define SI5341_IN_EN		0x0949
 #define SI5341_INX_TO_PFD_EN	0x094A
@@ -1189,6 +1190,31 @@ static const struct regmap_range_cfg si5341_regmap_ranges[] = {
 	},
 };
 
+static int si5341_wait_device_ready(struct i2c_client *client)
+{
+	int count;
+
+	/* Datasheet warns: Any attempt to read or write any register other
+	 * than DEVICE_READY before DEVICE_READY reads as 0x0F may corrupt the
+	 * NVM programming and may corrupt the register contents, as they are
+	 * read from NVM. Note that this includes accesses to the PAGE register.
+	 * Also: DEVICE_READY is available on every register page, so no page
+	 * change is needed to read it.
+	 * Do this outside regmap to avoid automatic PAGE register access.
+	 */
+	for (count = 0; count < 10; ++count) {
+		s32 result = i2c_smbus_read_byte_data(client,
+						      SI5341_DEVICE_READY);
+		if (result < 0)
+			return result;
+		if (result == 0x0F)
+			return 0;
+		usleep_range(1000, 20000);
+	}
+	dev_err(&client->dev, "timeout waiting for DEVICE_READY\n");
+	return -EIO;
+}
+
 static const struct regmap_config si5341_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -1385,6 +1411,11 @@ static int si5341_probe(struct i2c_client *client,
 
 	data->i2c_client = client;
 
+	/* Must be done before otherwise touching hardware */
+	err = si5341_wait_device_ready(client);
+	if (err)
+		return err;
+
 	for (i = 0; i < SI5341_NUM_INPUTS; ++i) {
 		input = devm_clk_get(&client->dev, si5341_input_clock_names[i]);
 		if (IS_ERR(input)) {
-- 
2.27.0


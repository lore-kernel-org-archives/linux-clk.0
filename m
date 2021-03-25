Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC227C433E3
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD61D61A39
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhCYT2U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:20 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:43558 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230085AbhCYT2A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:00 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJR1iY022970;
        Thu, 25 Mar 2021 15:27:52 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2050.outbound.protection.outlook.com [104.47.60.50])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xbcgt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye8UeNyEuLAMlBgfnD8+npfj1/E9WmATcPp0qkZS/iXGLSTXHBus3zRgVd/Mdv2MQtnQHLoFh007LLJp4YL5yXQbkMkkrLrU0dzB3NF6fb4ea8B/SOpZek44/UV5k0hFZxDyxfPOdmQEagiyXTHc3i2ywY5bkZpLdALhwMw6dTJE+G76sM9v6261WF/wvmyNNant/6Khuz1IcS0O/kQYGTX88p8/ivpJ6Q3npHmjNEE+4O7OHoiMqBcrpDd8CjBWh2vr+2ZdjeZKCb58TuPNNXXYOSY803As/lRRcIK08dziYQdgs1RAK1HCLv5YDsSIS1J0m3U8G64n4aQY3bkJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEq4dvJRYs+77BkhYcPb2ofaxxtW6jdlmehqZboCYtk=;
 b=iD7bh0lmYsxBBNCiSq033/lUyJxKPY8S0uMlfpLuADSIRgNzSYmKBJ5cLQDz4RbtCTrUAk0vK+sfFF/WjoKxC/sIwSaXMXrqXMNlJbsPtyftXOuKVtY5pkIt9O8la4RQH9AINA/GVFlCxjU3lTgZpfqM4WRL+L8ssFywdnvmO79a24vWrYa4tb9i+bjYLK07KnJs/zHxRnb03ykOTWEPq4a30eOV3eNz5FUJOB5b0El/vP1MuDXd07CWeNKER6BxeZEYQs5D5TwbjngI6kCQGv46acCQ5WHFis9yOaLS6WiCZvQk101EPl7/i5tz/KCTSvWorlhBUhgj5zvF3nRn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEq4dvJRYs+77BkhYcPb2ofaxxtW6jdlmehqZboCYtk=;
 b=srIMoFybLMlTwff5384IGA2MZjW8DTii3vvsmxhepTmmd+4yYZpgq0NidaQmPvn90cyyp5moVhyQYO6bKQg8XnM5IW6ChuGLrqcfrAQuAimdl4VVsY9Q6SxyxIwqT1GK//sLcz/1CsudKUPETyPQpcz1ltFrs1IosmgFZ4V/ztk=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0735.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.27; Thu, 25 Mar
 2021 19:27:51 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:51 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 2/9] clk: si5341: Wait for DEVICE_READY on startup
Date:   Thu, 25 Mar 2021 13:26:36 -0600
Message-Id: <20210325192643.2190069-3-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 604afd08-d6ad-4ba6-480a-08d8efc41467
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB0735D3A7B17A139C66620927EC629@YTXPR0101MB0735.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L58oELhWBfadfi45czsNhSzzsqHzkYwPzPXma+wd/SiLGm6dqgfwGZx3hNERrR9DfT3DDdoqWmwy+Bt27k+P5oyQjCyDT/MyMTAPbBHx2NSYxKmhZ3bnwyaXAI8PtMnuWMDw735gMXAT4RUk/fKP+DvHyfkQoeQeEV2tAMF7E4MEATVlbdEO6ML5Fwzxf2LFPfC8iXrlKlL+Y1LcO9f+ubN2Gplxu5AUSZqsdoL5p3RdLZPa8DoC7ofaYGO6LhUcl6QaBKDnPKwckvRFu+w+kv7aQxX0X5Tbmdt6WR6pJth3bO18PE4x8Qt3S1uQ5z1J6nC3dWxxZPRCJ8Ea1v53D2kTaxXKVsPUg1Uley8NXNr4PVf8NJdOHVfyJ2t9EVJ7PEu/yt/aVA5b1UD6wu7r5BxNbjqlypkBtm87Xa6wp3ccPwOJLf70KfMV7nZyY/ytCdaQSfRMW0pC8VBDeUqhpXupc5A+kOA9njw9XA30hKpgDflWQxtuMxqxGn/vXjDDXm32k/j6L22BEo7CkOoACxabWLzGf+f/ctTJeVs8ihNb5yLlYfpeWs1ByZunF8vmGLdcM5E1K7QC7zPGdni/k84kCFOF0uR4w11jBYIuuUcMn2HUrJt4QynmJrSbknqrpGU+cbhxyuhMNKCvc6EgCp5nmeAJiEI4uRj2C5sUzuI8mw17/wm6ABw0Pu4R5S7z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(107886003)(6506007)(956004)(316002)(38100700001)(2906002)(52116002)(69590400012)(6486002)(66476007)(16526019)(6666004)(186003)(86362001)(66946007)(66556008)(4326008)(5660300002)(36756003)(83380400001)(1076003)(44832011)(8936002)(26005)(478600001)(6512007)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uz7q9XoRlGN7yBGovFgLUMvFQgHzb44UUsFzc1EgLOma8eEJUrLzEYot52qy?=
 =?us-ascii?Q?nx01ULGXeHCJWILncV9jIDOUyWUjDOwVdf77OIjjRgHlDMi00tOb4cqD2Kai?=
 =?us-ascii?Q?8LQELGUT1JId0W3GQl775PBm+PoYiXstkXtWoKvBQBYS8k9HwUCQUMtVkOWZ?=
 =?us-ascii?Q?LFbRTab5VZOw23/5mxevezeeNegRsnck8XYxZdxU4m4JgjjBg0yVV9PUwWQe?=
 =?us-ascii?Q?cUOPjNZfPKQo5knel/6UMG+AVrfh+K73cMmai7G0/XInirvCsnpqwyfe+nqs?=
 =?us-ascii?Q?bjYOy5MhwlK9dvujSYyr+xVZN/eiDEp2q2ELCfKwcRAnX1iWfcpC4ayEvJin?=
 =?us-ascii?Q?X3z6uVqwO4f4e1Fgi0ZYJkH4kqnK9kiBoqD7yE34klJnrP9b1ry6VTEJ+fSu?=
 =?us-ascii?Q?Er4JqVwk3SjlF88Q8OZyc8+WQpXxm6cI98dqwUvV1LsbufyyuomsvILXd3NC?=
 =?us-ascii?Q?TwmFCjgtX8c6NCLEqmETZlMPxTKsHa5NE5DzfwLDsAVxRf9yue/jUPVatNtG?=
 =?us-ascii?Q?HSmA3NAb1TrwiWTs22OdzRtR3dENq4OLEe/MQm1MqxC/myxKZBbbOosKULfJ?=
 =?us-ascii?Q?3v9JB7+gvRMdKW4WBUTlqZp27s7YojOpbXKljdrmrd/fV9Kxtqruw9CwyIEs?=
 =?us-ascii?Q?i1CogCAkA+DHAUNw+wB0Efi+gVbFnTP74IIeSbp1A7k2NjwSkqnJjeWKo5pN?=
 =?us-ascii?Q?vVs7CcwrSINnX6mKMSt1ElNh+PY9UmM/SJsthCguAYSA5aZOdJOIsJYqyYpu?=
 =?us-ascii?Q?Y8xTXc93nLsCZ717TU7oNm7S8Mbf1p5O74KWA31RQcmjOeYo0y/nKl1XBF0I?=
 =?us-ascii?Q?SDkecmb5HDXfuYEpWZKtXoUdxbyvyMb0xJmF6Dkc3phTxsaKxLV93yiDkc8D?=
 =?us-ascii?Q?/tBeVS00p9kNETCkH8hWczRyspKrAz//xWJORDP48WyB70nMLWkNLjr9yWJC?=
 =?us-ascii?Q?avvX+xOsENDS4gLI2jeZMoDYfKsgm18GspPM6Dd/1ZEbqYYnoyh5yGAtQu4f?=
 =?us-ascii?Q?xk+oFax74w5cLazpaL23nPAT/0DAbpAH/zxjH0Oyh0gHnHLqMsLxcb9aqMXG?=
 =?us-ascii?Q?Kl0Xe1hxN3CqTFMxCC/BqaZ0YfIE+Gd+hupZhXKM4KlKWAITDXLEodAIqIeZ?=
 =?us-ascii?Q?i8uPJZFqGllTU78T8ZmDk5g7kGYZ+pO6nJTc87VHooEw1egIgJLY8nEQmOCL?=
 =?us-ascii?Q?eJj+o549uyTvBcpXB3esQSv394Q9UQ4Q4l/1FlCtedP8VIk4Rn8ryfKI/sUT?=
 =?us-ascii?Q?SLdWGwV/yy7Q3trVDkHL9F9iwKWQR9RRw78lfr0n9tXepRShD6eYhJGab+Qi?=
 =?us-ascii?Q?Y2MSTIh9NeWMw1As7ubgzFsH?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604afd08-d6ad-4ba6-480a-08d8efc41467
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:50.9175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4Le9bLPnfD0uAmsffkjkhh7XGMNFhrkeN9gHLG++BHqD6nAnKYOPbTQkr+HT7/0D5tG6tKIqYYzyJOdCfZlxVhsuT8huhRpZml1WspT4Z8=
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
 drivers/clk/clk-si5341.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index e0446e66fa64..b8a960e927bc 100644
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
@@ -1189,6 +1190,32 @@ static const struct regmap_range_cfg si5341_regmap_ranges[] = {
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
+	 * May take up to 300ms to complete.
+	 */
+	for (count = 0; count < 15; ++count) {
+		s32 result = i2c_smbus_read_byte_data(client,
+						      SI5341_DEVICE_READY);
+		if (result < 0)
+			return result;
+		if (result == 0x0F)
+			return 0;
+		msleep(20);
+	}
+	dev_err(&client->dev, "timeout waiting for DEVICE_READY\n");
+	return -EIO;
+}
+
 static const struct regmap_config si5341_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -1385,6 +1412,11 @@ static int si5341_probe(struct i2c_client *client,
 
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


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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559ABC433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A0F864F45
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbhCLSR4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:17:56 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:45607 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232518AbhCLSRs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:48 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBom2018929;
        Fri, 12 Mar 2021 13:17:43 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6Kvd1a9at1hGKyBPp52gBkTGNx/RDWBVtRfvmj3iYACLGBrzhcO6uU1O5gKPF16JaIHb2xpQMjc3VgFh5pmQK7ObvStovM4zVhdJUqkwTTbc+aXoCMzSAgxPszFgJS8LbtBzEE/gu9VM2aFN34/nEFYJxgboQgmedRYExJRW5/oXfA7TF1I969d+JNa+Z5GxDUTWx5c4SKBNSJSgckWLOdSAfpuY+ERJO4nQwYV9gIzljMgW1EhtYi0LxxgWKnhKUY68KFU6MHdLsz+aB3+9WW4/oqFB2GM0FRGE+rtoUsCRXQSafgxPwgk1xdPF/gh/Egb8zZ661iscF8/amE92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEq4dvJRYs+77BkhYcPb2ofaxxtW6jdlmehqZboCYtk=;
 b=B6BbcTh/IIRT0A/9eyCK6PpvoMH6m4qu55DhgurZP/G3x9HEZVHSEIARSvPxUOSGTzGXt2m3VD5mvM3IE58DcwfhGy0oX7ATdfRGVXwur5+kf6DPXTQYRI7a8OIj4AKgYccDkR3wepZliE4+1cLAm7Be8uM4X7S5LrGTaWAZKXjnj50rbulqLvYA4wMvg82PPouz+ZwLLjbs10BMPLmrTpvSCOHFia6cKZQgERQ0b82+Ncv3BmJO6hbHypHfLM8loHO9yqIIbUrPqdTD96tFR0VO+4DfYo6L+dJq7S/ZEK7yl9yYu/MTbgqzEa2EsLTTVMiy+NAyt4l1NaItfzqBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEq4dvJRYs+77BkhYcPb2ofaxxtW6jdlmehqZboCYtk=;
 b=cZA2c4c+TtjPEE1e96vNAm4cw7fI1Z0j+l10dMCEDmpqeIUEpYqAYrx48izpdTjXCiEdtAmPSysOZG0gxMdnhaDs6usF7vvq+u/NHT1ZLNkKZZljsSXRk8PVdT7/r8XS5OVUIiKsVMSM1vFoWzya1b+e7eftVQCVfjnKNBHHmOQ=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 18:17:41 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:41 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 2/9] clk: si5341: Wait for DEVICE_READY on startup
Date:   Fri, 12 Mar 2021 12:17:03 -0600
Message-Id: <20210312181710.3998978-3-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf6ed84-09fe-49ab-77d7-08d8e583200e
X-MS-TrafficTypeDiagnostic: YT1PR01MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB4439FBD9D8C13EFB7AC7D6D2EC6F9@YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: beQhd4+hPNomUAXTDiofHq1Ej7qt+VM+Wm50BNxr7iOtAyCzZEdaRyechgOovqnhHW0A1vRydEKbT9XADv45gn2Bq5pmwQ4FdC73i61iZgtbXOfqzZDrdTKqCYxRj5nRVHqQssRap21wxBgAWyrS90i18rdkYZEh1LB2YiBA7vGhBlMBhv84niSpIPRKuq9A/lzntFv4AbmgzYNL2VsSSdGBLJwy7odsr+PkVVGnJAryZfaWUtchahAbOclWneujjoGcYelkBjRE32KZHyphWq4Hj1mwyELF3G1l7ogIOP75t+LEv2jtG5A7HrdtNG7qTzceJW/jX1ohNBrQOBscFklrbGG6xPT2r8+0dXArOxEbOPmyauRysCY7n6DrXLETqe3o1OyQALgd+zGJRrawVmkh2Oz1ZeFI2DHR5fYituMafn+74Z5hOL9uaP41c4n6yIw4VAm8yuD6GUcFAmhwR4dPuxVGGnn2FJ5Y7MrlQtpow+UH/YJzIZ1fn7mVS7tTK73cd/y47uKmNGpNvcSIlY1JS/5f0QyxCO+X8a46GITytR8JxRQo9xtfYRCk324aTxmMTwLFiE+l7Ee6A5i47Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(2616005)(8936002)(44832011)(8676002)(69590400012)(956004)(26005)(107886003)(16526019)(4326008)(36756003)(186003)(6486002)(2906002)(6666004)(83380400001)(86362001)(316002)(5660300002)(6506007)(478600001)(6512007)(66946007)(66556008)(66476007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/Vwj9jFgPyw6ZeH0SNMvQGUEQeslH01FKVJ803Al9oLifbMx+0AINilg6ija?=
 =?us-ascii?Q?hOFxXcGs3mVohlrK7zPaN7/GePDh9Ao5A1qw4gTMuPnytivekAoO+Kn0KCoi?=
 =?us-ascii?Q?snbZd3111xOgIXdGobXyrwvVlACZOTt4HoNteoYsDXbsPyxWONLNdY9gCRsH?=
 =?us-ascii?Q?2EJYw522KOlnxt5TVP32MD+3pnjk0ap3U/TfpYugvMpvfJLxxjOJtIVxpvx3?=
 =?us-ascii?Q?uic5kKK72uI+2Ea5iCthwvKcqMZfOF8AZ3HKMQFPdEiFBWknB9AcNnrQzpN2?=
 =?us-ascii?Q?rkZOYGrjGcLw/3re1Rkpfx5vpwdutQHeJRMBTTs6X8o/4gJ3X2UyM69Ji6J7?=
 =?us-ascii?Q?cQDQY+IRpzM5g3pjhZ+AARNtrTGa0RTwnLuZl5CGmancpaqJRuEkvso7kr0j?=
 =?us-ascii?Q?TplFxy2Z+N2c8+rOStL2z5naIQZYPvns5A7RACewocHG+ETuATQH1t3Mq9Wx?=
 =?us-ascii?Q?Zi9pd0ctXF5VP1cr0s76tSVs2MhCzJT7rpx6o+L4NzCSF1On6h9uj7fVvUze?=
 =?us-ascii?Q?HBTqjHP+RroS3zrGFKJyDUXtGXyy97HRvtq0K/UI5gzAS6K1voMeFRRT3G/R?=
 =?us-ascii?Q?yN6GVht2RLR5NfhWlZR4qhMud9PjFU7R3Yd/CJTK2C70xRDN+q9eCdC3iG3p?=
 =?us-ascii?Q?ma4q9qsXe/NMEyQcD10g7M/1JBLFCui8y1iX7/NaRkSLgvhS+KOKxWy0qLSW?=
 =?us-ascii?Q?ffq84U+7LbLOKsEGfIDrlRSJURX1DGHZo37OEJDWcxrD0oXXAnrwyc83InWF?=
 =?us-ascii?Q?nays/8suuY0o5kv8Jm6cXT6QE8zDMd7mfAvAl2GY01NvnXpHVEk8jvl7s32p?=
 =?us-ascii?Q?T1V5Tn0ntMdIiTHvt3iKrq22lbSPyUC7dBWlRA7vAHvJ487yhYpjyUeSrWBl?=
 =?us-ascii?Q?6gEUwwz2NJvSZ1XxzVLR0xFjB79z2hwBiM1c713WpPM9IgeNtb6tK+HG5rD/?=
 =?us-ascii?Q?b9inm0pUhosEFCX3EJmE+KDdMvziqXmVu1HA3n5IdZjDGksqrDELOhY+SB+i?=
 =?us-ascii?Q?LvLcHd7aJSxbBVjctDnemUaB+bxHHb7xn2PtA8W4SceL5DnzoL5Rn1iXYfI6?=
 =?us-ascii?Q?ZzlF0UEULMjHimgEkh9w3c/ILaNbvdjtpq3JJGixH+aQqNkCFtwe1OieuqdZ?=
 =?us-ascii?Q?xRWh52y5O6kDtgUXEF6ZzhQjeDMLcXmX4ih75UNqqU79BOnkICrTW8stFhY+?=
 =?us-ascii?Q?WOvN0YX78r+x/wAK706nm6O+aNzOBKkB3TCyr11k/JcVNC+w9U3Vul8IcRSi?=
 =?us-ascii?Q?KAdEJYMDpPq8FnlnsteKr+2qJsBLVWyBlTMVG9O8Iv3432rInC2lfvBIPMpQ?=
 =?us-ascii?Q?Wq514U/cEiMOxz8UiSF5yJQI?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf6ed84-09fe-49ab-77d7-08d8e583200e
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:41.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZSRrKR2yCQYrBcb8ZBu6wrGEOUf9SrGG1f+shqGpZ7sP7uwbtZf+cbyM4soILwyLZQwrJZsd0LBKBDRb1d7BFrLdO8dNDGgwzEKeqkxx9U=
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


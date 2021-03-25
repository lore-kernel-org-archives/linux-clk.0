Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577E6C433EA
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27D8C619E4
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhCYT2W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:22 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:20383 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230100AbhCYT2C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:02 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQv3k022960;
        Thu, 25 Mar 2021 15:27:55 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xbcgv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfeDj0jQDyxf4cS2+iPhTJTT9H6N6bg8hD2VpCKLge4w9ErN09cOHH5jvW/sEYqaGEHqadukXufuBd5KTThSsuxpfVDZJ3pjaCJJvKvuqt4/f3Tr2uAObTG/KRgRVNG+enDc/yicbNBB1jeUbuYxSFhCL9uvqVwrQnOy8GlUCfFW45wfbo0QGFKHsOdFuR3UJhnPSzQoF45134awPCvEdjqi97DiT2wMGsBYC1OQol6Dzvi7LcCFVRN1D5XlG4PXBciJinBpIBbeYlyHPII5rYqLMu1vdOj1lil0Pd8jUZRnelkb7u84nk7Sa/1Ux3NTfkGAmqOHSUSV7m4RNSAgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M/wdsb3W/mqkD7bMBikg5jCY8Ip2YnH014mUcQveE4=;
 b=gRID5bjGY5/ZqXH6eDIP7jLnpwWye6VACJyXD8ZrDA8+8dKtfcUd5qpLwxEXK8n8dsD/PCUUI8w6GN59Fw3f85vIp/iepbj6034YzjsZQC6SBLLrGJHdfU/GcQaaiKv7SRZcyqdi6c0lUOCliV2PnFPMRpnwTW4oQzv9QsUovHtP1TwLhtMfjAAJP+Zx88nFNUVSVZ2uVkd0xRy6SJNa2JKE/qtjHUAlCswPeca7qt27FecVyzx3Ns8duTgh6ergzTL9xLkzSmU+PR68NHWi0fXX9+wiB9p9RO9chyYwGb/jan18/DoKjx4RwwPlvMb5OXfVCoYsx85v4RmjNkCisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M/wdsb3W/mqkD7bMBikg5jCY8Ip2YnH014mUcQveE4=;
 b=b1E5kZlArHMkLauvSHVUAGvI9k0tXczgrOsOHMr2Td+de7JDnNto8Tz7WusuPhqqiotrCrwcGCKSIMUaBNbqPBXnTnwl0ayiVVztf59E+bFNhdsuen7bgxvleAr1YL7phoYkIiWR9fNz2JD55Gm2J9LdYEZZhX361BtR8aNLyKI=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:27:54 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:54 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 4/9] clk: si5341: Check for input clock presence and PLL lock on startup
Date:   Thu, 25 Mar 2021 13:26:38 -0600
Message-Id: <20210325192643.2190069-5-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 063b348f-79bd-4091-6dad-08d8efc4162d
X-MS-TrafficTypeDiagnostic: YT1PR01MB2793:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB27938B392FA316056C613984EC629@YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JwE2DRCF8WSPA2uHyGhAFBJXNORgRn1khW1kdc0fMuag81B5Q7AJ1JCqNZmrknXVBBllkqqfo1ZGNz9LE9TCc0J83LzKp9RNWsFX4YEMtH0GbPVE8DIitVS23Hu0on3mdNPxAIIgSepHL7YvbJGQBCdY3fGbuOghzrBLjLlpdN1KkE+XZ3bErqGrtir/ky0kM5Fu32pew7UZqP2jeKp1uxy6tG+Mz/5OcRFYsOW2EUCBitJVmicl2rbfRy6kURSIXqXMMXu8uw0CUc9YU5xjIzQwfATWytu+Dd8dLIbBQQ8iSKeCCAO/LvqhBxmSlx8D8QLSAmxvtyYXkiVzfEbLUn8QGRjO3SInjBZWSGFnusBApcWh/YK4elh+W8fdFx4AOImOzAP8CA7TLB5WonBVy8ohsqqBmBTCv4HyQYJDm0wVFoHV3V2KDlDzfNYjezlF5qNrTbhYuSu7hEp+z44OJxTJBlxfVaTPBfotD6WhYGGwneGpwIqn1BUKOJZv83a1JEIDrW6VohrlyFiWWwVQH1tMQ7GxukrPx8YADRFNO6QaQJVfoNJ6pIobfZi3mRuhmpjIS7GhwZ6frn+oBwjAZNabrKasvrsRfq6w+7HWAqIJmybStCPNd/YfAF4HeUbBd1w5etqypxS/TMm77sypTHGY0B6fusxW2Y/T7ygMtVtYTxcNn0VPCd90EqQzAsV/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(16526019)(1076003)(44832011)(2906002)(66946007)(6512007)(26005)(8676002)(66476007)(52116002)(316002)(6506007)(69590400012)(66556008)(186003)(2616005)(956004)(107886003)(86362001)(38100700001)(4326008)(478600001)(6666004)(5660300002)(6486002)(36756003)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0u78MN+y7r4r+bt59y0n34ikatAjfXWdSo6H/4nI/s9ty1BtMjEizw5voy0D?=
 =?us-ascii?Q?17i7sfBaHzvEPNQuexSYWzaX4DBej7SW2BL/T+3SJr8e/1gqsIOaNpvwqhih?=
 =?us-ascii?Q?oatdyEHfVVn7+ELYRCCWdqxRVRuCMZqzOdROGt6QRRNWXe52cS9imHmcOUP8?=
 =?us-ascii?Q?/WhXREfXbgyXLSVDfY/dU5/AiWg4q7e1kJTRJIZtiH4t2Vc+RkPjmDKZjNcI?=
 =?us-ascii?Q?O3ffcWkReNdOkOSMrpskqllO5kUeWF5lStHxF23FdBzwAl5FZQ1OiNW8kZN0?=
 =?us-ascii?Q?qYc4cGNMJmG/EazoMlVUaZkJJlf6gIqtTp0xABwb9UadT6CXtabY5Nl72vmA?=
 =?us-ascii?Q?9IfaBLibcLS38nSx8Mbgmovj999KOcQNzvzPknIjxgItCmDKaYlp4bQJzdvo?=
 =?us-ascii?Q?PWzrvNnY/gNebZwEdN7Upl1tgoPoxPD+INDh7TTJtoZbvsKwQuSHEfBK3uaL?=
 =?us-ascii?Q?Jd48SxS5v/2TzBn0pxBpn9j3LsMR+8tmqnTmXAPFg55fL/IEVz0bYEnGl3xm?=
 =?us-ascii?Q?r/YMSgzWJvxjqRbLEWqES2yKCWjEdzfDnqnJNYrrFH5Oomeq7TbClWuMvzED?=
 =?us-ascii?Q?evqC/rDGFNwuNj8V2lxCWZhkgYAitcYVOnpJo2aTUiZnBw1KkM4tuIPCdcy3?=
 =?us-ascii?Q?dQhdjCFNmlS3y3gXP44bIaYstfhN8iX6urKq5nU2rfl4stsz0bDhcdcwvsoh?=
 =?us-ascii?Q?HloA5UQMiX4UkwiI6KEonyIRXsVDsICL86mff037vDkmlppCgiCMdXBKJWKR?=
 =?us-ascii?Q?k/joXcES2KB2o94iamVF5GrBzvHb+CumunQZLhpOVP6WiYWatFydakfE7rpp?=
 =?us-ascii?Q?O3qAWidNgS5qQ2rC3J9YBbnUpy+V5BT3GPkhTz2WWd1w5llUZEztShuDli3n?=
 =?us-ascii?Q?evONHU+VLJ8y+jb1GOdoF45hZ94kD5iGKGkFoDrTHYGhq2Vaaf4Xu7oyfMnl?=
 =?us-ascii?Q?Kq5K7R16b/Pl7pNfZChWDAGhDtBr+f3LoVRr55IpKqhdjVLPXjMvBUR4OnUe?=
 =?us-ascii?Q?XduM+P0BKtWKYaKWVEJ+EZTvjdydBK7sg+ZamPULrABJFCvSukOdTqamUT3p?=
 =?us-ascii?Q?iQn1La4YjBrA3eftSx+9SYwGJ905obYnNxDvK1fhYkfeX9I9zxEiOAe1rtj9?=
 =?us-ascii?Q?/JhsnOQiyDQUfU9qFy5JQVeCpC+/CFv4aXBupCqzIVyt3tJhErKkKsnT8GLL?=
 =?us-ascii?Q?XQy5jNYCbk6ND8dXtdM2jEsKG6oime61sS0eP+O6Um6Dg7VHGpw18t0GCMSC?=
 =?us-ascii?Q?Rt16mTpR0agNiEEOTGRJqEIpSao6jnY2o17uYcPLkocBqaQhJBUKrgbT2MdB?=
 =?us-ascii?Q?mIJBVTULwF85pRS8eqfH+p1Z?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063b348f-79bd-4091-6dad-08d8efc4162d
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:53.9518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKouQ2vIuNZCMg1hbPQ7R4XII3x79xsgWOxBIUz6/DR/nkYCbVcY9ib1d6VPMAmWQrs8y0CIASBWSeTrbeZQBiNb9mdQo9+T0tdyoKPJHYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2793
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

After initializing the device, wait for it to report that the input
clock is present and the PLL has locked before declaring success.

Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index ac1ccec2b681..da40b90c2aa8 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -92,6 +92,9 @@ struct clk_si5341_output_config {
 #define SI5341_PN_BASE		0x0002
 #define SI5341_DEVICE_REV	0x0005
 #define SI5341_STATUS		0x000C
+#define SI5341_LOS		0x000D
+#define SI5341_STATUS_STICKY	0x0011
+#define SI5341_LOS_STICKY	0x0012
 #define SI5341_SOFT_RST		0x001C
 #define SI5341_IN_SEL		0x0021
 #define SI5341_DEVICE_READY	0x00FE
@@ -99,6 +102,12 @@ struct clk_si5341_output_config {
 #define SI5341_IN_EN		0x0949
 #define SI5341_INX_TO_PFD_EN	0x094A
 
+/* Status bits */
+#define SI5341_STATUS_SYSINCAL	BIT(0)
+#define SI5341_STATUS_LOSXAXB	BIT(1)
+#define SI5341_STATUS_LOSREF	BIT(2)
+#define SI5341_STATUS_LOL	BIT(3)
+
 /* Input selection */
 #define SI5341_IN_SEL_MASK	0x06
 #define SI5341_IN_SEL_SHIFT	1
@@ -1416,6 +1425,7 @@ static int si5341_probe(struct i2c_client *client,
 	unsigned int i;
 	struct clk_si5341_output_config config[SI5341_MAX_NUM_OUTPUTS];
 	bool initialization_required;
+	u32 status;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1583,6 +1593,22 @@ static int si5341_probe(struct i2c_client *client,
 			return err;
 	}
 
+	/* wait for device to report input clock present and PLL lock */
+	err = regmap_read_poll_timeout(data->regmap, SI5341_STATUS, status,
+		!(status & (SI5341_STATUS_LOSREF | SI5341_STATUS_LOL)),
+	       10000, 250000);
+	if (err) {
+		dev_err(&client->dev, "Error waiting for input clock or PLL lock\n");
+		return err;
+	}
+
+	/* clear sticky alarm bits from initialization */
+	err = regmap_write(data->regmap, SI5341_STATUS_STICKY, 0);
+	if (err) {
+		dev_err(&client->dev, "unable to clear sticky status\n");
+		return err;
+	}
+
 	/* Free the names, clk framework makes copies */
 	for (i = 0; i < data->num_synth; ++i)
 		 devm_kfree(&client->dev, (void *)synth_clock_names[i]);
-- 
2.27.0


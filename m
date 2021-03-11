Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D52C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F62A64F88
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhCKWp7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:45:59 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:25427 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229664AbhCKWpq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:45:46 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BMLvD6009850;
        Thu, 11 Mar 2021 17:25:14 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
        by mx0c-0054df01.pphosted.com with ESMTP id 376bes9m84-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgix1WGu72dsD6wg9wKd4lQhPMVa64wVolhAPwC4yMRTyYo1dfnONpSlMZC9qpaMjrMksHaejF2I0uSFPPewj8qvi9SLjldwJK+W8iwx2DchhylGYh2Hu8PnaQT58XJXwR8+vI57ICMrqsipyncxR2xO3Nuxn2vRXZgs42lU4xhkREExjY+ZYZWIcutOTS/Ik5PpBAgzuJWi4826KjHCoDdxCZ8o/yKk2veefPDJrNBMZ89PJlTPk+/cgfcratjQlJb2jwi04oaVkaSdwZTG8MZX2oJ5sZqE3HEgC/a3lYFPVVD/caRu7FpDMLwRoy/w95wC4CdIjReZsRVBhTIpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJQLceEnUqW4NPmr4QN64XNbQGtz8vEx3AGlcgu4jk8=;
 b=drp5mHnaTTMfH75RywpDLNT6nVUwkVsy5GXT99PlN8wCsAbLSLP8NySrB6ODb7reAQPqx5//Bk8frJwp4JeCjCoGtZcazGQbmyJV2PuAc05y7DvMeU920Y/a30EPDI6q6jUv89tsETamT20nF7jByO5z1N4vhgOcWhLeVN9R45tZDvLH43Lg2l+w52H2ImGNRYkCUUVC9qR46BxbGK66yucSQlIShJxhpsq1a9qt23zXwO3p55S80ZWL/YzkwuRGvvnenqxs1ZSUpC0iSHLnyc1XJCrFkXVf02KssVvkmakFzGQI2ihxHmEiF8TCQ7h/eGT8qY7iewRReb0Ru7e7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJQLceEnUqW4NPmr4QN64XNbQGtz8vEx3AGlcgu4jk8=;
 b=vfxX08yWPm9fmuGjIcUKE6GYM8SMvL5FCs0wL0KYf5sIfNNVuajafMUaXzddQ8Qe6sLSrsiJpkbX3krNVryNF8MnOPlry73tPllZNEonVARkhYFYYiVzRo0qkdWoDUI103RRb9VelK7E23gzCGah/JEojOEHwn6H/7k4MBCfTu0=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:13 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:13 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 4/9] clk: si5341: Check for input clock presence and PLL lock on startup
Date:   Thu, 11 Mar 2021 16:24:31 -0600
Message-Id: <20210311222436.3826800-5-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 235c12aa-2405-484d-35c4-08d8e4dc8a0d
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB096052249DC46475953E8BDEEC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bo13AGcKTiPa4/L6pRl4psM8YJT7aPoeTWvF1H7UfK7x/a2kYBTSOjNXCZ0cxurKBH7saVM6xzoe65xn1GdFGGtbqJhUq0nMirfhSe53TDVj9LAueEzqYO1kRboFNdW5FIFOn8/xJ48G625Z2sPiZWLJNd2SCECLHZL1sQ3H2FqmzIGlKcuWKGUgIUEf0CT4xtLL6UyLW0dqL9Fsp9F2rAtq1JWLMVLRkW8BmIbJB+lYUszJg4HdS4BI4An90SSIdafQ6YCB01WmMeGcYh8VO4hwIDDsWQoHBcZdCILGJUz8E1L0nMP7EMSmPJ3tODlY2E+vyT7MzBKWKVhifuMu3jOLu6M1QrCNeiROtkDbDUhWgZmi7D5LOsDw+kFxuLz+WtS7APQTGzrrf1ZgfsM/hQUZJbDE7e9vLIjN3ckeSbzhddIMMwHixGg2W1ORrbKVSnM5/l9Thf0TADiUArIEnJW2CJGWTaIk8cnxjkGyn5x8ZRuxcdgITfkAiIZtiUmYhuhwEEjwgPe+cL+2eDRT2f+wGFKb9n6PuF+jC9ZWqOqwVqbKzRqYk+DGPKPjYFofJaamNDKdSNq3snVU+FpcNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qgwhBQKqjbnqCe6YaT05dD5szJghlNFHaXP3ySbnjFqOoex9KBbAAhnnj1rL?=
 =?us-ascii?Q?RiCvgGSiLLZ49zBdH2c8uL1WogwxHgl8/dSj1MThzJaz9EVSawuP8gzqbwB0?=
 =?us-ascii?Q?fQVDJTSeMb/ikZMXkdbrOGVrpOS1A/DUhi61Kfc2VMEU8HIVpxaiHO5oXLKl?=
 =?us-ascii?Q?ynzEsTJ8xl0huWBdQQVM5vajKEc7G3um645Sr2moDdf73GDbasfLkaF7ZopS?=
 =?us-ascii?Q?lJPYrtHaJYfcw4EMS6Zb9fYhKm6+cb0SLoUqihhaw3XPRUUF3RvU5bwwGq/W?=
 =?us-ascii?Q?sZWes0r0RDGsBLEO0e9P33AQ9RNabP4tbOWCYiSNvVEJGfnFOQwUz67ThOx8?=
 =?us-ascii?Q?KiGz0sVo9e9KZe6mEH5T92qovekfVJ3k57m0VC/niftkFjdyfZY1wfL4yZ5z?=
 =?us-ascii?Q?ZGr/BDolcmgPFaYdfcbI0fm83osx4lpJ5BGc7BhV5LnNU++8a1mxAxFpTMk8?=
 =?us-ascii?Q?gRtyGyBDk+GpprtwvjRiNxsnKtJnUXd42J+Trd9GJsdkkBXsIPijSJPyajpb?=
 =?us-ascii?Q?RwMkr+0TTrDHX0ozZIjHqN2a1nTSso7iBKXNq9X7D9Bk1MxpTgq+egyZM4Jg?=
 =?us-ascii?Q?053YJ+Ynu3cseit4Ro16ERtOJ0fQtzqSl5ocdJe/tfmiSiGTdWjfaTzJqZ/u?=
 =?us-ascii?Q?OU1MW+mDpoG167tis9STWRnyqLaaZVxEMckqZX9Ck/NUc1XGz4T+JL7UIN47?=
 =?us-ascii?Q?fcH76jthFReW7lJ2TB/qV1SnPzirF7Yon62XplGZHz3bB9oy5MPSwkueYxNc?=
 =?us-ascii?Q?1mx+dIWT9WS4WtBUb56wmlt10wz0raE8DzNXOkD/myYxtw+SlYJWrm1dmZKc?=
 =?us-ascii?Q?dpn//CPaKp4dIwqtIUTPOLTZvrON/dzhBe0zXh9YZqZ+PCLMy2qOvkP+vUjC?=
 =?us-ascii?Q?XHPF2c7+b8V05EUNu4x4cOlFLReHX8pCoXJv4oe79u4ItL4ydccLqSph5Ny6?=
 =?us-ascii?Q?eI9f1YDYHXPz0VnEMK6MdOUQdmCKltkRqh5vnuPpaBzurjXgbpXAUVzZh2Vk?=
 =?us-ascii?Q?bQOUT1TF5juJBNkrOwUqeEurGoGNY1+VUVQOUAIGy+XDxnxlMWWsqvI3tbUU?=
 =?us-ascii?Q?KOvWBWjxBRhMMiEL81mS/wKs+dCdgBZFA9lnrJvLVK3kR3TyVgNCxctmNcvb?=
 =?us-ascii?Q?uFm/JwqN19Bx2gDM4mLWKhdbD+nK+M+0wt+kAk0yTu9+OjVFZwxjVsdiKlrb?=
 =?us-ascii?Q?7v2CLaO0yFas5uUXsQySO4dqz4jvB1XgtnSLvjJvKQLybseznAQVqlkrL1eG?=
 =?us-ascii?Q?rf5w8MtzFO6dy674etsYAYLPla4Wnt1e21+LN87m7ik6wnnRyV3+2Fi6OfLk?=
 =?us-ascii?Q?j12lQmu91gZxGb3RtaomE+oI?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235c12aa-2405-484d-35c4-08d8e4dc8a0d
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:13.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaTPM8qmWNS0BdyCuXRLFVU9Ks1hhmvTXkmq/LghnJ0Lk+Fwj/otB4U2vKvfu6d0I34A8KwafQVj3a0nWKu1Z63DwstZqD/SITRdkSMv++c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB0960
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_12:2021-03-10,2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110117
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After initializing the device, allow sufficient time for the PLL to lock
(if we reconfigured it) and verify that the input clock is present and the
PLL has locked before declaring success.

Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 46 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 2d69b2144acf..5221e431f6cb 100644
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
@@ -1403,6 +1412,29 @@ static int si5341_clk_select_active_input(struct clk_si5341 *data)
 	return res;
 }
 
+static int si5341_check_healthy(struct clk_si5341 *data)
+{
+	u32 status;
+	int res = regmap_read(data->regmap, SI5341_STATUS, &status);
+
+	if (res < 0) {
+		dev_err(&data->i2c_client->dev, "failed to read status\n");
+		return res;
+	}
+
+	if ((status & SI5341_STATUS_LOSREF)) {
+		dev_err(&data->i2c_client->dev, "input clock not present\n");
+		return -EIO;
+	}
+
+	if ((status & SI5341_STATUS_LOL)) {
+		dev_err(&data->i2c_client->dev, "PLL not locked\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int si5341_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
@@ -1580,6 +1612,20 @@ static int si5341_probe(struct i2c_client *client,
 		err = si5341_finalize_defaults(data);
 		if (err < 0)
 			return err;
+
+		/* allow time for PLL to lock */
+		msleep(250);
+	}
+
+	err = si5341_check_healthy(data);
+	if (err)
+		return err;
+
+	/* clear sticky alarm bits from initialization */
+	err = regmap_write(data->regmap, SI5341_STATUS_STICKY, 0);
+	if (err) {
+		dev_err(&client->dev, "unable to clear sticky status\n");
+		return err;
 	}
 
 	/* Free the names, clk framework makes copies */
-- 
2.27.0


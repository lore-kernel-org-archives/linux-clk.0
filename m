Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC15C433EC
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88D21619C2
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCYT2X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:23 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:4246 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230160AbhCYT2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:06 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQvEG022964;
        Thu, 25 Mar 2021 15:27:59 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2056.outbound.protection.outlook.com [104.47.60.56])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xbcgw-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAMLFzBfnsEnAoUJOFM4FkIvTILjRYUuz8FhyL//6djHYkXiWCr+gSB6yRMoSN2oYbjHBW0P32PabA7I5v5+snxVS7MWNXFpTNbmzBoZQuMcVKCETmlYVEoJlldO1XgEiSDaja5jkTFHvBe5SGZdFPDO5itV1Br/7KVzC0il/fgf0ec5CVXcHBR5UqQFBP6h5aB/IKx8xr20wjgqa15or1x3YCf0pPbl1bw4kmiam1uDTWncbS3vws8kLSHFDNnTPzRq5lyh7kHgcMwlJOJ02ncbRHChL9XbcvezhX0iZrV3wfB0dqacyKCDQhR9ICwij3OgllTAs8YQmRy2khaVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r0qZ6iZZb2L+PeAp6+J3nTPUIonadagi/sbNV0siAw=;
 b=LpdqwETWXJdetyVql2wiMAW/9Ncpim3+GeKQgFIBD9LVv63AKGxWD4epR9La46GvtDWSeca+glJ26eqqKaWZjtIlFTVoqA06jNVb//xFCuhJO0/esvlIW84fq1L/M71nN7S7P5g7nsOJlQ4ZbbEenosAwRqBmOEXlPhkhSxetISiuTgWy1merdzcfPXpfK1duEvRLgKlcZqHcFx7M9+sVQ7npo1wZCGjgzfAzDEwiAtJa7cFkGg82KCN3BKwLadYv6HNTOkiLexWKrJymxT8+gfENVUnPIDoairFXlBHc1ellby6fKff+paf/aZVG9baldsb5ONUp8JhO6NShYqlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r0qZ6iZZb2L+PeAp6+J3nTPUIonadagi/sbNV0siAw=;
 b=1d2ytCpCwOLiHAyiZBPh1C8tsq6EACHzLoTmKU3aKQ7M+wAG86g2agGRDsLKVIUKi9Rnq3xb1I2rMDfgGCTNDuOnk0rOW7d9I7rCPQvni2tZCuDCa1nlJ7Go6FV3DypkDTkavsYG4f4NbZaEuspboOZFWEuU0N1N0H2Kt+j+kqo=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:27:58 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:58 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 7/9] clk: si5341: Add silabs,xaxb-ext-clk property
Date:   Thu, 25 Mar 2021 13:26:41 -0600
Message-Id: <20210325192643.2190069-8-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37519d70-dcbe-4059-3f07-08d8efc418c7
X-MS-TrafficTypeDiagnostic: YT1PR01MB2793:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB2793593FBF8979E70497B2C8EC629@YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35NxuMQbLWUnK2uR23L3R7vpdEaNCODfKGHmwsgtB41MgXYQRKGYx75ak3CD08nUJI/xdWUzDcEw2Q03ct8UGF2R+7HX+OywBLMxBYhgWmzUotnXFH8SPV3NlIx+KE6DftyPgtMuVNLoOT9QNiTPiAiBeWCdjYfYNHtfve77F2XyEA855VaN7FrnM9WkLXWCbN7TzRMhgolfTFU35Ai7yOmTuglD3j83K4yHfSFg44IWS/sBpnbQHzxG07dD1DnuNPLMXecFcmPexdz35vkR9RwBasNM4RY4Qrc8sPCrO8BJTLw8meMq1C6y+tIcFylxYnxtyA60RS3Z5tc8oPEaSgwM9iznafC5jBBZHT5QvDGzlA08m1jsZKpVMzQ45IIrWAWMzt+wqfpCjDOaT2xZV88ikWOQbBRaunhj7SSEoru2l7jM0Aw6xIvXRLUvY/wkIsJiFbI/UduLjnBQHqcpUsFetTH4UEesIUUppBQqRLlEPmH+xxDw2+vhz2RGcxkaprkfmeWqimPXN1KtU4kF+5GCF2c95A1bXkjKQ9G9Ntol7PnGyXToi/c0/F2z3qcZ43gVtaGFt9S9OzeAUeUTNcax6OC5o6X77Qb5qkZ4YPVVes7HP9E8mbFQ7hiqWRZNxVaZgIXtYUQSdY+LpX/hZgGdL3BOHabWrDD8vmg6wKukVmxVT4lIHyKW9mZBKEcs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(16526019)(1076003)(44832011)(2906002)(66946007)(6512007)(26005)(8676002)(66476007)(52116002)(316002)(6506007)(69590400012)(66556008)(186003)(2616005)(956004)(107886003)(86362001)(38100700001)(4326008)(478600001)(6666004)(5660300002)(6486002)(36756003)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/WACH1ONFuj5GPORl6/MQS7ScVgfgiG1mJKMCMffOMwryqSf/KecKsUyIbm9?=
 =?us-ascii?Q?9HSb3kH1alq+JRzrlGC3nmTrrjof+s54NLJ8rM5XiEb2oyEmmGpz2Bows5fG?=
 =?us-ascii?Q?fc76l+B4nJNKfb+QoL0nqvFPQgG62bdpAgpLI6LNAABh239gaqlEMVcSeQpT?=
 =?us-ascii?Q?4BYlm2lEZ1/JWfxrJh3ql9QS44wVUdTDo/Rx0yRJ21YKEI3zGT6mSI1UDQcl?=
 =?us-ascii?Q?p5hIIIxoocOpeHrYT09dDaKJJ5XDJ2UrPXXG5eoynmHByrvGXEyI11ayVjDW?=
 =?us-ascii?Q?gZS9b0+94sGUoSdd5AG6LvG3/IgXO3rOiPPEmoQHZmeHfgBOmWKG/24Sf5L0?=
 =?us-ascii?Q?p1qlheel+F0Hnl8jt+sazxTksV7btWbRQL5XG5XEvrwg0iJNxBjif+q4j7Zs?=
 =?us-ascii?Q?kANPQWSe1YVqW+QfKjWr7CaOnXB/hwkYY3kN9NIGoASNKdPKlp2J4WtD/x99?=
 =?us-ascii?Q?iksCNwr5n6pfUCGkBujwRdvnN47c/6AYubHPoAXwTA9uMBfUsW7aI5N9QdVk?=
 =?us-ascii?Q?PPdLFj/AFcjKYVXLc9AOiyBY0XwVXYgg9KBd6D1SU0lzMVCT3Css4xwQjq14?=
 =?us-ascii?Q?uROlc3XrpkPMXY5AJIYFLd/San00fH+DWdsrAuy/dmMW51XU+nlAT6GwkDwp?=
 =?us-ascii?Q?psRduoj9VZcip8y1mKC9OGoAGZCrDCvdpLUNR1v3UONTXOx3hk32aa0ztk5q?=
 =?us-ascii?Q?oCSobYJomT8dNS+2UVjhtDnn4LTu2jpbRw4gZFTq0nYiyHkaUtxBLzKlZMgQ?=
 =?us-ascii?Q?1Bmj0F1jpNse0twS2uzOWum81ZOPHdThXHRSYKoIPTHSCInzZBdTsb9+8UvU?=
 =?us-ascii?Q?b+G/fH+IT1pVKT4G9bo7fjj6mtdqh+5CpZN/3M7hK2ftjfDF+nT2GYJ9PqZs?=
 =?us-ascii?Q?lk50RPD8Yk2LmOkBQWwkzcdHbvtSjmcdDLcxuMOlPk0MrXht2c2lN4AHTgwl?=
 =?us-ascii?Q?L5OH9QRwUFDo/X74xMuNTilzP4r06wx/LcP4b9JSb68pSeKUC7iDrhzCZsb7?=
 =?us-ascii?Q?wwqWA43y606roc+/pWFXlIS4VsRTPOd6qEMyoqh1RjB6APAwRJLT5Yrl89j5?=
 =?us-ascii?Q?wLBC24a6hv1pzfnvr3Pn5ycBdYG3estmoNCWtVeeUagk40NzuV2gkj7Mm9aV?=
 =?us-ascii?Q?KilM73D/q+og+WDhtYT9UiTNLcqJSkWivHHw9UGwosklmsFGmRSzW8w3nxdF?=
 =?us-ascii?Q?1c0hlMAXew4JCVszH4tzjbkV40ZcwdsCV7289/cKb10Zr9DzTb0cyH5qUTTH?=
 =?us-ascii?Q?p4cXwiYMDpK/HPfh4s9yLeg9EgDv2yPks7VW0Bvm9KwTNyKi8sYeU/ze5jrt?=
 =?us-ascii?Q?BFMg/3pE27wURuVqvQlzCfvx?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37519d70-dcbe-4059-3f07-08d8efc418c7
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:58.2753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/OOTrWmZxbpodLg01xPdq+7Wfe+Gscgzgjo9srikzMCklk1gbhwHj9pZu2s78il8LwS7bDDAEMWDmEI7Lvke0raqqZpd7edydxR5DbwIpQ=
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

Add a property to allow specifying that the device XA/XB pins are used for
an external clock input rather than for a clock crystal.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 28ac7085f362..c5ab4a5ae6a5 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -80,6 +80,7 @@ struct clk_si5341 {
 	u8 num_outputs;
 	u8 num_synth;
 	u16 chip_id;
+	bool xaxb_ext_clk;
 };
 #define to_clk_si5341(_hw)	container_of(_hw, struct clk_si5341, hw)
 
@@ -529,9 +530,11 @@ static int si5341_clk_reparent(struct clk_si5341 *data, u8 index)
 		if (err < 0)
 			return err;
 
-		/* Power up XTAL oscillator and buffer */
+		/* Power up XTAL oscillator and buffer, select clock mode */
 		err = regmap_update_bits(data->regmap, SI5341_XAXB_CFG,
-				SI5341_XAXB_CFG_PDNB, SI5341_XAXB_CFG_PDNB);
+				SI5341_XAXB_CFG_PDNB | SI5341_XAXB_CFG_EXTCLK_EN,
+				SI5341_XAXB_CFG_PDNB | (data->xaxb_ext_clk ?
+					SI5341_XAXB_CFG_EXTCLK_EN : 0));
 		if (err < 0)
 			return err;
 	}
@@ -1539,6 +1542,8 @@ static int si5341_probe(struct i2c_client *client,
 
 		initialization_required = !err;
 	}
+	data->xaxb_ext_clk = of_property_read_bool(client->dev.of_node,
+						   "silabs,xaxb-ext-clk");
 
 	if (initialization_required) {
 		/* Populate the regmap cache in preparation for "cache only" */
-- 
2.27.0


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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AE4C4360C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47EFB64F6B
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhCLSSA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:18:00 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:53287 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231597AbhCLSRx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:53 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBqjl018941;
        Fri, 12 Mar 2021 13:17:49 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kf-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d66n3118fFXk3ejx1vcc3Y3pI3ymgWeeUZe3YgcKF3MIYOXeEWbfaBv+CBZNqCheYkyL4R40lkw1VCh7ejTDzFBV3rALFAjPzXJGx9/w892Ja5rgycz9JUVyH2FKIRrJXfpKFNz+0IOJWtTvCzTjGE6kSYToypCDKr/QwseUu41ehxGhB2VXMZBQ/Q0PnwoXhXT4V0jtrHKdlzSJDM/M6TpU4fJvgH9mi0fbukYSbG+HayKjLKprOPybQ4sKBM4qDrx7PuVfiCPrkpE2SnaO5oD2W3R+SE0Q55JeZfLPpviqlm6nIk76O7DERL6pDsyhPJCvlNgvcDrjwAYWoEiSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2OOLOgeQysfWi6kASonlVH+BiodlOoPpmUZSDaRqjk=;
 b=ECBUM9llcwsRbYTSIdU0cgTLK9954Wmw4+00LLeCCg97rvtvXe993DG9FutQtMrF+tQpV4P/0axWcCJSgE3soHnLyw3GzP+iPVT9F/Zk1W/5g4orS5QUiqjw7EUQv7mU2ti7bLe0tA+fGi3VCU3Jr67tdsF4uZAhyCIDMTaOB5MyE2GjImLwcE2P8crusq8MDAk6kDANrygd5C5bvMJHL2s0KaXOhOyG3vTZGliRqjz/g+T2Lk5SSOI5ZdBwgAC4L8QaZC8fBhVQDUT8cxD0+UODma4KsciTat8quLIPNfUZyNILvvQOs00bzFYXO50bTvr1A3vz0hMhK0YJUox/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2OOLOgeQysfWi6kASonlVH+BiodlOoPpmUZSDaRqjk=;
 b=cfuuBmconxmQh80PVOEJpE4RhA7DjCO54xVEPheHHUkAaD8ZMW8gcv1Z2E09RqBnAG03cRf0sYxk3NelR4I3xzHyUynybT8/Mz6rdaY18NfvPxYUCzBz38WyF+eNLTGfnN0xY8AoU6f+Izp4Ov2QU/MtjUfoMf0EiDfs3XGavkQ=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Fri, 12 Mar
 2021 18:17:47 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:47 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 7/9] clk: si5341: Add silabs,xaxb-ext-clk property
Date:   Fri, 12 Mar 2021 12:17:08 -0600
Message-Id: <20210312181710.3998978-8-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d404ee14-f3d4-4a0a-10f3-08d8e58323d8
X-MS-TrafficTypeDiagnostic: YT1PR01MB4409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB4409E002546BF8E7E86F6F17EC6F9@YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUVYbjjPICZGjc7BxoePzf+ZU7iG7CYL2AoRr1AOUEAlNKPlEMm9Uei5d0EKFRtoWxHCO3VPkxIkXyRQRTdCERpJOI/m/d1knxxABUUvF+OKPTM3BTrDvdK1BuBywVX/W2fHce8KYUJWYJUFR/7fJhdqSUcgr8CtQuIkZxwHIvpyzJ0EqB5mDeCETTx6reolxLY/nPCJgmjlYi5ITXoFiFbVuGsycxLxXsajcLNstYSQXPHLJxtLO5dvWL4xUNPeCgPTMw1aR/G77QW2Ak6EFoaTm3EKYOQ4/LrJ7Z/idpnQ3UMBhBLx0ywPTtsP86CoyjzQBQG53NgyxlWlwb6BuPhmBlOmvamRHyKdmYe6QD04X6gLS84Ypy7g2F7DFq6LoiARCh3xIEKxshAzAuHaH6pFu6sTEJ1ZgUI/7V67W9rzJPcNGomc4Nuj6lstOGp9WjfP9J5nNe0Eizx3JTL81bbi/BQYL9Gh1mNiOP0o0F8BhVS/BBqoeC6yyWXOUQQbTpz6JMC5beXCgSlICiIwO8zWgIp1eQqgG9NP7U8dkp4oruyf/zr8DSpbds13gq9muEAe2uqyNwDetTHKvvrPKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(366004)(69590400012)(186003)(44832011)(956004)(26005)(1076003)(16526019)(478600001)(52116002)(66476007)(6506007)(4326008)(83380400001)(66556008)(8936002)(316002)(2616005)(66946007)(5660300002)(8676002)(6666004)(86362001)(107886003)(6486002)(2906002)(36756003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4oN6eSqzc6zFRCT+mtkKNvYo5hh3x5MTlZ5S3ZaWJyNJ9TCuFT9Wlc7mbMpm?=
 =?us-ascii?Q?tDQ1PAI/W3ZH12QsT2CrGZdVdqSmG2St0dVlDSdA0Eiy7CZu9DMxCo0ZDI7f?=
 =?us-ascii?Q?29PtTdeBefkZQum+Z/kdD1ggkMlqTZejHTtcLb2FTFREcadB1HSi5MUjkf6D?=
 =?us-ascii?Q?3ERb4/eyZ15OzJPgcY8HEC4+F/wsNmtozyf2h6VQgOkVMReYMClt9hXZgsxk?=
 =?us-ascii?Q?psiJErjnVeTxqp+qQVt+pFSRIMHf8kJJODuTXjDMnys+jou3OyslHibKjnnr?=
 =?us-ascii?Q?awLVxcXEfwa5XWIz/GSAMELwlk55qx2J5oAlS1qVRjIt/2JCiJFLKaeu/HA8?=
 =?us-ascii?Q?+2wrlLU2T5/K8SqjDXuQGEHUOsJ4ET/mRFpGAOlrT4S86WhNgXB1pzsTD8JE?=
 =?us-ascii?Q?gVHyf85ZfRkiXI3VuqOtEg9GLJ1IN+0ZHpz2RtEzTG/DrUw4R12pOtY+5Nsu?=
 =?us-ascii?Q?v5TekwdA4Xv9U7YzygmktP6jR1oUqlqFF1Ou2KiHbBdox16tTIwzKQth5g6D?=
 =?us-ascii?Q?pNKR0K5Raof/joFOanBEOsMT5xqVYZLBuYBIQDQOBLN99X+MQXnlvN17HztD?=
 =?us-ascii?Q?t2ZmydN1Yxnt4k/BZ+cZOi5+hN4S1594cyPzU3CAgMaUaE1+n7LfY0pcLV1k?=
 =?us-ascii?Q?Yf0/g7BdpMYHO/QJleJkVuYgwV8oq7skMAyhtUs/VlyZBVu1PeWbBO6/mx8r?=
 =?us-ascii?Q?ABj5DXp/Rul+a23GLkkpVPWRTeUrRpfL8d4K1F/v9sPMThMQC3iXmcuvxd1C?=
 =?us-ascii?Q?uzgTRZ+cHw1SelLZ4FioXul59fLVZwYAho+I90V06JJQ+Ol9jlJNyyuUMgzE?=
 =?us-ascii?Q?1dkm1Jxm5h340E5XtgAhPeJ1VhyuOtQdvimyRcCzl3Vd4ni7qhIdSByJnBDP?=
 =?us-ascii?Q?ZEoExh1kpLRuRR1kI4FAYUTUeox0n5Q8qqjiF1XMtgnW338TcsGF/rqzz8/d?=
 =?us-ascii?Q?//p5L3Kof/Jss7qqFevFaspAcYJhe1uMTm7AZVpgBCYV5Psv42vzG7ceKruJ?=
 =?us-ascii?Q?F6W68JofezSnuN3cntqJjA5AXjsO93V14Fb67yCWq5npRNF6gqQUAWZJeg2A?=
 =?us-ascii?Q?TxebAh6/yc0bJkLm0nWo6zLN7xyo5aTvUUqZGB8LqNoB5Dq0yqruK4QldCJH?=
 =?us-ascii?Q?E7cs8p7SYEAuBy9oAr10nvgizAXKWeUkFlGpzR8a8ygLw8os9jQ/SFocBffm?=
 =?us-ascii?Q?CVjqPslZpfa0bbHYsLRoQTdOLdJ3Nml6gF47dBdQ5FT1Z7smc0UbB1xKLBSl?=
 =?us-ascii?Q?YyMmHSqLTrZdR+4inO4+syKT5FlsFwQG66Jg97kgT7ApTr4wSVjm9B3UTofQ?=
 =?us-ascii?Q?JNgRzvs2hm+yVmVvLKnJqjcj?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d404ee14-f3d4-4a0a-10f3-08d8e58323d8
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:47.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2xWBgsE+rrWCEFP2rOM6ATSxnXRqnS/kdHQ3TkFevJD9frhj7SLfCQ0ppUah1vgcuwvYVfBWfqUfNkRPgXB9kax+lSCgiewyQoHiEpYIPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4409
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

Add a property to allow specifying that the device XA/XB pins are used for
an external clock input rather than for a clock crystal.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index ed790a35eb83..689f8c2b0b57 100644
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


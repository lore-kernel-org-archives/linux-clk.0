Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E783BC433E9
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3C8D64F86
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCKWsI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:48:08 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:41026 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229562AbhCKWrm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:47:42 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BMLkgV009817;
        Thu, 11 Mar 2021 17:25:19 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
        by mx0c-0054df01.pphosted.com with ESMTP id 376bes9m86-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oO5DT4htzVUvA0QiwGiFi77bCQIgE/s/uZ3onkcLTbtvbW+JQcOJXf7r8bsVgsNCXutPbKwq56hmV8fcNHgsSkE8iQGQTaOaQ1/jmA3IEHs4xSAyjXvqXXNRoYVy3CdgmRbqWaOUeIivxnt21YJLyIA4iVNHI7Jt5Dt9d7IXo2156xjrTO8sVku1ZKfgnNW4Lj9bWXVCy+6fytyC8UWMI6sHysydHXLTSYWbCRFBhKKbQQdHZFULLrZafGoMrAEOsRlw4VH16o+qC/U7MJZo8z83Q5RYhQSQZPgQPv+4UkPCQ3qXefs9cUKVIWy9feBQTQCrwp6PQUDhm4hNCmomhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UVZZfuFmGSz17yssT97BuPz7Iw9bV/xAe6p7IRgE5E=;
 b=YKtJ2ucoXMU3to/wgyNFrhNawx33uipqEoJTTvKg1tkUJakZ42Q+ryjudkTwmCYT9stxE+tXmaIjw8DCJDg3uvXDMnAIN2XCRc24sTX1G5i734dXfJM1/yg0BCdYPsnzL8LgOEvCiwgzkKjZqogxvfsEacZXfHrkf6N6pfLVNdJih10I4y4NOdz/56g6DmGCcLw/pJzWSr4ClZqydfCc/4Nn4Tfg1gB8fs9k4ia3JI80TP63XfWDLsQcbQ1uuSIwWVwitqElLvsyqNjmVYsfsRTVcMIHsWvbRtwWk96Yy1nl7Tduk5IihQCmBIIXGTzljS5i9iIGp4ppa3bFqg5sUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UVZZfuFmGSz17yssT97BuPz7Iw9bV/xAe6p7IRgE5E=;
 b=KTgT0c1sWJkdo19Y6f7fq/oHXIk9CspX30O/AgnsaI/lD+W8ZqCSSPhMyiUSyoH92ZqHeXO+jSmXCiv16uo7iJHEjyID24C1KFPgY7elMb81SV9YbtlRuvutWIBbqAx326Z88PN5PXbcHu9KfEZPZuOsx+QN3Gli33AnMFvTMyI=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:18 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:18 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 7/9] clk: si5341: Add silabs,xaxb-ext-clk property
Date:   Thu, 11 Mar 2021 16:24:34 -0600
Message-Id: <20210311222436.3826800-8-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fec8b4a2-f917-4b15-ed5a-08d8e4dc8cdd
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB0960FC40765E60CAED6B7105EC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p7otFdpSou+F6a7Cm4ad72oKsxkW1K3Jzguf/kp74rK7DgWtFaqrJg797PE3zocuNU2uuwy1FWRx6yz+dyu2YWk+qiDoDTs8oQ5OgegwMW1S0c39QF8x+sbIMesPdrAdZI5lqJERYGMjPnUfFDxGnwNg9nbqMs3lEXsIj3HHqSkfsH11v0bPyXax1OhUZezJbxUYmwldK0dN7R18U/r0Mb6Ttl3XiTJxrnvi21LAKS5b+Ud+l6aXu5q21Vp4NqoEG8f8xXguCdq3QR+4ygrtaCRXzX5M5+z08GL8M2M4xLmTIYnk+UJUWGkfzddXOTazTQvTMl/2gAH7h2dL4CvxhOhP7lvuYbYYGRJ/8zYDbU2YttcRnRtGaXDFKtN7mcTieG3CaH06L0xT1VncnnBjRTDM3MaXN+mTuGSIGOEzou3aXXFW9a4V+nlFGXo9rHaX5V76ezNKN7SY/jpPdHGOga/4YZpUCj0lyXn+6YgQsdwqh+BiqFgv1YFNbHdlt4qsI08JGgratyuJdRng1mWrROiYFvJvoPcA4kZKBPaQFp5YiADU4Zg241jWzEpzSDRiLmsrHQxZpareiaXzdeZ6gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?81bC53ZtqKNKCo5y3qfz5sN9FifSMUNbB/Y6BjRSpGcuDa2U6819cRaMmGNl?=
 =?us-ascii?Q?I+9MWzZrWR9fzIgqOzuTs6YyzT9RhpN8qsHRHAj4j99Tt5wOXCwuj9ikBeK4?=
 =?us-ascii?Q?4D/Ii0DJ21CC7DLE2jVNqY1YhTaZyhNc4pmcV5y7btzgZ5Ql+whAaEfOc0oY?=
 =?us-ascii?Q?vGtmeFfYFGTizXRwa64e9CIpR+I/UdkO9vd5XxYWbjNAsPd0N/qTyYQP0zNw?=
 =?us-ascii?Q?JffNd2iWIiTtSJloacwPx+BZ2d+2g3Rn4ADLvADzSbLOmVCD0sVRhNm1b193?=
 =?us-ascii?Q?TdyvRyp1ECXhq9VK5TjP9+sMovuDPliZMsvaT5bswcUvxDiyId8Mx3SOTuFw?=
 =?us-ascii?Q?AN0mLDh852ZZuk+yxOW7CEPmXY4ZyXWoj7uyue09O1CJgzaPO7MWNrxTMJI1?=
 =?us-ascii?Q?6GIC9JhxkKrPR7RZrGPI1xn0G/e0nJCGSLHws1+hODnPQ+F7kSXALzliqWMm?=
 =?us-ascii?Q?QWHNSrFM7E/ggUwMc06UhhISmoiIsWRSNwW+ZbkYTmTWThv3qrqZlUVu0jM2?=
 =?us-ascii?Q?4SyhViEVL2V7WnbJYU4aYYH8HrmeF/4uAiqPI/fO56c871RdqTFxC/K6m2p0?=
 =?us-ascii?Q?6fglm52XJisYivUdMHSDaHIMZN/eT2kILyLKsp8Bzr1FYFPpZaW7euHR6eMk?=
 =?us-ascii?Q?topbOZsYqgWTUMDBe/deEt/XyggkcYp/SCJPaEroRb5bsSf4HBcLa0byVOwf?=
 =?us-ascii?Q?+pTqVlxQUsaMlT54g5kI6je+CV65rmd2GrDzMxih83ehFUpdykkAy1WdiuX2?=
 =?us-ascii?Q?JX0fTVMxd7c82fzvKhjG8kUZkLkRbFr0EiYyZJ9J6DhuzJ17cG+0GJsa/dxe?=
 =?us-ascii?Q?yKBjNqqMzD2iSeA1jVq+tlMh8Mw1TxlwAeDQSRPYzM/e3IPVBu52zfxHLMhk?=
 =?us-ascii?Q?y32H99b3hvv0L0HTatzkQYxSBmmFUJb+nTuGv4fdV3nSar8reFx1h1aW6db3?=
 =?us-ascii?Q?Ra16ePr2m8GT90Fu1+JEpU6ld1p5LTfPLvqA1YYpHqvY+Ih7bOgeb5aHM8Iz?=
 =?us-ascii?Q?ptwA/N/xMCZfdCkiga6YxWubUq2LEVh6Nc5gNW8zEiwO+uVbP/P43OJE5/Th?=
 =?us-ascii?Q?UkF+sVu5ivArjO6z11RIfAoYDSrk2bHhZeekw4VNIPx8r8KTSV4lB7gU7cE7?=
 =?us-ascii?Q?XKdq3X8xbqWC26fTqV8/a6lr+F7w8vCJLVAkhS4aKbj6IzbC/MmNcrJiviMt?=
 =?us-ascii?Q?Fvq5zGxkFYuBJumPF1YV4o2EJ1FxIp34hn6xpBvJPSLF8u8FIfL/pKrqfj6J?=
 =?us-ascii?Q?rq1WZb/91maBsRgsMkaifw7RKnF8NnEi1sxD+kF3643bOCCXEPGuQ/sbn/TT?=
 =?us-ascii?Q?nN/uW7wd15nMt630DO0Y9OzS?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec8b4a2-f917-4b15-ed5a-08d8e4dc8cdd
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:18.1576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdx08Zbo8Higx5D9u5NP72frdnc7uUb7WEb7qSWTy/Peao4M5l6jlwDUde+PIi8E71+Bm/P8QIpYjRA266h7mYFgw504Issk63ajoh0r/NQ=
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

Add a property to allow specifying that the device XA/XB pins are used for
an external clock input rather than for a clock crystal.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index f01a20fdf005..11740855bcde 100644
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
@@ -1560,6 +1563,8 @@ static int si5341_probe(struct i2c_client *client,
 
 		initialization_required = !err;
 	}
+	data->xaxb_ext_clk = of_property_read_bool(client->dev.of_node,
+						   "silabs,xaxb-ext-clk");
 
 	if (initialization_required) {
 		/* Populate the regmap cache in preparation for "cache only" */
-- 
2.27.0


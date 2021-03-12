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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649DFC433E6
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BFC064F77
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbhCLSR5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:17:57 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:5463 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232559AbhCLSRs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:48 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIEgPQ026793;
        Fri, 12 Mar 2021 13:17:41 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymhk0x-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5BO2WleM/xRkhsK3fwHurYSV1j0bLG4NDMwdC9VNcmyJUdU8b3z643hbFAuutCZGTy/eiQJt4vusgsGWmFHukxK/kMG1qKNcWmXvuxv3/4i5PIwWYoSljKFDC0FI7oKyz06TcH6CZ6IRmj+pxzvVoOtkoAZ6mo7DgOBoZO+2Rb+0jresNNTEQxZo04wEM6evTmLkuRPdMQRiBXBabk6Fv3mw2kO28dWtyohEgPbQySKu+WbU4PaC3TMQrpNhjDdHxWYkMF1aZ02lOd0dpMvG/5LYAITl3gmYocdjQFq8V/s12mhtw0IL/ykw+lehHJZ8Zg4Rtdv4k5Yie0X5MBd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7Zvi/oorIy4mTslUfQQatnXxwI40tGSvu8GL+ar32w=;
 b=ncKJCuhbiDAOa1fUUTNArdTi+sXE2wBR+HRMNSL/0lzfqnHNGK3v1CxQu7ABVUz3N01An6LRz+0U+TDNFsv7FxxTgGm1yfZD1nssTrQxjE1/plZlFsFGJF2IWgBWZCVDwVf9aoDuofQ31D+BTSjnkjB7RsicSBIX/EzRxQYUDCBWdUUFM7WBVNJ+fz7PAeEKbiGPgLq/YFzfWd9Q6ON5jx1ifIo+ax8gSoe+VnhChgLefwwOZTgLrFC/zvtJY3Ggx+T4mzysJ6/kw8FM9EZ8K2cLH+P1RnXusewXk4GeG27B5KdmBQ2m4vQLXfoow4LeUuvssanEuGLKlHbXzP4jjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7Zvi/oorIy4mTslUfQQatnXxwI40tGSvu8GL+ar32w=;
 b=WYno4snHcFZdIReaIZJntDEWD8CFZxpOOWL+TpsVMdOaxeAUBvVA/JKGJlsd/enzr6ZCaxbFLkm6bHMe3c+AkhE6l0nwTs2R6wLPductXedcbflWTAQmX0l/yTH7pARc22o7KoYax4ZJjVXk2VK7acVSMrN8LIZnjVmBsTqevis=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 18:17:40 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:40 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 1/9] dt-bindings: clock: clk-si5341: Add new attributes
Date:   Fri, 12 Mar 2021 12:17:02 -0600
Message-Id: <20210312181710.3998978-2-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69d56df8-7620-4aa8-133a-08d8e5831f61
X-MS-TrafficTypeDiagnostic: YT1PR01MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB443959FA44FF8DF595ACB1D7EC6F9@YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJSPWRW5wB2Xc8CD/8i7LWMyJdLfy5y7PxOXeUL30Jvi6WbpxZNljeff8kaXckXd3Ia0cnsqDtvrfaEkHtjg8et5FlfWbjzois5++jhVguvby6iB3YClecpfJyuCmIVg6DGMrftYg0tGjWJuWVJGSKH/uJ6l1kit3xPOYQUe5JHmfEm3SAO7aSshp6hGeJzKdRW86/GxfraR/qiAFwd2JIsRoj/1nmHgLSaGdqxNlDNA7bolr+kxBV0RiRf3TeNBYRR2laK0Q8RCGwJCPm5lKdOQCz3nSZr2D5O2j0uFaZUBiAZB023KXKhsJOnGMXvD+qXo03TAxJbZ8NIHLfpuY+X1toNpl67pMUMwc6bO4VfBUniBnGJ6h09kRu5vfDnxSmz9pp6E5tXEjAsp83IjnL2/WI3EH5i1YbZUlAp7jyTbTFnZ+j1ypuZklGilmNLfXi2+DSQCgtJ7U0kIpWauhRhprUF2J1698DckfHw58Av38pb4v9sfyXmdInquz8q98C6fmEYIJUOXYiXecGpBpu3dutNelQ+l18pD6QBSLnDUS2rHQiLG5RTnlgwqn0EIu5WiJKxqcLzO/awe+fYJpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(2616005)(8936002)(44832011)(8676002)(69590400012)(956004)(26005)(107886003)(16526019)(4326008)(36756003)(186003)(6486002)(2906002)(6666004)(83380400001)(86362001)(316002)(5660300002)(6506007)(478600001)(6512007)(66946007)(66556008)(66476007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WZ+AzweR6QLau9+oB/UqxJqu11s04GOrYqo0Vm1cHX2qXvOHn8UnZaQ81weQ?=
 =?us-ascii?Q?mnAJXMztyKp1xHhKJLKzN4LzE9ac2uaCU6r+WBGx6Fwyv4730YybpeS4OHEa?=
 =?us-ascii?Q?mth4mzPKqEwoyRcD1ZyBwbRQYdcED+hDHY0oimjo1Jq+Nprr8RVyEI3v1sEu?=
 =?us-ascii?Q?Oy/UlvaQtoPO43+/G1KDyGegZSSIbC7u5Wv4yRyWM3NOds+4UscGWFSDQpUL?=
 =?us-ascii?Q?+g2nyuC8p+AdiX3ZFl0owVzN0k+GY1OpGuLsu4K7lEXY+BueUbvKWTGVbtuw?=
 =?us-ascii?Q?D2UY0wjfsPTgTymeS7MYFqjt8GQSxScfEl/fChf3JZY3Cz9CFJdTqxfG+x2i?=
 =?us-ascii?Q?ysMn+s0R6Fc/ZRRxbsRtePoaUZBK+h3tjACCMIk1I/Tsz5XPWPVDfz8r73LQ?=
 =?us-ascii?Q?vECbgXIx3Vck2jpa3K+uMH/SglGF7WSnleK7gXYGD+Zk2J3nxWd9LvryH0I1?=
 =?us-ascii?Q?tssIEtkpQtc1+o2K5zsmd6fy2KoNsravGDQYgxe8t8UlfAQl+8OWTnWeEVxo?=
 =?us-ascii?Q?YldS6LRHSs3F8zFBxVgT+N/n+sID00IhC+xdmGrYSz25KtSyY9jroj0ety5m?=
 =?us-ascii?Q?z+Xjs/Y35bMbGmcVN48ENAiJGWq3+jQMKr/A/mY25LSQ4gYc+49S+pvFQ8lP?=
 =?us-ascii?Q?8TbHJj88TCR3x8+RtXapePanOa5KlISafCuwMvvCKI0ADWJDSZp2HFUk0kDD?=
 =?us-ascii?Q?qcp78ugayBetywu3NZ6IGWgVZzlnuru1Jc78sxxUJTfIbks51eSpCV2nz1DA?=
 =?us-ascii?Q?buSYDJ4rYhJZLwyt3rUfLo3yq6B3eUx5y6uMijPBy+vx33tuVGUft7+U06Y/?=
 =?us-ascii?Q?hSQ2ufHqoqv27zXpHpdzJq2juxyxcmpM0DTBh3qXVG1H5VtLyZqGyBsan9Gy?=
 =?us-ascii?Q?AC82ooPAfvChAd3plux4+/J197Tece3WqhYRSXlyasqvMQI9vuHgQRxj6C+A?=
 =?us-ascii?Q?WJt5Dz+EvoDfu3u1U7VUhn98/LmrZzbQbw668u5gwWgoUk936t6wzOqql9h+?=
 =?us-ascii?Q?ejnFV/lhRzoOcl7K5ch7Y5NMd1Re81GNtIkNmKQM52g9EbBba3JIUZi83D2p?=
 =?us-ascii?Q?Csqq26odvKnu5UOo2YEtr+p7J//vLXO8lmiNZZQJh3FUXxbR15gYhM+IIK93?=
 =?us-ascii?Q?0KMvOZ8DNVvHpSt7cbK2qsbJ8wVh5iUSwJOayqetPdrrOP9LxzEesvCDCn0B?=
 =?us-ascii?Q?GTBBhOK9DwJo78pOMbeUUafPrFXihK/X+DDzMrHDBLMEjL3DYpPY5hV/8iIz?=
 =?us-ascii?Q?gpURSqZ0gJusNsgHR7iKOkb+SxKkYg+c6Kg5RUYdP+KARxlfY9AiDTnHS8zS?=
 =?us-ascii?Q?C3H8I64G/IW6+oFlA7h2+Ms2?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d56df8-7620-4aa8-133a-08d8e5831f61
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:40.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WBqK987jsg/6Gitmm3Jb2IsTaAOzbgHaeVJ8x/1HVwY7d/RkZ8/nt3Fxf/j27a0IW82Tk+g9DEpkTpzX2Ugs0GFIiqNYnhi2cdlKqBxRfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4439
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_09:2021-03-12,2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120134
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new silabs,xaxb-ext-clk and silabs,iovdd-33 properties.

Changed vdd-supply on top-level node to optional since it is not actually
used by the driver.

Removed vdd-supply from output sub-nodes, as it was not supported by the
driver and it is not easily possible to support this in that location with
the kernel regulator infrastructure. Changed to have vddX-supply
attributes for each output on the top-level device node.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 .../devicetree/bindings/clock/silabs,si5341.txt  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5341.txt b/Documentation/devicetree/bindings/clock/silabs,si5341.txt
index 504cce3abe46..1cf7e002cb16 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5341.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si5341.txt
@@ -24,9 +24,8 @@ it.
 
 The device type, speed grade and revision are determined runtime by probing.
 
-The driver currently only supports XTAL input mode, and does not support any
-fancy input configurations. They can still be programmed into the chip and
-the driver will leave them "as is".
+The driver currently does not support any fancy input configurations. They can
+still be programmed into the chip and the driver will leave them "as is".
 
 ==I2C device node==
 
@@ -45,9 +44,9 @@ Required properties:
 	corresponding to inputs. Use a fixed clock for the "xtal" input.
 	At least one must be present.
 - clock-names: One of: "xtal", "in0", "in1", "in2"
-- vdd-supply: Regulator node for VDD
 
 Optional properties:
+- vdd-supply: Regulator node for VDD
 - vdda-supply: Regulator node for VDDA
 - vdds-supply: Regulator node for VDDS
 - silabs,pll-m-num, silabs,pll-m-den: Numerator and denominator for PLL
@@ -60,7 +59,14 @@ Optional properties:
   be initialized, and always performs the soft-reset routine. Since this will
   temporarily stop all output clocks, don't do this if the chip is generating
   the CPU clock for example.
+- silabs,xaxb-ext-clk: When present, indicates that the XA/XB pins are used
+  in EXTCLK (external reference clock) rather than XTAL (crystal) mode.
 - interrupts: Interrupt for INTRb pin.
+- silabs,iovdd-33: When present, indicates that the I2C lines are using 3.3V
+  rather than 1.8V thresholds.
+- vddX-supply (where X is an output index): Regulator node for VDD for the
+  specified output. The driver selects the output VDD_SEL setting based on this
+  voltage.
 - #address-cells: shall be set to 1.
 - #size-cells: shall be set to 0.
 
@@ -77,8 +83,6 @@ Required child node properties:
 - reg: number of clock output.
 
 Optional child node properties:
-- vdd-supply: Regulator node for VDD for this output. The driver selects default
-	values for common-mode and amplitude based on the voltage.
 - silabs,format: Output format, one of:
 	1 = differential (defaults to LVDS levels)
 	2 = low-power (defaults to HCSL levels)
-- 
2.27.0


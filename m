Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8D2C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23E93619C2
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhCYT2U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:20 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:50294 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230059AbhCYT15 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:27:57 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQvED022964;
        Thu, 25 Mar 2021 15:27:51 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xbcgr-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fj1JNnWwrL1HqB83uKx1q/t12k6mHl0K2CTBwEZloKJkJFqDmNu+HoR4z2BatwRpSEn/m5TCCPNvK1bVwTElHlIYvI0azZ5BONlk84v7X9Q1jxurUPQhmrMbYCjDfGU3Ccx+9WiWYoIgcvjYHHNTE4+vTtxyc5HvEU1rKr+Nz/dkoxK5Ac8Ef3nMFQBdI5xv3+CwJ/OyqgcVVcvOLMdrJFLh4oxphWViSjlX9XD8Xy5aQ1fW5g4Yf/RLj26rIESRYpkeWKWrcnIvqWG8ErG+JAxF8zEB2aA3q1Z9EqucWG9oUEmXg6hvOUM5UuD4vHuNoyxAry+PzbGXO9swXWL6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GN5GKt3jYrPvHnxsppf4DcSOq4WtUVEMLknRKIKhDgI=;
 b=Tp1Y7oZrDW6b+vWQaqgsSed15O43LpurFUoTcdSNv3ZLwkW0uxq6/4J4gl4up+PoPMPuXjhBWfsZQQpo4BJOLIjbEVT5O+E/AxiQEu72npRiR0PWWgMAErbCoNWS2bXrvdRS2jYe0oWJXtOMwYJboMYmR3mlo+0OI4SzEla77GVIsldq/pouuKnQeFX03YPYdYqeGKeVpQlUHP60It57lySo1eFFQ+klrxZLpewXqwJn5io6PHVqXZF8wuZGtxB/EcqO40aih6siidUR/jXCpdlfVZk0KHlO8c7+q5US7IjeQGkXlt6kOpuaaTPU0U7PYEUMyF7uY6+aKNvvjIGQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GN5GKt3jYrPvHnxsppf4DcSOq4WtUVEMLknRKIKhDgI=;
 b=5Qex4CondG1SqN27C/GiRKunPLXGJ4VYUFsli5jHq0068/XruE+iMWHw7urHSKqk8bvNnpP1IPdkiepqNJ3vjKA8r33Z8rErvZJuVwAlC6W/qVnjgLD7RiorTbeS7PsAimk8F418RJyXw07v/uHHN7w1RYz/PQ2shgrn9UffCMY=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT2PR01MB4413.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:27:49 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:49 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 1/9] dt-bindings: clock: clk-si5341: Add new attributes
Date:   Thu, 25 Mar 2021 13:26:35 -0600
Message-Id: <20210325192643.2190069-2-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9df8c666-4bca-457f-1e35-08d8efc41397
X-MS-TrafficTypeDiagnostic: YT2PR01MB4413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT2PR01MB44138E3ADBECECC9B19C3748EC629@YT2PR01MB4413.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+Oj04DJpZx0jKJD23xYto6fFB4luaB5GtqhOIe724N05/cZ3DLiuK52hC4ndTXiVEX7eookD7c4ZGdEQjKe2RRJ2N5zX12XTBYPiHJ1Jcv3mcP0o2HN4xLIGQD1jp9MUbbBfT07lA2naYAMiuE7kvshvWngOp/ABwDwnYRE2bMv9zRMCIEXpvON3uldXquZQuBWRx0dLeq7m39qp5RQVTkS//3uFF0ZIDfQAgzqXvv40cs297kccE5IATehnscvDK+QuBVMUTxJ/PnS1Hsx/ZUoLc/9iPZv5ol44P5dAZPT51b+b6CUtjrcFQ6Ylv3VO1kNn7CyWFhtoh5xtHYiONk5nBXUW7XQzznpA8YqfUhubnnn6IsJlqG/Ftfnn1TqNdJc60plJV0lYCvcSqCgEtLbN9JT3pGuAXQJUA71dV8uCv9sdEiqV1tlwxbX2x1foCPdguQHhjvCFj59saop+a3K20RxhU/E1ufppm4gZjOsjAl4EA3/2OF1kehi+R0yhDXWp71MiNZwpCmEYCa8KBYgqlXlA8k1mWDOVnBS3uoBcyuJIxMjW9RR63Tk7wSODVCa/Gj3SUdd0jaS3xStaXgS0lD5IKfRI9JdWqkkA94ts4/7lH8zSSwrSwh849Zi4Ips/AvN5h9YePAjW1/BCjlfVmTqBsb0+WG5L2PIiVl38TcTelieKnIJkwguSizD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(1076003)(44832011)(38100700001)(86362001)(6512007)(2616005)(6666004)(5660300002)(66476007)(478600001)(66946007)(2906002)(956004)(316002)(66556008)(83380400001)(6486002)(6506007)(26005)(107886003)(186003)(69590400012)(36756003)(4326008)(16526019)(52116002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/2hJVptplhwWJIIsQnCYA13hlkHG4nM10CmEGF4W9mTzcgh0342YA9Bo+G4w?=
 =?us-ascii?Q?1KGGrPpm7fGrOrFO2E3V79AtqLza+Z5QTw1OCW1RxvNZ+klU5+qAGUX37cQ6?=
 =?us-ascii?Q?sBAvS5l6IrRBWibgGTfhuZcEdDZy5yj7CG3Jz+n593auYgKwKj34diNyYJGh?=
 =?us-ascii?Q?CUmuaBh0NSzeNlLiJ26x4zMyvk6dIhhG7jAmH4+pzkLIbamydIXlFxruXKvu?=
 =?us-ascii?Q?LQBe5wt8/wJUPGjailbCwNtqaBBx0wtMeO8WbNJ7fcsDdqvdXrNHMWfr6D4I?=
 =?us-ascii?Q?y9g37VJmkLrR0AOJ/rko79UIqDryQd3SzKHKXvbJE31YqNhWxzrctEzfCgOy?=
 =?us-ascii?Q?bR1z4/DIBeOIh9ti2TsBkxRzzt6MpgsVY0Dc2p234uc7FeYXrwDUnNoK7wr2?=
 =?us-ascii?Q?nXTAyuInddsyERqwK98+O4Oqo0PUVRJS9BVRydn8pq6nhDgI0bHxHDXcLjNG?=
 =?us-ascii?Q?unUR4RH3+UqE2VuqI1ha4uhcGjcUmCioVjRvrSlTM5raBlOM5NM/F/sC2Qzv?=
 =?us-ascii?Q?s6IqnYFSSpp+fomm+hOIB0klvJ6TGzSLb6uNT3XNp1uffIqQbgN8Fbq2RYoe?=
 =?us-ascii?Q?mAhr5bvT1klT2YyRf9h5K/TpoueocqNsFBoyWkmuUWXdsIQqNj27C/7y/lcf?=
 =?us-ascii?Q?qTU9rAoOn97In7XJLV357b3Sz7b1go1hpv52/ZZQVOOqPbBuzeUu1Ad+HwDy?=
 =?us-ascii?Q?5SiQmmKDQZFZ9qNHmYfPNVEJUrU90Rke8IM5dPVGoZetmODHy3Qku8PcWW/Y?=
 =?us-ascii?Q?LPs4iiob84sBLN7XrUT9VDRuWgBUfuTpusIz9XMsdCvdwI3UEf0A5uEpNj44?=
 =?us-ascii?Q?yt38J3Fby92x30M8iz8yEdBZArecfCsqbxW78uV6diFbHYIkznpydKT0jNLp?=
 =?us-ascii?Q?zZ++1x7xmrCTW8c5/fUJJE21c6D7BY7ohR6kqIFcdFXiaAXbRw4l4xrUJ5dW?=
 =?us-ascii?Q?MMEKw4E/TheGqjg1MpNQ5AJQqqsWt520EjVrUaNxOo9quBvoNPHPgx0AhDWr?=
 =?us-ascii?Q?DwU2yp+/0foiLJ/rx9YOuVTAmpHyyHkMLjQSnOk2N6wqMekHZeuRkvBaF0l9?=
 =?us-ascii?Q?fUGCpLzakVYhSIt5BJVcGzM+oVDyVAXA76VtOU4xRnr2DhgrZCMoY5Z7BiKZ?=
 =?us-ascii?Q?q8HrYW4BScGdiZZZuj1g+7GcdIWqA8VE2bomGWy0sQwRfsW3sEUdrImGls4/?=
 =?us-ascii?Q?u6IpCA/+YXHSk7nWddELsSGc9ny0Tx6jNI8q0ezZ2aostya9bdy4EIHSGrxL?=
 =?us-ascii?Q?+xBNdznUxdDID1AI8knbqq8zazhaKglNDjHajrGy3qqs43dtQg9K5bmparFv?=
 =?us-ascii?Q?i2q4k9iyy8do3Y2fcO7uUMWy?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df8c666-4bca-457f-1e35-08d8efc41397
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:49.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I24V6tJ3ZdbwozgLFvNWnRebZINjO5rqrYJea9FHejyQUf9ci+pU+DPVfTGeWBML7wCpRravPa2BF0eMjS2hZkat+42P/4QINzTYNWk61KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4413
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

Add new silabs,xaxb-ext-clk and silabs,iovdd-33 properties.

Changed vdd-supply on top-level node to optional since it is not actually
used by the driver.

Removed vdd-supply from output sub-nodes, as it was not supported by the
driver and it is not easily possible to support this in that location with
the kernel regulator infrastructure. Changed to have vddoX-supply
attributes for each output on the top-level device node.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 .../devicetree/bindings/clock/silabs,si5341.txt  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5341.txt b/Documentation/devicetree/bindings/clock/silabs,si5341.txt
index 504cce3abe46..ce55aba0ce22 100644
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
+- vddoX-supply (where X is an output index): Regulator node for VDDO for the
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


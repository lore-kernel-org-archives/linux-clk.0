Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6E0C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9375A64F19
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCKWsI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:48:08 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:41029 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229553AbhCKWrm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:47:42 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BMLkjI009820;
        Thu, 11 Mar 2021 17:25:11 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
        by mx0c-0054df01.pphosted.com with ESMTP id 376bes9m83-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qmns7X8JutTVPnj3l8F/stBBMimyAmzNlCtdnRhZIKwViqrRwFbwmirV6hkLQF1BPzEay9ge2OKzO6chea1F1/fbkOHeU7WUBbVuVgDHBp4W/t/oWijezZb/U9WZ+WgsqSsVeD4nJbATx/PfB3+nWkqNEdOUWGifjz4UqBgic0xI6sZbwg0D6YnkfI4GBM0gjOJIF+KVdqKCe06GdNBjpQUe2TfxXDo1gPWHDKRas4Kr54ns4b9+fj4l4+eT0me8H8d/TGZqApWALhOSZrPxAANy2OtXfV4dSxVJX95RautUnFtIjSSOqQ+b+zI6irDVjC4HT0DdcDFwCmQkfiJ7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7Zvi/oorIy4mTslUfQQatnXxwI40tGSvu8GL+ar32w=;
 b=FmhqzBeUp96uSprJ7QhvRcjkWA3wyNms5TQ5ZYCXE0yFZYZsgxjGlcYFlN5viWVTkg9z0Q5hlhWtubWqr30WCvdZPAtuwUg5A7NcKhviZ2E/nzHK42b6aAbhsDUwpzj1mp8N4pj7Hft7zw8VpRnr0elwH+DhaEtZd8uYYxI8zD0VZCpKIqoLwjLxB5jXT4n68FRHQxdeazOHCRcZ2Lrjyn157stWxPlyVwxSOceEyE5zI4n+64jKBVE9DKdbL4VNen1AyGeFmqtJ9RLnePPyPSTS//dfIVxFxj75gQIAUajSQE6WqNHVQ7uHWiXjtvqtFJfuhpQN73yg5mqcx+dapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7Zvi/oorIy4mTslUfQQatnXxwI40tGSvu8GL+ar32w=;
 b=pg/io8K+hSGa99R0TrePO133+S6NJI+e/jy3A0+bu0fnpD4os3kmHjrQj8mMG84ali1Axt+ERo4TuUqlVnOrAeOJkxZRvQIJ/+n0iBRE76+R0wxL1F1nLLMI/wO0VJjcyCzcJvwSfPOSdhK3Nj5B93VYRegnvhyhkugVFRZcfdA=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:09 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:09 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 1/9] dt-bindings: clock: clk-si5341: Add new attributes
Date:   Thu, 11 Mar 2021 16:24:28 -0600
Message-Id: <20210311222436.3826800-2-robert.hancock@calian.com>
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
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db513db-31aa-4837-ee48-08d8e4dc87c1
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB09603D9A3D87FC338399FBFDEC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18eVDjpa/K3jYn7LsxjAX0rR64OpCU6DrZmQVLHcOWfyL0aX62/yWFLOMMeafcOE0x5dsFv7I1+AaWDuO1dEJzc4kPrmWEkLKop70+Cv/IqF67m+YP3p+oPlLNelDFdZ4GVZCmGbfmQWoKT/mmfQf2QuTZPDcrXRPboI3tIvGbybJvVyGiF0eAO/t0/4tmYAbtows2owcXEW/7P69NA95+K7rJ+TM7mmJCDPzuIyM9gIVdFjoVo6vwHsOHa0Zmsf+z784xXLZUGvEb62tMDeiyt2QmDp6Qorhcv/Cb5HQxYOrZMCJ66PuyHenSUPdcQDUWg+3k1boRsu9pj0oKV2/vN1EE//8KskEShRLDuNdSLhUChKu02IiTrpP+0z6EahWu4C1DrlRn7JHLqBnaPoq5I6ECNlpzDthfqEED9cMDDMC3vAEQYtDKtIujLxpFP81gE8DG1aiHfqL8oTehIQUEy02tWN95aHDGrrdkVI9m1I876aPfu2O132Ge0LaSj7a0irFNNdnywGpIgoEp251UVZ+6xQm0whBvNnsoseRiEjGtpfwo5TbaNTYyIar9+wKGCny59944I1Hj7/EH/xgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(2906002)(5660300002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oeXfiw+SCXOS1xhfAmWrcJdy+bWn1jlAEq7RAQuyGRCTm/YyNIuRfpaZfTbd?=
 =?us-ascii?Q?WZHK/BjnkoQRRIxo1PMLA/rTrJKVb6r0To0wHVrAY14+XAndPKOtAu0U8bT2?=
 =?us-ascii?Q?dUjIyN/IwcNFR8Ky+URdaCGtbjfiqBVkreIW89tRhrEDu97OciJtrsqnQXVh?=
 =?us-ascii?Q?mXZl2893VGpDUhspyi9MgAoG7aA1lVi7c9h6+p9eJxp59NjyeZxeY99t1JAT?=
 =?us-ascii?Q?ojpN/8Cfi43FqPqOFPhf45IQB00+3cpyN7fJAiRIqvRmq+11PosWZnhwv8C7?=
 =?us-ascii?Q?me5+bUq5upJMyhd7TJW/3bxUhstbnomIcDGM70fpKHd8/5YXob/4tpV65kaf?=
 =?us-ascii?Q?EdDykMgHvR6nI/gAFY4K4/bO1hwYiViZBVvuFzHs5vec1fi3arE91gapKgOm?=
 =?us-ascii?Q?qnKEo23ZjZn0oX8DaJMKeYP1P5PvPVW62WAvOFcSOxtu7CLBMW1EB6H8kwD2?=
 =?us-ascii?Q?4kTOKwp2rHyDBlWmS9Av45IHh11SUCzwMKsPGungoUaktoL4XeVJsYtBB+6A?=
 =?us-ascii?Q?BhFXG7JqvG0W4qE5qfNgwvEzN6wV/X09gYVF0Cl4XlCNsgK4wLWpYUOPm2Nw?=
 =?us-ascii?Q?egmQm6csOUOFT0SaA9qutXtGzqooqiWfH/U611I4kzxkNC9yxpwmFnXKzjhZ?=
 =?us-ascii?Q?JZEMibINdHy2d3GIhYgBTLIyrjgQ3y4r5Q5sar3wdGm8+QdtF7Eus5EThj8R?=
 =?us-ascii?Q?mJWMIUzuJBoTR7vBwZFdhWZbcghYjDwq+f7xyAIQ+E9EOe7Q1fs6KIENjVJI?=
 =?us-ascii?Q?M9n5kt8vQohzQjbdWidBkwhmD5XudZfc+0x5N0+vU5UyIfG7Dy3b9AHBaVnG?=
 =?us-ascii?Q?4QO7qXAY1J0TRUdObC2LaYDGUoYGg0MP4NELYJktu17fuLgODIFDr+ngI3Ay?=
 =?us-ascii?Q?NRNfsPM1yXAOlyHhub7vSQOuLezYDRl4z92FhfsxMj6kDowzOg3S9PXkx4Wc?=
 =?us-ascii?Q?t3P2pibKzdlZiURD56M33Tmzn73GR25LqoSwyCGK8GFp6MSxVi5jY84uoD2B?=
 =?us-ascii?Q?ymqaH982/x0BZtTPD6FPZI9i2eBox41Cvbkht/GBBaQENje0tPGYwI8Vee4q?=
 =?us-ascii?Q?3KekxSNumBqVZVg/JrGEEOMvyJlMK589kGZaTtu4RtHXR/SEPHLDiA0mFWq4?=
 =?us-ascii?Q?GgTuI3PvU+NUQPABQWG/c4maslJgEk972YEPTFM5aNJGWhykUtrex+R7s1h7?=
 =?us-ascii?Q?yplfE0EhIr7vFnzGofy+CFKEV+MRhCyykxrcOHUP3VHGnmfALiM+yEhQ7pfH?=
 =?us-ascii?Q?YRbpeRY1USN7NpfytSAofwXZ0jO9rv34spZxldCEvg85t6lZEK6VgxATdVKh?=
 =?us-ascii?Q?xp5dYtTDIxKJtvVuTqSR7wkN?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db513db-31aa-4837-ee48-08d8e4dc87c1
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:09.5956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94ZKHtv47iLuYGJRAopqBD07ZAbyuhA/6KpEnkMjrMFowI7AgkoICpkEySy0/gRQEOmXVwcxyo5+J0kISrJ+N44lm9qBGqpZHo8waiwy1JA=
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


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E00ECAAD8
	for <linux-clk@archiver.kernel.org>; Fri, 23 Sep 2022 11:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbiIWLEj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Sep 2022 07:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbiIWLET (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Sep 2022 07:04:19 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E013C122A52;
        Fri, 23 Sep 2022 04:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrqenyGe6aapdMcXLt0Vlf/eFxkYg5+4xjj8TrAvA1gqDF33R3uOshIDIi7IHkNFbzEvf16+X2SsnYrmsMV66D1MLqiGqkd+PKR1TJhfHLb/7tqDCvzP4sIefiTYxATp6VJnhgTLa2nyjD6VcHCpErImxBpVwDMli3H/Iq2banr5HVItOWwCed1k/2VWe+iq0LtRrkdLXShWMGON/+K74ciVCxa46HPft8gLFgVMq7NxZbjxSHcpfyD4nUt3JLDWqO7k4+ecCKxeX9zpvKmU3NzrNNHZiPydBRKzy7jXW2fhZNk0YoB8KYrEL7gTxweY7BXIbRwB+cOUXF9xQutfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5fwKpO2d4sF0/8A+nosQAwfmw63QSlxoTQ7xo92zIw=;
 b=laN+iiV7PW7AfmoM6sH43kWLq5EL4HMI9w7ufgvigrAbcFxmATParxY4bdNYFGxRrYlKV4AoJuLoo/9O6MTvWAmtMWoDXbeaE0K1RE0AP55qHFwTfFdM4tv1l5JCiScqX0zj7XBZn31Mi1/gODW1EIe49RgCZuxS6sKmHHLAKq5aOBaa91m+u0xDg08yYC03JgJ0qARA7o/3kZBVjH0XEm7q+8DVzkwkvHgFilMf7v9Xw77vhQJWtgvavE7fVbYzIjlzAIQQhfTWaKBfoYVHCmaNv+BiVd75QgHdN0w8segwHrGAJJcblfufmVy5m/sd/NGaJwi0MUZdArfc3azKkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5fwKpO2d4sF0/8A+nosQAwfmw63QSlxoTQ7xo92zIw=;
 b=AWNY8lu/K98yjWypVOPCoIPXkaeQS76iAfZ0YTz+NK+uBpq4EIoQa7XuMBsGfR+G98k4ptydXQ7NugaMP3z21roBmhhews0RM/+W+S50/Z8re8pC+YC92Dey3xYRr5E5zAy6fY2ntIthGWEev9r+rx4gzkavXe9Ss6bPXCOGch8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 11:04:14 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea%6]) with mapi id 15.20.5654.016; Fri, 23 Sep 2022
 11:04:14 +0000
From:   Li Jun <jun.li@nxp.com>
To:     sboyd@kernel.org, abelvesa@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH RESEND v3 3/3] arm64: dts: imx8mp: correct usb clocks
Date:   Fri, 23 Sep 2022 18:45:05 +0800
Message-Id: <1663929905-10492-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1663929905-10492-1-git-send-email-jun.li@nxp.com>
References: <1663929905-10492-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: cf181b20-ae15-437f-2f12-08da9d53599b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZPN2/Dlt9F76fa5ajhat/fBS4ZzsFbFBqWXVMzjAuHXsVNpoey9oezFZIiDHmIZBeoeOiYLR1OIbP7TN1joeG2+5mvItKnz9xfOEHl3v+ElLbmTEOJuXsGKdSc5tkQ6L+99d4+SS+4p2Jciu3t9O/LMeZZddqQCyQKsoDtOVwYdSDmu1XMRd95jCTzeyO2n22HxZ3YfMJBpfDqW5LWtVJjw6boyaWN03aQj3fns8hx8kTQV9620a4TTkznFuhn+B/Cd1dgmNXoyuasM5TUwLnKpb0IwtPPP+EPd6ySaJCUm4fxgU7gOhLms0BgeYi1bMnjGXQbMPSJs97Hfd3YRDnzQgBhig8Uyr5P+CcXDsaVEgquFXlZpIeznLYsJk/pyYMbQmEUZC2lqqn1waAYDWEfqEFKg8/fH/RoR6rLCKQnfU9LRRiH7bF6dMEWobtPbsOkAwYQ7aI7i8DvoaYG4jrCyg75DcptuQ+cPbYUKk2o/6ITcBZDBqsgvxwnkyMry2AlANdvLLKTMd3U/QBtadaQXx/+9YkndYXwH5WEnPH0y+VJrJhwMAO3x9V8LVO7K2xUJ2FoQAuw8xAjZUHdHIiQn/ns15WRYx89mLnYrWILcxrhZvxSaag6jsgdTukSml3pl5uwzvy0sCQVIsZq13cAnK2n8jc2gHtbjlQDsZRf+mtT/vVwK6unMvtXlWSEgOGRalz18h1TOfJ0GLADm2G5YhaKp2CH1OpH26eRHfVr4LN3n6bFmc3Fv6wO9q8GXNb1RTnvssWtL4Y9uyFMfI4SI1oVy5zelivHkE3OkECww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(66476007)(6506007)(52116002)(5660300002)(38350700002)(38100700002)(7416002)(41300700001)(66946007)(66556008)(6666004)(186003)(8936002)(86362001)(2616005)(8676002)(6486002)(6512007)(316002)(26005)(2906002)(478600001)(36756003)(4326008)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZicl8sX4OWOYrs3hCTUnv1D4MBPj2OYRs53Vz95lxnjb22uuY0yJIsWPgRc?=
 =?us-ascii?Q?R9neg9KSixi3MM6rhIwhXuo8Os3ZvuijQ/2Gh6qXWO6SUPNRV1vk/EQ6+Cn4?=
 =?us-ascii?Q?OBjU0/COsF/EfOBaqQQXuD6JZdsSkWeKUZN3JvTUq193LcJ0TGE9xnGJA6kA?=
 =?us-ascii?Q?kZtX+FrC6CuDgLUTQYRS0QOmrsHAK0DlLXy6hK0ipOF64IYbU9dZj7kEEf8Y?=
 =?us-ascii?Q?dk6ogvefa/N9iQa+xVXHRECLlHAL1y0JSCvMQlLtFbgxmf+lKiFaemp+EH1R?=
 =?us-ascii?Q?3tny4iSreDsIPzVh9zaAUNYNy8ySUDUIGWyuPg4rFVmrP5oEOZQmU0oGdqtj?=
 =?us-ascii?Q?jP98xGTlW3FYJDkvtIRz/7clgFoCvlpbS6JhUxG/RXCFVPNADd1QahxC0vtJ?=
 =?us-ascii?Q?TnxLz2SpTzPVY+w8ygNM9gkJB98DkfwsPAxiTDfrlJUwrEV5ju6Vd715mc2f?=
 =?us-ascii?Q?xoNsy+zng9o0+OWbwiZY7Nz6ILVOkNGP2xALPBwPS/IcAx/yMK6dEMc97d3w?=
 =?us-ascii?Q?4GmxNHWBTE4OPCigq+L0TylCnxG8Nv0wxagsvCM7VOgaEFqJCW8Bt8aD0Tsq?=
 =?us-ascii?Q?Qg8vWcIKwd9MfNE7gLoyUZcxOPwzVZYE/hmyCv/aihJP0revIA2vQhXek8bl?=
 =?us-ascii?Q?6l/0mVg5yU242rwgx3rwCxyTR1/gqXP46IcLx3SsEK69oWaQUV8rJsJ9Gm+J?=
 =?us-ascii?Q?OxKnOD0L9rvFFbCcyG8eL5KtpaXUUS+5CxdQAIsQBCzAmYi6jw60YduMzrJa?=
 =?us-ascii?Q?xsnrFZNIT9U3api3ck8uyPqNOslmOmT2I6LpPjuvvNHBM00imZs6YtZdSHVH?=
 =?us-ascii?Q?Ku6+gHo0TfDc8iAZ3VAEPzO1aSuwF7c7g1FiG3nEHWpqagkIplD3MuWcs9PX?=
 =?us-ascii?Q?LzNfuXHDWussWHQdXuZ8CZVKavpbvOelMlp7ylrzIu+SzuGRix+BnWhQ6s18?=
 =?us-ascii?Q?S7u65qxJXiDpp4RnMNHsAui9yn6Ay5/YsogxjjwINIt7R4pJO2iVektJvUOU?=
 =?us-ascii?Q?kpCN+LwccoMFgVispj9HkWDDlL9q+Ag/e5V5n0/onK7lKzg7v6ZZysKCCibg?=
 =?us-ascii?Q?bOs9h1TtByCWlhe53wLQeTw/IJfmuE0DVUNt6ARBk67YkonaXfwHAEnDVTIv?=
 =?us-ascii?Q?XNF3YZVSjTqrEe0XeorSqrfudM2v2ENSLHyM6xnHTAJ4SaWlOWI1eTmR4eML?=
 =?us-ascii?Q?V5cFNdu4uzwgl4weMcFGUYVcxwz8UcDfX7EfBpSmZMnbNWVepF4RyjuA80Bq?=
 =?us-ascii?Q?G0tonKK8QOGdfbjO2EzEIu1tfzitGzGbKBgcrlh/MEqcCm5gOM0RfOCEYlPp?=
 =?us-ascii?Q?nloqhiJHC0rvmFt0dM5pSobJ0IW2lyTKzYDSVF+9Ef8HKIjt5nG3efjQWtSl?=
 =?us-ascii?Q?gQws80XuLApGEkh3h3KmsfeIbP/ExbEq/jWTOw5PTyrfKi0pg3qI9j+2XzJz?=
 =?us-ascii?Q?r6W9IQtCaHaLAenjukCV/dpImXjbfN0NAKHkFca6B46oc+v2Hue4oWmd/ASF?=
 =?us-ascii?Q?U6e67d/fKXPInlvfJTDm4sEGZ1aD2Xf5Pbi42hbISekQ5Qyuy1OBgJUxbip4?=
 =?us-ascii?Q?NDxaEwuAD5avAmwNjEM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf181b20-ae15-437f-2f12-08da9d53599b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 11:04:13.8941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TRyUwNCE54Bex6EW7tNXhnNW/cdyjv74mwYWKcFS9mpTN5JM06lqCRDxpIDThQn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After commit cf7f3f4fa9e5 ("clk: imx8mp: fix usb_root_clk parent"),
usb_root_clk is no longer for suspend clock so update dts accordingly
to use right bus clock and suspend clock.

Fixes: fb8587a2c165 ("arm64: dtsi: imx8mp: add usb nodes")
Cc: stable@vger.kernel.org # v5.19+
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 522ab47426c3..c3dfeb4f4b15 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1169,7 +1169,7 @@ usb3_0: usb@32f10100 {
 			reg = <0x32f10100 0x8>,
 			      <0x381f0000 0x20>;
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_ROOT>;
+				 <&clk IMX8MP_CLK_USB_SUSP>;
 			clock-names = "hsio", "suspend";
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
@@ -1182,9 +1182,9 @@ usb3_0: usb@32f10100 {
 			usb_dwc3_0: usb@38100000 {
 				compatible = "snps,dwc3";
 				reg = <0x38100000 0x10000>;
-				clocks = <&clk IMX8MP_CLK_HSIO_AXI>,
+				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
 					 <&clk IMX8MP_CLK_USB_CORE_REF>,
-					 <&clk IMX8MP_CLK_USB_ROOT>;
+					 <&clk IMX8MP_CLK_USB_SUSP>;
 				clock-names = "bus_early", "ref", "suspend";
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb3_phy0>, <&usb3_phy0>;
@@ -1211,7 +1211,7 @@ usb3_1: usb@32f10108 {
 			reg = <0x32f10108 0x8>,
 			      <0x382f0000 0x20>;
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_ROOT>;
+				 <&clk IMX8MP_CLK_USB_SUSP>;
 			clock-names = "hsio", "suspend";
 			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
@@ -1224,9 +1224,9 @@ usb3_1: usb@32f10108 {
 			usb_dwc3_1: usb@38200000 {
 				compatible = "snps,dwc3";
 				reg = <0x38200000 0x10000>;
-				clocks = <&clk IMX8MP_CLK_HSIO_AXI>,
+				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
 					 <&clk IMX8MP_CLK_USB_CORE_REF>,
-					 <&clk IMX8MP_CLK_USB_ROOT>;
+					 <&clk IMX8MP_CLK_USB_SUSP>;
 				clock-names = "bus_early", "ref", "suspend";
 				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb3_phy1>, <&usb3_phy1>;
-- 
2.34.1


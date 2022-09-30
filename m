Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125EDC43219
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiI3POS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbiI3POM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:14:12 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9500C12F760;
        Fri, 30 Sep 2022 08:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbM168HP+wbt5o+umcn7bnuyr0ZUeimgbrzsHEWY/NYdH1TYMC4LMOgcqlWpbL67bl4ukRInVyJg5UYqBePFnA0flG0s6bEjCRxZ3aiiyY5Ahoi0GrCdm3cFwSmLfSlKqX8D93iizfTA7ZFTB6RTrujI/OiSqSf/bNiJvggBx1fnxUvwv0zJ/wWyQ4fQrBYeUEGy9zQyWUweaAasKHpEtVzAoANDBYArAtNdwEU21qOeEMkJMvE4OsGjgN7VPspae1Z1Go9yEOgonkx1+q8npOJMt2aYBlwsZInETTxJuqMrHj2CYCu6AW1UlvENK15a6IeaAsVcjjyBnDD987el+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5fwKpO2d4sF0/8A+nosQAwfmw63QSlxoTQ7xo92zIw=;
 b=TZ9bn6gnY3RVQ/6hw7webT/Eky1LbQLxOyqCVj44tCePN0xUXy9cdZm7UDZtpoYv7+NBU8FsXwDhaLedvJPpY747tItDfYRSCt0vm4tRHdM75I4LrrgNOQLELl8OkYHlHwYQp0UwqdB7Y1d7e/Bdtf1wiWPnK5UkKRH4SzQroDx8ytYqU8jM+extax9/mbj6XD1VlxQXzREWISBjZCsYx7a7lQFefofkaGKX4MRBOaoWGe4d5dCyFcPWhY1t04Ze14pawvpF/dNFyiLnBVhDD90WmmDzoxAR9vI+Q1h9N1rctp6hR6dAafxA+/O8ppUqG30moljKSyViKBGEWjFEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5fwKpO2d4sF0/8A+nosQAwfmw63QSlxoTQ7xo92zIw=;
 b=aaJBq6O+5AQudmfa02rXSRVP5MxTZay/MBHJN6/WSwvSptT+4pS6i5WZxUde2c+wZVQfzw7imqNlKEXe8JV9NpqdoIAPEIbJ6AhLJjHarSlivzJNAGGDmWPoM0kUY2yWqUQm59Ou/scUaQZkgvXUvciXwgolexh2Eae6z2/d+Ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AS8PR04MB8005.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:13:55 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a81a:385:308a:b85a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a81a:385:308a:b85a%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 15:13:55 +0000
From:   Li Jun <jun.li@nxp.com>
To:     sboyd@kernel.org, abelvesa@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: imx8mp: correct usb clocks
Date:   Fri, 30 Sep 2022 22:54:23 +0800
Message-Id: <1664549663-20364-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|AS8PR04MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: ce57204f-9d3c-4550-1d8f-08daa2f6640b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCNPpyvRq0gP3WeiXJts++dsLfvBRpFNvpyHBVzHgUVlq34ACmnIm0C1Wg4WcXSO7J+TqXinStItbwfxsddtdIuaui2L8Zg0J+9LwF9LZ+7ktEriNSa+K4ZdtkXgfJ6sku7lO+iXk8jEalBna30RyL8vQMPIB4ioZWtVbPu93f3ZkxOdjX54RV1Vf0vSdR/cy29wcLk7m4kvUQDs3HGrAM2Il6F8MKQ6jxV/rPamYZZx0SaobqbIdO5Xd5MHAG7hbxk204a1tdvWlghwtA/iTs7Saj8MXeWNyni1/rmcELVHs32rWw52In6U75+Ti7751s5kJTFdMz/XDYnfgD12wst3Q/sKa+G6LJ0uOWs2aO+ffHTqz/u143nX8vlq/DvEIda+WK/YWoEw05nPAUH5fGGhlahUzy6tWgMd8+pdysNE2EU7MSImQaG0nv79GOVcC8t979QTr4eU1dIiQELnMgdh+ZtY775FuE77cYnJDGzhXUUN+5G99eXb56jhsFWCWTPUvDL426f5j6XJf4Hw+xG6lTvknS6B8MifOIWqycSygcaG9ZaScOobL9dvA7gtJ/iQlS1wvh3gJmNMmVOEkt5Kp0Rdqbl5NedN2HFulY8cdiKBlqwCWKS4o3bs9/Q7PfQgufloijEfnd+W8BrL4NP9PI+icK2s97lO9gnWNIPruNws/DoebLm7LC+q7ajT6xjp2gbDLX8qFWpvUebzM1sZQV9SlgG+SU30DUha8Zs96FnGFZs6ra+Gooei1t4e5+ITZkYWPPlI8rD8eZErAzEwS413umkBlHKqc7d0fUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(6512007)(26005)(186003)(5660300002)(7416002)(2616005)(83380400001)(66946007)(66476007)(66556008)(2906002)(6486002)(316002)(6506007)(8676002)(4326008)(478600001)(86362001)(6666004)(38100700002)(36756003)(38350700002)(52116002)(8936002)(41300700001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFQzDakyvSSDdbreEMwqERZ05JMATgpbruef3lRKK8zJ8vaDSEbkn0+2zfmI?=
 =?us-ascii?Q?jLxpZKkX23SefewxURoNVEfZtU7SFFmhOp6IS0pGaF7JFZAREbK65e10HBPw?=
 =?us-ascii?Q?oh55GtB4eS4t1EtqjzWLos+tj+MFHbVzwLpTloUVFBFuZ1j0HiN8jQQGyYFT?=
 =?us-ascii?Q?5oxgRgFNc9QH9I32ewMN2nJM2GR77gYoi70wXmdhlnkyG4GXWJfjIcyGuUy/?=
 =?us-ascii?Q?P1tqDvWjNtJI4Hb8VrD+Phepn8umhT5F6zC8D76BI0fbAdwoVxMvuOEts0o3?=
 =?us-ascii?Q?8qFzn96M8KBBiIBBK/GOb2qPIDQmXEkO3wdqBN/hpjz1e7wG7+sbHkDQhIWj?=
 =?us-ascii?Q?EfO7V8YaLD+u9wfzldR8jnU/NtBuEOwe/3KKyIfty2STQ3KNPUrrKArGpDlt?=
 =?us-ascii?Q?NIxwdlxAH4EwN2B/rVzEeF+wn6edcSiBkbPbWlqMAskGwEWEuXHYdSOUbpOb?=
 =?us-ascii?Q?u6abObqUDTjzdfEFfKTuJZAR+2mh6aJQsmkAOiKZo5A8wmeBHAxrMaU5NwVV?=
 =?us-ascii?Q?M7TysnEYH3VM4VdAmA7yoLdivWeSUwhCnN6DJ3Ld1jevMLdLL1BOS4tA9ejR?=
 =?us-ascii?Q?RQt9J1EBDJNfa/PxVzTrue0F0CuqQz42kUpgrmdpe36eMF526WOeub+rNaK5?=
 =?us-ascii?Q?pfk09nXTvbmTg7J6R0MK+ZgZdxtcz/EXhLxZzJ58E5gs/OYo86n3bgtoTMIz?=
 =?us-ascii?Q?0Xf82WGeHT6su93x+0AAPqcDPwMdhP81P6+wQGso36TK6uwoWlULQAgR1zBH?=
 =?us-ascii?Q?Q6WB0zsy2GBY4Swrq72WirUYz8k67zW007CllXQ9uKgwmGh5LHbxoS5B0vND?=
 =?us-ascii?Q?/G7ZTkg43uXiQurVyoo/upwB9hbMRd+k2cfUcQkmBQkNVysoHqPA7V6GGAak?=
 =?us-ascii?Q?GslXHE1UEYUj9kUsbC7zsogRxrm7/dMzuwmSDn+cG1zNrxQ50Tta5kTrDdFW?=
 =?us-ascii?Q?vsFe2JCZCm5kN6cduBXVKRP8Y+AL4dlKXwi2FazmFdPuhw5G0gBFNuy3sEro?=
 =?us-ascii?Q?8HVll4tQvBA8DmlEPi7AKy4GCCv3phJgyD5VNrS07sTXBBZPBhnB2HH+cwIf?=
 =?us-ascii?Q?3DyHzHsFoO1Es2J4G3M4JsH8ROqtngN5AaSitFJnAH9N+O5CKXZHN7EW+MMT?=
 =?us-ascii?Q?HFK1sgjRZQBLfXHNRF4p89/f+nUXOH2e8Au2/EujoJHW5uOQ2Myng6WattQA?=
 =?us-ascii?Q?kd47+sO/pSll7H1aTWe0R9kbpX8DazfSO76qy+rW4wKgQ9fdKqc2GP4Celu/?=
 =?us-ascii?Q?sS7Xr6GGRpqWs4dMkAnw1fI2+s89+3+LuUbxRQkgloEGqO8CmLQDUulcZX14?=
 =?us-ascii?Q?GZPodkRx9o5RrWS6kv64FYSbAp2NQIZSvY42KKnfPl9v1CwxO1jAhjZKSEFA?=
 =?us-ascii?Q?vts2xg8J7TWYC3B6nxChdZpvnbLdBrzlJEfyoe2nxuFjkPbnc/rUvyvWHTjU?=
 =?us-ascii?Q?hxYiYEoTbMJEYEpL0uUTVOFJYPbfyBHiccflz/VmJ4KDT7C26w3A4ygd+yak?=
 =?us-ascii?Q?qzrU3M3VGvX2Xmn6PuGQYa3I6wsySe58W2eqwa4vnLY1EY0NJYqyR2GYQ3KC?=
 =?us-ascii?Q?GvM5X0CB5IuOeW4Db2CMcC9GOGQFuSOtCi65hvvg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce57204f-9d3c-4550-1d8f-08daa2f6640b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:13:55.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwtMZuvehlzBwTHrhbkTy9/udlQvaN1KrreicK3r/1TbQcLzhjb00K7nMCB2u3qd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8005
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


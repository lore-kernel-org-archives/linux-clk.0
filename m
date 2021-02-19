Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3C5C43217
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 16:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E143B64DFD
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 16:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhBSQDG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Feb 2021 11:03:06 -0500
Received: from inva020.nxp.com ([92.121.34.13]:36936 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhBSQCf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Feb 2021 11:02:35 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A37961A04AC;
        Fri, 19 Feb 2021 17:01:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9CE581A0461;
        Fri, 19 Feb 2021 17:01:07 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 083142042F;
        Fri, 19 Feb 2021 17:01:07 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Georgi Djakov <djakov@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Martin Kepplinger <martink@posteo.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 15/19] arm64: dts: imx8mq: Add all pl301 nodes
Date:   Fri, 19 Feb 2021 18:00:12 +0200
Message-Id: <1613750416-11901-16-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613750416-11901-1-git-send-email-abel.vesa@nxp.com>
References: <1613750416-11901-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add all the pl301s found on i.MX8MQ, according to the bus diagram.
Each pl301 has its own clock, icc id and opp table. They are probed
by the imx-bus driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 180 ++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index e30e948648e9..5f9ffa465d6c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1447,5 +1447,185 @@ ddr-pmu@3d800000 {
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		pl301_main: pl301@0 {
+			compatible = "fsl,imx8m-nic";
+			clocks = <&clk IMX8MQ_CLK_MAIN_AXI>;
+			operating-points-v2 = <&pl301_main_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_MAIN>;
+
+			pl301_main_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-133M {
+					opp-hz = /bits/ 64 <133333333>;
+				};
+				opp-333M {
+					opp-hz = /bits/ 64 <333333333>;
+				};
+			};
+		};
+
+		pl301_enet: pl301@1 {
+			compatible = "fsl,imx8m-nic";
+			clocks = <&clk IMX8MQ_CLK_ENET_AXI>;
+			operating-points-v2 = <&pl301_enet_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_ENET>;
+
+			pl301_enet_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-266M {
+					opp-hz = /bits/ 64 <266666666>;
+				};
+			};
+		};
+
+		pl301_gpu: pl301@2 {
+			compatible = "fsl,imx8m-nic";
+			clocks = <&clk IMX8MQ_CLK_GPU_AXI>;
+			operating-points-v2 = <&pl301_gpu_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_GPU>;
+
+			pl301_gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-800M {
+					opp-hz = /bits/ 64 <800000000>;
+				};
+			};
+		};
+
+		pl301_dc: pl301@3 {
+			compatible = "fsl,imx8m-nic";
+			clocks = <&clk IMX8MQ_CLK_DISP_AXI>;
+			operating-points-v2 = <&pl301_dc_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_DCSS>;
+
+			pl301_dc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-800M {
+					opp-hz = /bits/ 64 <800000000>;
+				};
+			};
+		};
+
+		/* PL301_DISPLAY (IPs other than DCSS, inside SUPERMIX) */
+		pl301_display: pl301@4 {
+			compatible = "fsl,imx8m-nic";
+			/* FIXME: don't know which clock yet */
+			clocks = <&clk IMX8MQ_CLK_DUMMY>;
+			operating-points-v2 = <&pl301_display_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_DISPLAY>;
+
+			pl301_display_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-333M {
+					opp-hz = /bits/ 64 <333333333>;
+				};
+			};
+		};
+
+		pl301_audio: pl301@5 {
+			compatible = "fsl,imx8m-nic";
+			clocks = <&clk IMX8MQ_CLK_AUDIO_AHB>;
+			operating-points-v2 = <&pl301_audio_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_AUDIO>;
+
+			pl301_audio_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-500M {
+					opp-hz = /bits/ 64 <500000000>;
+				};
+			};
+		};
+
+		pl301_video: pl301@6 {
+			compatible = "fsl,imx8m-nic";
+			clocks = <&clk IMX8MQ_CLK_VPU_BUS>;
+			operating-points-v2 = <&pl301_video_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_VIDEO>;
+
+			pl301_video_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-500M {
+					opp-hz = /bits/ 64 <500000000>;
+				};
+			};
+		};
+
+		pl301_usb: pl301@7 {
+			compatible = "fsl,imx8m-nic";
+			clocks = <&clk IMX8MQ_CLK_USB_BUS>;
+			operating-points-v2 = <&pl301_usb_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_USB>;
+
+			pl301_usb_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-128M {
+					opp-hz = /bits/ 64 <128000000>;
+				};
+				opp-500M {
+					opp-hz = /bits/ 64 <500000000>;
+				};
+			};
+		};
+
+		pl301_wakeup: pl301@8 {
+			compatible = "fsl,imx8m-nic";
+			/* FIXME: don't know which clock yet */
+			clocks = <&clk IMX8MQ_CLK_DUMMY>;
+			operating-points-v2 = <&pl301_wakeup_opp_table>;
+			#interconnect-cells = <0>;
+			fsl,icc-id = <IMX8MQ_ICN_WAKEUP>;
+
+			pl301_wakeup_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-25M {
+					opp-hz = /bits/ 64 <25000000>;
+				};
+				opp-133M {
+					opp-hz = /bits/ 64 <133333333>;
+				};
+			};
+		};
 	};
 };
-- 
2.29.2


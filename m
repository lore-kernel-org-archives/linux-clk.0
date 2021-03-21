Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FFCC433E2
	for <linux-clk@archiver.kernel.org>; Sun, 21 Mar 2021 20:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9BDF61601
	for <linux-clk@archiver.kernel.org>; Sun, 21 Mar 2021 20:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhCUUuD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Mar 2021 16:50:03 -0400
Received: from st43p00im-ztbu10073601.me.com ([17.58.63.184]:38875 "EHLO
        st43p00im-ztbu10073601.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231338AbhCUUt7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 21 Mar 2021 16:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1616359314; bh=Ve4jsESrp8OiRYiXnom06JM7XAJznVi4sZGNOiytr3g=;
        h=From:To:Subject:Date:Message-Id;
        b=i3a0U+PPK3nFCX2YB64VwBptR0ZDeHV9/psmpadWpY16pGgv2Kk67ClebRp5h9Xt/
         SbBelUXdsPr36AmJSR+ATxQMuT5AG2XjGaEkBUpsbsfxVK5NjGS+lSP9HwcAOx5MCK
         V4PqE/aBQZZKkNSmKbTu+FMgGVIQ74h8dtltIIE/H33KhYFOcmBs3e99t3wc5sRBIa
         dFsrHLM+TLNiJFmRJyHGUVJljgxY3jgPx7j1Nv/CujtWvgFXrs86JgPZK63yBVo1pS
         H/iQWMJrz8MnyZiL6qzX0AS7hOXXKWMCaymicvem9qnqLylsMA+eJc4NaiQRwjgK2G
         IHmHH6m2W2kdw==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-ztbu10073601.me.com (Postfix) with ESMTPSA id A9FA98202F7;
        Sun, 21 Mar 2021 20:41:51 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [PATCH 09/16] ARM: dts: sti: update flexgen compatible within stih407-clock
Date:   Sun, 21 Mar 2021 21:40:31 +0100
Message-Id: <20210321204038.14417-10-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210321204038.14417-1-avolmat@me.com>
References: <20210321204038.14417-1-avolmat@me.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-21_05:2021-03-19,2021-03-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=689 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2103210166
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

With the introduction of new flexgen compatible within the clk-flexgen
driver, remove the clock-output-names entry from the flexgen nodes
and set the new proper compatible corresponding.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/stih407-clock.dtsi | 85 ++--------------------------
 1 file changed, 6 insertions(+), 79 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index 1ab40db7c91a..ecd568777e5f 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -83,15 +83,12 @@
 			};
 
 			clk_s_a0_flexgen: clk-s-a0-flexgen {
-				compatible = "st,flexgen";
+				compatible = "st,flexgen", "st,flexgen-stih407-a0";
 
 				#clock-cells = <1>;
 
 				clocks = <&clk_s_a0_pll 0>,
 					 <&clk_sysin>;
-
-				clock-output-names = "clk-ic-lmi0";
-				clock-critical = <CLK_IC_LMI0>;
 			};
 		};
 
@@ -134,7 +131,7 @@
 
 			clk_s_c0_flexgen: clk-s-c0-flexgen {
 				#clock-cells = <1>;
-				compatible = "st,flexgen";
+				compatible = "st,flexgen", "st,flexgen-stih407-c0";
 
 				clocks = <&clk_s_c0_pll0 0>,
 					 <&clk_s_c0_pll1 0>,
@@ -144,45 +141,6 @@
 					 <&clk_s_c0_quadfs 3>,
 					 <&clk_sysin>;
 
-				clock-output-names = "clk-icn-gpu",
-						     "clk-fdma",
-						     "clk-nand",
-						     "clk-hva",
-						     "clk-proc-stfe",
-						     "clk-proc-tp",
-						     "clk-rx-icn-dmu",
-						     "clk-rx-icn-hva",
-						     "clk-icn-cpu",
-						     "clk-tx-icn-dmu",
-						     "clk-mmc-0",
-						     "clk-mmc-1",
-						     "clk-jpegdec",
-						     "clk-ext2fa9",
-						     "clk-ic-bdisp-0",
-						     "clk-ic-bdisp-1",
-						     "clk-pp-dmu",
-						     "clk-vid-dmu",
-						     "clk-dss-lpc",
-						     "clk-st231-aud-0",
-						     "clk-st231-gp-1",
-						     "clk-st231-dmu",
-						     "clk-icn-lmi",
-						     "clk-tx-icn-disp-1",
-						     "clk-icn-sbc",
-						     "clk-stfe-frc2",
-						     "clk-eth-phy",
-						     "clk-eth-ref-phyclk",
-						     "clk-flash-promip",
-						     "clk-main-disp",
-						     "clk-aux-disp",
-						     "clk-compo-dvp";
-				clock-critical = <CLK_PROC_STFE>,
-						 <CLK_ICN_CPU>,
-						 <CLK_TX_ICN_DMU>,
-						 <CLK_EXT2F_A9>,
-						 <CLK_ICN_LMI>,
-						 <CLK_ICN_SBC>;
-
 				/*
 				 * ARM Peripheral clock for timers
 				 */
@@ -219,18 +177,13 @@
 
 			clk_s_d0_flexgen: clk-s-d0-flexgen {
 				#clock-cells = <1>;
-				compatible = "st,flexgen-audio", "st,flexgen";
+				compatible = "st,flexgen", "st,flexgen-stih407-d0";
 
 				clocks = <&clk_s_d0_quadfs 0>,
 					 <&clk_s_d0_quadfs 1>,
 					 <&clk_s_d0_quadfs 2>,
 					 <&clk_s_d0_quadfs 3>,
 					 <&clk_sysin>;
-
-				clock-output-names = "clk-pcm-0",
-						     "clk-pcm-1",
-						     "clk-pcm-2",
-						     "clk-spdiff";
 			};
 		};
 
@@ -253,7 +206,7 @@
 
 			clk_s_d2_flexgen: clk-s-d2-flexgen {
 				#clock-cells = <1>;
-				compatible = "st,flexgen-video", "st,flexgen";
+				compatible = "st,flexgen", "st,flexgen-stih407-d2";
 
 				clocks = <&clk_s_d2_quadfs 0>,
 					 <&clk_s_d2_quadfs 1>,
@@ -262,24 +215,7 @@
 					 <&clk_sysin>,
 					 <&clk_sysin>,
 					 <&clk_tmdsout_hdmi>;
-
-				clock-output-names = "clk-pix-main-disp",
-						     "clk-pix-pip",
-						     "clk-pix-gdp1",
-						     "clk-pix-gdp2",
-						     "clk-pix-gdp3",
-						     "clk-pix-gdp4",
-						     "clk-pix-aux-disp",
-						     "clk-denc",
-						     "clk-pix-hddac",
-						     "clk-hddac",
-						     "clk-sddac",
-						     "clk-pix-dvo",
-						     "clk-dvo",
-						     "clk-pix-hdmi",
-						     "clk-tmds-hdmi",
-						     "clk-ref-hdmiphy";
-						     };
+			};
 		};
 
 		clk_s_d3_quadfs: clk-s-d3-quadfs@9107000 {
@@ -301,22 +237,13 @@
 
 			clk_s_d3_flexgen: clk-s-d3-flexgen {
 				#clock-cells = <1>;
-				compatible = "st,flexgen";
+				compatible = "st,flexgen", "st,flexgen-stih407-d3";
 
 				clocks = <&clk_s_d3_quadfs 0>,
 					 <&clk_s_d3_quadfs 1>,
 					 <&clk_s_d3_quadfs 2>,
 					 <&clk_s_d3_quadfs 3>,
 					 <&clk_sysin>;
-
-				clock-output-names = "clk-stfe-frc1",
-						     "clk-tsout-0",
-						     "clk-tsout-1",
-						     "clk-mchi",
-						     "clk-vsens-compo",
-						     "clk-frc1-remote",
-						     "clk-lpc-0",
-						     "clk-lpc-1";
 			};
 		};
 	};
-- 
2.17.1


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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3239BC433C1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 07:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFDD361A1F
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 07:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhCYHwa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 03:52:30 -0400
Received: from st43p00im-zteg10071901.me.com ([17.58.63.169]:52834 "EHLO
        st43p00im-zteg10071901.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230095AbhCYHv7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 03:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1616658716; bh=Ge/uIA5hLdNP9ltZO4wkWhRW01e4mo9aC5X6GiyNNoM=;
        h=From:To:Subject:Date:Message-Id;
        b=xaXQFWh0Y83hNWAp2kzvmQf4L2bNHqzTzo4ElSvJ33fOFt86nOWHv4vwVgMi57vkx
         I7sHgMluSysgeSv5BN2AOFqn6+DzwNt9yxp6Lu50U2QHtdKE7RtKtzy5wkusQhRBk2
         Sj7jxwRuqYMUxe4E4DeiJr/s1++/gyBTfuFHcblK419uxrcLBcSLEaUPyDqvB0qj0Y
         nZvaSjE453E8eNpTLkc5wk8D/yWPb9bE+INWyhP975iGdZG/vxIL5p5xjwzL3KSbzr
         ekcX65WebUnBKWofAQPT7oLVe0NoF7axkWkqSs4POFH4fV7n/DjydDRLs3gEcfA5iZ
         /085ZDWETDhJQ==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-zteg10071901.me.com (Postfix) with ESMTPSA id 38CB6D80F47;
        Thu, 25 Mar 2021 07:51:55 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [PATCH v2 11/16] ARM: dts: sti: update clkgen-pll entries in stih407-clock
Date:   Thu, 25 Mar 2021 08:50:13 +0100
Message-Id: <20210325075018.6598-12-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325075018.6598-1-avolmat@me.com>
References: <20210325075018.6598-1-avolmat@me.com>
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.369,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-03-25=5F01:2021-03-24=5F01,2021-03-25=5F01,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250059
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clkgen-pll driver now embed the clock names (assuming the
right compatible is used). Remove all clock-output-names property
and update when necessary the compatible.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/stih407-clock.dtsi | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index ecd568777e5f..2603226a6ca8 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -36,8 +36,6 @@
 				compatible = "st,stih407-clkgen-plla9";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clockgen-a9-pll-odf";
 			};
 		};
 
@@ -74,12 +72,9 @@
 
 			clk_s_a0_pll: clk-s-a0-pll {
 				#clock-cells = <1>;
-				compatible = "st,clkgen-pll0";
+				compatible = "st,clkgen-pll0-a0";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clk-s-a0-pll-ofd-0";
-				clock-critical = <0>; /* clk-s-a0-pll-ofd-0 */
 			};
 
 			clk_s_a0_flexgen: clk-s-a0-flexgen {
@@ -112,21 +107,16 @@
 
 			clk_s_c0_pll0: clk-s-c0-pll0 {
 				#clock-cells = <1>;
-				compatible = "st,clkgen-pll0";
+				compatible = "st,clkgen-pll0-c0";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clk-s-c0-pll0-odf-0";
-				clock-critical = <0>; /* clk-s-c0-pll0-odf-0 */
 			};
 
 			clk_s_c0_pll1: clk-s-c0-pll1 {
 				#clock-cells = <1>;
-				compatible = "st,clkgen-pll1";
+				compatible = "st,clkgen-pll1-c0";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clk-s-c0-pll1-odf-0";
 			};
 
 			clk_s_c0_flexgen: clk-s-c0-flexgen {
-- 
2.17.1


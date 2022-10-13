Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2548FC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiJMNTO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiJMNTN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:19:13 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B074E190;
        Thu, 13 Oct 2022 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667145; x=1697203145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3oHLugWLky0csD+inQW1HPD0hUDCdDKmAGzQ9GFoOY=;
  b=T+9S+Xv9PeciUadYC11eMcnN97eWkuAKIYSIRhYaEmzczAt5eKNQNp2d
   gwz534HtFD3C5PVom9cin7HxwopiIgxQ9m2FWBp5WOUwVJTmRvdB2rMb4
   WL8jc0F8m3PAGeu3szDLsFiahUvldnXaCtwyjl7W1R2Tzgpxh4dfdXj1o
   4BiGVpdOvtb487GtsQsBfaF10Lrp3KnWxb1cEPbEvTUyjaHwaifiXhL8K
   vNKQQQcBAp9Pr39Viu9qB2hTqBBSF5attK7YhimaAVBZMHzUAGUSO1u+I
   Fk61FAfoi6ZCOlW56LqWbEWiGJ91WAmf1ezuRO7WC2/eRnrrzMaJNe22v
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736847"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2022 15:19:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 13 Oct 2022 15:19:02 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 13 Oct 2022 15:19:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667142; x=1697203142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3oHLugWLky0csD+inQW1HPD0hUDCdDKmAGzQ9GFoOY=;
  b=mxPKZjGxVzFAMHIkc0anQdf4mWkEWBe44TF7lIqvSL7jvp+fRSuhb8TV
   7S1EBl4/wd1J3I7oWShD1nYH7zbCeQNuug0SufOD8k/dqCV5Fl6Zd5fbz
   dcmsTg+YBQEu+RmgQMLTLbX14MjHARKxfqyBoaIFwMK73M7gUp5jrqR0l
   Zgzfm/3qdiPDRwisAIa1DCTC3iOGuS7YXQGt9jkAUNyll3P1rGL20o0x3
   3lP/RUMWfIlvdOhYB2ZLrjv7PVHEIcUa7/atQDo1JTOzG68LQOuwc6zbf
   L9CiUKKWFRSmUkgTynKxtmElBgSroyPdVeR7lAFCgB+G4jFErMSDpbsci
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736846"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2022 15:19:02 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7544A280056;
        Thu, 13 Oct 2022 15:19:02 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] ARM: dts: imx6qdl: add clocks to clock controller node
Date:   Thu, 13 Oct 2022 15:18:35 +0200
Message-Id: <20221013131839.1365394-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
References: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing anaclk clocks and needed labels for the existing clocks.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 1a4b299815ca..e357ee2df779 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -54,23 +54,35 @@ aliases {
 	};
 
 	clocks {
-		ckil {
+		ckil: ckil {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
 		};
 
-		ckih1 {
+		ckih1: ckih1 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <0>;
 		};
 
-		osc {
+		osc: osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <24000000>;
 		};
+
+		anaclk1: anaclk1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+
+		anaclk2: anaclk2 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
 	};
 
 	ldb: ldb {
@@ -686,6 +698,10 @@ clks: clock-controller@20c4000 {
 				interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 88 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&osc>, <&ckil>, <&ckih1>,
+					 <&anaclk1>, <&anaclk2>;
+				clock-names = "osc", "ckil", "ckih1",
+				              "anaclk1", "anaclk2";
 			};
 
 			anatop: anatop@20c8000 {
-- 
2.25.1


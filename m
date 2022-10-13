Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1205CC4321E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiJMNTT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJMNTS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:19:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150C04E1A5;
        Thu, 13 Oct 2022 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667150; x=1697203150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DjCc8SJrGVWpiGwVXlXdMk13NbJ0gVyRaa4NngcEEjM=;
  b=UzcscVa5F4le8+PjU1aEI+AkGqGvfz0NCtPCfL3++zWN8SWDCqboCOsj
   vL1qxdLG4KZuFN1K5afd3IGelCAHhvfjgh/f1jSrPeu7jVB9z2r1eYSf0
   EVSRJpqz2z1lpviDY6XRTR7vc/tg8Ll7MxvRc0/Vlp9NlvETwWJ81EPe6
   W9Hu9D7dfkiyAGiJm9eytF33LTSYkeYx99f38Pdn+SIAqxjvN1e6/fnUd
   Y2VpkRCG5RUSl8RJoDVXUiek1N9jaSkkjMKf/+8fF0lxwEbWFjr9wi+B1
   wDGGj6fiW6sLT9dvXxeAkMjPICPgo21VhOBP0bOQgL8iSrU32+Ks8uQNz
   w==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736851"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2022 15:19:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 13 Oct 2022 15:19:03 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 13 Oct 2022 15:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667143; x=1697203143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DjCc8SJrGVWpiGwVXlXdMk13NbJ0gVyRaa4NngcEEjM=;
  b=dinCcrBkmhzm3wY3dxtU9DRQiC2JhJ49vEuoDcEtvvaGJZIc6I9rcqKQ
   7yEiBjn4xdQKjHf8tLZC1sL0cBwufhrWJHzLnx9LtOnjxrghM+YsPV7bI
   xRSHv5KE0aV+LVgI2hIrVwYNDqDoA3aJFpEmAjhIZcBYlJbV0rPbTgiNY
   w9rIDeuyQh/ZAgfszTP/9uBT21xgYfctitmM9j5ch5UeQ4OLU3B3cNhrN
   rhu3WnAQsuogVFrXMAAs332WL0zrr/FWSWY6Z0r8Biiio/CNjOPWSRIYu
   83CXOU6yKx3BwPhtbT/sArgpX5TuRfjfLEZ47y7fK2DjZOlmyFxakyl2E
   g==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736850"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2022 15:19:03 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1B3BE280056;
        Thu, 13 Oct 2022 15:19:03 +0200 (CEST)
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
Subject: [PATCH 3/5] ARM: dts: imx6qdl: add missing ipp_di clocks to clock controller node
Date:   Thu, 13 Oct 2022 15:18:37 +0200
Message-Id: <20221013131839.1365394-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
References: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These are external input clocks and a rate must be provided explicitly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e357ee2df779..def4e4e4b29e 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -83,6 +83,20 @@ anaclk2: anaclk2 {
 			#clock-cells = <0>;
 			clock-frequency = <0>;
 		};
+
+		ipp_di0: ipp-di0 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+			clock-output-names = "ipp_di0";
+		};
+
+		ipp_di1: ipp-di1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+			clock-output-names = "ipp_di1";
+		};
 	};
 
 	ldb: ldb {
@@ -699,9 +713,11 @@ clks: clock-controller@20c4000 {
 					     <0 88 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc>, <&ckil>, <&ckih1>,
-					 <&anaclk1>, <&anaclk2>;
+					 <&anaclk1>, <&anaclk2>,
+					 <&ipp_di0>, <&ipp_di1>;
 				clock-names = "osc", "ckil", "ckih1",
-				              "anaclk1", "anaclk2";
+				              "anaclk1", "anaclk2",
+					      "ipp_di0", "ipp_di1";
 			};
 
 			anatop: anatop@20c8000 {
-- 
2.25.1


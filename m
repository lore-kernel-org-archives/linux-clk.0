Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B30CCA47A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236030AbiFSQu3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 12:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236199AbiFSQu1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 12:50:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FBAD121
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:25 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id m16-20020a7bca50000000b0039c8a224c95so4621445wml.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HNXopq52OdPOW8hnENMbdffTvgekfwjZqRQxiWITItA=;
        b=UXseDhSOx0rUAEvMqPdKjoNX6iw9kl3ksS1KhacDVTvFn9tN8JSbBObzwz8gdyDzQg
         uQJkGfWZksWFLd0JITNB4k8Lp+jk+Tb4Jco9WbPkapDV40a/UXo94H0yAwxGoAu8j4Vg
         KwVUHLnxGxGypw8UpX7J2FHUCRkPpv7drdKjkZfhGI/gTAirqZbp2sUhgpyPIL9pmLIj
         qlkBRg4NNpCccrXRS+RduITB9GoWEe29/VUCSe5YbbNnsbABBPX8VNSs+PUJET+TxzYp
         HnkLC3Qc4N0cRB7whR+tm0GM/2NItv0jxMP8CQW86kPt2rl2M6rnavs5s0wUyftzUI9k
         +Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HNXopq52OdPOW8hnENMbdffTvgekfwjZqRQxiWITItA=;
        b=mENHiyLhYjfGU2hX/nFZ+GHRCDT7ksB4+96ka1cdvuohvDZBW2UkDJATXBSItc/nFs
         H6ZB9smHzo0OoBfnmHHMgjm3VArrn6hzOGj6LWIdWTqN0TQNR6E7Mn8u8lz/JFIidLAH
         YGR+5dBL69L0KuQZjvgAyfSO5Tspy5ANpig1sb6w2Dqae0w4tWAugHgkaoAi7OgYtmPW
         3UAFw7FUwqhQj5Ef/Gdy6qGy7GpL4Y3w8WCs1HNlhH9psb2HWwmTCTcCofS1ztpTl3Ha
         K49OMJYTpD9oA4FQPf4RXhv5nuV0ksQn39x2XxUUz1sg5iP1iO3no9nBkRvRePt8JEA1
         HbHg==
X-Gm-Message-State: AOAM530ry0e6pLmHljsd95kbN/LixZZ9StSfF8+Ow3PceDVFkYR5zVPu
        qyFAcIWyetONvEN2kDSkYs420g==
X-Google-Smtp-Source: ABdhPJxL+7m5XLx2s4xgfyyeKIsKdf3d5gNOY2UtvWLXs/QJRThfo178XdMRDOR1NdK/T7YB6xi5OQ==
X-Received: by 2002:a1c:4682:0:b0:39c:4459:6a84 with SMTP id t124-20020a1c4682000000b0039c44596a84mr30464743wma.167.1655657424029;
        Sun, 19 Jun 2022 09:50:24 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:23 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daire McNamara <daire.mcnamara@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC 6/6] riscv: dts: microchip: add mpfs specific macb reset support
Date:   Sun, 19 Jun 2022 17:49:36 +0100
Message-Id: <20220619164935.1492823-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

The macb on PolarFire SoC has reset support which the generic compatible
does not use. Add the newly introduced MPFS specific compatible as the
primary compatible to avail of this support & wire up the reset to the
clock controllers devicetree entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 8c3259134194..5a33cbf9467a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -197,6 +197,7 @@ clkcfg: clkcfg@20002000 {
 			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
 			clocks = <&refclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		mmuart0: serial@20000000 {
@@ -331,7 +332,7 @@ i2c1: i2c@2010b000 {
 		};
 
 		mac0: ethernet@20110000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -340,11 +341,12 @@ mac0: ethernet@20110000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC0>;
 			status = "disabled";
 		};
 
 		mac1: ethernet@20112000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -353,6 +355,7 @@ mac1: ethernet@20112000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC1>;
 			status = "disabled";
 		};
 
-- 
2.36.1


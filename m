Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB79C43444
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 03:34:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E2CE2085A
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 03:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHUtGV6B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfAODeV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jan 2019 22:34:21 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32827 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbfAODeP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Jan 2019 22:34:15 -0500
Received: by mail-pl1-f195.google.com with SMTP id z23so631398plo.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Jan 2019 19:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzEw+0c7YCMrIJx0PSwB5TjdR5ksSYaunb0Z3JfV66A=;
        b=HHUtGV6Bj0Zj+6v3TzOmsCTcz3nUIF8RYPXUoENgTw83quUwGId8YxiD/vXr4KDxru
         7cwVtubU9A24OMrCre37l5/BsWqQt/E+iOga54NjfzCK957vp8nDoTOdF3fck1pSqqu8
         tUrzUrT+5yNofk77YiSO/OFIh/QyUHAbQJeP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzEw+0c7YCMrIJx0PSwB5TjdR5ksSYaunb0Z3JfV66A=;
        b=XdwHOuc+qZnO2ngw8Cg//jmAC6Eui+JZEc0OygqvziGUdlhfLCEzO1w69j2cb/cQJG
         oIt1+5JKHwSasgE8J09GHXIKG4WD7SOhEDgmlytBn0HiPtlN3U8xwdDURuRAf7wDg+BS
         YeyWzwM0yr2CJ6Smsm/ezN8CZHqrgEg/VPfkW3fBUpXaXScBUOnxWmAC5r+HEtuHqThz
         Jra1GWRAxJNSZsYAJTeqbKsSt1+XfLUYWccjvKj5v5UDwaDp1CpLTaDUsRaJAIOmE2jL
         PmmUnDdgzWie9Cwafjx97skFu7wCKcf6EUwUfxc7eHI9+KonVZwVU/Ai3StYSJzZ6eaY
         v3kw==
X-Gm-Message-State: AJcUukeXZoVCJJb2WvMbudgIabet+nq8pWfsZyMccoCEpNwQgzNs8EDB
        6uvqy2Mb47WF6feuhv9Ap/gX
X-Google-Smtp-Source: ALg8bN5g5uMXPav02wZj17J108BuRNg5LAOSwAxAHeknYgo8mPBgYSnHviqmY5Fna7SYMv0PBLm2rw==
X-Received: by 2002:a17:902:2868:: with SMTP id e95mr1891450plb.317.1547523254819;
        Mon, 14 Jan 2019 19:34:14 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6084:4813:7cd6:42d1:f14c:3e90])
        by smtp.gmail.com with ESMTPSA id s9sm2137023pgl.88.2019.01.14.19.34.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jan 2019 19:34:14 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH v2 3/6] ARM: dts: Add CMU support for Actions Semi Owl S500 SoC
Date:   Tue, 15 Jan 2019 09:03:37 +0530
Message-Id: <20190115033340.25016-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add Clock Management Unit (CMU) support for Actions Semi Owl family
S500 SoC.

Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
[Mani: Fixed commit message and DTS]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/owl-s500.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/owl-s500.dtsi b/arch/arm/boot/dts/owl-s500.dtsi
index 5ceb6cc4451d..aa758538de8c 100644
--- a/arch/arm/boot/dts/owl-s500.dtsi
+++ b/arch/arm/boot/dts/owl-s500.dtsi
@@ -3,8 +3,10 @@
  * Actions Semi S500 SoC
  *
  * Copyright (c) 2016-2017 Andreas Färber
+ * Copyright (c) 2018 Edgar Bernardi Righi
  */
 
+#include <dt-bindings/clock/actions,s500-cmu.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/owl-s500-powergate.h>
 
@@ -70,6 +72,12 @@
 		#clock-cells = <0>;
 	};
 
+	losc: losc {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -124,6 +132,7 @@
 			compatible = "actions,s500-uart", "actions,owl-uart";
 			reg = <0xb0120000 0x2000>;
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_UART0>;
 			status = "disabled";
 		};
 
@@ -131,6 +140,7 @@
 			compatible = "actions,s500-uart", "actions,owl-uart";
 			reg = <0xb0122000 0x2000>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_UART1>;
 			status = "disabled";
 		};
 
@@ -138,6 +148,7 @@
 			compatible = "actions,s500-uart", "actions,owl-uart";
 			reg = <0xb0124000 0x2000>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_UART2>;
 			status = "disabled";
 		};
 
@@ -145,6 +156,7 @@
 			compatible = "actions,s500-uart", "actions,owl-uart";
 			reg = <0xb0126000 0x2000>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_UART3>;
 			status = "disabled";
 		};
 
@@ -152,6 +164,7 @@
 			compatible = "actions,s500-uart", "actions,owl-uart";
 			reg = <0xb0128000 0x2000>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_UART4>;
 			status = "disabled";
 		};
 
@@ -159,6 +172,7 @@
 			compatible = "actions,s500-uart", "actions,owl-uart";
 			reg = <0xb012a000 0x2000>;
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_UART5>;
 			status = "disabled";
 		};
 
@@ -166,9 +180,17 @@
 			compatible = "actions,s500-uart", "actions,owl-uart";
 			reg = <0xb012c000 0x2000>;
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_UART6>;
 			status = "disabled";
 		};
 
+		cmu: clock-controller@b0160000 {
+			compatible = "actions,s500-cmu";
+			reg = <0xb0160000 0x8000>;
+			clocks = <&hosc>, <&losc>;
+			#clock-cells = <1>;
+		};
+
 		timer: timer@b0168000 {
 			compatible = "actions,s500-timer";
 			reg = <0xb0168000 0x8000>;
-- 
2.17.1


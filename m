Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99448C49ED7
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 15:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D1D82186A
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 15:46:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5uuo8d0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389415AbfIPPqe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 11:46:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44785 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389380AbfIPPqd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 11:46:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id k1so49882pls.11
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GdUGLfzA/moIy9fqv00a3/N33TZrVkt63TobdJZyyCw=;
        b=f5uuo8d0Eac1oehzzno+gz4SgKXXXELEQr8OOsFMTlLzjQHG1qP3ca5oK34hNBEw5H
         7icQx4hOYnguI4btVP/2f+R/WtV0vnb/qG0VhwifaUbNDTDOszAGraQSRNkHaZQhVLkN
         P7XHlajOs6MINTQpKI09MvV5s3l492Tsfp/9zd+XiRpjEQUhw4/8lM7+dVRBzVybGgxi
         7j4qqkaQD1tL4tYSRER7C1iQoGhv1iAJNwaUlPwmGN9FUBtlzQ5j/5Ghc3kACrw/OOWX
         ASIo3Dta1rCyZrbDZCbcJ+CKCPa8VDN0zoQLut0m5YjxyW9Sur67vJOuLXTPbAwCEoPN
         +h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GdUGLfzA/moIy9fqv00a3/N33TZrVkt63TobdJZyyCw=;
        b=UL7wlbY8tskXnVYoRm2/09jMqyW86QNmXxR5BdtLwdIHf4GI4uRpt04dysX9NbwGfg
         Pd1bUubAnVLfyQViuiLIm9OFLOrvURq1jnneyD7L9SQvTospnK3e4UHObXwKrvcNL5V3
         VGO+bdEm9fOvILXCgImb+/reECEwARY8gI3ux49euqaa6LpfchJ0PfuDiBphzQOZ//yb
         sfGHLS/8zh+Pop2VwRP+xhXywrl49Y1EeeqyvxMhGvA8fCGBwDfoMiDXf2iBl/4FNddz
         g5EcOyvKj3A5Gz+eDXJ8dJp8GDF4/udonF/ecfLvzfWh29H89XUgrOMtTtJEHqJA5sA+
         ZKAw==
X-Gm-Message-State: APjAAAVLfRlqW8qHPO+SpW8+k2a+i2RtgJqmXNoVu6Nbd0W7O8Y4Xasi
        aMo1P9mdwSsdniepuU6wAbcb
X-Google-Smtp-Source: APXvYqxQVpA35IOqLq2Hr/utbWBDftkp4RcZap5GW+4N216N28cBd/8WPcwz6xFyhBbjCuGfLkMAmw==
X-Received: by 2002:a17:902:7401:: with SMTP id g1mr500851pll.20.1568648793095;
        Mon, 16 Sep 2019 08:46:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id s5sm36227670pfe.52.2019.09.16.08.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:46:32 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 3/7] arm64: dts: actions: Add MMC controller support for S900
Date:   Mon, 16 Sep 2019 21:15:42 +0530
Message-Id: <20190916154546.24982-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
References: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MMC controller support for Actions Semi S900 SoC. There are 4 MMC
controllers in this SoC which can be used for accessing SD/MMC/SDIO cards.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/actions/s900.dtsi | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
index df3a68a3ac97..eb35cf78ab73 100644
--- a/arch/arm64/boot/dts/actions/s900.dtsi
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/actions,s900-cmu.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/actions,s900-reset.h>
 
@@ -284,5 +285,49 @@
 			dma-requests = <46>;
 			clocks = <&cmu CLK_DMAC>;
 		};
+
+		mmc0: mmc@e0330000 {
+			compatible = "actions,owl-mmc";
+			reg = <0x0 0xe0330000 0x0 0x4000>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_SD0>;
+			resets = <&cmu RESET_SD0>;
+			dmas = <&dma 2>;
+			dma-names = "mmc";
+			status = "disabled";
+		};
+
+		mmc1: mmc@e0334000 {
+			compatible = "actions,owl-mmc";
+			reg = <0x0 0xe0334000 0x0 0x4000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_SD1>;
+			resets = <&cmu RESET_SD1>;
+			dmas = <&dma 3>;
+			dma-names = "mmc";
+			status = "disabled";
+		};
+
+		mmc2: mmc@e0338000 {
+			compatible = "actions,owl-mmc";
+			reg = <0x0 0xe0338000 0x0 0x4000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_SD2>;
+			resets = <&cmu RESET_SD2>;
+			dmas = <&dma 4>;
+			dma-names = "mmc";
+			status = "disabled";
+		};
+
+		mmc3: mmc@e033c000 {
+			compatible = "actions,owl-mmc";
+			reg = <0x0 0xe033c000 0x0 0x4000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_SD3>;
+			resets = <&cmu RESET_SD3>;
+			dmas = <&dma 46>;
+			dma-names = "mmc";
+			status = "disabled";
+		};
 	};
 };
-- 
2.17.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D6EC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jan 2022 09:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353084AbiASJ2x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jan 2022 04:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353090AbiASJ2u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jan 2022 04:28:50 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0BBC06173E
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 01:28:49 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i17so1997285pfk.11
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 01:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AEMYWaSEel8Cp4M82ZW85fUPHW8FXC9jvw93/++Wovk=;
        b=ezn/qJM7sxbIkM29eOAixvkIHUFcHSL+GXFG8F5i0B4NlzOAQ3nNurzh43WyO1Q8Z7
         2LP/B9CWpDPCGL1iVN8vr+JpTwRbsSrbjWhwnflX34ph08iMbWRPaam63hSGgc7bA4OJ
         eDBMvjSoBo8kBDrtTEdy2inGeaFAWcKnty1zrhcpzbm9XBMsbWJYAePXr7f7bXYxN/gi
         ecSbdEpEelkaENONBeR7cBqwwyCkNtPOtBOC0MCfm1spfL78WRFd3EfMwvCaJ7/xCCFx
         /mfD+XvxvpRqyXWGmLHJYyoeU14XgF6uW+/YNMQTFYPXEL+dP+FfFOjeDsignik7Eo8e
         6xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AEMYWaSEel8Cp4M82ZW85fUPHW8FXC9jvw93/++Wovk=;
        b=LVZlI81T22SDVkbBgTFE9W1+TlLTOK/VSFCKOeykHCPkSPZqIxFoFYAH3w5T2+n2Z0
         JZSJ6DGpH3/cx0zb/g12FpZr232+G+q+sC4Iyx6h4JYq5ttXYuiL0xfTiwOJ9d76wyTO
         7byL2uvY82BIeVFKZMsYcvn5n8k6t63E0HpFHL44IQvJJL4oyWz1shbF5pPw3loALEv0
         nFzKedkiNOGBYJBjqA0L8E52XZNirmdsJlpopfE0ZWNSfxCdK4CrCzniet2/YaMipDKI
         Awbfs0pzJdlnC8gbeE3OnIynaNC6smVAdD+xqZFYy24Wm9lusv4GTj9VEn3UEofCSRfl
         DxcA==
X-Gm-Message-State: AOAM530YWU8IM6CMXoqbG4gZZ8mh69HqzLU5AE5M2yHlVZvM/Nfid83K
        9GfPKd1f13tB1Hgkx3fWuwmfWQ==
X-Google-Smtp-Source: ABdhPJyoYH6hpuE6wwoRFycNZ0mY/1V2rBlplF2VQiYHcx/nwAScjQ89HomKMDFJA0dt7UXy6/o71A==
X-Received: by 2002:a65:690a:: with SMTP id s10mr23376522pgq.48.1642584529158;
        Wed, 19 Jan 2022 01:28:49 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y8sm1415894pfl.207.2022.01.19.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 01:28:48 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/4] dt-bindings: change the macro name of prci in header files and example
Date:   Wed, 19 Jan 2022 17:28:38 +0800
Message-Id: <81d9a152e65374117b633f953aa31f378412acb5.1642582832.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642582832.git.zong.li@sifive.com>
References: <cover.1642582832.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We currently change the macro name for fu540 and fu740 by adding the
prefix respectively, the dt-bindings should be modified as well.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 .../devicetree/bindings/gpio/sifive,gpio.yaml  |  2 +-
 .../bindings/pci/sifive,fu740-pcie.yaml        |  2 +-
 .../bindings/serial/sifive-serial.yaml         |  2 +-
 include/dt-bindings/clock/sifive-fu540-prci.h  |  8 ++++----
 include/dt-bindings/clock/sifive-fu740-prci.h  | 18 +++++++++---------
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index c2902aac2514..eaf3210fa90c 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -79,7 +79,7 @@ examples:
         interrupt-parent = <&plic>;
         interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
         reg = <0x10060000 0x1000>;
-        clocks = <&tlclk PRCI_CLK_TLCLK>;
+        clocks = <&tlclk FU540_PRCI_CLK_TLCLK>;
         gpio-controller;
         #gpio-cells = <2>;
         interrupt-controller;
diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 2b9d1d6fc661..6e6860551d33 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -105,7 +105,7 @@ examples:
                             <0x0 0x0 0x0 0x3 &plic0 59>,
                             <0x0 0x0 0x0 0x4 &plic0 60>;
             clock-names = "pcie_aux";
-            clocks = <&prci PRCI_CLK_PCIE_AUX>;
+            clocks = <&prci FU740_PRCI_CLK_PCIE_AUX>;
             resets = <&prci 4>;
             pwren-gpios = <&gpio 5 0>;
             reset-gpios = <&gpio 8 0>;
diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 09aae43f65a7..b0a8871e3641 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -59,7 +59,7 @@ examples:
         interrupt-parent = <&plic0>;
         interrupts = <80>;
         reg = <0x10010000 0x1000>;
-        clocks = <&prci PRCI_CLK_TLCLK>;
+        clocks = <&prci FU540_PRCI_CLK_TLCLK>;
       };
 
 ...
diff --git a/include/dt-bindings/clock/sifive-fu540-prci.h b/include/dt-bindings/clock/sifive-fu540-prci.h
index 3b21d0522c91..5af372e8385f 100644
--- a/include/dt-bindings/clock/sifive-fu540-prci.h
+++ b/include/dt-bindings/clock/sifive-fu540-prci.h
@@ -10,9 +10,9 @@
 
 /* Clock indexes for use by Device Tree data and the PRCI driver */
 
-#define PRCI_CLK_COREPLL	       0
-#define PRCI_CLK_DDRPLL		       1
-#define PRCI_CLK_GEMGXLPLL	       2
-#define PRCI_CLK_TLCLK		       3
+#define FU540_PRCI_CLK_COREPLL		0
+#define FU540_PRCI_CLK_DDRPLL		1
+#define FU540_PRCI_CLK_GEMGXLPLL	2
+#define FU540_PRCI_CLK_TLCLK		3
 
 #endif
diff --git a/include/dt-bindings/clock/sifive-fu740-prci.h b/include/dt-bindings/clock/sifive-fu740-prci.h
index 7899b7fee7db..672bdadbf6c0 100644
--- a/include/dt-bindings/clock/sifive-fu740-prci.h
+++ b/include/dt-bindings/clock/sifive-fu740-prci.h
@@ -11,14 +11,14 @@
 
 /* Clock indexes for use by Device Tree data and the PRCI driver */
 
-#define PRCI_CLK_COREPLL	       0
-#define PRCI_CLK_DDRPLL		       1
-#define PRCI_CLK_GEMGXLPLL	       2
-#define PRCI_CLK_DVFSCOREPLL	       3
-#define PRCI_CLK_HFPCLKPLL	       4
-#define PRCI_CLK_CLTXPLL	       5
-#define PRCI_CLK_TLCLK		       6
-#define PRCI_CLK_PCLK		       7
-#define PRCI_CLK_PCIE_AUX	       8
+#define FU740_PRCI_CLK_COREPLL		0
+#define FU740_PRCI_CLK_DDRPLL		1
+#define FU740_PRCI_CLK_GEMGXLPLL	2
+#define FU740_PRCI_CLK_DVFSCOREPLL	3
+#define FU740_PRCI_CLK_HFPCLKPLL	4
+#define FU740_PRCI_CLK_CLTXPLL		5
+#define FU740_PRCI_CLK_TLCLK		6
+#define FU740_PRCI_CLK_PCLK		7
+#define FU740_PRCI_CLK_PCIE_AUX		8
 
 #endif	/* __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H */
-- 
2.31.1


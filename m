Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AE0C4361A
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA09C64E38
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbhCRGJJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Mar 2021 02:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhCRGIw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Mar 2021 02:08:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B51C061762
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 23:08:52 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q11so749383pld.11
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 23:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H4O8Pz9t8/99FT90e18/xfiNTrUM7XDwRwcWmzhNsZ0=;
        b=C1CilY+TIsLUfNiPWi+Gp28S0ZCZuAlTIyNcYPmntFgRJpD8pRA/q9FVezUwJdWnkr
         IIR5kgKJTi1WYk0OmrZXrrennrBJW8Evbp0+FToBwqILhxGxsMAG5uTZwB+WpQBBLjp9
         gHxV9lV/TKP19fEd8wfN7cdbJ9uQLW55eqpBm/2ZTN09eLD96WgwJBvAs0ZVFv+sTMgJ
         fDUx7S4u4ABXOuYGBZoIV3DaM6jertw5GIwyGNlXfpZ+QDlWwajN3GmYzPzogVhm9z5z
         dBWMYdXOGIAeKRQHeD1d4JG8d+y0pRQZdPeyDQymK+PPflbb2Qilqo04jFRZxx/ONDUq
         WkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4O8Pz9t8/99FT90e18/xfiNTrUM7XDwRwcWmzhNsZ0=;
        b=jm/8pPjyw5aAdMQcIaXdz0sg9cp+Gd17aJFo0k9NUziLHlvZX/6a0uwPGYgPulg639
         MfCLT5NKtUbjKRBHXo+llhtY5iwzIseM+ykM8CMtQZXv2kKLqcv9eEgFo8K0c+uz96mv
         QuPtnCPcvBOww81sqpOMT3KbbzUeo4aZ1JzElni/zjF3/RMUL5bICEGFzz1WBrPH141s
         bGPOaHRKoQBm7jBmA0LXA4O7ZC/9e3uIwFa5KX2YMubKQ6jOsqwS7GZKC92GbKJ7jOCT
         3Z3yegnrZV18G6JteKmDfdZ3cL1hZuhCMf3biZ/H/UQJUoEh3GIa94eo2MF1tohG0T2e
         2FYQ==
X-Gm-Message-State: AOAM531mAPhmx867E5reJlz1tg6kZeiUC6V7GDorsvRucomekmjloq+G
        jYE0KGM1PLZ6bP9/wyXCqBIJ5Q==
X-Google-Smtp-Source: ABdhPJyl35YIgn5TvN5MNKZ1TPt5+h5j5mZkq8LUsV5fL4Ysw4zzLFVIjBUzx+FmMc3kdIZujmU8Mw==
X-Received: by 2002:a17:90a:5d10:: with SMTP id s16mr2621850pji.126.1616047731651;
        Wed, 17 Mar 2021 23:08:51 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id 68sm967353pfd.75.2021.03.17.23.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 23:08:51 -0700 (PDT)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
        erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
        robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        mturquette@baylibre.com, sboyd@kernel.org,
        lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
        alex.dewar90@gmail.com, khilman@baylibre.com,
        hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
        jh80.chung@samsung.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        helgaas@kernel.org
Subject: [PATCH v2 6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
Date:   Thu, 18 Mar 2021 14:08:13 +0800
Message-Id: <17994571deaf703e65ece7e44c742f82c988cf39.1615954046.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1615954045.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index d1bb22b11920..d0839739b425 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -158,6 +158,7 @@ prci: clock-controller@10000000 {
 			reg = <0x0 0x10000000 0x0 0x1000>;
 			clocks = <&hfclk>, <&rtcclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 		uart0: serial@10010000 {
 			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
@@ -288,5 +289,38 @@ gpio: gpio@10060000 {
 			clocks = <&prci PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
+		pcie@e00000000 {
+			#address-cells = <3>;
+			#interrupt-cells = <1>;
+			#num-lanes = <8>;
+			#size-cells = <2>;
+			compatible = "sifive,fu740-pcie";
+			reg = <0xe 0x00000000 0x1 0x0
+			       0xd 0xf0000000 0x0 0x10000000
+			       0x0 0x100d0000 0x0 0x1000>;
+			reg-names = "dbi", "config", "mgmt";
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000        /* I/O */
+				  0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000      /* mem */
+				  0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000      /* mem */
+				  0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+			num-lanes = <0x8>;
+			interrupts = <56 57 58 59 60 61 62 63 64>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-parent = <&plic0>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
+					<0x0 0x0 0x0 0x2 &plic0 58>,
+					<0x0 0x0 0x0 0x3 &plic0 59>,
+					<0x0 0x0 0x0 0x4 &plic0 60>;
+			clock-names = "pcie_aux";
+			clocks = <&prci PRCI_CLK_PCIE_AUX>;
+			pwren-gpios = <&gpio 5 0>;
+			perstn-gpios = <&gpio 8 0>;
+			resets = <&prci 4>;
+			status = "okay";
+		};
 	};
 };
-- 
2.30.2


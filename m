Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCCAC433EB
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 09:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0B3E601FF
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 09:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234731AbhCaJ05 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 05:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbhCaJ0k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 05:26:40 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B9AC06175F
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 02:26:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso906393pjb.4
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 02:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yP7PEulAPK6UHzRxTLeSHifkookZOtRjzWBAZ0O/gdc=;
        b=LOw7EcVTffm/NjdpGaGKUcEGQ77gQ9JBGdonP44rzUgXmMgCpaNUUehuHZr1fxV1UH
         3BBm56IlXAYsVcHNKpUz4rfO9dQS24nWfBTjUsvikelk59OREv70zUWGBbH2weoPqb1v
         fe5f2NqgE0tBYaHEv53mPjfxC0q//a/k26g7ERe1p40gF7ZDAu55vDVITOsHtel4i7gk
         t193rAIOVpfvOXumSpeM5SWmZTcuFe8Ui9c0OnT1wU6EWF4zKZPgVgDWc6s3/YmvsIVs
         DSj7O3ADkHdwvuty7xC835x7GQzPyJUO+6tIJue0z3CAXUBR/aUoKr6JELz2lo+C+iNH
         gfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yP7PEulAPK6UHzRxTLeSHifkookZOtRjzWBAZ0O/gdc=;
        b=aHa+0xRvD4yQlr5d5+iU+f3E3LemMtW6uGouLHmTBEuc5rIzaw41LMuPT/BswflWSS
         jjALnqdE2KuPImYR00buDTu7BuGy3PMyc0lmKzOr2fkr95kFmAPEwbeG8PSkrvIKDYHK
         3gvWRd/OVc+8UwMREeG+WESOemO2dyIcTTjg8EUlbLztiH39VgUBljPNxWEX6S+zSkI5
         j0G/Jd3bmuDdpQnmDu/1q3EXnGsTC5KEbTGxNTRLncCL50Kwt9t/C5r2o4q2SLK6nuK1
         FqSky6zuZfqKBfWlzVeM8kSeOby0PhKOQ56k1bJYMXHF8z5FuPWunj3OJXrXEl4VLo9n
         k8zw==
X-Gm-Message-State: AOAM532lfilLewBsMVl+1wm78IfFsF0/5O1eHRKZMcX5Z+K4F5P+waF7
        DHacdCKonzn82ncyK4Lzy3rwHQ==
X-Google-Smtp-Source: ABdhPJyOcOzTnUY5eHiAJ1S0x1EGTnxPs4BI8SbPuOMDe+Jv2va6wUKiS7UneRWEWjd/DWnW7Vlmhw==
X-Received: by 2002:a17:90b:1987:: with SMTP id mv7mr2512728pjb.152.1617182799984;
        Wed, 31 Mar 2021 02:26:39 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id 143sm1726505pfx.144.2021.03.31.02.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:26:39 -0700 (PDT)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
        erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
        robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
        sboyd@kernel.org, lorenzo.pieralisi@arm.com,
        p.zabel@pengutronix.de, alex.dewar90@gmail.com,
        khilman@baylibre.com, hayashi.kunihiko@socionext.com,
        vidyas@nvidia.com, jh80.chung@samsung.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v3 6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
Date:   Wed, 31 Mar 2021 17:26:05 +0800
Message-Id: <20210331092605.105909-7-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331092605.105909-1-greentime.hu@sifive.com>
References: <20210331092605.105909-1-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index d1bb22b11920..b2317c8e3a80 100644
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
@@ -288,5 +289,37 @@ gpio: gpio@10060000 {
 			clocks = <&prci PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
+		pcie@e00000000 {
+			compatible = "sifive,fu740-pcie";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			reg = <0xe 0x00000000 0x0 0x80000000>,
+			      <0xd 0xf0000000 0x0 0x10000000>,
+			      <0x0 0x100d0000 0x0 0x1000>;
+			reg-names = "dbi", "config", "mgmt";
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /* I/O */
+				 <0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000>,    /* mem */
+				 <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000>,    /* mem */
+				 <0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+			num-lanes = <0x8>;
+			interrupts = <56>, <57>, <58>, <59>, <60>, <61>, <62>, <63>, <64>;
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
+			reset-gpios = <&gpio 8 0>;
+			resets = <&prci 4>;
+			status = "okay";
+		};
 	};
 };
-- 
2.30.2


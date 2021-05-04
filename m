Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB9AC43618
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 11:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03A06613BA
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 11:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhEDLBn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 07:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhEDLBg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 07:01:36 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B18C06138C
        for <linux-clk@vger.kernel.org>; Tue,  4 May 2021 04:00:37 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id e15so7030792pfv.10
        for <linux-clk@vger.kernel.org>; Tue, 04 May 2021 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bd4fUtUUCN/HpB11MmfQQGuVzm8gcsXHLL3mbp/tsMI=;
        b=gxf7CzRhIEg7zRxAYGfW3O9gQpoV2/SC9xkdYvQf3t+rCcVcsEqdhkegYCDClL06IQ
         nNCvHtQnt2tAtCMP/3gx3r/XxbYswP6vnXZO7suvBW7X1mwBvhXuau0m/XuWNLv38/9N
         eN2AN9ttEI4gDJ29x+0pSaSXv9wc6K3vB9XcRHoBhtLXHIvV0LRs8BVDfsScBrgeZPeM
         UkHPGcCTozEn+KaHV4WeUqZ/IVdH4zhep8U4PtnPDLCrTNih8FfDVVXd4Olpfl6YQIZg
         1rKIEmXBw6aeSdAIgAfCF2wCnbsGLCur1hSjinLYVbLNDDxRlcn86lav+MEPJfQknkDK
         hbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bd4fUtUUCN/HpB11MmfQQGuVzm8gcsXHLL3mbp/tsMI=;
        b=h+dkslek2BZPMtClClQk1uS4JmBkHdxuMPNthzr7BvF9pQ0RNqwttEZb2xGibv9RAx
         u+oat9iUtRBPexqut0IuXJIjiI70Q2TQ/pKQdTTgLOFSfyboe97wSMQaNMi2QGJA9O0L
         AcR0ulrU0H6d3XFQ5FhODJlayb46zU+C7HWC6dAClVWEv2QRw+chmgwd/Oo2umPaEgCq
         wfiQX+rJcJ/6toUSeNfpbj1dff9oIpohm7WP6hIw+ewz2rcTbdjd8of0Eem6Gbw/Z1AH
         poM1Hc2I5FKQcpn71j53bJ13rpVKkieR0vdsL6fPDSuO0LtjfxjwXV7teF9DjqOxWj9Y
         IZEw==
X-Gm-Message-State: AOAM532N/2r2xro6XgzaeBYZnpIBbej6Ws38m7ieIZg49Buj3N1JQU6a
        YX8RuTN569IwyEZDUkcqVyKlbQ==
X-Google-Smtp-Source: ABdhPJz46MtHcSpwQA7kaeKNf5SD74WureuuZMKtrRm8c5ReJSIREFjLSWxpGsBIBtCzVJDkaWsUTg==
X-Received: by 2002:a63:1d19:: with SMTP id d25mr22535208pgd.169.1620126037434;
        Tue, 04 May 2021 04:00:37 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 04:00:37 -0700 (PDT)
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
Cc:     Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v6 6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
Date:   Tue,  4 May 2021 18:59:40 +0800
Message-Id: <20210504105940.100004-7-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index eeb4f8c3e0e7..8eef82e4199f 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -159,6 +159,7 @@ prci: clock-controller@10000000 {
 			reg = <0x0 0x10000000 0x0 0x1000>;
 			clocks = <&hfclk>, <&rtcclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 		uart0: serial@10010000 {
 			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
@@ -289,5 +290,37 @@ gpio: gpio@10060000 {
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
2.31.1


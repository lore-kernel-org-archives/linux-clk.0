Return-Path: <SRS0=Adza=ZH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37614C432C3
	for <linux-clk@archiver.kernel.org>; Fri, 15 Nov 2019 16:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AEB02072D
	for <linux-clk@archiver.kernel.org>; Fri, 15 Nov 2019 16:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+5f07YL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfKOQ3j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:29:39 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39672 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbfKOQ3j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Nov 2019 11:29:39 -0500
Received: by mail-pg1-f195.google.com with SMTP id 29so6239832pgm.6
        for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2019 08:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=F+5f07YLpe5ouKmkTbFGbDdunX/KCt+dKybIeWw2uN5evbh0B2Mr32f1AUvREsXuZd
         6E6zV+NRXkT9IOcKo/StVi+ubHWxgRq0aKA1QVvfmhUIjn7Y+UrHouPMWcNfSnZHUBry
         1K+Fbtj/qFLphLnaT5CNC89x1uJ8AEPgZQPqzG+xjmlpJUMixmXCXvBJ/XPW0xharZQ5
         3e886sJBoYHcRyzfI6WNwY+P3TxKtI0TXSx4SOLGnb2RVr+gK6/g3omS8MYBxe9PlpG9
         om+syucI14CmPGDiUayqgNtOMu9H5CYyGtFl7Pbn7WREgCnbNGr3zpJELaucvUmNgs/W
         2yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=uMFCr+SkSNmANSSpB9J39ouOmzJ8mLwBlc5nwWVUxis3H1DDrUm0S1P3KDgXX4FZ9Y
         7j47Z4msTZnSH3UI/M9LfE7n1aRECQrqDzOUZkNTvSLPQkhSw0qey6PqdAWWCXwnPlgT
         whkMLxFh2FOv6PqpiSqP8kMDr+9wfpShXheiU9wluf3L+AEXedDpHBIAJwvbKZp6Xcie
         7hdO46GUWrlgc33D1WNLKBwF/OGyBdme7l9JjW3F4C04O4WOjWrJCrx44aaPhK0O7h5V
         aO1zof8u7iRBCmRRpwUc/JQb8EOkkEOJfwigNtJtzu9JDSOtjXfXoqSSWiJZdYYck92i
         aM1A==
X-Gm-Message-State: APjAAAXAoFX8ZMbD/CMZ3sAaYFlOUkDD/XIycf56SNPslpGNIZNK602I
        3+KG3krHrgd0mejSlWChJ55M
X-Google-Smtp-Source: APXvYqwDZwTI7WAkduLMSH+eqssbv8GB1QaGVtH8A8kWnBO9K2P2qfEHIyrK9Cb+ZIfueyohjNBsxg==
X-Received: by 2002:a62:e119:: with SMTP id q25mr18667948pfh.161.1573835378452;
        Fri, 15 Nov 2019 08:29:38 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6183:6d55:8418:2bbc:e6d8:2b4])
        by smtp.gmail.com with ESMTPSA id y24sm12295288pfr.116.2019.11.15.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 08:29:37 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 4/7] arm64: dts: bitmain: Add clock controller support for BM1880 SoC
Date:   Fri, 15 Nov 2019 21:58:58 +0530
Message-Id: <20191115162901.17456-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115162901.17456-1-manivannan.sadhasivam@linaro.org>
References: <20191115162901.17456-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock controller support for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index d65453f99a99..8471662413da 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -4,6 +4,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <dt-bindings/clock/bm1880-clock.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/bitmain,bm1880-reset.h>
 
@@ -66,6 +67,12 @@
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	osc: osc {
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -94,6 +101,15 @@
 				reg = <0x400 0x120>;
 			};
 
+			clk: clock-controller@e8 {
+				compatible = "bitmain,bm1880-clk";
+				reg = <0xe8 0x0c>, <0x800 0xb0>;
+				reg-names = "pll", "sys";
+				clocks = <&osc>;
+				clock-names = "osc";
+				#clock-cells = <1>;
+			};
+
 			rst: reset-controller@c00 {
 				compatible = "bitmain,bm1880-reset";
 				reg = <0xc00 0x8>;
-- 
2.17.1


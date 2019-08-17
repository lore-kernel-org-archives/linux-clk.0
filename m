Return-Path: <SRS0=iaTJ=WN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD7FC3A59E
	for <linux-clk@archiver.kernel.org>; Sat, 17 Aug 2019 18:36:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F1512173B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Aug 2019 18:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m4IDdt5h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfHQSgo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Aug 2019 14:36:44 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37491 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfHQSgn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Aug 2019 14:36:43 -0400
Received: by mail-pg1-f193.google.com with SMTP id d1so3991425pgp.4
        for <linux-clk@vger.kernel.org>; Sat, 17 Aug 2019 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=m4IDdt5hE3NS7csTFWIonyNM4/jZUwMLDrD/Mq4Th9B6YG83CrzyI4AAIpjEDqZPe8
         Fi0+cx8yUubrqjQvrRsbOVcuWdisRVU/SSNg68kdQA1BfikK8mud6fn/d0FRR+BBiSqd
         2ZBi8TxKm2ns7ni5cAjvaLHaIrl4EByyDRYQsEwIU4viACw7gPEyLCwuleW3DRLMoyW5
         sM2oiMT1TjQfOfTx0MJ94Wq4p1YeSbGXthSKH0wo1l/j3i66VrTgc52b3GrqhGneSsRW
         Fx+CXvCpZOS+Y/A2dVIBdXRdHPLucJX65qp2mMAzMP1vC9jEJd6dY80KtPuvnNXuvXi+
         xXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=D4ZTNYTSYKYj8bdviUZe5KWj4mENWZUK7+WqAmXqloZQ+pMouYl2djNnZrcJBnExPG
         m5hJjrx5LfN9kiD2ywunmjj8dnEXa4fLds2PmiPqlWhkpNdAXnVVtP7JquGaroQchJ5t
         N5WaRKDjbZK4vh8CYDolR3o8uP9nQyPgqq1bqh0n06Ry/f+SNT4MjDlPTpcTlIDWjAH1
         h+QA7Y6G4Gcwgcy8ygPlMaaueFCjYX4jZ1FRGJBzdPIx0HqgC5VQkDlsom5LnNo+hk6f
         O3+4a+j/0tojniXDCGaDoEsiYri4NbcXEUoapU3gQFodgpNQHdHirsT09sVnQ7lszCmt
         ib8A==
X-Gm-Message-State: APjAAAUJ7L1COKXkRTYojDiJ+WSrVHEeWRCKHBifV3/xpHEwU/uMNyHv
        TvBcF7fDN+dJ6Cla9k5QY+H4
X-Google-Smtp-Source: APXvYqzsV4wdUNvPH0b0Ophc5Xcyb7iDGJiJNKWcXu9BLHJ5O7iDOC7hDRDHo3GH489oZ0FMp34r/w==
X-Received: by 2002:a17:90a:a105:: with SMTP id s5mr12903768pjp.51.1566067002944;
        Sat, 17 Aug 2019 11:36:42 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:909:4559:9185:a772:a21d:70ac])
        by smtp.gmail.com with ESMTPSA id 33sm8588640pgy.22.2019.08.17.11.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 11:36:42 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/7] arm64: dts: bitmain: Add clock controller support for BM1880 SoC
Date:   Sun, 18 Aug 2019 00:06:09 +0530
Message-Id: <20190817183614.8429-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
References: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
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


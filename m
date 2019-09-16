Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816DBC4CECE
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 16:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55DCB2186A
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 16:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jE2g8ybO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389828AbfIPQP3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 12:15:29 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40545 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389807AbfIPQP0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 12:15:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so180894pfb.7
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=jE2g8ybOcOUwoEThqmw1rnJDV6U69PWwTv2OUjNx3CE2KVZUeEQs6WWuow8qfhTw1z
         fzwuvLgN4Rf5C3+MF3iEj1BCVt5sEvoknLn+2nK6sB6jSLqgh/n2wHwjsccIEzrrvara
         8/l1j0hNsc2Z31T3a1ZcBYfgqChesnusC0YMJuZJ8fXc3wr3wkR+ngzJ1n+X36r4TK/Y
         UBPdaMlV5FCKCMxaON4VM6f7WoDd57zhy0mTFuDWJW9kntIn2FFOot3lhElnvnkZbr4x
         9UMLrVB3HjQa5Hdk5jhLhgrqfQZ4ZZqczggs4l5GrMgbBKVIngAmKZntUXrBqVNPENqC
         Dw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=Z2XxMPlQjNRoHJdr87GZrk/E1257/kEQlCdku0JEOpJjWE9JzXOSDkS2ZJoXJ35MBl
         PlCLtY0G2DlJhT3SLJrb/Y6f0TTp7etPu1gbEWypyg0cSXTNwKpr8SN+egqGLT9Pic2K
         MS604P+7kAea3mjRjj2Z2O0Pe/8mTzyD6RkpF8MM0i/og2TysZREpirMgosvnN0oH3dz
         LtduhTdUHN/BUSuec9EXwdmsSOGi+oqzPErNlyk2fk4mQ3fgYj44jWEKknCyHc1k9J09
         Q9ReiqHpcLoWFBuS1AUj8ZteK/JOjOfk+oT++y579dXdjeccVWfberdTB0m+7LMwDllJ
         Maiw==
X-Gm-Message-State: APjAAAXr10suC+ZCKVVlDA+9B3anhqsD6DavDz/rIo5SSvAdZXtpQp+L
        jekf57urWfmYmcdbzHtF0+ce
X-Google-Smtp-Source: APXvYqykS8glTIKVHijJEFn2JIHIDQLBwCTSvv4gHN6zTXId4IDlNKrbns+fLHkkxys913v7GaEswg==
X-Received: by 2002:a62:2ac9:: with SMTP id q192mr52183pfq.189.1568650524525;
        Mon, 16 Sep 2019 09:15:24 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id h66sm614134pjb.0.2019.09.16.09.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 09:15:24 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 5/8] arm64: dts: bitmain: Add clock controller support for BM1880 SoC
Date:   Mon, 16 Sep 2019 21:44:44 +0530
Message-Id: <20190916161447.32715-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
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


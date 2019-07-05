Return-Path: <SRS0=Ml9T=VC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B13BC46499
	for <linux-clk@archiver.kernel.org>; Fri,  5 Jul 2019 15:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3295216E3
	for <linux-clk@archiver.kernel.org>; Fri,  5 Jul 2019 15:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FsMlfk2Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfGEPPJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Jul 2019 11:15:09 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34860 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbfGEPPJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Jul 2019 11:15:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id u14so3268082pfn.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Jul 2019 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pnFKwgNsYpmubPKLkJXycKS9VYfFkpb2W871iieZZDk=;
        b=FsMlfk2ZU1BrvhnsQetLbWU/mxumz9RLpLIFkhi3D4wujKxRDkrRQIqZJdyxeCFYMj
         RzGyO7tG+3v1VY1p3FjAPLjLRWM7SyP/hI3Lq57e+JupfcKpTUihhyK6z8rCrkgQMyfH
         J8Ft8lVHesiX0u54DldtCczALimAENg83xEl2PHqLnmdezVUp1TpOf+WrVYdX1tM0h61
         Y0D+wcf4+x3jq6Y08eJ3ckDQm6352vn1sITAsrVWSVd5G232Ok4TLGNMX8JWdnycmbjf
         NeLGBwT7rzeCUjrwD3PwitOwuQnrrY00Spycn59BAFrBR0J4z/YtmG+L/4tGXIpb2xts
         TwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pnFKwgNsYpmubPKLkJXycKS9VYfFkpb2W871iieZZDk=;
        b=qcyEMy+ZB7nkSTfJ9jg8FphLwh/C7F5hxEe+6owD55jveEOoc+1SLtXnx1ce5jyiYI
         9WzgZ6RPuDcnvOuGWqeJuFHWWxHaXG6lcowf8AVMEJ/5pAHO2lxp5rwvnI2C5cxomRid
         kP5HbVF71HD6OJTlVwfeYP8eEaNnvp3sYbBAPySjQe/qfukfY3D2+JkfRRLv7Ru7ngnr
         kfRPmdI6G050/RzXb7NUfQUsBEqF6MeoDQb0IYiwstJ18tFF9UV67QVGYBQEpsZBRBaG
         cHNXU1XwFoF6KEUk2BHkOdC2fg29+6+qmMUlfqe2Jo+0dJTwPYpsY480o0fVRrEwEnN3
         HVzg==
X-Gm-Message-State: APjAAAUBIvZ8ii5E2QLogVPPKthhPmXLOkTBsIeaVarDW6qGj+vjJXCN
        R9qEOerjjoE0phsEIYmb0HBH
X-Google-Smtp-Source: APXvYqz3mPNH6Ybau1VTJ26KlOtoId3CcrfwCRjbTIhdJy1DoBb5E8LmAdQckUNquFrcjd6b5Isxfg==
X-Received: by 2002:a17:90a:b312:: with SMTP id d18mr6095115pjr.35.1562339708466;
        Fri, 05 Jul 2019 08:15:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:916:7317:a59d:72b6:ef7f:a938])
        by smtp.gmail.com with ESMTPSA id w3sm8248778pgl.31.2019.07.05.08.15.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 08:15:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] arm64: dts: bitmain: Add clock controller support for BM1880 SoC
Date:   Fri,  5 Jul 2019 20:44:37 +0530
Message-Id: <20190705151440.20844-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock controller support for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index 86e73af1629c..d2edb2e28bf2 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -4,6 +4,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <dt-bindings/clock/bm1880-clock.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -65,6 +66,12 @@
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
@@ -93,6 +100,14 @@
 				reg = <0x400 0x120>;
 			};
 
+			clk: clock-controller {
+				compatible = "bitmain,bm1880-clk";
+				reg = <0xe8 0x0c>,<0x800 0xb0>;
+				reg-names = "pll", "sys";
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
+
 			rst: reset-controller@c00 {
 				compatible = "bitmain,bm1880-reset";
 				reg = <0xc00 0x8>;
-- 
2.17.1


Return-Path: <SRS0=BdQT=PI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DE0C43387
	for <linux-clk@archiver.kernel.org>; Mon, 31 Dec 2018 18:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D79C72073F
	for <linux-clk@archiver.kernel.org>; Mon, 31 Dec 2018 18:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="drYNuZs/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbeLaSz7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Dec 2018 13:55:59 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42271 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbeLaSz6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Dec 2018 13:55:58 -0500
Received: by mail-pg1-f193.google.com with SMTP id d72so12935943pga.9
        for <linux-clk@vger.kernel.org>; Mon, 31 Dec 2018 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzEw+0c7YCMrIJx0PSwB5TjdR5ksSYaunb0Z3JfV66A=;
        b=drYNuZs/jBj1/vLtblqax09zFggcbQ8stoB/0bqktqAbJghWOyVWDjfuk6tmVg1J2s
         X+Q7MfHl/fcPYdKUIpFFLoKrvYDrFbt2gNFfphH1op8jnamf/0s/e0gTPomNVNeegLz8
         KRmQy+IdMAPJ2LgDEdt5zhl71aALwwOXHnzZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzEw+0c7YCMrIJx0PSwB5TjdR5ksSYaunb0Z3JfV66A=;
        b=iwlyntvP15kUexX4vaXERrOF06iPogGc/Ro2g9xCpM46f+I1cjtD1PX5s9uSHG6kP5
         bNdLNQDBuqfypWIIVFNpdtURYvlMEMQ0IUWBTcApP5gEjXSW1CLvR71uQcfWLnVKDiQx
         MSKvsjaBg8X2Tf0b9sMRR8nMOB9aCtS/V6iXAGkZ0PqJJURFnlWIMbTRjE8ObA0/1RKu
         057DxZEPtGoZSgqZ8x9ViCeFXz+gtTd1PBEfh0obrBn14lU21DQHPDdxnt/RRhfW64UQ
         XRbXA1LhUUWKX7xvera1CfevfdqDUgdbsAUgB42EaazlSMMd967eBzyDBHD3Z4iEJD69
         yVdg==
X-Gm-Message-State: AJcUukdkb5HAhpOFts538FtekF+NGm9LVlcOVIruxtX5v3bUXuXsJ/hU
        3yLhy8FYXCZMqGKJUNZqQRhu
X-Google-Smtp-Source: ALg8bN7mtIXE8I7yk96Gm9/UfW9HxwDGQfysbrCNRvLvROQm4a8TxSmr+sF28gQnZCXYQkolA20awA==
X-Received: by 2002:a63:9749:: with SMTP id d9mr8237520pgo.415.1546282557427;
        Mon, 31 Dec 2018 10:55:57 -0800 (PST)
Received: from localhost.localdomain ([2405:204:7440:b882:8d58:e15f:9ff4:efc2])
        by smtp.gmail.com with ESMTPSA id s9sm66146224pgl.88.2018.12.31.10.55.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Dec 2018 10:55:56 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de,
        robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH 3/6] ARM: dts: Add CMU support for Actions Semi Owl S500 SoC
Date:   Tue,  1 Jan 2019 00:25:14 +0530
Message-Id: <20181231185517.18517-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
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


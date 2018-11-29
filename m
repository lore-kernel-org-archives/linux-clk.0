Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E806C43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 615E520989
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dp6tBqUa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615E520989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbeK3Dvm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 22:51:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55002 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbeK3Dvg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 22:51:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id z18so2976183wmc.4
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EtM4PIazhY07dM0/SaEEWQPxpJFOk9DHFjeuMp17cAY=;
        b=dp6tBqUavwos7KZ6mfDXbkfB1XygBEgZvGmxP56Gt7XJvFVMSHA+Hbmc218c34qykK
         mnKFwjX/LAeiZ8J7StjT1l/MyQY9VfNWCZGBnu8zGb8/1vxZe0vWyibf5kYKvQ3s8Tb3
         oUf9Snoo6m2eXkvB3ttsuCl72Gh5NJemwmlpHwWSL7PT+Oo7XLRwYJd6+W4dn+ERcgn8
         LCjmmDwmH55yKn9YQp0uQqs43FJJ9JA47QKSpvSGPYBImCVyOyAGS1/bZJh7DtYDdXu5
         UMBpD7k8n+y7QVVX1qyERYjExlapvkTAYdT+LawMVBdRxpeN6kCuQDbCLOgnYzD/lIzG
         sX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EtM4PIazhY07dM0/SaEEWQPxpJFOk9DHFjeuMp17cAY=;
        b=pTCj+tBZ/8OoHvtts20ZbaGieKz7taFc0YkkiEY1tOX/VYTDOTt41fDZuoqJlv8PN4
         F6JFeM1vBg5S6o5IDPZAJrxCL70YbY7QvV22LzbzZWzGVDpadAkqpT1sXckYgr6Hst56
         aIM4uj9Cq6Lr9AFLUqmFwsZAONqN/SmtzbkEqmz7pLKS0mKwY9EdlpTfNkdMjpM0GUkB
         HYoVpj9J6Lmhm82AN8sJPZPaFae4AMaA3QRdViK0dr4X1rEDv1GjkrFYCz2htNdofBSZ
         /NOnuB7x/22onkCJFtbpjd6KL8BU62fEjt4y+B9o5Gm+nOcDW6uKpjDef69w868ZWbr5
         +duQ==
X-Gm-Message-State: AA+aEWa9L3bYtueNkxMm4Y9tbLqHZUQAqp4NCXkd+s0f7lujnKKY6PAv
        x+sQt5Iwyn1KpNnaSRVhup8GGQ==
X-Google-Smtp-Source: AFSGD/WJaOfuutDvzzbZ0va/pIvGxVLGX5l0HSRmlnvR/hCkFtrHbXkYMSJpeus8Ic5I9RR/omDFMw==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr2463397wmi.144.1543509935558;
        Thu, 29 Nov 2018 08:45:35 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id d4sm2721909wrp.89.2018.11.29.08.45.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Nov 2018 08:45:34 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: meson: add clock controller clock inputs
Date:   Thu, 29 Nov 2018 17:45:24 +0100
Message-Id: <20181129164524.18670-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129164524.18670-1-jbrunet@baylibre.com>
References: <20181129164524.18670-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock inputs of the clock controllers

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5f512c91471e..f2e9fbfff4ea 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1089,6 +1089,7 @@
 				clkc: clock-controller {
 					compatible = "amlogic,axg-clkc";
 					#clock-cells = <1>;
+					clocks = <&xtal>;
 				};
 			};
 		};
@@ -1334,6 +1335,8 @@
 					compatible = "amlogic,meson-axg-aoclkc";
 					#clock-cells = <1>;
 					#reset-cells = <1>;
+					clocks = <&xtal>, <&clkc CLKID_CLK81>;
+					clock-names = "xtal", "mpeg-clk";
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 6796d250985a..3322da6da962 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -299,6 +299,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &efuse {
@@ -334,6 +336,7 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxbb-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ed278097825b..223f34959844 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -260,6 +260,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxl-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &gpio_intc {
@@ -284,6 +286,7 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxl-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
 	};
 };
 
-- 
2.19.1


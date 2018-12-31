Return-Path: <SRS0=BdQT=PI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39BBC43387
	for <linux-clk@archiver.kernel.org>; Mon, 31 Dec 2018 18:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B386F2073F
	for <linux-clk@archiver.kernel.org>; Mon, 31 Dec 2018 18:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAfoUXX2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbeLaS4G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Dec 2018 13:56:06 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45791 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbeLaS4E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Dec 2018 13:56:04 -0500
Received: by mail-pl1-f195.google.com with SMTP id a14so12880360plm.12
        for <linux-clk@vger.kernel.org>; Mon, 31 Dec 2018 10:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xnTFjl+GiCKiqWScUNzvjAlPROFJTsMxFZH/vteR13U=;
        b=DAfoUXX2Mm4QCjZqfBd/jHNgGDXixo8Idl2Ej2QqqP8eRoI+RjdqXc//NL6yfnGUki
         x96pi+g9+u6YtEP3M6799NXkX8CxIyuptrQkPatVQ/7t4Wpa9OBmKzf2ffLtp1crXjcD
         0onod/iPgWI3xVsGvCupVe1PmvzcKQWx74o8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xnTFjl+GiCKiqWScUNzvjAlPROFJTsMxFZH/vteR13U=;
        b=Muq5QeQKT41gatIYQCFpH0fMoRhZW+A1xHOD58sv6sJpxK5UGwqPdwsrwU+B7sAVmk
         BpA2W9ZoXwHFdegcS3HSII+ljf6C8XzASnZwlhpyWb7718xENYgZFdVZqifapDpGPFdz
         qfJAXRa76IcVj+4V1Fgiex3Bo+68cMvcQnmaUfN6eBlrSdjTWZOPta2uu/qqmBvGU4lw
         ghF7ERCIxbQCQzvtaIxRuZ8AXpgji5PJFf/dX+AvMSWFR3/MN4ZUO5Lj/6GOHX9om3vt
         lwyjSHUKizy0/9ShjLdy47/o6LY26rLuuCeFWqYJfxlnVarOV6WIuWE3v2lTAYbxu9OW
         4gXg==
X-Gm-Message-State: AJcUukfnF/glTmRULh5VAkEhMxrTmHc73PfAK6NzxXIm17ucS26lGRTm
        2lbap4X0u9iyWbARCdRMuIG5
X-Google-Smtp-Source: ALg8bN5xgrandwk7kDkjOhlCJwLKw+AbtdnzuOLk8O3v+FGwxL+DJprDS/hJpaHyHyUJ8W9f/MztHw==
X-Received: by 2002:a17:902:3064:: with SMTP id u91mr37492748plb.325.1546282563704;
        Mon, 31 Dec 2018 10:56:03 -0800 (PST)
Received: from localhost.localdomain ([2405:204:7440:b882:8d58:e15f:9ff4:efc2])
        by smtp.gmail.com with ESMTPSA id s9sm66146224pgl.88.2018.12.31.10.55.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Dec 2018 10:56:03 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de,
        robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH 4/6] ARM: dts: Remove fake UART clock for S500 based SBCs
Date:   Tue,  1 Jan 2019 00:25:15 +0530
Message-Id: <20181231185517.18517-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since Actions Semi S500 SoC has gained support for Clock Management Unit
in kernel, let's remove the fake UART clocks from Cubieboard6, Guitar and
Sparky SBCs.

Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/owl-s500-cubieboard6.dts     | 7 -------
 arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts | 7 -------
 arch/arm/boot/dts/owl-s500-sparky.dts          | 7 -------
 3 files changed, 21 deletions(-)

diff --git a/arch/arm/boot/dts/owl-s500-cubieboard6.dts b/arch/arm/boot/dts/owl-s500-cubieboard6.dts
index 7c96c59b610d..c2b02895910c 100644
--- a/arch/arm/boot/dts/owl-s500-cubieboard6.dts
+++ b/arch/arm/boot/dts/owl-s500-cubieboard6.dts
@@ -25,12 +25,6 @@
 		device_type = "memory";
 		reg = <0x0 0x80000000>;
 	};
-
-	uart3_clk: uart3-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <921600>;
-		#clock-cells = <0>;
-	};
 };
 
 &timer {
@@ -39,5 +33,4 @@
 
 &uart3 {
 	status = "okay";
-	clocks = <&uart3_clk>;
 };
diff --git a/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts b/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
index e610d49395d2..7ae34a23e320 100644
--- a/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
+++ b/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
@@ -18,15 +18,8 @@
 	chosen {
 		stdout-path = "serial3:115200n8";
 	};
-
-	uart3_clk: uart3-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <921600>;
-		#clock-cells = <0>;
-	};
 };
 
 &uart3 {
 	status = "okay";
-	clocks = <&uart3_clk>;
 };
diff --git a/arch/arm/boot/dts/owl-s500-sparky.dts b/arch/arm/boot/dts/owl-s500-sparky.dts
index c665ce8b88b4..9d8f7336bec0 100644
--- a/arch/arm/boot/dts/owl-s500-sparky.dts
+++ b/arch/arm/boot/dts/owl-s500-sparky.dts
@@ -25,12 +25,6 @@
 		device_type = "memory";
 		reg = <0x0 0x40000000>; /* 1 or 2 GiB */
 	};
-
-	uart3_clk: uart3-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <921600>;
-		#clock-cells = <0>;
-	};
 };
 
 &timer {
@@ -39,5 +33,4 @@
 
 &uart3 {
 	status = "okay";
-	clocks = <&uart3_clk>;
 };
-- 
2.17.1


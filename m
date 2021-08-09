Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A106C4320E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6577B60EC0
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235352AbhHINLr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 09:11:47 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:48848
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235337AbhHINLr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Aug 2021 09:11:47 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 05BCE3F34E
        for <linux-clk@vger.kernel.org>; Mon,  9 Aug 2021 13:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628514686;
        bh=QT8SwdEZ0R6TNUIJP6/Ss9c7WD6R+hflCwKGvca5iIE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=lLHfC7lQe5+ydflXn2NJdPOCwtSC/XH9yF2Tyx624v9f6hXKRQJD+OIagLmTREz0N
         hlx4iRISQsZu/JXWeISMooA/edpUDUjKLgrw7QXMBFZXJWaXQO2Pbai1iPMbltXLNb
         WDz4/3HyHu37JiqDfSqzUfqmxtEiMkcyxlI/RiCvAbmfOhQn63oxwmrnBC69LEpQPW
         7m60qEhd+GbZ8t/45RwtctW6KHreN0Zy+Jd4xUKND0J4b9ZvcHO7hVXSDtVapAjEkj
         KhvR3w17tHUFBhLg9/TCGb/Uw9k0z0/1F9eaOu4VfHXUiFJpJL18iDCBauP4M0lvCM
         WGNE730DBhpQA==
Received: by mail-ed1-f71.google.com with SMTP id dh21-20020a0564021d35b02903be0aa37025so6605194edb.7
        for <linux-clk@vger.kernel.org>; Mon, 09 Aug 2021 06:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QT8SwdEZ0R6TNUIJP6/Ss9c7WD6R+hflCwKGvca5iIE=;
        b=jr0leMTvGMTM8R8PAofZCmSAsl/eOoUfh5+3U59FhTim53YWtzEAy/8m/za2RUjOP6
         IF85+LMm3FVi3PF7X81vuBH/W6fYvEwSuyxs19UxdA/47AI3uH1IszvJAbsvAUkOCa57
         rZGkoIvytdOD4gJrPo+xcQwsQqql2cenaBxyiM1V0h+k7UOG/VTWvh/ePHakX5othCR3
         gylmX5rNSqLqnnO8yWcy3lFsNPlpVESUB3W1df5S1dWcGXPGqMw32X6yNrKoZ0WLtzEB
         fyCj/R1veiiMnJHpxRMvu4L11j4OYr8sd8p2dqPnNen4qfDxWO8Gq6B2i6um7wSvD0Ib
         Dkfg==
X-Gm-Message-State: AOAM5316H63MCNeJHbgyZymR0vk3Vg7ym5RUJCExvy+14htP2zYpWMFP
        Hv5hNdHHZwYZ2TiLWd3TxqwxvuFF3NBW1E/wdEMKUepqfytSgY5qTh+PeGUoDpDb3zMetFBTLjC
        Er6/v6Y1Fz4M2VTzRZA0WypHg8/oFC+zsT0BooQ==
X-Received: by 2002:a05:6402:1603:: with SMTP id f3mr29666969edv.274.1628514685509;
        Mon, 09 Aug 2021 06:11:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsBn38E/01SuiowZudPrXAASccbbFYi5v/N0fNRNffxu2X4kYSHdNIQQP0mWfQ0n1EBaDBhw==
X-Received: by 2002:a05:6402:1603:: with SMTP id f3mr29666944edv.274.1628514685342;
        Mon, 09 Aug 2021 06:11:25 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id cf16sm8023425edb.92.2021.08.09.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 06:11:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: samsung: convert Exynos3250 to dtschema
Date:   Mon,  9 Aug 2021 15:09:34 +0200
Message-Id: <20210809130935.80565-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809130935.80565-1-krzysztof.kozlowski@canonical.com>
References: <20210809130935.80565-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Merge Exynos3250 clock controller bindings to existing DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/clock/exynos3250-clock.txt       | 57 -------------------
 .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/exynos3250-clock.txt b/Documentation/devicetree/bindings/clock/exynos3250-clock.txt
deleted file mode 100644
index 7441ed519f02..000000000000
--- a/Documentation/devicetree/bindings/clock/exynos3250-clock.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-* Samsung Exynos3250 Clock Controller
-
-The Exynos3250 clock controller generates and supplies clock to various
-controllers within the Exynos3250 SoC.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,exynos3250-cmu" - controller compatible with Exynos3250 SoC.
-  - "samsung,exynos3250-cmu-dmc" - controller compatible with
-    Exynos3250 SoC for Dynamic Memory Controller domain.
-  - "samsung,exynos3250-cmu-isp" - ISP block clock controller compatible
-     with Exynos3250 SOC
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume.
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/exynos3250.h header and can be used in device
-tree sources.
-
-Example 1: Examples of clock controller nodes are listed below.
-
-	cmu: clock-controller@10030000 {
-		compatible = "samsung,exynos3250-cmu";
-		reg = <0x10030000 0x20000>;
-		#clock-cells = <1>;
-	};
-
-	cmu_dmc: clock-controller@105c0000 {
-		compatible = "samsung,exynos3250-cmu-dmc";
-		reg = <0x105C0000 0x2000>;
-		#clock-cells = <1>;
-	};
-
-	cmu_isp: clock-controller@10048000 {
-		compatible = "samsung,exynos3250-cmu-isp";
-		reg = <0x10048000 0x1000>;
-		#clock-cells = <1>;
-	};
-
-Example 2: UART controller node that consumes the clock generated by the clock
-	   controller. Refer to the standard clock bindings for information
-	   about 'clocks' and 'clock-names' property.
-
-	serial@13800000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x13800000 0x100>;
-		interrupts = <0 109 0>;
-		clocks = <&cmu CLK_UART0>, <&cmu CLK_SCLK_UART0>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
index b0f58a1cf6cb..c7b07fcd3fa1 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -20,6 +20,9 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - samsung,exynos3250-cmu
+          - samsung,exynos3250-cmu-dmc
+          - samsung,exynos3250-cmu-isp
           - samsung,exynos5250-clock
           - samsung,exynos5420-clock
           - samsung,exynos5800-clock
-- 
2.30.2


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5873BC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 342EB64E26
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhBKFZB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 00:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhBKFYq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 00:24:46 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E696C06121F
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:46 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 18so3019705pfz.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=drLaSc5ZM86pYsr4qLGvKU8aVv9tTxJbObF+iwNMmEQ=;
        b=jp6hj6pAZiQPW3brKYdJFQwHu7V/w6I6J6wMmvcoskkhHdvU5VWS3StPS6ZKXC0vDu
         fRLGvDYkHBrB/12nBLeQjy+uAynaTZfcN+UCbE9hsP8CJP4KrsMTCtWUE1+eCR187F+Q
         0lkoF9qUAj3hkLRMVH5+eOY2Zpa2qUcMd7YPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drLaSc5ZM86pYsr4qLGvKU8aVv9tTxJbObF+iwNMmEQ=;
        b=SgHZp95OlGKfnPglBR4Q1M+U3Ti4Z8vUeBE4qVoeX1L7ETMI8WaIHnsfwEsJQIKvg3
         49bHSzx9OlyaT3E4K7N5JBZN5RGa+BR0leQl8YJCTl+viDV3a7Q2jd+vjQMUyA5Gmbje
         QeRAdYI8Fp1VWIXx++v61g2ND4hwAO3RpbqGhjYOxMSDCPxsbdsNAEQUliQokajWRODC
         9LSvSMN3MjAf6Zqpmk0euQ1hNdrtLSMM0107RdEi8FyZyOFitPQRom5WVtp1vCBjOBTL
         Vhv5O0ePDTL4UXTrql3lcnEOfIbohcWz7MrxvteTlFxVXlhpo3UprGwjJclZkUii2RAb
         JzcA==
X-Gm-Message-State: AOAM533ToGwHeNccobGAgD3ZcK6YAKG/i58CiPMIMX7rn6k+Sa2colwb
        qKsg2qZNUHrX6gCgzz3LWPPJhJX8ZICt50TS
X-Google-Smtp-Source: ABdhPJyHpMF49V0rRYm+e1K3qaBAEMF89qgT53q/leQhoUKNZHISqHdbh9vE3U7pIb57dPPHmnMhXw==
X-Received: by 2002:a63:215f:: with SMTP id s31mr6408465pgm.146.1613020965624;
        Wed, 10 Feb 2021 21:22:45 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id o21sm3493511pjp.42.2021.02.10.21.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 21:22:45 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        devicetree@vger.kernel.org
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 6/7] ARM: mstar: Add the external clocks to the base dsti
Date:   Thu, 11 Feb 2021 14:22:05 +0900
Message-Id: <20210211052206.2955988-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210211052206.2955988-1-daniel@0x0f.com>
References: <20210211052206.2955988-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All of the currently known MStar/SigmaStar ARMv7 SoCs have an "xtal"
clock input that is usually 24MHz and an "RTC xtal" that is usually 32KHz.

The xtal input has to be connected to something so it's enabled by default.

The MSC313 and MSC313E do not bring the RTC clock input out to the pins
so it's impossible to connect it. The SSC8336 does bring the input
out to the pins but it's not always actually connected to something.

The RTC node needs to always be present because in the future the nodes
for the clock muxes will refer to it even if it's not usable.

The RTC node is disabled by default and should be enabled at the board
level if the RTC input is wired up.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index b0a21b0b731f..889c3804c251 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -46,6 +46,21 @@ pmu: pmu {
 		interrupt-affinity = <&cpu0>;
 	};
 
+	clocks: clocks {
+		xtal: xtal {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+
+		rtc_xtal: rtc_xtal {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+			status = "disabled";
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.30.0.rc2


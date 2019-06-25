Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C85FC48BD7
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D54C3204FD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y1JwsIjl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732287AbfFYQsC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 12:48:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36161 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732264AbfFYQsB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 12:48:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so17474962wrs.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cM212LJlReM22Z/bSs47ZKND7c0iwlH/sYLmqGtvNPI=;
        b=y1JwsIjllH/q1V2AXG3E9FRpqgb/gJ7a0DxiAEw8wPRhS164tXiVP3fH/2YgiI+nGM
         jM4gF1s8Pu0y4IRmcmaP0i0yeBxIKHdeCBO0h+EU/UTOTmvF9/Bj+H4PGk3DpJUhJASB
         heKSN/MCHDtOY0YN6wJPoWXZNq5uzmnCZkPlBQ3Vk2DhCPFQdiF6baPvZT0p6kMpVHQD
         Md0WAOiT05LJIIsF3Wl78bQRoOhrYb/saLW2FHrh3AEz0/yee7AZGsJ/Sqjq97B76bdG
         b31Pt40Hl4smjHO3OSRVhhJHqzJoihLtCo88grZ+xX5NQXCfCKCPt0ueYCde+88F2lZK
         cvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cM212LJlReM22Z/bSs47ZKND7c0iwlH/sYLmqGtvNPI=;
        b=eIsbxqVGVsn0G6HknK3BiR0DxIjjCMZQQLtaRN5N7cl3HmKbnO0UvKc5oSo1Uz+O6V
         lQ5L0F3nJN1um0wnXl4DRDxDAsmsSph0adULaLE5S8rhBv68y7CsskqUDmJsu/h8O0oH
         5vMPv5rkdY+KeCJ5GYUnBv2JPewTo4ACUR8bZyCZl/WuzhehFCRjJVRT8HrLcQLdW2T8
         u5TrFejuIgIEFOUF+WbqE5NT342cnBowA6fWUzLI9wXAMR7Q1hEVpXXoGzxffh2hl6tY
         NUTFqqIGxtVpDynF89eTxB88w4q/rAVfEsx6iprBoFhEQIa//CE9BHEa0KM7ZXGqy7P4
         o5Bg==
X-Gm-Message-State: APjAAAVWqWEgSulGGGGhFLBYVovyas6fopPrfZIXWhgoAkac9KLbF520
        YzSzAvRg+0NsOzw8+t5bjjvGfg==
X-Google-Smtp-Source: APXvYqwJ4I60Ak49uP7T2OkszfI0IIxti+ZQtTTsDd9vEBP4j6weUpwwGn91vqoS9swHumKVX+UcnQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr28697211wre.205.1561481279722;
        Tue, 25 Jun 2019 09:47:59 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:59 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 13/14] arm64: dts: qcom: qcs404: Add DVFS support
Date:   Tue, 25 Jun 2019 18:47:32 +0200
Message-Id: <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Support dynamic voltage and frequency scaling on qcs404.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9569686dbc41..4b4ce0b5df76 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -34,6 +34,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU1: cpu@101 {
@@ -43,6 +46,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU2: cpu@102 {
@@ -52,6 +58,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU3: cpu@103 {
@@ -61,6 +70,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		L2_0: l2-cache {
-- 
2.21.0


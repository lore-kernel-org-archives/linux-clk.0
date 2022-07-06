Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FF4CCA47C
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 09:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbiGFJHu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbiGFJGv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 05:06:51 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6054B25299
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 02:05:06 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id m6-20020a05600c3b0600b003a0489f412cso8458746wms.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXNec13rQxx7mczo0Bb45Dl1W4/rRz+jQsRU4AeJnZM=;
        b=2KH0c9i5pRILecSD4cAr1i5IG81/CljsGJebd4GrlEu87GGF+p4iLvgg69UypD4DGA
         l545no2gU5djMfQXCkQ13fkRA6JgbOl04rIrM6ABTL0bmmCnR1jciczP2obeGis+6VaG
         v3YHDgcdTBNvuLmF7cDwpiCUQHw2E/SyNMjbz6/BHLG0R1x71jyIulfD0jboY1YyPPIM
         k9BAZp0vE4EF8p5/Xeho4rFX51MilcYI0SEO6UF+eTxIihL0BCZ5GdVEBIFl9mZV70m0
         m3hNv+FivGSRxvIYos1Wgq1x6JMp3lx9XVdmv+NO6xxmbgGCXd+0QaoI5xzy42DkYErn
         qIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXNec13rQxx7mczo0Bb45Dl1W4/rRz+jQsRU4AeJnZM=;
        b=hD7Z5+Egj/joIULGt8ms/JAydX/g8J1HskprdA97QbYVyeIvEvfpSS/n/XWKClJQkK
         rTc33UNxL1mpnQINQE/lQIzvBHjg1BhCyT0aWkgH/d/R2VnVmX/RbJtIjjClkrESFINM
         7MzXuKm7tJLkPPWhLTWWGKFPOKbWNyfjfIRGsUUjafgjuaD/zWmC4aYcqbZwi297F/07
         s8xUu0tAqWPmDfRsj2044JsZlybmpOWRKyGbWCfrzKSKeVDdJL4tZNNEzEvdFsOMMPCW
         gCnpktOS8zfCy+eunpNzHhBqV6t18eYQOEnfw9UJflq+1gpxXbT8CkEhA11vp5irp5uF
         GrcQ==
X-Gm-Message-State: AJIora96uTY8Tq6HHYI6o0rlYzNpn4jmpks9Z/qUWreI7MtTbPlJh0Ci
        2J5ki0ZMlLUcAAvwaSi7sKa/hA==
X-Google-Smtp-Source: AGRyM1toIJ3bBwvAdPj3WgU9vUOPQT1BAvlEHJ5810B7GsO/4J25yaE+bYN0O90J2JbxvuU5axmchw==
X-Received: by 2002:a05:600c:3788:b0:3a0:4279:5142 with SMTP id o8-20020a05600c378800b003a042795142mr38248606wmr.21.1657098301075;
        Wed, 06 Jul 2022 02:05:01 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v11-20020adfe28b000000b0021d6ef34b2asm5230223wri.51.2022.07.06.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:05:00 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        john@metanate.com, didi.debian@cknow.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 27/33] arm64: dts: rockchip: add rk3328 crypto node
Date:   Wed,  6 Jul 2022 09:04:06 +0000
Message-Id: <20220706090412.806101-28-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706090412.806101-1-clabbe@baylibre.com>
References: <20220706090412.806101-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

rk3328 has a crypto IP handled by the rk3288 crypto driver so adds a
node for it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 49ae15708a0b..96a7a777bae8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -1025,6 +1025,17 @@ gic: interrupt-controller@ff811000 {
 		      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	crypto: crypto@ff060000 {
+		compatible = "rockchip,rk3328-crypto";
+		reg = <0x0 0xff060000 0x0 0x4000>;
+		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_CRYPTO_MST>, <&cru HCLK_CRYPTO_SLV>,
+			 <&cru SCLK_CRYPTO>;
+		clock-names = "hclk_master", "hclk_slave", "sclk";
+		resets = <&cru SRST_CRYPTO>;
+		reset-names = "crypto-rst";
+	};
+
 	pinctrl: pinctrl {
 		compatible = "rockchip,rk3328-pinctrl";
 		rockchip,grf = <&grf>;
-- 
2.35.1


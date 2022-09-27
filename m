Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3301C6FA86
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 07:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiI0H5v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 03:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbiI0H4b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 03:56:31 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BA8AE23C
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:56:04 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r10-20020a1c440a000000b003b494ffc00bso769714wma.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QXNec13rQxx7mczo0Bb45Dl1W4/rRz+jQsRU4AeJnZM=;
        b=7Z4Ya4FJF8izdlJJi0KOSJdYA3ci49E1lmr+MVg9ExH4Yw/daGRLYbHqoztQ0FZdrB
         xjpJNLPVkg8W/HiFxbqgE0IQ/1BunOKYfekMEtWIdLWIwIBjtUTfe/vgxqC5nFi+xuAu
         aXyUoidd6XaoadwuPJc3YLUowY1Peid71VpJrjEOXtRpFEZlUizKBE3WVKBUBKrFrVLE
         ZNjMBcMAwfFieUMKtd6iHcF4174GELX3ZRIO3E4sBpnn5mB1Qxhl+u2HpPBA39mgJsw7
         e7QvfbTXN6jVQgsXQkvuGx3HwCtUHeEIIUZjFE0WNR7tK8Vfoi4E9D0/tCaFaqWeH+gJ
         70Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QXNec13rQxx7mczo0Bb45Dl1W4/rRz+jQsRU4AeJnZM=;
        b=Wz+v24e9V73GtwNDhtWvxYrke19WdCUX+tT/iCQLf+ITaYTg/9xSDl0H4wwMraZU44
         ReE5lNkJODvN8vE5uY8uSdO8e1tquQCFLFa2LIM9bGwc7F9UAcMMe73dAHV8hPMtAJ6+
         W/N4m5FlJPCdLfV4CsFeGa0g0qMPnSHzvGD0h8mtFITiSegIckglPyldMAjNjDZKCwHa
         W0/mvCs8gybQSHnKdt4RrQDqFHHuPPwL9sYqL/1wwJ+UGHogrPKIW83hiani9ORtJalO
         utMMjbqNox7v3kqfuE+eZ7qV7UhxAl605yP/s1DU0LcsgxBY+zgGCkD3c+p+vXfdoHA4
         i9fQ==
X-Gm-Message-State: ACrzQf1q5S//ShVDQECCoIbF2LoYPFY73c/c279ZCzSK9rrLk3AYcJL9
        ORz0TNi26JTCNJXJmnVTpJZbuA==
X-Google-Smtp-Source: AMsMyM5nnhYhQwme3zvGgjZnP57vTakH5++Ar9MdcosaQ773rvsfR+o2LAUTSt89rn6+lT118m1cGA==
X-Received: by 2002:a05:600c:3591:b0:3b4:bf48:9f10 with SMTP id p17-20020a05600c359100b003b4bf489f10mr1721441wmq.76.1664265363834;
        Tue, 27 Sep 2022 00:56:03 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8-20020adfdcc8000000b0022afbd02c69sm1076654wrm.56.2022.09.27.00.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 00:56:03 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v10 27/33] arm64: dts: rockchip: add rk3328 crypto node
Date:   Tue, 27 Sep 2022 07:55:05 +0000
Message-Id: <20220927075511.3147847-28-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927075511.3147847-1-clabbe@baylibre.com>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
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


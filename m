Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD7DC0502C
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 13:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbiIANAF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 09:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiIAM6n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:58:43 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A8190834
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso1340434wmc.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=QXNec13rQxx7mczo0Bb45Dl1W4/rRz+jQsRU4AeJnZM=;
        b=stFp2ZLkJAsW6hGzxfz+PRuE4PLjXsmpU2vPFtfvFB4D4UY7QRGYTcmrZDewn8b8Ai
         s3KNutoE3J5bhfFRhTK0Uzt5uo9TUlMly5jaflRtPoh2XyUwX5hk/W4yGlb57OT53GcY
         a5QztEb4kIG7jRm8WUgf/+eeUX/8qICHMBJxuL4cfoRw90Izq2TPrlnE7qyp3fkwUvBb
         cdgmHqzVPLDdtLVDMLG/0GirMrCRHYDk2kjjzGnopMKhGabvPyaH52uaJp/ihYkD/83h
         AfLwURWnLcWt7gqHDDqHx+H9Nj6B/lWBDl1hDRDJM4wwF9AulrGJJici9hKemQ98OhwO
         m6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QXNec13rQxx7mczo0Bb45Dl1W4/rRz+jQsRU4AeJnZM=;
        b=t+Sd08B7H9ECypqMC+htZtAoWEYYws1oqShBWnAy+i7T/gbdZ7kfL8JQ473eFNhGrR
         ISOtV9TzJajEPor5JoU5nT5ESvKXT4hymvsejmSW2ivxpNACMOljXR23cSgAGCUFM1XQ
         VH7Itl8fe87fX9nrysfZrf/ktwyQdnRTUeG+HyAnsD2qHtWXHshHbORjz7bs0182RQI5
         lYbZeeqQWv0WCBgXvNSXHX56RDLHp8hW7SDTZH+kU4OfaoM2YPOxXRPAo8G6nipNx0zg
         y6q/6zFa7/0UOP/ymZRH3tlQiMdsW/2vkVZ0+fhpY/ZhU1IeyH/Ik4bKfjmsdr+uCTRO
         4quA==
X-Gm-Message-State: ACgBeo2N4uDBLPV5pnWJQcUFuemmrQfFUrXaLrLmfBvHLNeQrVLzix0/
        9BnbbXXUa3S4FxiLlQOYQ/1kyA==
X-Google-Smtp-Source: AA6agR6kskfAoZag4yYUzmRw/gm3W6IjBrrVyQaAOK+QT10cru5zUronjFtmjvUBalKY+JyRRJLqPQ==
X-Received: by 2002:a1c:4b01:0:b0:3a5:94e8:948e with SMTP id y1-20020a1c4b01000000b003a594e8948emr5115728wma.197.1662037064747;
        Thu, 01 Sep 2022 05:57:44 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:44 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v9 27/33] arm64: dts: rockchip: add rk3328 crypto node
Date:   Thu,  1 Sep 2022 12:57:04 +0000
Message-Id: <20220901125710.3733083-28-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901125710.3733083-1-clabbe@baylibre.com>
References: <20220901125710.3733083-1-clabbe@baylibre.com>
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


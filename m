Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA26C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 08:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbiEWI7n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 04:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiEWI7m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 04:59:42 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFE03F311
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 01:59:40 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id a38so10244987pgl.9
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
        b=X2xZIXhmJUlFUqC3yKU35eJzJRk0/e3r+c8tWahEJf3KPE2r2Shc1G5fNKe8xOKqFj
         LPCOssfEm9wvBZ9+ufc07zRl5ZR/EeBa2ro1UOzK5bsJKGQn41AyMAyssS4QFwyZgkTw
         oWLAJARJfKXShDez4cvMjpfj+7pC3SKDDKLCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
        b=5q7JRI8DrvkiI57u3fWPywTdJN4tBpCtGDlD2MjdaHQrzc05QxCJDSU5OQGUjh3Giy
         AESjIx/1TMQRh+YhQEKfe+dVwpWL6/mcawZdd9u4UYZBDRxcE5zPk8MJ4r5jhd8jrSFj
         VAQFdnJkYr3ZNgfi1HgOVyBhh+2pm0m+bfrB20VcXe5gIvT9FilwksgItLU0xBfJqk3V
         1ijxZFWjEWR+hxrBR0Bj9xyJUCw5U2E4LGZjXOZ9MVfFdl0vl9x/WmmPgP4EcoLw4Cbr
         i6qATXIeWvPZOsLZh1LaTU6NlrhizlE/kt9VKdyDz3XSoSRL+euIkgQ0Z08XLkOPC3/c
         V8mg==
X-Gm-Message-State: AOAM531Yi4OPRlq8qjkUvKpq9yC+LEPpfFgpcBOFZh8Oka/TApFURkKQ
        rdBdqeWBKA34eqcXJExnmrmdEQ==
X-Google-Smtp-Source: ABdhPJyKyy+R8cax5BnnVeWF2iS5z85uLAPJvTYypKsPeT5JuXm1sykaEWUSesO19CI0VaYkJIQvfw==
X-Received: by 2002:a63:5563:0:b0:3f6:89b:89f3 with SMTP id f35-20020a635563000000b003f6089b89f3mr19106153pgm.419.1653296380565;
        Mon, 23 May 2022 01:59:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1b8:7eae:9793:ff95])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902cf4b00b0015e8d4eb22csm4524719plg.118.2022.05.23.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 01:59:40 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: mt8183: Fix Mali GPU clock
Date:   Mon, 23 May 2022 16:59:20 +0800
Message-Id: <20220523085923.1430470-2-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523085923.1430470-1-wenst@chromium.org>
References: <20220523085923.1430470-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The actual clock feeding into the Mali GPU on the MT8183 is from the
clock gate in the MFGCFG block, not CLK_TOP_MFGPLL_CK from the TOPCKGEN
block, which itself is simply a pass-through placeholder for the MFGPLL
in the APMIXEDSYS block.

Fix the hardware description with the correct clock reference.

Fixes: a8168cebf1bc ("arm64: dts: mt8183: Add node for the Mali GPU")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 01e650251928..6ced76a60aab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1368,7 +1368,7 @@ gpu: gpu@13040000 {
 				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "job", "mmu", "gpu";
 
-			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
+			clocks = <&mfgcfg CLK_MFG_BG3D>;
 
 			power-domains =
 				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,
-- 
2.36.1.124.g0e6072fb45-goog


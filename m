Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81C9CCA473
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 09:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbiGFJGg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbiGFJF5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 05:05:57 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FB924BFC
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 02:04:53 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m184so8445688wme.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0VQZblY3ilqDl88ksU7sNdmpCxvXcKe3g1VMncWlyM=;
        b=e0yxJClSSXUpxDCwHaDOIvRbSdrRABgnEeecbOpuZA4XLCVBkpW4gXL+Wk1VaIiSVL
         /yCdOstHJFcouC915CbdVqS7Tx868WNSlZHGvvOdjzkN+8V4Iv948hnotFeMmebif5KJ
         jIcJMhNoBQlK/G0WDrkfLcATnb9vue15d+/tkV0tTl32cpb+D5dpTGg0Xj77/c19ZvxH
         WPqz6PrZNnUt8yLrm11Rz6kMcDArUEH6QWDdDV8MwpK3kf9HDJ+QTxhEc+4S0/vzEyPb
         3lGPUJhBlXEb7UCNljr3yotpXx9k6NmWl69/f13H4yxs8XCnIHf4nt4r8hN3UbP+WjrO
         hs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0VQZblY3ilqDl88ksU7sNdmpCxvXcKe3g1VMncWlyM=;
        b=6rUdt065EhfIkaYkv3qePDiI+nGyX1spqX1NwMmSqO5Yr16TLd8uO2Q47fWv3IX1gv
         rxi9woBA/iSqB2rFyTLYfDbddnG9vy1tJdbEA2qcvqbitds91y/HjgQ0Dlc9kc93Fl5S
         SmUcyq2K/oKT/4s/0eM4Vq2RM4pAyhhB5gR219X8nb/yuTMqPeW29SMwE0EwzjWFYDyC
         InJA72yqV7N/uc4BvM84+rjaWic7AS5TcZeDUy4TzELE4OlOgcpkcaCJ7eAQC5D5KWUS
         9XoUXUtjMs+Dk01/Uog23bBIEnJb/2CvMBU3Qc2Wtw5zl0FhhTSsHyhoEYOcRoAwEl7u
         iSXg==
X-Gm-Message-State: AJIora/EBf5k7qsUBeLc3NCAxkTq/LiALfUPeay17GRH7GK3f2POcHSn
        q4Hdx3W/fL8O4Fi8xVOGeKa+Jg==
X-Google-Smtp-Source: AGRyM1vhku6FFRqMSgg0ZToVK+4jD8sS/eXzzi4dV/619Zhx8Ilio+pxWWjXHv62NgKXwOO5OBzU6w==
X-Received: by 2002:a7b:ca54:0:b0:3a0:522c:d0ec with SMTP id m20-20020a7bca54000000b003a0522cd0ecmr40784122wml.63.1657098292893;
        Wed, 06 Jul 2022 02:04:52 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v11-20020adfe28b000000b0021d6ef34b2asm5230223wri.51.2022.07.06.02.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:04:52 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        john@metanate.com, didi.debian@cknow.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 19/33] crypto: rockchip: add support for rk3328
Date:   Wed,  6 Jul 2022 09:03:58 +0000
Message-Id: <20220706090412.806101-20-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706090412.806101-1-clabbe@baylibre.com>
References: <20220706090412.806101-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The rk3328 could be used as-is by the rockchip driver.

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index a635029ac71d..c92559b83f7d 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -202,6 +202,7 @@ static void rk_crypto_unregister(void)
 
 static const struct of_device_id crypto_of_id_table[] = {
 	{ .compatible = "rockchip,rk3288-crypto" },
+	{ .compatible = "rockchip,rk3328-crypto" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, crypto_of_id_table);
-- 
2.35.1


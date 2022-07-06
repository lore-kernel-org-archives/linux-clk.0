Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E34CCA489
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 09:07:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbiGFJHs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiGFJGh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 05:06:37 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622A32528F
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 02:05:05 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d16so14735586wrv.10
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 02:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HcULCDUWUOb7zL9pkaT5teTJK7hgsOh6ToY9+UZMac=;
        b=jzmrHnL6AP5JP5ynKqMYe5yX2tYmFdVE8TwhZFHgWJFWW0o1xKFCEzfUtnEChQnGm/
         A6fQvxFRl2SJpiM4Zj/xug3hmVwSmyjac1QgUpHLeezzF65VvWPXm1axFpEEUOV6/Tvq
         FmFmnBGkQtH8EGsxTiOQ3zh9mBrKz/VYH64Ram1n1qoiNJN0DeG0dPQXrNtxp3U+wfWW
         e1NjKc352R2J8iC4t/8fmbX8ZkB6Zor6dVY+HZIwU2XX5wv7jTxP50GPf53rIHxA+20F
         12t1xepnNyAfFnfApYwl21tsc0KoW0p5KIZ1vlvUXF4b+4tt44fifPg2WA5jVg9InUm5
         TAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HcULCDUWUOb7zL9pkaT5teTJK7hgsOh6ToY9+UZMac=;
        b=M/Yl8s49TnMp34DDnplgEvDmTmUjge2hdYivR0NQ/SHbTS633GOlOMP2MCFrpOIf5r
         /n0eF3KGNI9YOYIAzmuIa/a2PT7DlR6aK+P/vNnFeY+OHSGaA1uifoIPzsCu3IEq9eMi
         el7ZP1Y6iEr0iS3AXsmNhrcuouXOngF3sLqWPM6bPfQh3VWbXYYBjbDNjpoWrs1UVHOz
         DQB9VmZ1PA3+kf3E3dSF3KatxkQTQJFcWcSbCBck4HpZij+JXCVKztCUIVlf2yjubxPL
         BuIilYqBVoRtsso1S6IUPoiwAXnpOm9TfbR8MqrwhovFF98tMzuzLOljofyesFHSVeZJ
         cBuQ==
X-Gm-Message-State: AJIora+kHbgwuxQRNgfOVsyeY8h011fGCrCpP1UTEsDH+cLHsPi6G+fz
        lc2wn+R+xe3+M9vpxRAexUUAjA==
X-Google-Smtp-Source: AGRyM1vRD4rRZCFfC8x4QQPMMOy8cjZ8voHj35W/8OT3F5k7JS0Li37UwyHkRVf/XoUVjf0EDwXrnw==
X-Received: by 2002:adf:fb08:0:b0:21b:af81:2ffd with SMTP id c8-20020adffb08000000b0021baf812ffdmr36963912wrr.685.1657098305026;
        Wed, 06 Jul 2022 02:05:05 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v11-20020adfe28b000000b0021d6ef34b2asm5230223wri.51.2022.07.06.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:05:04 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        john@metanate.com, didi.debian@cknow.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 31/33] crypto: rockchip: rk_ahash_reg_init use crypto_info from parameter
Date:   Wed,  6 Jul 2022 09:04:10 +0000
Message-Id: <20220706090412.806101-32-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706090412.806101-1-clabbe@baylibre.com>
References: <20220706090412.806101-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

rk_ahash_reg_init() use crypto_info from TFM context, since we will
remove it, let's take if from parameters.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index d1bf68cb390d..30f78256c955 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -78,12 +78,10 @@ static int zero_message_process(struct ahash_request *req)
 	return 0;
 }
 
-static void rk_ahash_reg_init(struct ahash_request *req)
+static void rk_ahash_reg_init(struct ahash_request *req,
+			      struct rk_crypto_info *dev)
 {
 	struct rk_ahash_rctx *rctx = ahash_request_ctx(req);
-	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
-	struct rk_ahash_ctx *tctx = crypto_ahash_ctx(tfm);
-	struct rk_crypto_info *dev = tctx->dev;
 	int reg_status;
 
 	reg_status = CRYPTO_READ(dev, RK_CRYPTO_CTRL) |
@@ -281,7 +279,7 @@ static int rk_hash_run(struct crypto_engine *engine, void *breq)
 		goto theend;
 	}
 
-	rk_ahash_reg_init(areq);
+	rk_ahash_reg_init(areq, rkc);
 
 	while (sg) {
 		reinit_completion(&rkc->complete);
-- 
2.35.1


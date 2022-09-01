Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4F7ECAAD1
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 13:00:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbiIANAw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 09:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbiIAM6s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:58:48 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A857B92F54
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:50 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso1399331wmb.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/HcULCDUWUOb7zL9pkaT5teTJK7hgsOh6ToY9+UZMac=;
        b=KapuCx5qj8Ak04KhbnwPqKSGbQrPvjiwrvC9FAP6XabsrqP7jSPl3uXoAHiKDm58C2
         n13dpg2d7ShJbWPRVIR9GoVy1XRJjrjsFodq530Ld95GoH5cq1kjGXOdku4IvMdomFEr
         gfdT1o0Tg8AQnli9LHEPrzjF0eKErwvvgzB/trTFqMf34aSaZzre/fK68dMcz4cweD3T
         AQk3rCCbgo2g+aGG1/sHYDSLIsOab0uI+w8/pr0rdjshqKJT2XfkTXhXGCBsKcVRfE+4
         FdRuCTR6W6qXWe3ccAdN7m0dm1P9aDsiy+kEUehT/d8YcBIkRKNz7Hdd6dyjL7OGRGfL
         ua8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/HcULCDUWUOb7zL9pkaT5teTJK7hgsOh6ToY9+UZMac=;
        b=lG2k+cyLf+M5hCMY7qcuv31XDgyNVi60VQ3jzpsplA/1cbgoBAgEpbqsId9uvPJ96a
         5M0AaWucj1wIx2lpJpG0LoLmE3d8tMIosmgzZM4nWBARdGKpkdcz8XgqT8eq+4qPjR1V
         Bu2SoeptMQJQ5gldquvWGXQRSZBmwqb3lMscXchA/FlDIjRbECotRCrijy0cp6o9axW/
         t049Uo7rmY4g+saOLd76BoibBmAn6AkpvqEr2gzoB3tIu0bU9dnIV9pthi23nERTneXS
         MQjiRarN2H3ETOPrHkJ0jssKv38BDt35mL5XnIoSxjs8I+pEZUCG0+Qv4Ch/+tlT6dEh
         VUzA==
X-Gm-Message-State: ACgBeo3Lzmr6xLhB4nPxr8mPPfz13bm6a+/CnZUktV+slOqD0hCNIQdK
        g7GdvO9ukaajXe3OYL16OBKyTA==
X-Google-Smtp-Source: AA6agR4rGPULOSXMFSjrpbzgg23HBh+1+xyEWaMLjkNI2rkP7/dBEeFCgkzvN073oVZro5isX754Mw==
X-Received: by 2002:a05:600c:3d93:b0:3a6:1ac3:adf8 with SMTP id bi19-20020a05600c3d9300b003a61ac3adf8mr4997806wmb.125.1662037068719;
        Thu, 01 Sep 2022 05:57:48 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:48 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v9 31/33] crypto: rockchip: rk_ahash_reg_init use crypto_info from parameter
Date:   Thu,  1 Sep 2022 12:57:08 +0000
Message-Id: <20220901125710.3733083-32-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901125710.3733083-1-clabbe@baylibre.com>
References: <20220901125710.3733083-1-clabbe@baylibre.com>
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


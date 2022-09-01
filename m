Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C49C67868
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 12:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiIAM6u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbiIAM6U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:58:20 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971E28C45B
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:37 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so1393185wms.5
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YefmDD2ry3pwsMvqRhlFBCTRYluZUGamucEuHQLyttA=;
        b=2hXx+nQSQVcTeqlzndNPsL0k9VCNN/agna1n1/p8AEgMN0bRpx8wFa6bBq2v9gVOPS
         htlvLOhNfleYCkpfh3I6c+htV3gErQAXcBF8IUm/PUYQ74o5YeHad+xBuOhonlVq16QM
         neE31TDLR/f9QHnAxmMUijneA39w/mUY0XzCJhIE93exea/YqkXo1KEVwbuswqALar5U
         D/0GM9T7sUu/D1O6bWCmFmlPa2E+PMvDjjKFeYiYrAB61PdWf3GmQXwwFKy1Fw9WGig7
         69CecXa4PQj2cE7ZZTmQvXVOPsTZuMNKh1lnOdhwUMfQlOAItlghRg3F0RAkckOq4qjb
         1vXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YefmDD2ry3pwsMvqRhlFBCTRYluZUGamucEuHQLyttA=;
        b=FYPHJaQzcvNWqxFjV1xmboh6d7XdHMU4fPLJF1eMd00BfiFYOtjdTrocE+vJws9hM/
         rEtID1s6qySHk89VoYGHicH4FwF0vILrMGrPN3HL+KXN5e1Rv6Sge+mKQGx68xm+jMP0
         4WJAVbfppS3CAeo1EVykvngB0RLhoZBUmaB3k6zZvAKk6SnapU670QjyLxkUx12RGkQJ
         jYXq80DCFvWtKJI/tt8qfxmRMl25ye0yVmOTmmXgTk3VCN09gvJllMG/gn3zVMqOodeB
         T0m3ajTNM2u2FChGTBc9Q/hvxocGI/tcqEbMt2zd+8SQ2Lx2Tb51F1XCrEU9UGGFaw44
         DT+Q==
X-Gm-Message-State: ACgBeo0eypPCmAsrlvt+a0Z09ws8ph8742QkLiL1jU2NAFCJ+GpHQbTq
        44Gb+97dYht2fxBRVU4TI4fLlA==
X-Google-Smtp-Source: AA6agR6xy35cPfSsVkdrBykc9jFpEP7+G228a6e7gPMMC3IANHfruJbizfV1qsviUsdZ11vyGB7EyA==
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id d6-20020a05600c4c0600b003a54eeceb4bmr5383280wmp.151.1662037055409;
        Thu, 01 Sep 2022 05:57:35 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:34 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v9 18/33] crypto: rockchip: fix style issue
Date:   Thu,  1 Sep 2022 12:56:55 +0000
Message-Id: <20220901125710.3733083-19-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901125710.3733083-1-clabbe@baylibre.com>
References: <20220901125710.3733083-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch fixes some warning reported by checkpatch

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index 1fbab86c9238..fae779d73c84 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -336,7 +336,7 @@ static int rk_cra_hash_init(struct crypto_tfm *tfm)
 
 	/* for fallback */
 	tctx->fallback_tfm = crypto_alloc_ahash(alg_name, 0,
-					       CRYPTO_ALG_NEED_FALLBACK);
+						CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(tctx->fallback_tfm)) {
 		dev_err(tctx->dev->dev, "Could not load fallback driver.\n");
 		return PTR_ERR(tctx->fallback_tfm);
@@ -394,8 +394,8 @@ struct rk_crypto_tmp rk_ahash_sha1 = {
 				  .cra_init = rk_cra_hash_init,
 				  .cra_exit = rk_cra_hash_exit,
 				  .cra_module = THIS_MODULE,
-				  }
-			 }
+			}
+		}
 	}
 };
 
@@ -424,8 +424,8 @@ struct rk_crypto_tmp rk_ahash_sha256 = {
 				  .cra_init = rk_cra_hash_init,
 				  .cra_exit = rk_cra_hash_exit,
 				  .cra_module = THIS_MODULE,
-				  }
-			 }
+			}
+		}
 	}
 };
 
@@ -454,7 +454,7 @@ struct rk_crypto_tmp rk_ahash_md5 = {
 				  .cra_init = rk_cra_hash_init,
 				  .cra_exit = rk_cra_hash_exit,
 				  .cra_module = THIS_MODULE,
-				  }
 			}
+		}
 	}
 };
-- 
2.35.1


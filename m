Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58016C6FA86
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 07:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbiI0H7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 03:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiI0H5y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 03:57:54 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED610AF4A7
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:56:25 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so564081wmb.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YefmDD2ry3pwsMvqRhlFBCTRYluZUGamucEuHQLyttA=;
        b=b6cyFsVdHpavnTM+FghMbIremImdbNLhZmESi/YDiLg9fwtm0QB7WjxwYZaUgSVT22
         adTJB5aBAQo5ybo0VDTQhr7MsEtfmfI2pnxOZgN/OCHlCZ1T919He2kgIWwO0IxebmSr
         XMOJ7FzxqpmgVaGM95K6alSXq+rv2ih8+odCnxRElBu6w/O3E8UbuAlOC9aaQCMBCkpx
         JGo+ViAbGhq9PYLNKl0BSmrGVkHdbHXFAlStXqDzt6tNplT4hvECzVveS0fD0rmmRV83
         dzZox8w9RS+kY5hgSTAer1oJkQBTdTajgqHDVS09yMcPtSJ+34d5Kk8WSLCkIejgGdyu
         Z6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YefmDD2ry3pwsMvqRhlFBCTRYluZUGamucEuHQLyttA=;
        b=Qlp8DjLUw7wUAzrksNg98jMj2nOWyGEKrucegD4jhHAeMC6YovWbtNTcmKhMgM9pwO
         BIet9s1tr0jX1tBS8LqRw4SMKvaL+SKfa26xuVsaNZL4VbxErZ62pKWFsC+C3hxWJ+di
         9x+jujlUMT4y/PGX71EWQoErIBstyW6GPytiMZFVFwGSVM7/pG09O3JQZBEG1SJRicUp
         RlG/IuyyezIHPpG1ecXLITbW81ZKY+L//vsoo2dWAbT/qQd3ETkr8/onxuaS0BaHxjVK
         RuU18/T7GSjlgmGI2YjPm/0ubgTCL41Gy/yRYEMD49S2mdE3PBL85sOL6rdYb0V1I/fu
         lwQg==
X-Gm-Message-State: ACrzQf0nif3VFJyVQR1/q4tsSo88zGHa6K+G21vKOuNbKttL6g3fsd4T
        2kMFCWcEPovqk1z4lZ9jHL5Isg==
X-Google-Smtp-Source: AMsMyM4/rNZzgNJTepN67xDHUXBr/ay4ncfQEeuGV0yY19vs4s1TrxLKZO2Q4CYlVMNJk0l0nCKOMg==
X-Received: by 2002:a05:600c:6025:b0:3b4:8c0c:f3c9 with SMTP id az37-20020a05600c602500b003b48c0cf3c9mr1592002wmb.206.1664265353398;
        Tue, 27 Sep 2022 00:55:53 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8-20020adfdcc8000000b0022afbd02c69sm1076654wrm.56.2022.09.27.00.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 00:55:52 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v10 18/33] crypto: rockchip: fix style issue
Date:   Tue, 27 Sep 2022 07:54:56 +0000
Message-Id: <20220927075511.3147847-19-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927075511.3147847-1-clabbe@baylibre.com>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
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


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35A7C6FA92
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 07:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbiI0Hzk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 03:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiI0Hzi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 03:55:38 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6847FF9E
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:55:36 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id t4so5973885wmj.5
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5oq+K0wpCSsh7jUwt6+vmm/hcvr/21v0i001Dyw+Eww=;
        b=lxkYHvxCAqLWDWDvxXrAB4By3mwYic56in2nci5DWHkW2XvI9y0c3OwcDndIaqeuVH
         9BNiqKAvKp9G9309RaiEkJo3gtb0V6Z/qZCUDm+/CYZtepcNj/c9MPZSUiaIQxD/W8dO
         WdiR9gH83jEx58wTjJKQiD3jsfKZKh/qHTfk3bV7eqnHdwoSnnMK15BF9yD6XqQwZiNA
         6amP1UrUXKNWHgsHsCbwmrmMkFXODvYbiXP+TBgU6EbwvEaQA69U6s+58UqJYfFmJybN
         e+BqrhRU7AxpaHcCk9hEyJBqRN035GZCdNOMn68M49Gi/GMyAcYfskETXbWO7F5j2i2o
         AmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5oq+K0wpCSsh7jUwt6+vmm/hcvr/21v0i001Dyw+Eww=;
        b=m7Ooow5FpQ6uVDw9q3un3HT79XdUlJJhTn8wNgDBa7pvqvUth/pJd164trT5llud++
         5EP8eYnZTRK+la2aCigYkd2cPINRIVCWNvd1b52UUeTBEp0o4XB6s5pIgyTA/aQzpnZY
         6IAVhBzyTOZMBQr0h70FeNdTFgH9c4rT2czGcPyZVHvSu0BuPECMnGqx9sJ/B14l0mBU
         vP7zI7vD9rFNXMw+Xq2BtOLYSo/YUgxNeSv1tCwm5yrz0xGtfmjalneUYAcEb6JwSsI/
         hwv0StbPdygQw5d+tmAng2YNf6NOw6U0x0MN3+fSEjtfA715eafY2j0YJstG8UcbyU7s
         wtJw==
X-Gm-Message-State: ACrzQf17K40OrqpuCHSvpGG3nvpZTjSPEzM53sAzi6NzEUt67OdncwML
        8RtLRgyxpQ77ixsUW4AJOOHymw==
X-Google-Smtp-Source: AMsMyM6/Owm7TylvFkkxOOlFObTA52Tc0HgmezFZ3ZDKhH18ki2KYuexhCEF+bw3cOR6XQKPKBY3KQ==
X-Received: by 2002:a05:600c:4a9a:b0:3b4:78ab:bae5 with SMTP id b26-20020a05600c4a9a00b003b478abbae5mr1653203wmp.114.1664265335209;
        Tue, 27 Sep 2022 00:55:35 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8-20020adfdcc8000000b0022afbd02c69sm1076654wrm.56.2022.09.27.00.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 00:55:34 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v10 02/33] crypto: rockchip: do not use uninitialized variable
Date:   Tue, 27 Sep 2022 07:54:40 +0000
Message-Id: <20220927075511.3147847-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927075511.3147847-1-clabbe@baylibre.com>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

crypto_info->dev is not yet set, so use pdev->dev instead.

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index 45cc5f766788..21d3f1458584 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -381,7 +381,7 @@ static int rk_crypto_probe(struct platform_device *pdev)
 			       "rk-crypto", pdev);
 
 	if (err) {
-		dev_err(crypto_info->dev, "irq request failed.\n");
+		dev_err(&pdev->dev, "irq request failed.\n");
 		goto err_crypto;
 	}
 
-- 
2.35.1


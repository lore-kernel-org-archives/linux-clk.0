Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A08ECAAD1
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 12:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbiIAM5e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233479AbiIAM5X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:57:23 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C4880528
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:20 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso1339692wmc.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5oq+K0wpCSsh7jUwt6+vmm/hcvr/21v0i001Dyw+Eww=;
        b=DdLEChHulzdasOuIWPUlvh6/dx1pv3JVup4WbLGKn8GZsDUWAeHKhRXg8s3zgqoS4D
         zfCnpWVLLQgQDTgIhJgSaYxq+gtoHzG1yztUdHZk7U1Vb9/PzweyZfmYzy1j7qGMYnp8
         hFCGKvNcS5LLVeuc54F3KGX0w2Fvuf2SVvVrsx43CmfrvZ2Evu8fU0KYNTCojgdBwW2W
         hNxd2bhrWhmMpKUWXkZmaHK8C8bnBhnTyQ2tpAXZMXzIXdGgb/jPCxZvPqxoSXN2wKUA
         UwqbbkRJlL8aUniD+sedCbytuSuM+u96t5FxdGx5lcNS93a0JsxwRVL+Bc8tVYjmaGEJ
         G4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5oq+K0wpCSsh7jUwt6+vmm/hcvr/21v0i001Dyw+Eww=;
        b=ATwE34GxJETuYP1eAa2XPAhDoNtFYDdiUT9+kmBVbLjFcu8QdsN1/qnXl+TP55BNoF
         yEZGJwoIYIJgLhz9o/NlytrNTmhaDvuVQX359w0FWvvo4hC4GBIlldvefekX31LZZ/2i
         GzKyAd7iqQmeCGQ1wau7AhQ9Ur5NAhI8n4e9vKhcLZfJvx5qpYP/OQR3ryt65Pge9SFm
         yFfqH342YJNiPn1+XyZ7QKG5Ub9mxz+++2WrdZPYP9gRlSeiYckRmnv+GbO1T4uW/CoX
         FLJCHvNJtouILztOyMl3WbHvW6Am7sA8N5V/WZ8zgu1Gh1bkPQeoL1P+B/aRsC4gBh4o
         r1jg==
X-Gm-Message-State: ACgBeo3kH+g7xpsPHc63eKA062GbmlfGQPNluySY0DMvFtbapSM3ezD5
        oo1oy1qmQZv8hoUo05ujXkA3ig==
X-Google-Smtp-Source: AA6agR7sSVB8GDqHA/SNdpU3efGHrOX2Si3u7vU37Gf21cUjmMfyxBMIMocd/FwxLdJzZOAFR16rnQ==
X-Received: by 2002:a05:600c:1e88:b0:3a6:2ca3:f7f2 with SMTP id be8-20020a05600c1e8800b003a62ca3f7f2mr5333101wmb.7.1662037038960;
        Thu, 01 Sep 2022 05:57:18 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:18 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v9 02/33] crypto: rockchip: do not use uninitialized variable
Date:   Thu,  1 Sep 2022 12:56:39 +0000
Message-Id: <20220901125710.3733083-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901125710.3733083-1-clabbe@baylibre.com>
References: <20220901125710.3733083-1-clabbe@baylibre.com>
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


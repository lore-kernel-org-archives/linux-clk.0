Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D89ECAAD1
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 12:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbiIAM67 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbiIAM6W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 08:58:22 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4094BA49
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 05:57:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so1324483wme.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=V0VQZblY3ilqDl88ksU7sNdmpCxvXcKe3g1VMncWlyM=;
        b=gPuilAw3In4sLBTLM/O3vTLJNCLuJQ5jb5eL8ZFv5Iod4QUNem/h1qDSlfrvHCZAH8
         StWFIZtraRSdayz/b8z2Uk255VLarodlWjpxmNQO3x55mRbO6oST1UZ+d/20MkU+phu/
         VaB0M32Q3mv6CrBMLUK+O8MXHkK99vMTSVvNAiCTQ1NSBEaHo2MC/jSe/LyzsaMI4gm4
         W/iQ5YkVSsD+xWGiyvqvVDvSGdeSKISF5mhc1CVLVYFGa8x0vE2b6dBFZXGAU90miEP6
         tebB/BELlN5r4d6nYxD2kXK7h9wPZr15bO+/9wajk8pDXQ+I4em2hC2XVubS6+pmNmtE
         JUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=V0VQZblY3ilqDl88ksU7sNdmpCxvXcKe3g1VMncWlyM=;
        b=TZHO+IbRU3DYEUV5KBTIxGJgmrezl9rEdCrWaFrccwEKY1WIhIADCxPe/voA8M31ff
         TmJaN91P+JZJtUl03akfwLdaBWo/J7dkNONNdYaajIYUnSWi/lURJ3avMlBHx/X25DNO
         3uTcMgIGfAq6O4II2QsgG9OkPW+r29yf0v28tiVFvLQozOKgJLzl/a130DJfH7Ovjtnf
         MyoC1GeXrX9phuHsQkM716gzIGLXuFujnoBYDSENE3fc0dWZwqDmxx1YqTUc3TM4CZL/
         nLx4h3nY7iqAndMR+/4GXMkrmzL+8nFbtagsMUlv0NXR2wyGJKraZy4O1Yd/g/gw7m+8
         lR8g==
X-Gm-Message-State: ACgBeo3j0gan5zaUjWUOwM+o+pBDTe6iKh4xNip/JdGlVJBdNoExES1I
        HTwVmWCF4GfonZR2k9GtEaf2MA==
X-Google-Smtp-Source: AA6agR5+OPEH3cDQuiUwxXjulon0wpg02exBkXOVsbW35hMY72r4YlI1sLLApT1+xM6Cm+7PqZpHIA==
X-Received: by 2002:a05:600c:3541:b0:3a6:28e4:c458 with SMTP id i1-20020a05600c354100b003a628e4c458mr5163013wmq.188.1662037056497;
        Thu, 01 Sep 2022 05:57:36 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d59c5000000b002257fd37877sm15556709wry.6.2022.09.01.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:57:36 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, ardb@kernel.org,
        davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v9 19/33] crypto: rockchip: add support for rk3328
Date:   Thu,  1 Sep 2022 12:56:56 +0000
Message-Id: <20220901125710.3733083-20-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901125710.3733083-1-clabbe@baylibre.com>
References: <20220901125710.3733083-1-clabbe@baylibre.com>
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


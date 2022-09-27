Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C757AC6FA86
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 07:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbiI0Hzj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 03:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiI0Hzi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 03:55:38 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0307B7A4
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:55:35 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso8373538wmk.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2nwWkT4441Zvq5igIAOKA8C0HAjPPXDmTRADPlAyhok=;
        b=FhCg6N8IdLUqYun9zFfNxEKEFxD/HuGTkniM7ShtX24traaLVPnNCQf6esKBn0W/kg
         3yjeiHkQXXz4+27KjUI70493oisSzR9M+ECcruAfQ7DAoW3K2SxW0OPUFapVTtqi9hR5
         DEjiIryUck3YbGPpR/3H1zoaJlaK8HOPpPjJz3u1MSKuAUg07OS5wukM9QalNg/F6WQ4
         qdi5dxstPbe57InTXy89Cw1DxqZFA+D7aWz4xTTnXeUZFjvQ86dPVGGZ5n+KlcS8iQD4
         zk1b82sC3K3UwhhbL3n/c+tgU+UlqcbVBkgl9oi4xF/S1hwsKSLiTcDZ9suJmNp+ZnUi
         bUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2nwWkT4441Zvq5igIAOKA8C0HAjPPXDmTRADPlAyhok=;
        b=nWJeXGOJ7sDdHe2JCTbnCUMA/GBkvnTLB+gfZj3n5Fvn6H5LGJshLvmKw8QzQQuj/5
         tnr6Sntvye4bY3yzvt6VKaYcOdvWOh+P+IPAL/25Kbqyt8tJuJ1CioqLeCXOty3x9mb7
         20CGcmWcRX00oY5rHuqLjxpURQp2tAHxKcCwBRzegr9XvNWGHukf3jbVfCRVULR0kXtI
         0qL3Sl0C8iFkyRqnnUHli6M9wGQh0nbGnHQ9ivcY8YHojRr8xTcQIDrmfDdt943Wbo/k
         iKDmUflfK3hw5Rnxb8NF/EZNoEPpK549u9Hl8WICjwGATeu79onfCPXAUNDz5uhuUBJv
         BN4Q==
X-Gm-Message-State: ACrzQf2yRynY2xnTmUFZJAQ7zqQrk+RTjLwOu9k8KNqaY34SgLZZZbzj
        PjAFiYV/53xC8i1WmhcY0khH1Q==
X-Google-Smtp-Source: AMsMyM6h87WBvVreQkid4R2UnKxsEZtgzHIzUDroAKPttULMr+SwoIKne5+cNdtK+OWCySafkeOQVg==
X-Received: by 2002:a05:600c:4f89:b0:3b4:a6fc:89e5 with SMTP id n9-20020a05600c4f8900b003b4a6fc89e5mr1531348wmq.149.1664265334129;
        Tue, 27 Sep 2022 00:55:34 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8-20020adfdcc8000000b0022afbd02c69sm1076654wrm.56.2022.09.27.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 00:55:33 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v10 01/33] crypto: rockchip: use dev_err for error message about interrupt
Date:   Tue, 27 Sep 2022 07:54:39 +0000
Message-Id: <20220927075511.3147847-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927075511.3147847-1-clabbe@baylibre.com>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Interrupt is mandatory so the message should be printed as error.

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index 35d73061d156..45cc5f766788 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -371,8 +371,7 @@ static int rk_crypto_probe(struct platform_device *pdev)
 
 	crypto_info->irq = platform_get_irq(pdev, 0);
 	if (crypto_info->irq < 0) {
-		dev_warn(crypto_info->dev,
-			 "control Interrupt is not available.\n");
+		dev_err(&pdev->dev, "control Interrupt is not available.\n");
 		err = crypto_info->irq;
 		goto err_crypto;
 	}
-- 
2.35.1


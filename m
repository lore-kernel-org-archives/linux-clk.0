Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90437C07E9D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 07:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbiI0H5X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 03:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbiI0H4W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 03:56:22 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1655AC254
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:55:51 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id iv17so5975135wmb.4
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7ylfTYeCV4qm7Xvrt0AIQJLtkrEPyfygSFvvPlELDM0=;
        b=wbc0SyvXaTABHib78FBmKP0lE8/ezGuglpmYtKia6eLXSGdcnnuFZMkaTGKpXEox4l
         ej+Hu/upuxu6yu9UE0GM8vHx+E47AP2++H7Qcv5gphNO3kGJWajB32KvPh0HH3iwIVgH
         GlfryTyUxdtGkELhzh1hfnyQqVtxXHhRSoHqMDRYSQpykLw1uDm4VkyyVpU1rzYLJsmJ
         grs2Bx7U5y86yamAWrJ9B7/ODTH22xtzlr4xnxhQ+40iT/TuM1TQ4tP00HDR0ymArd5Y
         k0EgwtLUppyzKohuWTHK/iDb4TR1FCbaJBuZ8TRFAUinMweAt42fMZQFiNfxu2kPCw/G
         ADVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7ylfTYeCV4qm7Xvrt0AIQJLtkrEPyfygSFvvPlELDM0=;
        b=XS3wfnrS7m5uY2vV3aGPIgt5Alki1CB0sMHFKphkBfI3oJ5BRAnYMDoyFyT5+JED1Q
         xbXYb2hsIr70ha/zMUNaGaqmrtVLMZdkSL87zvn12YCfXyGsuOGWYJ9BeezC6J9/Cp9h
         tJaa6rKkQSAVt/ca2gYPc8hC7b9Qb6tTr49VinLxNdy5Il/73XmEWrKM+PJ+07d41HNg
         i92lfGPLv+P8+f53QsZ/5P6jrAUFs5BWBbO01Uh/NS3zD6rIwG5arA5s8gtNCtjYUUqF
         oSCfmxY8UF6DQHHuOHaPCGm/NvZ+qJxvxlO9XeEvYjpBaozKbJ+e2vRlc0sjbS4lJS7j
         HQDg==
X-Gm-Message-State: ACrzQf2jDIJjudjc+P/RglvOMEAve4HYjpyAdYjH7U63Oo9nvWnhXX0B
        GMqDi8pGvy/QcbCUzX3MAUq8hQ==
X-Google-Smtp-Source: AMsMyM7KPzoDPDP6P3GJiPjCTQ7gxxhh8hRIjHM6cB/B4uAKtXlN9csha8doRS7dLCk+7FZcdL5dMQ==
X-Received: by 2002:a1c:202:0:b0:3a8:4197:eec0 with SMTP id 2-20020a1c0202000000b003a84197eec0mr1602533wmc.83.1664265350864;
        Tue, 27 Sep 2022 00:55:50 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8-20020adfdcc8000000b0022afbd02c69sm1076654wrm.56.2022.09.27.00.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 00:55:50 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>,
        John Keeping <john@metanate.com>
Subject: [PATCH v10 16/33] crypto: rockchip: add myself as maintainer
Date:   Tue, 27 Sep 2022 07:54:54 +0000
Message-Id: <20220927075511.3147847-17-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927075511.3147847-1-clabbe@baylibre.com>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Nobody is set as maintainer of rockchip crypto, I propose to do it as I
have already reworked lot of this code.

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d0d808564539..4798da736ad1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17702,6 +17702,13 @@ F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
 F:	drivers/hid/hid-roccat*
 F:	include/linux/hid-roccat*
 
+ROCKCHIP CRYPTO DRIVERS
+M:	Corentin Labbe <clabbe@baylibre.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
+F:	drivers/crypto/rockchip/
+
 ROCKCHIP I2S TDM DRIVER
 M:	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
 L:	linux-rockchip@lists.infradead.org
-- 
2.35.1


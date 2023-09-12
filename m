Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C800ACA0ED3
	for <linux-clk@archiver.kernel.org>; Tue, 12 Sep 2023 04:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjILEyU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Sep 2023 00:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjILEx2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Sep 2023 00:53:28 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD38B172A
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 21:52:40 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9ad8d0be93aso16145666b.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 21:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494359; x=1695099159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/QQ+pzGaKCLEtkSfzXPg0nfGWLMjKop4b6FhGuhCMU=;
        b=ZbOmYZW/JAfcdUR2SZj75Ay/9AF60BgUASOAoYifDrqIvxcJJ30D4uLEgk2OzYBs72
         yqKv3KS3oWBK+hLrTR9d0vA8J4F9YE/Ld3aZdaXPOYiocTyQoazMoPz6l2jkH6m4wz4w
         gWxkqY4bDI2ghVadVqRz+fesm5k5KbFi7TRXE90GNgqSQaCtELc6DJzq3ilm9kPiY9aw
         pRSbRbsLfh0qkZojV4HNuJWy8O7lKGio0NGbwlvY5TEsJ3QDsCpfdnsxtRSwRxVbW5EK
         218jukITXdoFqSPYB4qFCyc5hBrth8KZ19+34BKu1e9WrxxlSu7a9JIqKnPbVCZE5S/5
         0VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494359; x=1695099159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/QQ+pzGaKCLEtkSfzXPg0nfGWLMjKop4b6FhGuhCMU=;
        b=Aa09+CTh5+KS+VO0MIfEz9Mm4sL34g1/Q0LyIW+F+rROcIvAg/q2qSaLVXCLcE5GK3
         2O0az5Sd8Z0n+4sD4eYrDJebqKqYHsKLAA2h+qT2IUO1mMMuEecWRSmZ09JELssy+ngC
         dUQOMcgzuexwYejTCdO+7EZydwQc2wJGBiLMn35xw6I2iRiJ0ZCubEn6XvjCptO286cW
         myJiEX3kid4PmLcBghYR+fGFHB3DP9jDMR0a29aCW04MnQ9XnULUOaqXoNArVmiH2JZa
         78+4QTYJ0P4sF5nBZNNsKpmt6Z0Dmsj9ZrquydN/MyeSSDJ1Ii+2CvUFOCefppmvTTMb
         m14g==
X-Gm-Message-State: AOJu0YzDfoPB5tudz8YzpCDBu0Sj3/S7dxfLCMftf8CehYnkWjcC0z/4
        o41IEuVcE54NtzAQ8rwsY16DVQ==
X-Google-Smtp-Source: AGHT+IHOeFoaBGmGEVaMe9QVI6eGxLkERWdiTBlKcpER9LrrvOlg5Al5pU8Bs+zay+AHLcLZg1/wlQ==
X-Received: by 2002:a17:906:7311:b0:9aa:1dc9:1474 with SMTP id di17-20020a170906731100b009aa1dc91474mr2204329ejc.33.1694494359466;
        Mon, 11 Sep 2023 21:52:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:52:39 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, magnus.damm@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/37] clk: renesas: rzg2l: simplify a bit the logic in rzg2l_mod_clock_endisable()
Date:   Tue, 12 Sep 2023 07:51:31 +0300
Message-Id: <20230912045157.177966-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The bitmask << 16 is anyway set on both branches of if thus move it
before the if and set the lower bits of registers only in case clock is
enabled.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 44226682db2c..6c289223a4e2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -914,10 +914,9 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 		enable ? "ON" : "OFF");
 	spin_lock_irqsave(&priv->rmw_lock, flags);
 
+	value = bitmask << 16;
 	if (enable)
-		value = (bitmask << 16) | bitmask;
-	else
-		value = bitmask << 16;
+		value |= bitmask;
 	writel(value, priv->base + CLK_ON_R(reg));
 
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
-- 
2.39.2


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DE8C43217
	for <linux-clk@archiver.kernel.org>; Sun, 13 Nov 2022 18:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbiKMSH0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Nov 2022 13:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235391AbiKMSHY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Nov 2022 13:07:24 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C921144F
        for <linux-clk@vger.kernel.org>; Sun, 13 Nov 2022 10:07:23 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id n12so23322657eja.11
        for <linux-clk@vger.kernel.org>; Sun, 13 Nov 2022 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ywf6b+IbFOVLTjHv9G0JoUs4QJxVF9RbJDvY4hkSgIA=;
        b=hin9Lr5Joe5vd3olZvvUG7/wpSBZyrBXwsfzX6islosOI+AFu0EcoNnJ7sxEGWAwpQ
         OE+O8tdQNc87u3kdB57YvH05emhmk1ZJRl1gQT0GCLXNJZT3Mun+g1/EgWDxMzb5YIhB
         nm3bai4xCptl7uW/7jpUWCMWZaPhsdymxzqg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ywf6b+IbFOVLTjHv9G0JoUs4QJxVF9RbJDvY4hkSgIA=;
        b=0nG3qKcxrqk/tTD9aYP59PA8TIzwBQAFM5VD9nYsOaJu0vo1sbzjNu4BT+8uw4n0fC
         ONcImb1qOsyK8RJIv955yiTYdYLmMjJm6cucG8UzFbhXOBPj2C1ogfLrX+70Y9/F0mYV
         C/yV5M1s6TOsU/5ypVQMyxnILKwpLU1vRKyyLhcPaLMWaiO0UWhEYaed1EUapNLOaBHk
         N29pgNKOIlGXmJzc8asyC7UBSb/BK9AElTpEmQ+FrO4xcBc9agrdVvQE94baXKDmNwmF
         xEeRhYdjK8xV/K6Ag+SSaKMJtwjupuO3CJN1XVFYEaNadS2ErbDS29kyICUmi7JSIUBa
         Zv2A==
X-Gm-Message-State: ANoB5plTly+0+eCG5TLxjoLqIkcU4QlW8RQ+OGjlHBVVCnFXpMScbL8k
        C0qfR74rxCZ8eVe2BJWl9oBY/g==
X-Google-Smtp-Source: AA0mqf5/5Lt0K9H+vpsJNjdcN/7weKL30uW/Mr4Sjk61dOE7gBRDMSYHcHTgHTZ6IFoazAgvOeEB4Q==
X-Received: by 2002:a17:906:bc42:b0:78d:7a4c:13ea with SMTP id s2-20020a170906bc4200b0078d7a4c13eamr8130192ejv.471.1668362842656;
        Sun, 13 Nov 2022 10:07:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-40-103-33.business.telecomitalia.it. [79.40.103.33])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906118b00b007a8de84ce36sm3171058eja.206.2022.11.13.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 10:07:22 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 4/5] clk: imx8mn: fix imx8mn_sai2_sels clocks list
Date:   Sun, 13 Nov 2022 19:07:09 +0100
Message-Id: <20221113180710.1625410-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221113180710.1625410-1-dario.binacchi@amarulasolutions.com>
References: <20221113180710.1625410-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to the "Clock Root" table of the reference manual (document
IMX8MNRM Rev 2, 07/2022):

     Clock Root     offset     Source Select (CCM_TARGET_ROOTn[MUX])
        ...          ...                    ...
   SAI2_CLK_ROOT    0xA600            000 - 24M_REF_CLK
                                      001 - AUDIO_PLL1_CLK
                                      010 - AUDIO_PLL2_CLK
                                      011 - VIDEO_PLL_CLK
                                      100 - SYSTEM_PLL1_DIV6
                                      110 - EXT_CLK_2
                                      111 - EXT_CLK_3
        ...          ...                    ...

while the imx8mn_sai2_sels list contained clk_ext3 and clk_ext4 for
source select bits 110b and 111b.

Fixes: 96d6392b54dbb ("clk: imx: Add support for i.MX8MN clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/imx/clk-imx8mn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index b80af5d1ef46..37128c35198d 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -109,7 +109,7 @@ static const char * const imx8mn_disp_pixel_sels[] = {"osc_24m", "video_pll_out"
 
 static const char * const imx8mn_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
 						"video_pll_out", "sys_pll1_133m", "dummy",
-						"clk_ext3", "clk_ext4", };
+						"clk_ext2", "clk_ext3", };
 
 static const char * const imx8mn_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
 						"video_pll_out", "sys_pll1_133m", "dummy",
-- 
2.32.0


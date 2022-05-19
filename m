Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36603C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 07:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiESHRI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 03:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbiESHRA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 03:17:00 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C496D38C
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 00:16:51 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c14so4391512pfn.2
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Lobr1vMx7rDaM5B+yUv81HVaD1u4SedAKGtA+u9eB0=;
        b=iR0EAiANHpgr6qqiXvJm8TqFB+PzivUbHjXAByQCTPk+RQfY2cGvzwMkoow9PlOcVW
         463hMSQao/hqbeQ1WB96f4CaYMV456vxf+1BjGIhP8k0GXT6Ub2Ja0amLXUK0yIltbmh
         qmBeFKkgPHy4W0AOQwgYpcRgI7ZdFfaaZXEF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Lobr1vMx7rDaM5B+yUv81HVaD1u4SedAKGtA+u9eB0=;
        b=KkU9M4FW4P1XmZA0ZP26P94+iPxuI5lZKr1V/3SEnvavCOeY3vgCQvCczUO8kiudtj
         uDz9rhGemAbv66dxErnfbh5TjCcckOpZWrJ1XLXd+h7TOsgaHsaPV5PbkP5vYHnZw4jF
         g4BCiWMoZyUECYiNHZnlpEYUGmD/RJyl3z6A/yQQ3WOSFowgbJ4788pXr7ec9DVbdO+p
         6y6KRZvEuathl5aK4Lkq1rbthJiJLhPUe6VxUkCV8l/9yPCjnDyKZhGifb7iZMMbdd9f
         qo8EMOHXfx0r20n6Zf6N+95wjiEcXOxQSSm0Vqmf4PkrEQuZiGuukayRzycvHT5rkbXa
         mu5w==
X-Gm-Message-State: AOAM532fwExap96dGokwlzr5O4RaotiQzZe8+MCDyP3ltd7u8TLZHeg7
        JvyglT4wnLUQrQFiJqB3x5cWtw==
X-Google-Smtp-Source: ABdhPJylSUfb3Z55yfaTqVg3bRO6QxvkbPPkHOaMcXrMUTD5T6cI7rFyVdO46NS5CA47zzipp9of8g==
X-Received: by 2002:a63:381e:0:b0:3c6:d5e4:fed9 with SMTP id f30-20020a63381e000000b003c6d5e4fed9mr2797165pga.553.1652944611201;
        Thu, 19 May 2022 00:16:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2338:2871:9320:bed0])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b00160c970eeb7sm2972945plx.234.2022.05.19.00.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:16:50 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] clk: mediatek: mt8173: Switch to clk_hw provider APIs
Date:   Thu, 19 May 2022 15:16:10 +0800
Message-Id: <20220519071610.423372-6-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519071610.423372-1-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

The MT8173 clk driver has one clk that is registered directly with the
clk provider APIs, instead of going through the MediaTek clk library.

Switch this instance to use the clk_hw provider API.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8173.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 68d3a9749316..d34b248c42ca 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -994,7 +994,6 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
 	struct clk_hw *hw;
-	struct clk *clk;
 	int r, i;
 
 	base = of_iomap(node, 0);
@@ -1023,10 +1022,10 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 		clk_data->hws[cku->id] = hw;
 	}
 
-	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
-				   base + 0x40, 16, 3, CLK_DIVIDER_POWER_OF_TWO,
-				   NULL);
-	clk_data->hws[CLK_APMIXED_HDMI_REF] = __clk_get_hw(clk);
+	hw = clk_hw_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
+				     base + 0x40, 16, 3, CLK_DIVIDER_POWER_OF_TWO,
+				     NULL);
+	clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-- 
2.36.1.124.g0e6072fb45-goog


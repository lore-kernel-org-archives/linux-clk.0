Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47797C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 10:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239988AbiEJKwv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 06:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240130AbiEJKwl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 06:52:41 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898AB269EED
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:38 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id a191so14336338pge.2
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1FdjvAvBabmLm4piyf37Hjo9sFlsoGQgqNCW+UhIAU=;
        b=ZZiV8FDh2493+GOlLnM7AZV/ZfAixCm4kzvDQ1nO/IODoCr4uGB1REYq3dCvCCoueB
         v+z6rjTTcoU+PfM7KZLpjbvUy/9Leb07mDEpaqkxxR9K+Iig89VNPPYI9/RhCyVb23rZ
         UL8+bSzulghk0/90WI7aFZh9Fo5N0C4xCsLDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1FdjvAvBabmLm4piyf37Hjo9sFlsoGQgqNCW+UhIAU=;
        b=ZVVkwRcJsyiEfz6nE06IxlWH1qHHnFX87MAxfnavoSA2nbwVLGRFwfDjjvEpP2zr1j
         sxrzDOXi68pV7o4rUm5xmQ98MUfbEYrmdVDCZKWkzIOXh60D9sPQxILA2EsBxc/uLxTT
         undVopkUU81+d4XgD+FhpAD4ocKbZ9yZYzQfttxZX13JwhH5Vlafto2r95TgYC2rNopB
         icA7bVDHoW3+E5QuYwNeB2EQeaWBwLHpF0DU6QWdEr78Cgi9VeJj+Flocapife2MGUDS
         3rf0n/uh6EfOS05DQvHUvzmHWRuT2TOR1Ca7ZHImHrPqghqKjgCih0vjNUpBBEq6Eiqd
         W0wg==
X-Gm-Message-State: AOAM531gxH/1jbC012NWmZMABkWh3I0xVxcdKUx1ln+u5w4EpboTqKo1
        LGRZZOxV7oT9P+lHoz4AwbBMzA==
X-Google-Smtp-Source: ABdhPJxKnqA7t1z+oo+oIn6NpFLqC9befrDq1r+7XtICHqRZ8wiJKs4Wd8gpOGmFIl6MrBte/wNZsA==
X-Received: by 2002:a05:6a00:228c:b0:50e:17ba:9f84 with SMTP id f12-20020a056a00228c00b0050e17ba9f84mr19695444pfe.62.1652179717922;
        Tue, 10 May 2022 03:48:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 03:48:37 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] clk: mediatek: mt8173: Switch to clk_hw provider APIs
Date:   Tue, 10 May 2022 18:48:04 +0800
Message-Id: <20220510104804.544597-12-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
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
2.36.0.512.ge40c2bad7a-goog


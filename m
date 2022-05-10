Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC253C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 10:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240084AbiEJKwe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 06:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240057AbiEJKwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 06:52:14 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4D81DEC60
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:17 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id s14so16403698plk.8
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ya570kQIAxuwgnTHVGLX3kmecG/HttO9ZeMkT+/ygQ=;
        b=gKnovVtABKGaXs0ew7Ew46WRae5W9XUyMaRi+BXWBsgdcPRWPTZkv81F1UTsdFhA+R
         0bK5gYQejDadKl/CyZtRvtrZy0cO4xfwB11HHMczv8yuTjR0iz2hZMtWCOon4KnRr8U4
         wCGMJJ16wP+oNIyhUjai4h+GSF0TZ5Cq0FvDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ya570kQIAxuwgnTHVGLX3kmecG/HttO9ZeMkT+/ygQ=;
        b=IX2nDcTBa9F8je7huMgFLkZkOWtbPvksua+ZTYDfOa8hLI6PrQMzpmBqVA50pM9+qa
         uXK3r6EkntcJ5AdoyDdCQveQVlATci0HjAahipQV8Gp1i1udNXuV1A85pE8KVeAGdS0K
         NepEkXltdB99xtbURlQLxomhuWvBTz2lnG2ENNBZ/a1CL6kRk69QOEnXSOG+oc99hV0F
         VKhimP2DJtcVC3c8L9jon0Vd+xXgKPC0SMc4m0G7kdhKJ/LZvjPHDePiutRZHb1/kxnf
         AB4QC2Ixy1b/uvhAlfR6ANpo6TvLY4TqGU+spZXv6ukC4SpHkfblUZo4Ni61Or3ja94l
         vNIA==
X-Gm-Message-State: AOAM5328bUjFpZ91diglfl2Kd25Mx0FvNJ6/4KGtGXereU6Ke8+B5J/b
        rB1NPAY6ppvpbpGA8oOXwIiELw==
X-Google-Smtp-Source: ABdhPJyuC3cLw47lStzO6uMYKTb6L73kwMJTqdTohd+gCWo6N9AUW5HTchd+pVnS5MwifVwvcusnJw==
X-Received: by 2002:a17:90a:1d1:b0:1dd:220a:c433 with SMTP id 17-20020a17090a01d100b001dd220ac433mr8066368pjd.196.1652179696544;
        Tue, 10 May 2022 03:48:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 03:48:16 -0700 (PDT)
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
Subject: [PATCH v2 02/11] clk: mediatek: apmixed: Drop error message from clk_register() failure
Date:   Tue, 10 May 2022 18:47:55 +0800
Message-Id: <20220510104804.544597-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_ref2usb_tx() prints an error message if clk_register()
fails. It doesn't if kzalloc() fails though. The caller would then tack
on its own error message to handle this.

Also, All other clk registration functions in the MediaTek clk library
leave the error message printing to the bulk registration functions,
while the helpers that register individual clks just return error codes.

Drop the error message that is printed when clk_register() fails in
mtk_clk_register_ref2usb_tx() to make its behavior consistent both
across its failure modes, and with the rest of the driver library.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-apmixed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index a29339cc26c4..06400c043fe7 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -91,10 +91,8 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 
 	clk = clk_register(NULL, &tx->hw);
 
-	if (IS_ERR(clk)) {
-		pr_err("Failed to register clk %s: %pe\n", name, clk);
+	if (IS_ERR(clk))
 		kfree(tx);
-	}
 
 	return clk;
 }
-- 
2.36.0.512.ge40c2bad7a-goog


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8EBC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbiBHNRG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358851AbiBHMls (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:48 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1997C03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:47 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id z35so1582707pfw.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2a4Zov6E++VeMpVDqW+bpg0HKHZjA85AGbm7eJFVTok=;
        b=UK5/1wa6pFIEPSGIZaow9B/7baK1t3FJYJLgwb//r3zSSqpTXDRnxHEtqo3e0adC3V
         3aFMXbNUsIQLBfSowdTPw9DEb+wFWm8V8JuIkNw+9K9ajSZSe3Vko+pogXCBEENcmzOi
         uPGk6nvYOoXU/ewsdDAwwCjd3kCEl8FyF1iks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2a4Zov6E++VeMpVDqW+bpg0HKHZjA85AGbm7eJFVTok=;
        b=7uMCTnOhXDQsI/OPSduRB49VONWTz2UJI+1JhQFeR8/IyRVQmItUQbQYZdUalFI008
         DHnInoPxhlBTKdvjKisQj6eUAxrO9nHodngmf2NPRA8LpYSamYhvLwM7Dg7WpAPziBJ9
         IlGNBASF1Trh796PoLHIa+4ZqWoIu/Hq5vSjbUKK3QDD+GKzOWZQE6PhDHGN+UcXYPa6
         w9bGuC88WV73r2BzDpC8El5TYG6se2C9ZVgU8wOaDmr7LkioPeu9VNlqzIZTpZq528MB
         kjE+c1YcNENK1kd3cgzPz9vBqy3wj18/wwJHVJEFD1c4UzL9c3Flq9xsK6AX0npfDOVs
         KlvA==
X-Gm-Message-State: AOAM530elZqOwuBmUlCNHAzj5XSi+1NSbJk8VlJWcX2Qy4CtG6SJDH24
        6PBb5GuRzpEVAiLhYl9hskrkeQ==
X-Google-Smtp-Source: ABdhPJxFX/826gPUwmwjQsBpabmmOS6aCRXpKBLH1nSGwHhUQ3qT7hUm02w9dIiJLfy6PTmB2Rv/SQ==
X-Received: by 2002:a63:d943:: with SMTP id e3mr3365014pgj.427.1644324107392;
        Tue, 08 Feb 2022 04:41:47 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:47 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 27/31] clk: mediatek: Unregister clks in mtk_clk_simple_probe() error path
Date:   Tue,  8 Feb 2022 20:40:30 +0800
Message-Id: <20220208124034.414635-28-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Until now the mediatek clk driver library did not have any way to
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of mtk_clk_simple_probe() to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8f15e9de742e..0e027be0d5fc 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -439,12 +439,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_data;
+		goto unregister_clks;
 
 	platform_set_drvdata(pdev, clk_data);
 
 	return r;
 
+unregister_clks:
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.35.0.263.gb82422642f-goog


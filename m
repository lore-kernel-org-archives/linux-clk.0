Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E8DC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbiAVJSp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbiAVJSZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:25 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E6CC061753
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:22 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id o64so11345090pjo.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OL43s5I7LNHYgmLD2gKEH5DLtt+mhRAmKo34NJ8rtwE=;
        b=Ggo0kYpwoWnwSolmdIbTiIGBqEoKYbbJGe28yVsffQtRCfNStfbzu7ufp6Frh7kLje
         tP7/f8uW+0pNL+bOuvU/y84/uITpHYEb4voWNxDpRawsGCYd/r3YXYAKeQhm0MdB4Mlt
         UhRx3i9YIEqpmxfnvwv7tKZDw0i0XRfWQqIWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OL43s5I7LNHYgmLD2gKEH5DLtt+mhRAmKo34NJ8rtwE=;
        b=gf97aFezrgokKOu2IxnCRGFoSI9iW8KSuIeoWjR0+z6EzplgsMzCjBEaxkLTHiT4QM
         nn1nBX4+elFtrVpf9pKlvHg5V9HsVFTHDFTTMQBpMQapk2QwPK/mcmj77jD3sO6tDgFN
         1xpwNWoAqwgm2BKqdBECj1DBlKXvL9VuWLvzMbTACJ87jPye/YwvmqHRRW6ZHs76VqI3
         U+q2qZ1qORtLPjx/y5TP+Erg+CpJauvgkJd7Wx1BXKHWiCHY7zMVELWnmLnuku9El2Yj
         fjWQ03vRrjrj7AtgEnou88hP9hhLA1Zhevafq/wx84W6At4hY3qg8U9oeJ51BOIl2rUU
         8aYw==
X-Gm-Message-State: AOAM530SSNxzwvjFg4NIZonG4axv16Vwo0BTHRgm7WDHr/gPv9yDml99
        3J8mnj/gxzNGHiTQODt5o9/z0ZK13ZK4Ag==
X-Google-Smtp-Source: ABdhPJxYWG1G6A9uuQSoK+hKtiVNFyIt2rfYZvu/Rc9m92uJiLRu3G1sp2IZGb5nnUAghww4dGPDEA==
X-Received: by 2002:a17:903:32c6:b0:14b:3f5b:e9c6 with SMTP id i6-20020a17090332c600b0014b3f5be9c6mr89273plr.136.1642843102481;
        Sat, 22 Jan 2022 01:18:22 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:22 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 17/31] clk: mediatek: Implement mtk_clk_unregister_divider_clks() API
Date:   Sat, 22 Jan 2022 17:17:17 +0800
Message-Id: <20220122091731.283592-18-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_divider_clks(), as the name suggests, is used to register
a given list of divider clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  8 +++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b267b2f04b84..3a6dfe445e63 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -286,6 +286,25 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 	}
 }
 
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_clk_divider *mcd = &mcds[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+			continue;
+
+		clk_unregister_divider(clk_data->clks[mcd->id]);
+		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
+	}
+}
+
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
 	const struct mtk_clk_desc *mcd;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 4db1a97c1250..e3ae22fb0334 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -176,9 +176,11 @@ struct mtk_clk_divider {
 		.div_width = _width,				\
 }
 
-void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
-			int num, void __iomem *base, spinlock_t *lock,
-				struct clk_onecell_data *clk_data);
+void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+			       void __iomem *base, spinlock_t *lock,
+			       struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data);
 
 struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
 void mtk_free_clk_data(struct clk_onecell_data *clk_data);
-- 
2.35.0.rc0.227.g00780c9af4-goog


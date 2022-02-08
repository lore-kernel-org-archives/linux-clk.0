Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADC4C4321E
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353972AbiBHNQc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358139AbiBHMlC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:02 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9E5C03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:02 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id om7so2926001pjb.5
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yu5wC4iGlAJptCPwbvLdBvXWnUX/vMCoe837u17t2vE=;
        b=WYmMFm75NEaKiAQgXHcNywEYl4EfNKMdlnHmbH+Y/S70IQ6WZ9BTZFIM6qXllePpzx
         VqxfGa3WakmxF3TFYcuEqxxCXNGBaGXzpSF7WpnjK4acriB5IPWJHkzpCdKwAC2iXA2q
         MpfJH/5jIsHVddh1YI+t3DBLCwl7un6kbnAxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yu5wC4iGlAJptCPwbvLdBvXWnUX/vMCoe837u17t2vE=;
        b=uJv9oEVwH//oEEsqzT0Sy4oulBQHCS3/jrSqFhvcL04wmXNVG/GkTk1D/UTiV+Ghd9
         M/C2qfcSproiWpQKmge0/MSXptMASoudl+jqXGul8lr8yLkV0aGBL/1dnCUS+qADsvbP
         I9YNCVxwgGp8qzTdJdxmhbbRAaNbij9YLX3W1lF0n/0QgdaQpoqfQjEFS8b2TjOCpT0n
         vAf2gZusn6r7ul9B2FkfM16y02sUCsCpQ1XGokTmrlUpsH4D77yMeLU1lqMCx3HYeU00
         wGJqYE7N5AKaUo/6y2rXFYboF+58ahWQoo1YsW+he8vRTUvaWl6I+1QAFzFCK9Gty8QT
         BkCQ==
X-Gm-Message-State: AOAM532jDfiTonYueUCFejo614agMFR5F2UvvbpvRipuw8WhmN2J88oQ
        F78XgqsXnU8LXiarO7C85Xcm0A==
X-Google-Smtp-Source: ABdhPJzUeRlYjgcD/Tizn2yiqNMWwskxr1QbMAtRHQShttT8ptqsm5WTOeTXEuEiu4TrR1RbEMFh/Q==
X-Received: by 2002:a17:902:6b8c:: with SMTP id p12mr4434188plk.51.1644324062033;
        Tue, 08 Feb 2022 04:41:02 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:01 -0800 (PST)
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
Subject: [PATCH v3 06/31] clk: mediatek: cpumux: Implement unregister API
Date:   Tue,  8 Feb 2022 20:40:09 +0800
Message-Id: <20220208124034.414635-7-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cpumux clk type within the MediaTek clk driver library only has
a register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the cpumux type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-cpumux.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index cab5095416b6..99a819e3673f 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -77,6 +77,21 @@ mtk_clk_register_cpumux(const struct mtk_composite *mux,
 	return clk;
 }
 
+static void mtk_clk_unregister_cpumux(struct clk *clk)
+{
+	struct mtk_clk_cpumux *cpumux;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	cpumux = to_mtk_clk_cpumux(hw);
+
+	clk_unregister(clk);
+	kfree(cpumux);
+}
+
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data)
@@ -106,4 +121,20 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 	return 0;
 }
 
+void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
+				 struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_composite *mux = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_cpumux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+}
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index 2aaf1afd4e5f..fda7770fd803 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -19,4 +19,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
 
+void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
+				 struct clk_onecell_data *clk_data);
+
 #endif /* __DRV_CLK_CPUMUX_H */
-- 
2.35.0.263.gb82422642f-goog


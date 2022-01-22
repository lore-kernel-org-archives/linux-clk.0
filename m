Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEA3C433FE
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbiAVJTz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbiAVJTL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:19:11 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17E6C06176F
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:33 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id e9so10275644pgb.3
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TEZ0MfngpjieBK0SXrIypAK0YzHVKnAErn4UHbTrxk=;
        b=G89iIeSLYaSHnG28ej39jy7C6u1UfWz4foTwDQ3HDtc1rwz7fX2NqHJAzXQGdhTaM7
         7dkLHYZsAY363xBWB4t2vrJVLdsj7YQorPuqazaY1Zwn/+TUsRlc6Ic7+WjjdaooeKuk
         gURdzHetX2DAxi4E6qBVou42HNmx++CcJTDEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TEZ0MfngpjieBK0SXrIypAK0YzHVKnAErn4UHbTrxk=;
        b=gr1jQJvWR7bz5GP5A3NqmKCyL5hyhwa/OZpfV+ogm7+V2AgT0Fmmo+BzGQsp4iukqc
         IPljVzQa7Z/HIp2JZclS7txWZr3sE+UNpVKjZ46l4yiKE9KjtNhZAu/y6o0C3UHebdKc
         sCyFhPmKdvWBvSiAXx/eeezPB/CxRa1E63dOwFzhu6t74L9E56CoQnCBqaWeO+YcZOEP
         vL8og3dNmHx6vYksCkqH2MdSdimvQvt4qrOD68/zKW7ueQNSMA9KkHGIVbpO8ryOT7I3
         ZVIAwt4m2YNDswr3XGWbCU8AB4Mj5ZCyGU/zWwu4NAVTHo7Ujbwe+pG/0lsi2yp62HNB
         Zwhw==
X-Gm-Message-State: AOAM5337HxYwRIqqVx9WbYACdihsQEs3DljmDmEcp7CYpxB+jrlvjmwL
        RBXmfr4nf7RNR73dJixY+lGezQ==
X-Google-Smtp-Source: ABdhPJxJiShS15jsyBrH2j+XqBNlWH2MNjyeLX7mBslEBYwQ2NuEg6RU8qADx6ysHah6+FMDvsbf+Q==
X-Received: by 2002:a63:4e5a:: with SMTP id o26mr5497546pgl.272.1642843113500;
        Sat, 22 Jan 2022 01:18:33 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:33 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 22/31] clk: mediatek: gate: Implement error handling in register API
Date:   Sat, 22 Jan 2022 17:17:22 +0800
Message-Id: <20220122091731.283592-23-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gate clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-gate.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index e8881ae1489a..631ff170b7b9 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -237,13 +237,26 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[gate->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_gate *gate = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
+		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 int mtk_clk_register_gates(struct device_node *node,
-- 
2.35.0.rc0.227.g00780c9af4-goog


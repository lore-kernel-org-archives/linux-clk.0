Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F23C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 07:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbiESHQo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 03:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbiESHQn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 03:16:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E1C5B3D7
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 00:16:40 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso4460213pjg.0
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cH79WtLzMOqFUUnK2kn/1tBt8ZjWnYQCRSDHn3B7YcA=;
        b=mWw/D457X0Ra2tdW+bQE0qt7AbOAi0il9BcFHlNgdw4z3xU/xF+mYqyaE2xe2mhqSW
         JgR1HJ/GoTcPWVyLJN1rBYXb88vP+BmlwCw9elnK+5/r1evMK7N9E9aIADZrIjM8Uvy3
         muBGEfyPKu2NLuCCSnTKV7ThZXW2Z0knpC5D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cH79WtLzMOqFUUnK2kn/1tBt8ZjWnYQCRSDHn3B7YcA=;
        b=Stzw72x1FAYU+ALHU84dppUB7TTZx5EEu4IhY/H/NR2z5Wi6Qhwm4R+dDzTMrIQWYO
         wOhQsc4YyjBmam8KYheZA8zR8vQG4d6LaZFPQE59KQzo9ydEF4j0gp2HRTeI2JxHPH6B
         nehcBuU/+xOsOUd3bZMrfKdK8azEaWxf0Af0s5F7vt79XqbRvwlGZc/T6gHa7Dc6DT7h
         jmBcE4QWVWVUeG6mOmdE2aSua9RpGjnne+VE5PPkhgB8ozgh1goTfrbgVXvu6Pnl5D9i
         87R65v8EWcutjC7YZi/SA/luqwdhgDun48wTOrxR8sKozqSu/3as4MkF/llBZDjah0RR
         jfPg==
X-Gm-Message-State: AOAM531DnBgX2ob5Rf+lokfS1J5gs8JJTSpnIt241ZUaJtCfM/NQXVIt
        cIwdvRtrydBeMBGgJ/ZGXiXYww==
X-Google-Smtp-Source: ABdhPJxerj/ScUFseL5P7Tfgjpgxs9ptQdEZ57VVfGNEbvfGEhzOVSdem6eKxcdXMOdcDG1cBo0esA==
X-Received: by 2002:a17:902:8696:b0:15d:946:2f98 with SMTP id g22-20020a170902869600b0015d09462f98mr3479433plo.82.1652944599940;
        Thu, 19 May 2022 00:16:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2338:2871:9320:bed0])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b00160c970eeb7sm2972945plx.234.2022.05.19.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:16:39 -0700 (PDT)
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
Subject: [PATCH v3 1/5] clk: mediatek: Make mtk_clk_register_composite() static
Date:   Thu, 19 May 2022 15:16:06 +0800
Message-Id: <20220519071610.423372-2-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519071610.423372-1-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_composite() is not used anywhere outside of the file it
is defined.

Make it static.

Fixes: 9741b1a68035 ("clk: mediatek: Add initial common clock support for Mediatek SoCs.")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 drivers/clk/mediatek/clk-mtk.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b4063261cf56..52bacce5dadd 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -183,7 +183,7 @@ void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
 
-struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
+static struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
 	struct clk *clk;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bf6565aa7319..9577084790dc 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -147,9 +147,6 @@ struct mtk_composite {
 		.flags = 0,						\
 	}
 
-struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
-		void __iomem *base, spinlock_t *lock);
-
 int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
 				void __iomem *base, spinlock_t *lock,
 				struct clk_onecell_data *clk_data);
-- 
2.36.1.124.g0e6072fb45-goog


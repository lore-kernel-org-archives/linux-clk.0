Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22682C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 11:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbiGLLeP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 07:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbiGLLeO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 07:34:14 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFD5AB7DA
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 04:34:13 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id r6so4571013plg.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 04:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WHpICsyByAQH93fjocLsnPpN777QDLGLHmPw1NuqSiI=;
        b=HiWiJHoIMTwU/6yayll4vWwEVSoyDhb3Rr+kWxAHJ6wVtixr58GSQ8/vOUuXyZhSBH
         9UHzutDKljJGdU7Tav0qNG9aObjZYZF2PYLFh018b7wUnh1YSRW6tF+xpzHcOTxrg869
         qMmLVmsVV2zjXqecmyRCvbS0iZRMn1T6s9b2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WHpICsyByAQH93fjocLsnPpN777QDLGLHmPw1NuqSiI=;
        b=a19Uz1D5VK3uAVSqzCNL04YYbhU/+Jy0ok4yWVBrwOv+Es70rohevvqAMOPwQjC/Bl
         ysde8UpDxCHr8jxHERH1LK+jGXJ2nbvysmg7Cdu/Zjt1bYMtVeHCpXErZk+s9YFNfIu/
         /yQsGEeQ10+5IjwZTxOZJ/FNE1hrymqy15vt/12AoX1rywyEHeT8BCFLq4lElnPgiyMe
         wEpuzV428SEO0kAenBL29Swefz5sUrrMlqGlHGHbFdIxaiDb0XO/lJ0rICJ2rOkM+9Cv
         2kMeWdD6OyDo5KYQeErHIx8V7Emlv7XEGHm/WR2YzBrmfI6q79Y/01lcWXd1wNB6CRTp
         Y2kQ==
X-Gm-Message-State: AJIora/Rgs97B7tsyV3DnWI3DdVn5Xn6eYwNei0hTcnX6zzdV5e8+hlm
        gpWZJkE0tl7Al/KceCe3Fuyllw==
X-Google-Smtp-Source: AGRyM1t9YjFM9jfrb3CKRXxvF1sBMXVpXvetHSpZs3rbBUk7GAB2Qt1od81KyIufbdXQokePzaibcQ==
X-Received: by 2002:a17:90a:4294:b0:1ee:f3f2:9cd0 with SMTP id p20-20020a17090a429400b001eef3f29cd0mr3812180pjg.79.1657625652797;
        Tue, 12 Jul 2022 04:34:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1a9:ca7d:e86f:cf6f])
        by smtp.gmail.com with ESMTPSA id 80-20020a621653000000b0052890d61628sm6537967pfw.60.2022.07.12.04.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 04:34:12 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
Subject: [PATCH 2/2] clk: core: Fix runtime PM sequence in clk_core_unprepare()
Date:   Tue, 12 Jul 2022 19:34:02 +0800
Message-Id: <20220712113402.871838-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220712113402.871838-1-wenst@chromium.org>
References: <20220712113402.871838-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the original commit 9a34b45397e5 ("clk: Add support for runtime PM"),
the commit message mentioned that pm_runtime_put_sync() would be done
at the end of clk_core_unprepare(). This mirrors the operations in
clk_core_prepare() in the opposite order.

However, the actual code that was added wasn't in the order the commit
message described. Move clk_pm_runtime_put() to the end of
clk_core_unprepare() so that it is in the correct order.

Fixes: 9a34b45397e5 ("clk: Add support for runtime PM")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b3de636eec84..87684daadedd 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -855,13 +855,12 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (core->ops->unprepare)
 		core->ops->unprepare(core->hw);
 
-	clk_pm_runtime_put(core);
-
 	trace_clk_unprepare_complete(core);
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_disable(core->parent);
 	clk_core_unprepare(core->parent);
+	clk_pm_runtime_put(core);
 }
 
 static void clk_core_unprepare_lock(struct clk_core *core)
-- 
2.37.0.144.g8ac04bfd2-goog


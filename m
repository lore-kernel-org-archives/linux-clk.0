Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63179C433B4
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 23:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F47261262
	for <linux-clk@archiver.kernel.org>; Tue,  6 Apr 2021 23:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbhDFXGT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Apr 2021 19:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233379AbhDFXGT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Apr 2021 19:06:19 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65659C06174A
        for <linux-clk@vger.kernel.org>; Tue,  6 Apr 2021 16:06:09 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u4so18382216ljo.6
        for <linux-clk@vger.kernel.org>; Tue, 06 Apr 2021 16:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
        b=TpblUsbtD5po/N9CH/uKdwv0vEB3mnX65H7KPdYRddC7mVJFSjpYcspElVN2O/5zzv
         2NpmbX9x1UTxC/AiZlaBMKn4eS9jCVyuZQ/exmSW+stHaDAlpm6HzEuLtv+YbAGyjeua
         V4S8RLiqJk+mcEOvLgVUqhmmcWK2LLUItP/tmnl5KhP45rkzszvaaqhxln/vB2NErNSF
         whPy8AlWU59tdX6njnk0uAnKlCsN7wG36UGU6SFGzJ3mGEaoee9u6DAarPFvGZCBgvJN
         qqevv4fjV00ioLnCri+pzlI9ZIilUwxBMtOxAcgry/cd3REqfT8EOVLrcqTJqQiyak+f
         oa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
        b=ihUarACSp0jTZcfrwMETlbwNIkCyKZ36DC7ZRjJ0hchvc8vC4Cwfu8UjH//iQcrD/T
         hzAAI64uvHPgW2DSLKh80yQPYhXVUmm+Kp/jzDAUwR7Q1tKuUzWZ8cexOaHvuGZOUV1a
         MHgwrpXukajg8iiQJZP5i2rf9iBNH6bCO1w4h2vznpBZleXWl798pc0B5Uso+VWbJj19
         gE+Ky4ygbIJtpACH+gwHo7sL7QOQaVXtLfXN6MYQWI+PKggF7XXJ75G1Riyp5EOPqZ29
         viuuzyfnHUuv5S6+0LO7zhymYudneu/1+2V5Ukx+2ZeoI4DByX4RBdYxSn5+S7iol9mB
         VFxQ==
X-Gm-Message-State: AOAM531vKadNwGqP2e2FKAo2JfzaarsZpoJCC2AVEVq4BukydTYWhO1n
        6CRL4ojhJTuGQzgS4bmqByP1uQ==
X-Google-Smtp-Source: ABdhPJxc5AF4qmysF86wYNJ0vHcgPANetDoaI2kJ39Ne3VwoDSAJxdpOVbZhfFJ5YUI9Ez56qmMVXA==
X-Received: by 2002:a05:651c:ca:: with SMTP id 10mr240945ljr.63.1617750367763;
        Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b25sm2351498ljo.80.2021.04.06.16.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] clk: fixed: fix double free in resource managed fixed-factor clock
Date:   Wed,  7 Apr 2021 02:06:06 +0300
Message-Id: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

devm_clk_hw_register_fixed_factor_release(), the release function for
the devm_clk_hw_register_fixed_factor(), calls
clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
after that the devres functions will also kfree the allocated data,
resulting in double free/memory corruption. Just call
clk_hw_unregister() instead, leaving kfree() to devres code.

Reported-by: Rob Clark <robdclark@chromium.org>
Cc: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Stephen, this fix affects the DSI PHY rework. Do we have a chance of
getting it into 5.12, otherwise there will be a cross-dependency between
msm-next and clk-next.

---
 drivers/clk/clk-fixed-factor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 4f7bf3929d6d..390c16f321a6 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -66,7 +66,12 @@ EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
 static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
 {
-	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor *)res)->hw);
+	/*
+	 * We can not use clk_hw_unregister_fixed_factor, since it will kfree()
+	 * the hw, resulting in double free. Just unregister the hw and let
+	 * devres code kfree() it.
+	 */
+	clk_hw_unregister(&((struct clk_fixed_factor *)res)->hw);
 }
 
 static struct clk_hw *
-- 
2.30.2


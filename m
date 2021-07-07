Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24A3C07E95
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jul 2021 04:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA11361C71
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jul 2021 04:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhGGEnE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jul 2021 00:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhGGEnD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jul 2021 00:43:03 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67123C061574
        for <linux-clk@vger.kernel.org>; Tue,  6 Jul 2021 21:40:23 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so1030357otq.11
        for <linux-clk@vger.kernel.org>; Tue, 06 Jul 2021 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5H4e4u0XsnmjBPbEPHm1B40OwiQKYlLnQ9+wCD+65I=;
        b=wIEjLTUOfdCzQXZEwRXFkoa1kydtdqNNIQsXs1VYWvqdTaTP0o3VZmN65zVAM8UsgH
         Cz5N0ibLBP8mkNthNXy9vOCeiArIiMQuyn2IikuvqxSDByks550lO0Nx4/wnI9cAlLOZ
         I6euGtircGIDI+R+SI2l5nQKXRbE8093YZZFNawxhWiq1A85zpeDsu/NVdrGUHwUjsUC
         vS5UelTJTxvO/N3KKaW9kP7YJcXnWtu3afbiX1aC8vaMlxjJHdSqZ6F3XEaetXbX06dE
         qLLurS+daipcSeNQ0CVmmx4xmiaU3RfG4OivAll4qgGsOzXViMiXkvCD5ZJotYRNvIjD
         mXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5H4e4u0XsnmjBPbEPHm1B40OwiQKYlLnQ9+wCD+65I=;
        b=nU6gW05j+QgrG4tRE/3NbO3l9MmegXXVCDjG0IrLXpAZBHAXN44EGrSwDjYhrbaYtv
         84ByNaEklfFVaHjBtuYm0jrtep5YRhA8uI9fjvc235gC3aOKXhE5i+pBD5lQt19e0SYY
         fVyAgVKOG9qizk2aEwWCZOklDAxuV0DZCPmeHoY1N1AtP+KCG4/ELyqt8ZCxu4Vo7uD1
         TPwQiDp3LaegNq2HmaRMTtrFQ38t0K0VJY2EYoqMSpbHdqei7L7xaCO1YUG6U912MbLD
         9r3GsQoR08EEXXzZtC5BEgXAzOcWDUVPozZTewYopYL4eqLicw2r0SUBp1EHx/A7v4xg
         QhPw==
X-Gm-Message-State: AOAM5325JhQg5+Yd3Ghm8hgO26qJ9YNtNCynhmo/SkCwaQLmqaI631Rs
        qYpsq5tjOMvvVeyDY+ALLARNOQ==
X-Google-Smtp-Source: ABdhPJwx1dbI/LyZnXSbUHZWIvb7/jTFRODDFHRsfOLnK2J5LuVmqLE8neL+BWlSo55aYkhzvqBA9w==
X-Received: by 2002:a05:6830:1584:: with SMTP id i4mr3653881otr.353.1625632822719;
        Tue, 06 Jul 2021 21:40:22 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm3706405otl.50.2021.07.06.21.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 21:40:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Mike Tipton <mdtipton@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [RFC] clk: Allow forcing an unused clock to be disabled
Date:   Tue,  6 Jul 2021 21:38:59 -0700
Message-Id: <20210707043859.195870-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The process of disabling unused clocks will skip clocks that are not
enabled by Linux, but doesn't implement the is_enabled() callback to
read back the hardware state. In the case that it's determined that the
parent clock is enabled this might be turned off, causing the skipped
clock to lock up.

One such case is the RCG "mdp_clk_src" in the Qualcomm SDM845, which at
boot is parented by "disp_cc_pll0", which during clk_disable_unused() is
left untouched, while the parent is disabled.

Later the typical next operation for "mdp_clk_src" is an
assigned-clock-rates will cause the next enable attempt to reparent the
RCG. But the RCG needs both the old and new parent to be ticking to
perform this switch and will therefor not complete.

Introduce a new flag for clock drivers to mark that clocks that should
be assumed to be enabled even when is_enabled isn't implemented and mark
the "mdp_clk_src" clock for SDM845 as such.
This allows the driver to transition the RCG from the PLL to a clock
source that is known to be enabled when the future reparenting operation
is undertaken.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Naturally this patch should be split in a core and driver part, but for the
sake of the RFC I made both changes in the same patch.

 drivers/clk/clk.c                | 2 +-
 drivers/clk/qcom/dispcc-sdm845.c | 1 +
 include/linux/clk-provider.h     | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..9e4789d106f3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1265,7 +1265,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	 * sequence.  call .disable_unused if available, otherwise fall
 	 * back to .disable
 	 */
-	if (clk_core_is_enabled(core)) {
+	if (clk_core_is_enabled(core) || core->flags & CLK_ASSUME_ENABLED_BOOT) {
 		trace_clk_disable(core);
 		if (core->ops->disable_unused)
 			core->ops->disable_unused(core->hw);
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 735adfefc379..046f7e656f7c 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -267,6 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
+		.flags = CLK_ASSUME_ENABLED_BOOT,
 	},
 };
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 162a2e5546a3..d00ca925842c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* assume clock is enabled if found unused in late init */
+#define CLK_ASSUME_ENABLED_BOOT	BIT(14)
 
 struct clk;
 struct clk_hw;
-- 
2.29.2


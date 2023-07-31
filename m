Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5E6C001DE
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 04:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjGaE21 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 00:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjGaE20 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 00:28:26 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B66E6C
        for <linux-clk@vger.kernel.org>; Sun, 30 Jul 2023 21:28:25 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bbc87ded50so24703595ad.1
        for <linux-clk@vger.kernel.org>; Sun, 30 Jul 2023 21:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690777704; x=1691382504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5A36sJfoTWTZxxRtlkUpT4+tRtDcKRqPwRCEoULd4eU=;
        b=b5DQ6Rlyi7Lq9BXtLOOwalkREoNbb87b7unENttOCjxE8BVeLJiZVLColztFw+ksZi
         T5RO9eNtw8w4tbxo8yjiH8JdzdVbiLrXtczhvTfIZrpykQ7oQia1ZRmOGhd2hBXjrtZT
         V8fl0WKyk3tkCepVejzvfjyVLsuOV988AmZX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690777704; x=1691382504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5A36sJfoTWTZxxRtlkUpT4+tRtDcKRqPwRCEoULd4eU=;
        b=XjpjQlhM9Kzvmmrk9gv+tcUAIlfqC2ATSz4tI+JU0LHWN+9VlL6nQPX/9vu9lhZl4F
         IMUezXSoh/99E8gtZ+/sn+JEmFFgoubSy9pt90jHyl6bqAk4hxcI9j30FIYDCNFr3We3
         rVvi1un3gJduEFmD854bfgSMZT2OwGvADX0MytSrrPSowhDVCVZqOdzX8j3AVp7vX20N
         68cdq+kKtqTVyxeFzB23FYw6SehjgQ+P/cxXnlwQYxiF7fqpwN5oxGeHuBOaOwFR033W
         Z5aov5Z3U+P5FJZlBqcfWTgJ13+doX6CoX0b7csesOEuJ1Acg1jO+r7Xa4oJ9I36qjom
         yNRQ==
X-Gm-Message-State: ABy/qLaOdTTgaLu7/aTtSdROr6KJaxTYqSMwItRDqQipljEspB0zXFla
        dkjvX/P0vgO7o6WpaL+gFO9UXA==
X-Google-Smtp-Source: APBJJlGW73mZDqZnkyjN83Bmi8SBbMUxpBxQv5ILrRrZFjgWoHlYdewLdEqjUMKHtrkbxW8SlUceaA==
X-Received: by 2002:a17:902:d4c3:b0:1b8:b3f0:3d57 with SMTP id o3-20020a170902d4c300b001b8b3f03d57mr9821918plg.31.1690777704531;
        Sun, 30 Jul 2023 21:28:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd7a:6af2:fca:ff71])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902b20f00b001b9df8f14d7sm7349096plr.267.2023.07.30.21.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 21:28:24 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: meson8b: Simplify notifier clock lookup
Date:   Mon, 31 Jul 2023 12:27:53 +0800
Message-ID: <20230731042807.1322972-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver registers a clock notifier by first getting the name of one
of its clocks it just registered, then uses the name to look up the
clock. The lookup is not needed, since each clock provider already
has a clock attached to it. Use that instead to get rid of a
__clk_lookup() call.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Found this could be simplified while looking through some clk core code.


 drivers/clk/meson/meson8b.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 827e78fb16a8..c4336ac012bf 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3793,7 +3793,6 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 {
 	struct meson8b_clk_reset *rstc;
 	struct device_node *parent_np;
-	const char *notifier_clk_name;
 	struct clk *notifier_clk;
 	struct regmap *map;
 	int i, ret;
@@ -3847,9 +3846,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 	 * tricky programming sequence will be handled by the forthcoming
 	 * coordinated clock rates mechanism once that feature is released.
 	 */
-	notifier_clk_name = clk_hw_get_name(&meson8b_cpu_scale_out_sel.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
-	ret = clk_notifier_register(notifier_clk, &meson8b_cpu_nb_data.nb);
+	ret = clk_notifier_register(meson8b_cpu_scale_out_sel.hw.clk, &meson8b_cpu_nb_data.nb);
 	if (ret) {
 		pr_err("%s: failed to register the CPU clock notifier\n",
 		       __func__);
-- 
2.41.0.487.g6d72f3e995-goog


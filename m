Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76313C43334
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jul 2022 18:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbiGDS6G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jul 2022 14:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbiGDS57 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 14:57:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7DD12611
        for <linux-clk@vger.kernel.org>; Mon,  4 Jul 2022 11:57:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so6062067wme.0
        for <linux-clk@vger.kernel.org>; Mon, 04 Jul 2022 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d5poSYlinO2iAnmaIm0CnEx4qAIHaY4O+1UlEMuYCNc=;
        b=Cbxc+86iTX0z4WsVPx5OduAQlR9qkJU7TB0nwc6Kr1qNOKOmuUXX0DJw/PVhgaOEpA
         n/wmw3ELdBLOOzG4MFSbUWg0ZgdOpH77GcD8zIwGedIt1aYwzCkqLEUUy8mx0GVWGWvn
         XIRg7trM37CE4YC6Bu8BEICgISr7YUzsCJi3ELfL+TAMq/imcAsxiWiufaFrJ1nEGyXF
         wTFu9aQfeI7OPr4MwY6WTbxJZ3jJjW0t+9GRmFf6HXJ5gQe1OQwdORBCGezbJAp7KOQU
         126EmhjOKrZbyYhnjN2o+44jc20BKsdQgTtTcwTaqZdvh61PxlK8/PBeUWK0iS5UhjLZ
         ZBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d5poSYlinO2iAnmaIm0CnEx4qAIHaY4O+1UlEMuYCNc=;
        b=dJHNZy9P6xW7K3ZJcjGDOy/TFF7YVyOaaumEz1GWam+d/25Eu5BMOi3eEBsxxHk5eU
         v/K6MgpU7xWvsKPzl1UX6xI26n3nELruudsEquI2ATl8C9tJuJim4FPkM2/D+cgLA/P6
         L48XT1WseJhOIovj/6BTnDEmVeHT2oj4uhAs4Q1lO3zhQF3FlCU5Nu10OO/vXqtvVHsF
         ntV+LBNGA0gZRKAlGT77QGHLMTd71ojGOIfUYoUEwKmLX2AbFU031Uex437oL40RNcwO
         dNIM6MHHR0AYqRg+a75fVPf6k+UKdTlFrCRd9pi12h0bfP1IUHbm8IvVkZ6wRFdaJUJ/
         lzyg==
X-Gm-Message-State: AJIora/uFrLzW2LhLYfP/eqkVV5gwU3+1oUkJlP48xAx2cPFHdkQmsal
        tBU0goJRzXb78aZbJnrSQElKVw==
X-Google-Smtp-Source: AGRyM1vGKLOIMfCnLIwkfuo7eLCoSbQovJPAOaBT8opy2GAUFI4vyW7duiJLDWYmedNsLyIsleeVdQ==
X-Received: by 2002:a05:600c:255:b0:3a1:963d:2ba3 with SMTP id 21-20020a05600c025500b003a1963d2ba3mr14093642wmj.200.1656961071630;
        Mon, 04 Jul 2022 11:57:51 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id ba15-20020a0560001c0f00b0021bae66362esm27937213wrb.58.2022.07.04.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:57:50 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC] clk: Add clk_hw based provider enable/disable API
Date:   Mon,  4 Jul 2022 21:57:33 +0300
Message-Id: <20220704185733.1288578-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sometimes, a clock needs to be enabled or disabled by the provider,
without actually touching the enable count. For example, a clock
provider driver might choose to disable some unused clocks on sync state
callback rather than on the default clk_disable_unused. Such clocks are
usually enabled by bootloader and need to stay ungated until some driver
built as module probes. So add clk_hw enable/disable to allow the clock
provider drivers to disable such clocks on sync state callback.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/clk.c            | 25 +++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f00d4c1158d7..a727cffb6bba 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1011,6 +1011,17 @@ void clk_disable(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_disable);
 
+void clk_hw_disable(const struct clk_hw *hw)
+{
+	struct clk_core *core = hw->core;
+
+	trace_clk_disable(core);
+	if (core->ops->disable)
+		core->ops->disable(core->hw);
+	trace_clk_disable_complete(core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_disable);
+
 static int clk_core_enable(struct clk_core *core)
 {
 	int ret = 0;
@@ -1176,6 +1187,20 @@ int clk_enable(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_enable);
 
+int clk_hw_enable(const struct clk_hw *hw)
+{
+	struct clk_core *core = hw->core;
+	int ret = 0;
+
+	trace_clk_enable(core);
+	if (core->ops->enable)
+		ret = core->ops->enable(core->hw);
+	trace_clk_enable_complete(core);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_hw_enable);
+
 /**
  * clk_is_enabled_when_prepared - indicate if preparing a clock also enables it.
  * @clk: clock source
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..0f9968a7a6d2 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1212,6 +1212,8 @@ unsigned long clk_hw_get_flags(const struct clk_hw *hw);
 bool clk_hw_is_prepared(const struct clk_hw *hw);
 bool clk_hw_rate_is_protected(const struct clk_hw *hw);
 bool clk_hw_is_enabled(const struct clk_hw *hw);
+int clk_hw_enable(const struct clk_hw *hw);
+void clk_hw_disable(const struct clk_hw *hw);
 bool __clk_is_enabled(struct clk *clk);
 struct clk *__clk_lookup(const char *name);
 int __clk_mux_determine_rate(struct clk_hw *hw,
-- 
2.34.3


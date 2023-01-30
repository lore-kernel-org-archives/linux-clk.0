Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C89C636CB
	for <linux-clk@archiver.kernel.org>; Mon, 30 Jan 2023 15:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237530AbjA3PdN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237424AbjA3PdK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 10:33:10 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A4A3D0A0
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 07:33:08 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id k4so27358759eje.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klMFULevlZRSdq/t6HkLJjoWsUEq+5/M/OvadlOEDJ8=;
        b=TufXggk+98chwa+9EqnSSCJyj3NeVAN/J4oKU6XwYsgHnTNNyMoIDpFKet588OlBv/
         +evgBQr33NkssDSzsH7RIV+gScR538nB2jvVFjdmgrNu2t04Bq/UHxqiCDpmHnwnhhaV
         rA2dqPMQUxzAYChNF4hCjZ/yuvUmP3ChYlIl1I8SHR5X0tciHJxWfZtqaJ6yjn93Qk/q
         YclnhK7OsmRvbHhd5xExjF3EbMozJxbVdZBWcAgqNaBzIvxBAgVaj0O3YFR+ZL0NPYyu
         jWlPLvDW9fYA2JzjW7j2GoOnW+WbLdXBhLn/9je9vi9b6mSi74hyTP6khKC0nT7NpQlQ
         atIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klMFULevlZRSdq/t6HkLJjoWsUEq+5/M/OvadlOEDJ8=;
        b=D696I9MSBDZFw1W5EpR8w7ChQRyZMiojqvhl8aaa90G+paKMUWTHPN6gAgxSVlzAKV
         7jodRdudJFEgl3gvM6tJ78J6oG4BarA1VifT0coAoUYmciyA1JaHZ0ZMcJKsOT4a+Cpu
         IvlzES/kD4mXVRYuHG8AvhGbqAzOdNUZufKr+of1J+doKYsIMPrp0yIM0aVxHNSqxZ+X
         XVWM4dTXSLLlaTXc20arB58gh/BkI1SexQ/zFE0hmNxQBbbhsgtPlyuQNOQ8exIoI+i/
         szcqe7NiKk2wulfwlKnJrwcj1aTHt9Tq4DkTjZFJNOFYzHssia9YwcwJNXxitP6jhXX9
         1mPQ==
X-Gm-Message-State: AO0yUKXcgVWPaI4BGr/lkhjTudmbAoLPotf+SrKY5GPlkFbqgsRyUtR6
        l6f5sS1yZRSj91JeO+LyQzrHOw==
X-Google-Smtp-Source: AK7set/8thb0RPFSzYQ4tFMVEuWkNDGEJkgsXS0/hVDeS6KIu/w/acJ5fN0fMIHFjeuw+1SJ4t76HA==
X-Received: by 2002:a17:906:9bd8:b0:883:ba98:204d with SMTP id de24-20020a1709069bd800b00883ba98204dmr8557395ejc.65.1675092787251;
        Mon, 30 Jan 2023 07:33:07 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906054700b00878769f1e6bsm6805773eja.55.2023.01.30.07.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:33:06 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] clk: qcom: branch: Add SLEEP/WAKE fields definitions
Date:   Mon, 30 Jan 2023 16:32:46 +0100
Message-Id: <20230130153252.2310882-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
References: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

HLOS-controlled branch clocks on non-ancient Qualcomm platforms
feature SLEEP and WAKE fields which can be written to to configure
how long the clock hardware should wait internally before being
(un)gated. Some very sensitive clocks need to have these values
programmed to prevent putting the hardware in a not-exactly-good
state.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:

- New patch

 drivers/clk/qcom/clk-branch.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index d8fc7b93ef6d..773f760a4590 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -41,6 +41,8 @@ struct clk_branch {
 #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
 #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+#define CBCR_WAKEUP			GENMASK(11, 8)
+#define CBCR_SLEEP			GENMASK(7, 4)
 
 static inline void qcom_branch_set_force_mem_core(struct regmap *regmap, u32 reg, bool on)
 {
-- 
2.39.1


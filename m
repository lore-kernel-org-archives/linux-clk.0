Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E08C7EE43
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbjFLJ3F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjFLJ20 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:28:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD544C0C
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:22:53 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f642a24555so4795453e87.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686561772; x=1689153772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wF7kJNEVNClZhr22GJ39Mf3qOuL6Q0VFjYnT8ReRfhE=;
        b=TQFyRQ9dCAAjzWOD1qlKjLIaGuoxP8JtMlaRrMdhIDuLRK4jGXpvd9VWW5vx2qTjIS
         IgZLOVYLfGkuntkIxDONGBdGyukhQOKTQmYYsLh6KJvYOtOMEaC0oDUQ4TeQllmB9DSM
         1TzEhCcbitB1S1jqEYzXDhZK370PA2R3KJV++NAO93DIWdcAszS+iaCEEAxw1tcDm7H7
         mJ3naSjr4iUs1S/w7yidyLrpmVQyer7mjnZsSGAneL767HuG0AOWbx6jTgPk1QCfDYUv
         NV/wwsgN7wXiJhI9YdNMImRO+Q7nHpXyWashbxmUNzs1qz2q4TAHosQq1BUxtgizWvKX
         HqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561772; x=1689153772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wF7kJNEVNClZhr22GJ39Mf3qOuL6Q0VFjYnT8ReRfhE=;
        b=hotN3jcetqE8qkxGIQE2Jl4jD65JoMhrmeF9EH/3r0r5faL7E+HIJM3dplaF6zuoam
         6BEOFcXSD9ujBzI2IbY+hYHIC9F2DXFs23BSH5kBkrzTZ0VQZkLowpTRVHNnSfNEuetI
         d5Avxug98AUKpUk1hr8IWYED8u2ZnRoOf9DLa8uI8pJv0OfLPwIhJHVKdyAqpqvRaHJm
         9AEYYhlo43EU9R/SGhpSH8NjmBrP7bkQ0bCBk/kCacEdjuD4S3GFR+/W+iWgUNnB8g1b
         YVY9Y92NaK2Vjmy8N2bC3cVKdeiEJIt/y2zC4AeAJ5G+DBGA5fRQnm3KnPwappBBd1zY
         gnwQ==
X-Gm-Message-State: AC+VfDwhahV69OTyKrDykSUjf9IoNqwFrI/5w8tVagkkuQiUKyxI2kl7
        9FncRDlkfJM8HyZkhgnB4S5GIw==
X-Google-Smtp-Source: ACHHUZ7RbAzssVMBcdrvdXlaVgKlkWxS5u0gD99JnUeFDv45MtVzgcIujsTbpXWa2jpkgJNModhPWA==
X-Received: by 2002:a2e:8719:0:b0:2b1:e65a:a1d3 with SMTP id m25-20020a2e8719000000b002b1e65aa1d3mr2200583lji.40.1686561771994;
        Mon, 12 Jun 2023 02:22:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id o20-20020a2e7314000000b002adc2fe3fc8sm1681722ljc.4.2023.06.12.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:22:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 11:22:48 +0200
Subject: [PATCH 2/2] clk: qcom: gcc-msm8996: Use read-only RCG ops for RPM
 bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org>
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
In-Reply-To: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686561768; l=1415;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ciUM7VVqmyaHUus+1v7jieLBfQZSXfrd5Ukd9qFyQXo=;
 b=34ZFn6hCgCgNYS/VVRxB/dsQm8stj9nIrROWY7b0B1M6RqHvB/A+SpcLbyv4XA5qQ4vbLebmW
 giUvvTAi9p0BcxEhM4uBTY9UCEv86kBgUMnYvr0BMrglAgg99c9oOtL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The config/periph/system NoC clocks are wholly controlled by the
RPM firmware and Linux should never ever alter their configuration.

Switch them over to read-only ops to avoid that.

Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 5e44d1bcca9e..588e3b67657a 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -264,7 +264,7 @@ static struct clk_rcg2 system_noc_clk_src = {
 		.name = "system_noc_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll0_early_div,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_ro_ops,
 	},
 };
 
@@ -284,7 +284,7 @@ static struct clk_rcg2 config_noc_clk_src = {
 		.name = "config_noc_clk_src",
 		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_ro_ops,
 	},
 };
 
@@ -306,7 +306,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
 		.name = "periph_noc_clk_src",
 		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_ro_ops,
 	},
 };
 

-- 
2.41.0


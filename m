Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32957C11F7B
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EA5761622
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbhF3Nec (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 09:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbhF3Ne2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 09:34:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0CCC0613A3
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 06:31:59 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t17so5232038lfq.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=iGjCMoZAsR3C08FVW2wUexAl3OiXXIgXxPdEXN/UjAHi6UBv5v28IkhVcZLQvTJw5D
         Fw0uztQxzd6y1BNGAt9RSWW14ScCvDunMGu13h/xX/FfPr10d2MFGF4DJmrkIGYLYmQE
         NK+Ww1lTgcApSSzEzDlWWFFDgaK5VzXulSCFGNRaOWlsJDtMFVHtoA0XnBFQnTu6o6JQ
         UwyI+wFN7URtfpdwRFc79mLjqZV8UWH1U5r6RBHdVsVr0Pm4yCdcDvvoLxR4XGaI04iA
         eiMo/krjTz+HFd1XLDzhPvKytiQcLlxze8UK1cVOyuPx1MfGEk4dBY4Mtcx5lNAYpzSA
         lz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=oWZ9tXeBPiOJ6K4QNr4x9C+OUZOT4ZlqkDynx4mAuAncTYUxIEifJOWT+DcA422OwL
         FaukIvpuiWS6AL6V6ecQZaf9JoXbm5+/kYJpRytu+dVV/56zKzVshWUjERqvK1vE39CR
         t6iQXfeavEuQpeaInQVTS2EMrGW/Xd7L0iIw6WH17LNGe3iX4j9hQIxnG65wOcMr4xaD
         B9hEjmMlo7u0aYvBpoeXPrvee/OrpjYZVQuLtlwK+9TkSX5K35G5iugc4LV9Z9S7180x
         JnucAb7R5Emohh4TlcXKJbAXP4/BQPUwrD9KdMAKNzkXzmjEu8Q5Ak/hGbPPZqzVcOLC
         W9bA==
X-Gm-Message-State: AOAM530iBNDdlTdQrxR2jl1JxgHSbffofDXiF3UR/SLTped7ZjR8Hurj
        fChI5ZWjyB8uDBJfpAIbHHnsPw==
X-Google-Smtp-Source: ABdhPJxW/WD7GUsdSYVEZlbk6fXSYFsdVdHuSWzbaLh7Nn+zKQdBdygp9o4CIo9p/woMGw9+TgfEDQ==
X-Received: by 2002:a05:6512:7a:: with SMTP id i26mr26839723lfo.2.1625059917527;
        Wed, 30 Jun 2021 06:31:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x20sm1578098lfd.128.2021.06.30.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 06:31:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Wed, 30 Jun 2021 16:31:49 +0300
Message-Id: <20210630133149.3204290-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 7b435a1c2c4b..eedef85d90e5 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -276,7 +276,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -286,7 +285,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -296,7 +294,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -306,7 +303,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.30.2


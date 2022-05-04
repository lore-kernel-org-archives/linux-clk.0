Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E96C43219
	for <linux-clk@archiver.kernel.org>; Wed,  4 May 2022 16:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353540AbiEDQmT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 May 2022 12:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353543AbiEDQmS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 12:42:18 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDEF2DA85
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 09:38:41 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k2so2786728wrd.5
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OL4OygVzSjP0XpPxh6rx/xZO5NOzCq2mv5XgMowVSTY=;
        b=oYyGqRl+RkNxCmu3AtrgJ1epuLShDEh2zKmthdd2zyyjh0ny1iy04eQbZsZ9HsO6Yy
         1sOnO4Ey/7rwulblZuqmRNNxaWoFOlsGjv0aFfGS0JOHwMegU264vYleEePMLm0UtTOG
         y/1rPixgniVaVvQLXB+8XPn1mHuPziFoJU31mIIvF9FhhUcNyrvxzXrkAMx39vJJXBsp
         HlcgVBs9HyUqZkdhmagWsJqghrLpchIW4aBTynCDA8/PN3X1tEgvYv145QwcurJxn1+9
         dX9oSyTLTM617a4RdLfkjYlxFGrN7Vx2JovteDVSj+TSE0UppPjy79DGgOb4OcQo3gEm
         TwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OL4OygVzSjP0XpPxh6rx/xZO5NOzCq2mv5XgMowVSTY=;
        b=h2b8fbF0Ld9j0oUcDdhsPN6lXk3eHbJ6UmjkqZzbBR/sHRRuwvrSWP6lfZy6enWD0g
         FRcg7UNxREgdsrrlplX92dIgBkWXVHyYCt2qc94knjgw9ou90WIbX8YB+XUZDRLkYS/C
         /l8ZAkCMGe67K5jYfp7rmXzTyajbZqiLLqIVWhXL3sQACiLQMW4CtAqZlKgUMfut+hIB
         MPoKHrYRgHvxcoMI7vaMGP5mz5d3LRsrTH7UDcHLSG2bVKrjwJ5xiZn5TYKrd5fvjaCr
         lR/bno2E9MEnXUzFvY06WSDdiJJFN/4M1rVJzpOTuBrmHGWDmV3ft1jq0fzlCnbLqn2R
         valg==
X-Gm-Message-State: AOAM533a/1KdX072HlTalvNLwAVG0Gen4QSp78lgIMOYmkMJ3WAA1UZi
        RhR1hkC27Z3YqK+PXxM2emNknQ==
X-Google-Smtp-Source: ABdhPJwQdjfgZsZ7V7FETHh2ZyzPmf5rJmM/DrOREnvSlLwPjMdu5PdVgQeoKPRuTaeQgZhKp8bFeA==
X-Received: by 2002:adf:ed03:0:b0:20c:4c8b:8e07 with SMTP id a3-20020adfed03000000b0020c4c8b8e07mr16843933wro.423.1651682319843;
        Wed, 04 May 2022 09:38:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:39 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 2/4] clk: qcom: add gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
Date:   Wed,  4 May 2022 17:38:33 +0100
Message-Id: <20220504163835.40130-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reviewing qcom docs for the 8939 we can see the command rcgr is pointing to
the wrong address. bimc_ddr_clk_src_rcgr is @ 0x01832024 not 0x01832004.

Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 40c20745a024..49e4bb87c46a 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -634,7 +634,7 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 };
 
 static struct clk_rcg2 bimc_ddr_clk_src = {
-	.cmd_rcgr = 0x32004,
+	.cmd_rcgr = 0x32024,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_bimc_map,
 	.clkr.hw.init = &(struct clk_init_data){
-- 
2.35.1


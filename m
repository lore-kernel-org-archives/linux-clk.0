Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE1FC67871
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 20:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbiJXUSo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 16:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233376AbiJXUSZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 16:18:25 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE3A12A34C
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 11:35:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l32so7070448wms.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 11:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/us6so7a7L/wAT5CX3+5Z/jO0OFN3Rtpb2Ic6XDIGg=;
        b=tYTUZ5NTpMo0q3fxgyh+J1efpmkcEl5aAVtNKf8717N3Nu1eLt0N4dwQamcO8K5dj/
         s5tKaPClYuOTOVPrKwNhnaVbWFADG62EweuqPDDIncVDuBv1icozaf89clr8aFtGlg2G
         QgLMNjeMdxnThCVkJy5xFgZ0lQI9DiANcQvFymvuj8sNPK2Nzxnfkl5v5OI9DulnqV0p
         UykVi+rPsPi8tdpMl/CFLLQQui/XXG+7C3Pus2orKhKvlkdcOMOpGHmAHCTsidrlhR7b
         NM5vcAzn9TcUJ1QHOiiiF8oh1zQq0Eu8jTjeeugZgFnsiYo7Sv/Xj0Rt6fkvi2qHRng4
         mySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/us6so7a7L/wAT5CX3+5Z/jO0OFN3Rtpb2Ic6XDIGg=;
        b=x7jR88Ru0TeRd0ub7JhFIOvIzaxl3MHe2WAO7vbIQJ4TxYPDoT9JV2gBiOhjIDP3Oc
         s1hd2Uep7SyTIH7uBwvqmOsuQpt3c1IEyyccb9Bhj4kdv4mK62KvYMzVSfkirXtzVAfm
         wyGt34yXwfDXkJvbRJxTUA/olR9PkY1BthiktEIPUTVrBqf+lpfI6es4fiS19RvPCzlL
         rT2yIsxHp+sJC7B+kIFi+Jv5nXbZx7Hjzlrrc5feB+sA1VaodgLIexq+7v1ARyVhC1Eb
         n5cBr8UOLRvZ/mmuv0nOsFU3BaIYYDD5pG2h5DP6/3F8BVDOFesbBvr47+dBzzG7BwSx
         X42Q==
X-Gm-Message-State: ACrzQf3H7xHbfa737S6Q1Vy2tSngxqrFy40tI4hlyg4kBxWuJjsit5f6
        MtF0SXvensHZbGqNmkRyeMSoiQ==
X-Google-Smtp-Source: AMsMyM7e9+NIXQNHCmAyNHaoJZRbf/vcjeKvJwwdUpTRjQTg26AmGlaXrBt0Uz+emmp/JFYemwCqDw==
X-Received: by 2002:a05:600c:358f:b0:3c6:da94:66f9 with SMTP id p15-20020a05600c358f00b003c6da9466f9mr22777161wmq.142.1666636451706;
        Mon, 24 Oct 2022 11:34:11 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n11-20020adff08b000000b00228692033dcsm280323wro.91.2022.10.24.11.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 11:34:11 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Steev Klimaszewski <steev@kali.org>
Subject: [PATCH 2/2] clk: qcom: sdm845: Use generic clk_sync_state_disable_unused callback
Date:   Mon, 24 Oct 2022 21:33:58 +0300
Message-Id: <20221024183358.569765-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024183358.569765-1-abel.vesa@linaro.org>
References: <20221024183358.569765-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

By adding the newly added clk_sync_state_disable_unused as sync_state
callback to all sdm845 clock providers, we make sure that no clock
belonging to these providers gets disabled on clk_disable_unused,
but rather they are disabled on sync_state, when it is safe, since
all the consumers build as modules have had their chance of enabling
their own clocks.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---

Changes since RFC:
 * Added Bjorn's R-b tag

 drivers/clk/qcom/camcc-sdm845.c  | 1 +
 drivers/clk/qcom/dispcc-sdm845.c | 1 +
 drivers/clk/qcom/gcc-sdm845.c    | 1 +
 drivers/clk/qcom/gpucc-sdm845.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 27d44188a7ab..e5aeb832e47b 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1743,6 +1743,7 @@ static struct platform_driver cam_cc_sdm845_driver = {
 	.driver	= {
 		.name = "sdm845-camcc",
 		.of_match_table = cam_cc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 735adfefc379..1810d58bad09 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -869,6 +869,7 @@ static struct platform_driver disp_cc_sdm845_driver = {
 	.driver		= {
 		.name	= "disp_cc-sdm845",
 		.of_match_table = disp_cc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 6af08e0ca847..0ff05af515c4 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -4020,6 +4020,7 @@ static struct platform_driver gcc_sdm845_driver = {
 	.driver		= {
 		.name	= "gcc-sdm845",
 		.of_match_table = gcc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 110b54401bc6..622a54a67d32 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -205,6 +205,7 @@ static struct platform_driver gpu_cc_sdm845_driver = {
 	.driver = {
 		.name = "sdm845-gpucc",
 		.of_match_table = gpu_cc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
-- 
2.34.1


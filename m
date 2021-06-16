Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E055AC49EA4
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7A3C613DA
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhFPONh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhFPONe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 10:13:34 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B6CC0617A6
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:26 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z8so2839823wrp.12
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+LrLr5ScKl10ELD0o4ZHSHRjCSJkFhG5a8CEjAWpf0=;
        b=dYpK2lVMhSj1JMnFOWz/gb2RgSQ9t3LSlBD8hDZoFpWqEbXwVv7r50EshsXzKmzhn6
         072awUEOdcuOAgXuqQA0KuTntJ7Kn7/E+KCHdGP3FKz00v0YFP92hgm0b6s4/HzJHpqs
         WtLiHIMATvbpu5T23XuQYsPiD9ryOJ4mTm09so9EWnffJTH7SNwdYNsRkLI7OYuVyBem
         GKHDb5QhqirylTFQaQBTMMQ70WqTsqcB4X1QJ6ozCH90xyY+v6DAvbCozRY6MFokBuXO
         sMSZXjy7L/LfVyrJocwVt4nWtqz0WKBOOTV32ocB8pgrFT5ysObzdPSNfrDqNH9NrhIN
         ku+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+LrLr5ScKl10ELD0o4ZHSHRjCSJkFhG5a8CEjAWpf0=;
        b=Cd2BHtQ9Z9xwrDoaAg9P7Yt7WtR8BEW9kdbyejYGh0QRfbjr3SWFlsaD/Zcd9OPZOO
         NSSqPkJFVYwQTRMxdDhn4n/42FioxlvX48I+f9FVMkqizYtbCys/kZwdZ/rX2nIZBI5g
         cZCXurEI+7uD4ygKG1nACZpzkspe3iZAsY4st4XYpLvkvKNBIcYtia6tawGNt4aJfONT
         TVx+5w664UOrPyM6XzGvaDfZwpwcH3E8nGMT3xaurGRLhWAP8+ieBmXRvIw7Hv9r3MYD
         qSlXRVscgh0t6x1YrACumlGG2i/IWvniSVsocd0jZMGPFspPR2ppguHQ7tw3ko/Sq9c7
         iZ+w==
X-Gm-Message-State: AOAM530oaNAdbhg8Gg83MmbfNzKzziLXaiI47q8ELlkTXdTXxd8F+tdm
        VMbqH7Ggv2kFt+M1hdosXxndMQ==
X-Google-Smtp-Source: ABdhPJxAFBS8WqjBJ74ngiCvh2qJQoU+yU7YGRzoWEqeCM9ZbvMyzePxiEBZodMpXcaaxATvaD5jqA==
X-Received: by 2002:adf:a45a:: with SMTP id e26mr5804185wra.222.1623852684859;
        Wed, 16 Jun 2021 07:11:24 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 03/11] clk: qcom: clk-alpha-pll: Fix typo in comment
Date:   Wed, 16 Jun 2021 16:10:59 +0200
Message-Id: <20210616141107.291430-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Substiture lucid for trion in comment, in order to conform to the
function name.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index c6eb99169ddc..01090852ea76 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1399,7 +1399,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.30.2


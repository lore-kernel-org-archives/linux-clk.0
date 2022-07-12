Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9D8C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 12:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiGLM73 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 08:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiGLM72 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 08:59:28 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7A71FCC3
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:27 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id q9so11063631wrd.8
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YcLvi+3H4SZDC4Wsi6Jml9K8EcZLIybrbSAvZgpWSqA=;
        b=dmGcYqbWfgUh+Q1+INrTNsZzRzGhE2fn0s41tXguGC9PkK0FL4oIgSUfFVymKl7RBS
         m4NtcbRJMJuWfoYr3CbyaLVuJpsP+2vnDZ48mFdA9tMEHvJQZ2hH7jhu7bMFCBtpt9Lv
         wGQo5Q6zKhANT1yLQYqOQSdoY0zC0QRKcFMMjmDCStRAehvNb4D+/aXzy5GICKPadft1
         sYvVEMu3BolHb5rOV/CN4SsgbJYunypTKpwUzQURdSIe7GQPE+2aDCEs8YCvnBbLW7ta
         ZXGyNbhXc1zEPdiZrQsrLslTEd77+wTRN0x4BZVvpw8Fz0GSZfiPD1t0yjjNB3lYuFTi
         whNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YcLvi+3H4SZDC4Wsi6Jml9K8EcZLIybrbSAvZgpWSqA=;
        b=DkQArcDjUG1nvMZlkH6dg79zP8uaXI9+JKqN7Bf5iVhOZubxV5Q4jcEaoAJ3fdwj9y
         5zBLijlB5mq5Prs6Hmujk7PoxTbajs1an+komqumxTUIesGYcnAZgSsnXcJiKHPuu2kd
         pNPF403oolCU+DKmUJL/2FwrvniaiPJzRXcBO1Trn1JzBeocFBL/DfrEDeAheNN4+JKt
         j/5DKlCZKDCuBhr/6BvYfvbo7s0GHAgrtiaYmy3M2MbKn0MmSRu4J1d3vqRf0M5PJor6
         cUtaxrh0LdSAIsqPrwNH/53CzJaXdE90HGimb5QGEJOLvdirdrqN/eissxGeJuN3odnO
         OduA==
X-Gm-Message-State: AJIora/0Q/mIK7w3k36kDIygr3XIlALym7Wv8kl7TvEl+Gpbf4hxW2Ii
        kT9XIMxd/9j6EfOcBVYFtJsWNQ==
X-Google-Smtp-Source: AGRyM1sk2ydtTGiAIm2ysjC3FJO4ph1CqAj/xRQPAVIZmuTklOKE/MQhoamv2UhmdjFnZnBKb7/VzA==
X-Received: by 2002:a5d:69c9:0:b0:21d:6427:f553 with SMTP id s9-20020a5d69c9000000b0021d6427f553mr22567022wrw.257.1657630765679;
        Tue, 12 Jul 2022 05:59:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/6] clk: qcom: gcc-msm8939: Fix weird field spacing in ftbl_gcc_camss_cci_clk
Date:   Tue, 12 Jul 2022 13:59:17 +0100
Message-Id: <20220712125922.3461675-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adding a new item to this frequency table I see the existing indentation is
incorrect.

Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 39ebb443ae3d5..628b476a5468e 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1002,7 +1002,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_camss_cci_clk[] = {
-	F(19200000,	P_XO, 1, 0,	0),
+	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
 
-- 
2.36.1


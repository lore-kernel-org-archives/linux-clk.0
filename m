Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A06BCCA482
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 12:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbiGLM73 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 08:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiGLM73 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 08:59:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CA61FCE1
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:28 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so4754627wmb.5
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGmubJfrLjSm9JAoHZslmLyGxIMnq3hUIjCR/6pycIU=;
        b=lwu+sDij0oIDTBVhhUHAe05XQQ8hnVhOQsUf6sjeqHka24pCYDWZy8dJbO5Qyrs0WW
         y2jG8po5NMLC22R7hpmwoQ4B8a4LkffHViNYIhi7t54aMbc4MYjBwM4RF73pJB5fx+CU
         IgfxEHtJ7SMgv0eJeTBCE7BBnZwcBNeQArUTM5upkoaj3t84/56CdoqNrmMqAvUOkZm3
         RVtOiBGSs3zZt8a7Er1aQBa1VwxlHwHd1N/dlFrB1BSUjnbea9+oE7nPk42JqE4a7faH
         mavJgJyNTIlmYoXXIUvyB1IZ05qd/yW+K/IqRrZAuDzAawDiUgztpHhya/Yj7MKJsmag
         Q18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGmubJfrLjSm9JAoHZslmLyGxIMnq3hUIjCR/6pycIU=;
        b=dgfxRgH28yCB2Ee62MsV9g38zHzW9jq5w7BA5+qgqwmKhuMW9ITPjXs0d68q+m3b/r
         rjg53YC/S1knq2ATxxfLlvYuqIyszMlai8M5ovbL7r+zqk7atveH9PzBnSLJrE8mcspG
         r1+Ihaymd32Ia6UdeBVL4dZM52gLwG5EkSVSK59czkW3Y6u/cJAc2fUN08htHJd6LGRg
         oNYBqZKU1UpL7d7RKFRCwWqMpCIWSKqkjDoPUOnLZbgKC/LUy7h+5F/SUbLSwzkS72nh
         ZBHPXBDyK0WPtnqD1cBbwkNNOyR/PpPM6eK5YeYyMQCyBjSM1UxCTt0O/A5/HgiAdAIB
         2oYQ==
X-Gm-Message-State: AJIora9pVI+uUeY/ot982vZc4oK9bVTfWrUZmOVFdJ7RSQjPEykqV8cx
        ggUl6Zg4U9ut6sM6wxbuk5Fp0g==
X-Google-Smtp-Source: AGRyM1vuRmWtPxdlVOsiZ6Wbb3SfvMFi6r5RJsyUjzWdnsFZ/RdnTmnLB5wnE0oYoX5PBeqVajWpGg==
X-Received: by 2002:a05:600c:2059:b0:3a2:e5a4:ef8 with SMTP id p25-20020a05600c205900b003a2e5a40ef8mr3605632wmg.146.1657630766594;
        Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/6] clk: qcom: gcc-msm8939: Add missing CAMSS CCI bus clock
Date:   Tue, 12 Jul 2022 13:59:18 +0100
Message-Id: <20220712125922.3461675-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Standard CCI bus clock clocks are 19.2 MHz and 37.5 MHz. We already define
the 19.2 MHz but are missing the 37.5 MHz.

See qcom kernel drivers/clk/qcom/clock-gcc-8936.c::ftbl_gcc_camss_cci_clk[]

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 628b476a5468e..6a3e2326c72a3 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1003,6 +1003,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_camss_cci_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
+	F(37500000, P_GPLL0, 1, 3, 64),
 	{ }
 };
 
-- 
2.36.1


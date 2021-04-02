Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC79C43603
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 487C3611AD
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235538AbhDBU6U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235285AbhDBU6S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE523C0617A7
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z8so6667894ljm.12
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=GTnbEgbKsX79rBeA/vMUlcHO7mDwhKtf+xQR8oPPUIzwRdFkxYLMffZk9dI4IU8Qta
         vKWmzv+KYxbThatuZ/TeKAUgzdQNhuOd4FBAed73evEOeZbrWiE6tSODoVvBRtuY0pC3
         T55OfbjOoOJh0n6ux3q0FaHfouDctxFbbc30OwGNvOlMqdLRy1EEVZtvYQlZwfA/hX6S
         J6j9rgTkm5bLzimzfFXyF7rbLe7M07e3S5YZPpTOrjJwdfZqD45LeyV1+5wClX9wc4rv
         Yv6yGLdsgBVBAhyzGmfOoClzfBZ5Z3KU4HVBgmFZDzzzQJJ2IF5xyIUbDjb650FerqVE
         KZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=forRx81BTe0Kl2esJAvH2C7NpfkUKx+bzy/uUS165Afuu0z+jxrPbWgaAnXb8NHC2x
         xjZsm3L68QTgIUaExT8XvXKj5AniV2tHsf1T7mSS8PjiIf/lS2Bjo+YZZntRe+fwymD+
         SPbHmQaP/iVC7GyCL+BJkMQeADpk+C8OADYZRYe/yb6K0Cv566paqFXnHBCid+Wi/H2l
         SwcCHsgE/VVxPb3yhyKdGAwwQTgnWz96FoAjQGeTh2iX1+BIOgp8ojo99P4RtC4UKN/x
         Fy4P3/EhqQ9rPG5Y59zMdxKsPinoaUy37nNofztIjQGprhNpNbkOXje0H5EnK18HuVsg
         PoCw==
X-Gm-Message-State: AOAM533sZf9P1aUwkhqEzoXOzvMfGzGc4Hxezr3Bb/Ulh+UuQYdsNbXU
        yqx91lLz2GMLVJv9OMFGJmgAYg==
X-Google-Smtp-Source: ABdhPJxXhxuLXYyk89jk1XXEgijIWsZZ0JiIkXfQjfUh2ZTVAqOjkWOiSDAAp4CXRr0M+I1s4DjA4g==
X-Received: by 2002:a2e:9952:: with SMTP id r18mr9079603ljj.180.1617397092255;
        Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 07/16] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:55 +0300
Message-Id: <20210402205804.96507-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gpucc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 3fa7d1f9ff98..67c136a77efb 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -26,7 +26,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL0_OUT_MAIN,
-- 
2.30.2


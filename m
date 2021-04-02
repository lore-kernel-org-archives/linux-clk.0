Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF48C433B4
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34A6B61185
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235341AbhDBU6T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235256AbhDBU6N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:13 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB20C06178C
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:11 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id c6so5213531lji.8
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=RQseK+v2y9+Y9Tja3btRyJoS2TWXAxKLDDqf0PxrB92NAWyzu0QpuUON+2zUJDNiQz
         cHqxmlhSdjavwwMtMciXtgCxsEZncS80rHO2rUlChs/orjzQ4bDfXpZ+bmc+DCVCE5Gd
         fdjz4SLYuEaFn4giNpPoVmYv1sAHmmNpTJxYS/xeSoxGUAk1J80V7reH2FD5IGthou7H
         GADxTpM/QcX3uLw0QVKN6i2b1vC/n2bvOAUHr0+YNlQkNEvY8gGm7qluQHkik9NfQeq5
         Yj96IGS5erG+rF2gOpNFher45W3QItQ3jWB0DQjwLlWjjBIsJrtV6JIU35LRGImiUbKc
         j/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=JUrmz6Z8Owsr6S18CAzjIaLIXBonccgK38ek7HZCghnfAtKqHjeYL0CHGl/2mcAKMc
         oTAUJlrllov27/82PXd2LRngekeObouqrokrJuSpNiAdeWf9HvnYZYagC9SZdKJb3DP1
         8vqKzR7LYTNKVxJEg4O1uVHkfcawmKL2dNMjL+jm5N8RXNWpkTFLG+4msc37cTCCU/P5
         UYD34hekCc3TJAduZMUBa4z9BmAnyjWtZxh6pzbISHgCJGedgQruWxtAZQQJyxp3qRW1
         NBvtPY/fV8BVnegM4v/yvsU5tNeSz1X4DlNO6IVezyZdFI4qcICgwcFiO8+f+r//QYWc
         DG9g==
X-Gm-Message-State: AOAM5321G3X0Ztr7ouuStCSgbtD1hlvrUb9biCLmk03/Wx0migQu+bp4
        0KjdFLOiy3UckjkXLRj4CWwh+Q==
X-Google-Smtp-Source: ABdhPJw45AhbBGM61ImPHmAHwcmSNXScYW1iW034WjSYHXbHnLCmfyAdLzr2DQISjHqwqir5lst2GA==
X-Received: by 2002:a2e:5445:: with SMTP id y5mr9529636ljd.381.1617397090254;
        Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 04/16] clk: qcom: gpucc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:52 +0300
Message-Id: <20210402205804.96507-5-dmitry.baryshkov@linaro.org>
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
---
 drivers/clk/qcom/gpucc-sc7180.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 88a739b6fec3..d738251cba17 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -26,12 +26,9 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
-	P_GPU_CC_PLL1_OUT_EVEN,
 	P_GPU_CC_PLL1_OUT_MAIN,
-	P_GPU_CC_PLL1_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2


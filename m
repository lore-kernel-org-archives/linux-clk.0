Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E33AC43460
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1C926100C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbhDBU6L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbhDBU6L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:11 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA89C06178C
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b4so9088018lfi.6
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=nPv1d+lTkkym7XVbDklY5lSMjysVIgpZlelhQ/l2NXLeHT+9VRoPI/DNpcy2cYFXKA
         JI4U1g6/fVbnVqWBEseoO/2PO2giozLiFW3SzCQBsDXmOaBK4/+8WSL4TfB2B6cxDebs
         p2cpqX3gzeY2X+zORZA46vcLJ3ss5dp8rBByGIoCotiotZFwXNiK2kJS8dHQghVm7baf
         glKxFvhPVOD1DJpXppK6pT7HoerIAB10se5yVTg5vsCaF0w36L93SlFKpXZJUoe82g6U
         +7b+u8HHQ36/zECKMYnqE0iKT6ixGe+77UcMy058ZvuIPEph8xsSBXi2JfHD2+V+dQ/o
         fBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=lEJRt/fx5cTYjHV1xwp0y00zmegHO94kgAm+ljW2cfTPyHOkqT4NDN70fFrZcDLCfy
         dSdSV/0nCk3nBgi62i7bR3dpgBvKGKAMHrL24CpSdycV4+EWXUWJYwAdusx20NXVZ2mr
         B+LtNS9JLnP/nrusmkZDmaZe96IlvWj34KjuWqRlG8X3LVlqesoM125wMT4z4xSkgQZM
         LT1YSCwkucB7ClEiJ9HLnSWLV8Nc4EDd+A+9oEE9zr8fIHPBnsJw/R8uAT3mtIYlsgI9
         5v8Zp+kw4+1oaVI43Wq+RYov9KMpRSVSXt2zt3iRGYAL2kZ+dOX7bfwtYWWe/ZPIB91g
         31gQ==
X-Gm-Message-State: AOAM533f9jEK5UEizvStOqQZYEas8B/RXeN53FIZ562f9XLncpGMde7x
        tdOfPRxmJs3owFYM9Fcbi9pq/w==
X-Google-Smtp-Source: ABdhPJx2LHN7qorApvae/t/WcApNAkybbdtIDT5V53I+MYmDlk6pud2VDI0QMeywSE+XEyKpqGUUmA==
X-Received: by 2002:a19:e49:: with SMTP id 70mr3175258lfo.650.1617397087828;
        Fri, 02 Apr 2021 13:58:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 01/16] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:49 +0300
Message-Id: <20210402205804.96507-2-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sc7180.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index f487515701e3..3334bf9cfb94 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -19,8 +19,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_EVEN,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
-- 
2.30.2


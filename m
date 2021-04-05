Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B99C43619
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E839613EF
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242858AbhDEWsA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242853AbhDEWr7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:47:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1A2C061788
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:52 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g8so19613094lfv.12
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=Z+IkZruGrZaabSYy0xACMntYsKB1e8EqvWzHdMt6/5s91XdMwjAmubwiLwgOMY66DP
         yXxqoHyfw72ghv4QMXW/wz9mu7+D9Epx4oGt8spmGl45s1Db9C4oIFuIVMeji8icCsZ1
         LZgDkgJ8zoJOe12bdwxalRpGgS2TCNgemGsW1OcmcAfiqAiDKl3lYiqjle8urNiJg+Wm
         UfVpcqhZZc7vShAKqwyyBHL/J7/ViQZYsdqdvCFPs8vmfL5iWoP2DapOpsRMqQUdTPEe
         LsB0JDjKcYSD3c7FDF9/408YGv7UwAgYtW13La6CvcVM/mADwzrt0xTZ9clwaudU0FiN
         fRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=QogF3b5PNg+WHAE5dhBt3gIvn7Xq6OY8v7dOzJdeboqo6LNOS21S2PK8uEsVHlCiqg
         K/ZcVxIH0LRrjga/8Ultc4i0pMj2/WxkEdlpoL8sCpKW5yQAvp4CzArQ34lO5QuK52eT
         ZIjkrldJvvFAT8qtZTL5oc3OdvwxnuPuOC7hqZrn6PXUFn5tevlKnhf/PqWuiX0pTN2a
         XaYBWmlG2C2nNVqLfa0uZxdqfUcoDF+wSmQixbNQeUg724z9hMEneKgIkYm3h291QUKM
         W0UidYmaWqpqXp4Bg725cuceswwtQgxgkPMU4zSk//6GDWKYqe6X+nax9Yl797JwUf/t
         ql5Q==
X-Gm-Message-State: AOAM531Sxfk/YPN2bl4Ih6y7iP/kvgUEbSr0tiNROT/aSsksgZWawNCr
        TjmikCVPaV3v1bp7o9+P0bHN7Q==
X-Google-Smtp-Source: ABdhPJwg2Oie9vK1EmSx5XaUQ258eIEpkoNfFIkVb6IYDe6N5ViEfRkqsa8LLTV3qjXEIVBxFwSYaw==
X-Received: by 2002:a19:c7c3:: with SMTP id x186mr18445313lff.76.1617662870662;
        Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 08/33] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:18 +0300
Message-Id: <20210405224743.590029-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 276e5ecd4840..ed57bbb19f88 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -19,11 +19,7 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2


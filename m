Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76059C43470
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 538FD613E8
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237820AbhDEWr6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237740AbhDEWrz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:47:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF59C061794
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w28so19610260lfn.2
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=l4n1hPdm6mZJ5jnZY8zNCYWbyAW7m8vdIUwqGlY5ZFLlKfmV1ycqKJphCwH8fErMir
         DdDZrRpfTFYgLi8gDn7JZr3V9J7Ev8RFFwTxvrRuFEpMvpR5nJrKoVtEy8SbNin+LFvg
         9M1lFSHHWHvNZZoR4FIZXy6z0DTrX4SMq6MObiZBch1ezGzB0vGYw/RosOq4pi8T/N6D
         3hIXc34coCnc/1AImPCg8j/w0DH7XP4/J8vTJS8SAr/+dGWCgUHEh8zVDQSeohF+5wh8
         Lvqv/lU6LyNr4viaG6z7heYGCexVE1g2PDQsGJOTW8N8aLOUh8FhtBA2GzFlQUWw6Hiy
         7VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=Lqi2uhITVIz1BDFDVyID88H1k9x7YdRJXWttNYvcgB7c1tvrA2h7JMu5IocJ/CiNvC
         Qpd2Rgsvubdg92Q2TSg+nEf5aYnzw3I5zDkxCkBj4+Hh84VLnsGtZlv3EuenNf8od11V
         u5MNHZALdamuySeNEoVl5J+xe/+vajy4xuJ0DS2QUNFnLGb89QNfTPn8s79owEYMVyFr
         FiI9DQEpUMbM4WUi3p66dUkRiZ/ex3g2HlQzYhYCO/m6/qvLT9GjLhXP/u+YTGtnGCJc
         9eQaDqOjr1qHX7nP5FQgZLsg1QblZmJJuhpP2RpXsNIQCV6sNZN4N8+UwiKN42gNk/fS
         /Vzg==
X-Gm-Message-State: AOAM531hzHaSrYDA1rTHSyERy6/RX+GDp2RMGrxZKWyJjqJ3wgHAcviV
        RiDdp7tocPlCDVqbmD/LEWP5YA==
X-Google-Smtp-Source: ABdhPJy896m+krX0OwjSlBuB9A9r4hylGh8EY5YnmMVQxPdLjtibPAD2N+YU0u+Qer34rZVyDY6M8Q==
X-Received: by 2002:a19:818d:: with SMTP id c135mr18047904lfd.349.1617662866693;
        Mon, 05 Apr 2021 15:47:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 02/33] clk: qcom: dispcc-sm8250: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:12 +0300
Message-Id: <20210405224743.590029-3-dmitry.baryshkov@linaro.org>
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
---
 drivers/clk/qcom/dispcc-sm8250.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 588575e1169d..86275814e055 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -21,23 +21,15 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DISP_CC_PLL1_OUT_EVEN,
 	P_DISP_CC_PLL1_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
 	P_DP_PHY_PLL_VCO_DIV_CLK,
-	P_DPTX1_PHY_PLL_LINK_CLK,
-	P_DPTX1_PHY_PLL_VCO_DIV_CLK,
-	P_DPTX2_PHY_PLL_LINK_CLK,
-	P_DPTX2_PHY_PLL_VCO_DIV_CLK,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
 	P_DSI1_PHY_PLL_OUT_BYTECLK,
 	P_DSI1_PHY_PLL_OUT_DSICLK,
-	P_EDP_PHY_PLL_LINK_CLK,
-	P_EDP_PHY_PLL_VCO_DIV_CLK,
 };
 
 static struct pll_vco vco_table[] = {
-- 
2.30.2


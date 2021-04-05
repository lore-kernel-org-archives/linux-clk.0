Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5713BC43460
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A690613EE
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242849AbhDEWsB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242857AbhDEWsA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C59DC061756
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u20so14219055lja.13
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=iO17GaXV+HCFVR6adStyMQ6Kq1k/DXe2MXVjWfuL4gNcK1XowODZQ0xOiXWzrklyz9
         PndQ2u13UXj50usm68Z0TFhvasExah/39jRF2h5FS2ASiAxoo1dbKoQv587/ol65ZKUD
         389roAZzyKe7tAOBF21H2g4aCzHIF3FbPqe3e8u1WrrtArIVCC6SraHQBW5thEOWHc6f
         hl13WAyfVMx7H3Spm82orf/HMpTrUqNms4W4uyKPnjF8KabeObBvblnBzLpn9OSx+R1J
         SU1E8BZRZs9NnfWUpNLoP20A9od5+k2E6DNjPree/DBce9QbJyUW1En4fuo3nxJ809X+
         v4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=JM6J8YBlNmMwUXnjKSUJ5ETbeZUnmZA6rheof0jTWc3mGBMRVVUXyW/SE1/dU6zZpb
         Fo4uNIbELnFcO/vdh2ZCFOLBc/YcVI9gRXdhykYJTzBGRgo4otQK8yNCtdqwDDPOmNsg
         9yZj9nvTV63tHrAqeN4/01gLl0o+Z6lpIct0KY62UakBVg0YR0UhXIVxYcbf9tkdb41R
         NGkym9R0mHfMu8PR/OuHmk6VDv4FuLJhIoKzIOXSKdPn8lqceHWDPsmbUt3mjEecupZT
         YmxPvVas6D2jB6u+VP93A8oLAs1/lVbsQ486IlD8UCCccR6LgOmWr+KnVsMd94ETC8bn
         f2HA==
X-Gm-Message-State: AOAM533OblpZ6HIsf2NLH0xcwUgQPngmfOZOWcJYs492e9rpF4hnO/iX
        zwlCxBZ8mQ4cqvkXdoMJLyNRFA==
X-Google-Smtp-Source: ABdhPJyLTG9aCXEDyChdCwUCn5sSiBa5lzAKE7LglrDQOvlPNhnZHgZH7yBWepx5SUfVwODwjO8drQ==
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr18113277ljc.91.1617662871983;
        Mon, 05 Apr 2021 15:47:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 10/33] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:20 +0300
Message-Id: <20210405224743.590029-11-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2


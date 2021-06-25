Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588A1C48BC2
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 22:55:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34DC361949
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 22:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhFYW5r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 18:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbhFYW5q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jun 2021 18:57:46 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CA2C061574
        for <linux-clk@vger.kernel.org>; Fri, 25 Jun 2021 15:55:24 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id d21-20020a9d72d50000b02904604cda7e66so9236204otk.7
        for <linux-clk@vger.kernel.org>; Fri, 25 Jun 2021 15:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=luOPyFo3L01zOr2qtu2eBJWxs2yeN+/Vdrodh5iollo=;
        b=mJh25ztmvFCyH/W7nUNGj+2z4f2AS5pMEcCtLdpkIz3FZUmG28wxqomX9SpHT3Mt87
         fW5Sf/kTK9V2CIKz5rbS1vfkZTnk/NY/g3uuKHSHc2M7VjnU+Ui6LSWuSQTc/5jANbJm
         VHx3dNIxXVrQaHzmJVxdwM2WqhGR7TnDke6YXw/9Og6Uggsd1QPOtTaf+eE4ARfWkwR+
         HTl/F6SLnoAbsOYJTy7PYIvqwIywJD2cAZ1GzU3lJuV3IMwt8GWBWwVeIlHAH+giF/w9
         Oa2ZrLoCcb1BpKXb1/l147l2tkaEUTsHH880jRo33dmA0gEHZBNUb7MlTl1GZGPEjkOU
         kRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=luOPyFo3L01zOr2qtu2eBJWxs2yeN+/Vdrodh5iollo=;
        b=nqE2kknx5o8BN7VaumSISB/ogLUGEVsmOhfU1NulsI/wLxw/k/ED8lqeg5oA4ySQ5x
         eeb9HlIm1EMplvSZ7NutkhsI02KI1MZ0PnL2AtQdT2tt3ZcP0TOxt/U7t5mWegtOApyo
         WLSN7CoVEYmWsEwgOXUD4PGzChtuviccvtKDYfLksZRuRIyeuRccQOssIo6BC1UOGM+r
         PmaXpJqk9fwm9rntZ+7Rmo/vM1/m/rvlqL17HJbCIVIYwHlHlfdcgFiG7PKcjySFQYmv
         rDjocdnt90rsEL9mY7M4Am3RZhZJ6Lh9YxZX6U53PT1FFDxsASQcRk9kz//XBUtfDkFJ
         cyGw==
X-Gm-Message-State: AOAM533mRA4meOOQpnyFjW8Ola2IBteNcYPQ8Oqk/tBvulK0ueCxC651
        2Cx6B3xBoF0Mr3h4f7pU0u5pBQ==
X-Google-Smtp-Source: ABdhPJwiJynOzvN6yh3Vh7xbiLJtDZrSq3jgQsBh55iOSBxetLaVl9zxb1FS3c7rwCCJBapHH8IC+g==
X-Received: by 2002:a9d:c23:: with SMTP id 32mr11451076otr.182.1624661724139;
        Fri, 25 Jun 2021 15:55:24 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w11sm1516557oov.19.2021.06.25.15.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 15:55:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: Ensure regulator init state matches GDSC state
Date:   Fri, 25 Jun 2021 15:54:14 -0700
Message-Id: <20210625225414.1318338-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As GDSCs are registered and found to be already enabled
gdsc_toggle_logic() will be invoked for votable GDSCs and ensure that
the vote is matching the hardware state. Part of this the related
regulator will be enabled.

But for non-votable GDSCs the regulator and GDSC status will be out of
sync and as the GDSC is later disabled regulator_disable() will face an
unbalanced enable-count, or something might turn off the supply under
the feet of the GDSC.

So ensure that the regulator is enabled even for non-votable GDSCs.

Cc: stable@vger.kernel.org
Fixes: 37416e554961 ("clk: qcom: gdsc: Handle GDSC regulator supplies")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 51ed640e527b..f7e7759cdb90 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -359,10 +359,17 @@ static int gdsc_init(struct gdsc *sc)
 
 	/*
 	 * Votable GDSCs can be ON due to Vote from other masters.
-	 * If a Votable GDSC is ON, make sure we have a Vote.
+	 * If a Votable GDSC is ON, make sure we have a Vote. If
+	 * non-votable, ensure that the supply is kept enabled (as
+	 * is done by gdsc_enable).
 	 */
-	if ((sc->flags & VOTABLE) && on)
+	if ((sc->flags & VOTABLE) && on) {
 		gdsc_enable(&sc->pd);
+	} else if (on) {
+		ret = regulator_enable(sc->rsupply);
+		if (ret < 0)
+			return ret;
+	}
 
 	/*
 	 * Make sure the retain bit is set if the GDSC is already on, otherwise
-- 
2.29.2


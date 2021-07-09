Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6A0C11F6A
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 139B2613ED
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhGIRe4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 13:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhGIRey (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 13:34:54 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849CFC061797
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 10:32:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u18so14982049lfl.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=p4MDQnpFTSPgXtG+PXQEdPP352hDWz8Stp22Wi3WKR0YgREac2VUswu7zpo11zdGYv
         3wDME5GPeFyVyTQrojf/dXFG1VnKwqZMH0sjAc4gYyw3Ki6mFcc2hRYWCsN7pbehCvLF
         WeWPQakp3zuYRkwl2nvWkv/eHSQoyPfI5YYOxs3mrr9cC7uivbi1gXkQeznHKD2c64J8
         lhFq9LXoweEJ6mCr414URpxb2Jma4wnD6EN23Uk9s28aQtRrlvd45/yb2h8qWfLpsNu6
         TS3dF6Rlj3s6oUL6dfLHK1vlmEi6xxpLUDWLdvwf3PVVhzvujWuC0pELbaum+F3Eckf7
         8qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=oxSvoHgv26bIJXcFqHPrDIZxo4lJ1XcZWtuuw8++twJMQw596PuF+9Bd0YaD83H8EW
         o14KOKNRWd4hl+++4HH5PJMsA5JStocr0ZX612nBEPGot3Jqcrcn8H4NeJ6mALnNtwe2
         062BKqehXNs+LMsjTRuPCVIMju1csMywj3kkVELvvz+h2HjfkyUHkmxkTd9kte+iH0a5
         hLvCXEqSlpe+suNeziUdzjn3A1hb3kF8gzEFRHM3fv1Y5ltH4N96WtNFoq81NRuKwt5z
         nsaIrBvXksV5fXJUtLtzMzMTn2j9oRlJzph5bdx5LW2U5iuu47JANvN38FCq17aGXSvq
         Nn5w==
X-Gm-Message-State: AOAM530uB8twbI50LJrjHXdVoHxJXJbKowl81bIV6w9VGXlJ9qCY59VI
        km7BD25x5pwMNKNXcLq1xyr1OA==
X-Google-Smtp-Source: ABdhPJyYcFjllrZgWkk/43fifMH9cKfl6MIk9xpfXGxacTUBWTBdQzl+TE1JYq3wBpVe+KVSBNhXoQ==
X-Received: by 2002:a05:6512:238c:: with SMTP id c12mr30865872lfv.317.1625851928920;
        Fri, 09 Jul 2021 10:32:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14sm511129lfb.132.2021.07.09.10.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:32:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 20:32:01 +0300
Message-Id: <20210709173202.667820-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index de09cd5c209f..dfbfe64b12f6 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -955,7 +955,6 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.30.2


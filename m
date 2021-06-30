Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADFBC11F65
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12EA661405
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhF3Neb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 09:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbhF3Ne2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 09:34:28 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387A4C061787
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 06:31:58 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a6so3328704ljq.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 06:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=nN4kNd2LBw+qLu1JnZ77bd/t3mM8E8ALtHKNmgKXifU5dgCmPrRyDI9c/vsZhVZMUW
         SZ12CTcg11NmQ6Bsah1DYL175Lwzk3AhA2RFLOMAgxIv5v/V1TeojFzwqhD9pbaOmbrT
         vrHMUA5SW534De2TuTTjvuyciT4bbGpuBlQPm8Ytvz34j+ZyYfWU/xFyjS/bdvnps53a
         sLD9inZYMZuVUKRkRO/Y1MPDlJ/Da5nsSSFjfAxFzKGONgbi20bTLWZDn8sjsD8jG4QE
         TuTy9ZmQVO2bA9rQVf1G4vs3IfL2dQDBu/2Pc0kD+VEgs5m78ItS2XwlpR2h/eEVHQbj
         9LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=sAU7eY/KB6plwql2L0XnyGjVNSHa15sEaBXoTaLf/aQN+kuqmVr9iAlnSmRU5NphDP
         UD4L48fgU4Ru8gKUqrs8bmfu3CkCbpmDYHfkT8VooeUMIUHxX7f54+baMkMIbDWIHu75
         YWuZ2XwDM1wh/Z95W+pOq/rCZ5Gb7NYZi1K44o5ERy6Oi7uovIxZ2YBHsF7EmT+7Pcbp
         E6x9QLneFomVvbebYfMwP2TAVQTR8Hw9i1cCVl4l7hY8PBQyeDZYPeZGYxuHR8zxXDB/
         85cC+YZPQkmcNvr0xv2G68xsb/WU0U1x4SyRiyq9JS2mmgx8znjGVoygmnOiBjb54MPT
         9kNQ==
X-Gm-Message-State: AOAM530Fxmsr58+eG7u+jn1x2qGVPNedGgEbQcpptOa6LbUx3KYtvw/a
        /CgBcFxrhPqYZFPxGRsN+j1Q6g==
X-Google-Smtp-Source: ABdhPJxr+7YpD56iuPGLpJn8os8tptok8/A09ts9VMan+Nfe+HMIP2f6hj1eOMhVhDYwejrInlnRog==
X-Received: by 2002:a2e:9bcc:: with SMTP id w12mr8056907ljj.123.1625059916603;
        Wed, 30 Jun 2021 06:31:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x20sm1578098lfd.128.2021.06.30.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 06:31:56 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Wed, 30 Jun 2021 16:31:48 +0300
Message-Id: <20210630133149.3204290-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
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


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40891ECAAD3
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 10:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiIIKbo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 06:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiIIKbm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 06:31:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9868249B5E
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 03:31:41 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x10so1297299ljq.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=pTtm4yi9EAOEY6vRrWAlext4ChYvlJB9U3YsR0uPxqs=;
        b=jymvIrwLc1eqlShSgxRsUFqij5BkjcjHU/Ky+2nhly1DGx5rCWTDc3NFeXc6qgYBuo
         iJVpIoDwWcxZVceM+OPOE/vYfkebk2ImoIzymDQASwYeqWMW9BwToYX3JljUwfifXDK2
         11B5vV/Q1hnptECsJYWqFiWcYWsrSrfa/eiRLA9EdeyruMAzUF89X+rJ07O1/kz9IwsO
         u2eLuQ3NBIlkNBCATiBSLj3MYlQuppE8GLUXKnkjThSmZM1Uix/5781zx75z4UZU5CkI
         O4Z9bc99D6+Iuv/ECoD1OITGYruiZPOlh/7MSbiD+I+6HlkPsafraOzF9LdL7Dw+Ch5E
         8UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=pTtm4yi9EAOEY6vRrWAlext4ChYvlJB9U3YsR0uPxqs=;
        b=OW14wvxOYBi91aUmhlC8bBQ8tm/dp56eTl7ZpcN+Kcg28slIe1LkKuYPFUZqsZqjTW
         YswaLLN8g42JtFovJbHWwsvR1DzCHzrIn2h0iWJu3JdmDda79a50KCZJA6dC7epkunPo
         w25b1Mbp4aJzt0/n7AaSjYEZEd6TLIV1LEeEom6HduV0vULqYjmPTz0ljCM7H54XXPOJ
         c1hl7aFxrLzKL+omZkfgRwm4tVpyrVFV61L0RXZbUIaJLaQ6cHzYCjdS2f9YdG+4pDQ0
         DiuYsaqIRtdP+WTz/UPQH5uHWUq61yJZVJWr9g8nrxxdAXxfnDr48z/LaYqFF7RU5IEb
         f2Iw==
X-Gm-Message-State: ACgBeo3Poc8ZBs1nI3cl9pgzySSFEzwLUYlMa/kXMv7c7krTHiRNbKC3
        PjNzCk9ltDn0IK2nFQNzbfokTg==
X-Google-Smtp-Source: AA6agR5BAXfTRI7oCh9R193gsTFzhn+8oFs6L/8MSyEW8o8iP4QSyq90OdjfNJAHfw19NSrfg6KplA==
X-Received: by 2002:a2e:9b0e:0:b0:26b:e2dc:c0e4 with SMTP id u14-20020a2e9b0e000000b0026be2dcc0e4mr874995lji.459.1662719500000;
        Fri, 09 Sep 2022 03:31:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a05651236c300b004979ec19380sm19160lfs.285.2022.09.09.03.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:31:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: qcom: a53-pll: convert to use parent_data rather than parent_names
Date:   Fri,  9 Sep 2022 13:31:37 +0300
Message-Id: <20220909103137.3727830-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change a53-pll driver to use clk_parent_data rather than always looking
up the xo clock in the system clock list.

Note, this change also switches the a53-pll from the global `xo' clock
to the `xo_board', the clock that is specified as the `xo' clock in the
DT file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Added a note regarding xo -> xo_board change (Bjorn)

---
 drivers/clk/qcom/a53-pll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 329d2c5356d8..f9c5e296dba2 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -127,7 +127,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	if (!init.name)
 		return -ENOMEM;
 
-	init.parent_names = (const char *[]){ "xo" };
+	init.parent_data = &(const struct clk_parent_data){
+		.fw_name = "xo", .name = "xo_board",
+	};
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
 	pll->clkr.hw.init = &init;
-- 
2.35.1


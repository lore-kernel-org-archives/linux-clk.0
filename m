Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78941C7EE24
	for <linux-clk@archiver.kernel.org>; Sun,  7 May 2023 17:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjEGRxl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 May 2023 13:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjEGRxk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 7 May 2023 13:53:40 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4602D58
        for <linux-clk@vger.kernel.org>; Sun,  7 May 2023 10:53:38 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ac82b07eb3so35624531fa.1
        for <linux-clk@vger.kernel.org>; Sun, 07 May 2023 10:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683482017; x=1686074017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iAIvvqwVR4IGoEYIIWCaks02oDOzgrLafdexSSTNYY=;
        b=vKjzTQFwLGWPbLIZtbfw2A85vIr/haasx7TxzVUBfxslGAn3SOuqxv7z1zVkL+OQKk
         FRFYvGqnuCu2vq24uJM+v3tDB0muDsIv5tcoukukoHbF0NRCFRDjzO3l/k5b+M5O+A+9
         5aYCNTU9hR1HndbKZl4JYkmmcU7OV+FCN8qglQe205jrDq6vt7Bl65rpXFwM484+enjL
         F1Jt/FcmeLikKs0YBeDsWujz/rBJUHESfJH8g7hmEQDP5OUyA4Y/0rhEQ3eFAdHCoFPH
         jJpgT8NQkFfRvlUANXXJNM4Q7h17UhYuE5GAEk5yXgx7XCFRyB+aw95wxhhgMysjeajT
         c5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683482017; x=1686074017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iAIvvqwVR4IGoEYIIWCaks02oDOzgrLafdexSSTNYY=;
        b=JnMkEXlqndC7CZ8REimL+SFdMMYAcFsD/1HbW63J/GjdKd0DPTwFeuYRjKMgrMMnkS
         p18ZvHBP7Svj33iEMN62fGXTknfwuAUOrf4bNUpUGC5io3XFQSMiDl2TlEWLfshKFwp/
         gIpWfULIR/hZty+XatcFAl9WmoDn2kVgRPcgbfBhjY1zFWiJXBbdN93dawSAJZdVPpPq
         ob2vnewyuaiE6gvWjIg/v1tNfNfGmboocWgVcZ6RfMb0UACwYkAnwMmS8JE7RYY3fuTC
         EZ6RAF85AGUD6ntEdE7LpNyeBp4Wt9CML0sx7f63Mwsb74nS6zsdKzNLULGeE7AUqKC8
         Rljw==
X-Gm-Message-State: AC+VfDyd/19xRRR2f3xMQ+cDl35PairbOCo0LE0DSgHKAdgjdM0h9s8L
        sTK+XZa48Kx0ZJdsm0sUPSXGtQ==
X-Google-Smtp-Source: ACHHUZ4yRhQTgDJZ0zLiiEHYOXxMNdJcTvIwBkJGyQ5KidwGtroNQwIyoDQe4YOBsjOLML87hAP8lA==
X-Received: by 2002:a2e:b70b:0:b0:2ad:8a4b:6a9e with SMTP id j11-20020a2eb70b000000b002ad8a4b6a9emr682076ljo.26.1683482017023;
        Sun, 07 May 2023 10:53:37 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e9850000000b002ac8e6d54b7sm883616ljj.42.2023.05.07.10.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 10:53:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Date:   Sun,  7 May 2023 20:53:35 +0300
Message-Id: <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
The gdsc doesn't fully come out of retention mode. Change it's pwrsts
flags to PWRSTS_OFF_ON.

Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index aa29c79fcd55..277ef0065aae 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
 	.pd = {
 		.name = "mdss",
 	},
-	.pwrsts = PWRSTS_RET_ON,
+	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc camss_jpeg_gdsc = {
-- 
2.39.2


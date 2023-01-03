Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7367C46467
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbjACO4I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238037AbjACOzq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:46 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD851120BB
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:36 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id x37so25175866ljq.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGOM/WsYLYOk2jC46YBaJyxofD5npQLyF46OlyhRQWg=;
        b=fJQ+xGWyd/xbEweVtX+7jVnV4i2M1wBSGovZqR2UgfpLwa+tlZFxjK+OtMEtRV9irL
         eW9BRWorqtbFHBQO8hdmEtMmRhU3DuE9q/Y3dfBaIjlobi7ayYhlk3Ko84envFlzss1I
         wH1QQvf3mhMkMWKELZDDx3z9/fUb9cXKSzdM947gwY6bmus+5Oi7FAT+1SXrpP+OEOlC
         /hcdOw489p4/1W5wxtLKShaYTHfq7cCet5NalLLu3Emo9zphB64UGZX/hT8Bez1SAoko
         jlZWvddPyKChLHmKyhwuBk9zYYCjMuiaEMw1lcITzKELt3f9vSLuqQxbsfIoWr2JJcUP
         nASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGOM/WsYLYOk2jC46YBaJyxofD5npQLyF46OlyhRQWg=;
        b=XVPj0Ewe7vP0K1H8Sqbocz/ht13nFBDs4J4OMmKS6QsZGG+33bcgFWV3UBHCUpka6D
         7PUydwwmD5sOogeF8/x0cVBtJewFrnecVhGOZcnyl/g/XPSl1hlWAQvlPJIqH9iB7KCf
         FMLXxRQBUvxE9UG8VJjJW4guhjNHFvVtB9kuzYc0oBFxGy31VtOipQf98HoskKYqPs7Z
         NlyV+sLnpMUMIx3qJeppfT6GKxfTC4lbClz6fQ8AyPxue3l7yzNU06KPVcd+IzyUM5JS
         voXIK0RHAADGh2KTcKmVE5TZxnFC6VB4I1jijyTun2eFF1PZQlDvkEk7Ya4U9Lh1uLhe
         5LtQ==
X-Gm-Message-State: AFqh2kppSxCkup6qytaEfI/qRs9ftAIUH0YDOwKCmkmV6nBazP3IY+gX
        M9XL/QNNU7lvHRPfoHh6XFhkiA==
X-Google-Smtp-Source: AMrXdXuZL5fLCv7Ya4Kngb4yKQDa3fcd+8QTkDaDgQufYmAwhO5aSCppizENwVP1//GVQz+AqvCDmw==
X-Received: by 2002:a2e:958e:0:b0:27f:bf7d:7117 with SMTP id w14-20020a2e958e000000b0027fbf7d7117mr7882896ljh.8.1672757735186;
        Tue, 03 Jan 2023 06:55:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 18/21] clk: qcom: dispcc-sm8250: switch to devm_pm_runtime_enable
Date:   Tue,  3 Jan 2023 16:55:12 +0200
Message-Id: <20230103145515.1164020-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using the devm_pm_runtime_enable() instead of hand-coding
corresponding action to call pm_runtime_disable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 382dbd8ba250..e17bb8b543b5 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1251,19 +1251,12 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
 
-static void disp_cc_sm8250_pm_runtime_disable(void *data)
-{
-	pm_runtime_disable(data);
-}
-
 static int disp_cc_sm8250_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_add_action_or_reset(&pdev->dev, disp_cc_sm8250_pm_runtime_disable, &pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
 
-- 
2.39.0


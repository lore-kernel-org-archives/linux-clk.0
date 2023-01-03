Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0764C3DA7D
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238110AbjACO40 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237984AbjACOzr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:47 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855AC12604
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:38 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id v23so21935001ljj.9
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/uwobszORt87pwL1AH7ZVk/kYoJ04eNFcidz9MKWGI=;
        b=kOfPzQ/ei7XOeNhiRlhR2/NKnTFi07r4Z78NJp5Tp/H1nsLG3OimnpgX767EECJK79
         XuDOXAg2Wspe9T2GkISlrX4I49EHBzlkvIRqylMeO1gMwpdYLMNIbP55v2VPbKomCUra
         GMQn0L9FChKEaIQrzUIatm1nORBj2Oqdhm7rMiuAfxaQFGnTp8jAD/zbUOKlU9mg4NST
         n79fWX32jMIBxsEJtx5p+uOcHs3ccihuFd6dANvl12/op3Rtmq6E1k944wwVuxra8iOV
         e0K/yVS72mTnzGne+PJV7jdlCxJd15bOb5tXq6gdYXOppiOPZah1w+G3Gd2PdOXkBX8W
         cj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/uwobszORt87pwL1AH7ZVk/kYoJ04eNFcidz9MKWGI=;
        b=ZDuGpiLQd0hJZlrOpHMaSwtK3piJg0L83fUKd2Da7stUUu44vNm5ZTtn++kahEoFOo
         Nk54jtNoqA06R5g2ZJnhBWPP3rIZHkHyU0Xo0bd1Jo+08eUBMIQOcIFR9IF7eTQJgl76
         Gm05AM5a7Mg+SaTQD1VTRQ8h1tZ3PolOJx3YN29EQhjttPGFkSBijWAsn3QIGN+VyVA+
         IOPUZsaq9+5gFNmSN2DfmD0BZ0AeiHL7HAv1XJ/gUSPniBO8vFzvnOk97dcokHMvy3Wo
         tXsWazp/NGcM6F0P8gTm0tG6NlQznSqCm/m6fBUZnhL/6fk0pq/X1B/hEUqvlNuO3t34
         SGrw==
X-Gm-Message-State: AFqh2kq0Yq6lJR87qG0cuPvXqUCiUzS7q7hLB9A+H33tOGsFzhkH9rqJ
        0BeFt1o6OzbUpxh+t4iVCzeWMg==
X-Google-Smtp-Source: AMrXdXsS9PO49PSertcVCgvx9gyspkIoepPHdp+DovL+eGvfCcptgZxXP2MkIKPbPcwtf6/aqIHjXg==
X-Received: by 2002:a2e:9084:0:b0:27b:57da:b39b with SMTP id l4-20020a2e9084000000b0027b57dab39bmr16330037ljg.23.1672757738086;
        Tue, 03 Jan 2023 06:55:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 21/21] clk: qcom: videocc-sm8250: switch to devm_pm_runtime_enable
Date:   Tue,  3 Jan 2023 16:55:15 +0200
Message-Id: <20230103145515.1164020-22-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8250.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index f28f2cb051d7..ad46c4014a40 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -361,19 +361,12 @@ static const struct of_device_id video_cc_sm8250_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, video_cc_sm8250_match_table);
 
-static void video_cc_sm8250_pm_runtime_disable(void *data)
-{
-	pm_runtime_disable(data);
-}
-
 static int video_cc_sm8250_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_add_action_or_reset(&pdev->dev, video_cc_sm8250_pm_runtime_disable, &pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
 
-- 
2.39.0


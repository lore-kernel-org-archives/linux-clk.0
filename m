Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED07AC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 26 Apr 2022 10:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348762AbiDZKSs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Apr 2022 06:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348501AbiDZKSG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Apr 2022 06:18:06 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D67E647A
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 02:41:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q14so21179233ljc.12
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=r1acGK2YBreLLygya/EOvCaObm6bBK2btdbyizZrEEZxckdmY3AeHcQ2bsa9N7NU4x
         D0BGu+DwXHkjo9FNLWjQYkK5JUOKQDeMKp7enmXFnLLFfnft4m2gz2kzKy2C5pSs6+Th
         k20E+demYA/Uf0O74o9vaOLtDTRgSSSQjEb8Zpqprry0tUoGkIT2VI1UyvCW7n9RNTJ2
         8/NgACXO/ykQHnmPalMkZqa9MYu2sYKhaJV03yrrQorkPDK5Rxka0EAkImafsx3xOeEs
         UtWHOqzvcoZto9e5PFE64B3wHW9J4FeXliua0SDuap1Lvj8amWR+bsTt1CCXlH79bfP0
         MFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=bDb5eCDm7y3LtBgNzbs5YKnadvc/YAXOUlDW6wu3+3VArT9W+CUpJTf4ycZK6uSr9y
         L3LjTEDMvztqySRmzsrDffxZqO5AyuWgnSW2zPfOI1zm7pUhUQdZ0UKQ3o5k/bup6e56
         Wv5mhTsKahKDFH8sAnSl+Gw/7yQ/kRqqMSpzfOeInaByGJh2kFTlDOtp6wcpzbrrEU99
         BF8EGbuKZZnHKhXg8+vFjAxSXDj4DGVGayhSLN107XVB0wriXlyE/VvaUqdsWgJCWHrQ
         2yA+vaEnJfNXtX5wCi1Hm7FwcAs+NvWnMDcDrCtc6ShfC/j13cVtkuKTtULvR0XOIyLr
         NAzg==
X-Gm-Message-State: AOAM532t9iwNKNyBNha0p3hj0gp6fO+276Pk57ixD30xe18I0jbM4yvU
        CnZp4YOx6GV2qcYOTZsPEeJg3w==
X-Google-Smtp-Source: ABdhPJzWpE9NmwU6vb9ejFEdUGOTsvjvOrOTdhMT2Iy+07f2LnAdyGRecHaAYpIZ/rElgTBXx3hFuQ==
X-Received: by 2002:a2e:8ec6:0:b0:24f:e8c:230f with SMTP id e6-20020a2e8ec6000000b0024f0e8c230fmr7567001ljl.530.1650966107912;
        Tue, 26 Apr 2022 02:41:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id y28-20020a19641c000000b00471f6806403sm1330117lfb.16.2022.04.26.02.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:41:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_tdas@quicinc.com
Subject: [PATCH v4 1/3] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
Date:   Tue, 26 Apr 2022 12:41:42 +0300
Message-Id: <20220426094144.2958416-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426094144.2958416-1-dmitry.baryshkov@linaro.org>
References: <20220426094144.2958416-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens platform device
manually. It would be better to follow IPQ8064 approach, where tsens
device is defined as gcc's child device in the device tree. If nothing
else, it removes gcc's dependency on QFPROM, thus allowing clock
controller to be probed earlier.

Don't create it in case there are available child nodes (tsens) inside
the gcc's device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 051745ef99c8..a6e13b91e4c8 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3641,6 +3641,9 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 		hfpll_l2.d = &hfpll_l2_8064_data;
 	}
 
+	if (of_get_available_child_count(pdev->dev.of_node) != 0)
+		return devm_of_platform_populate(&pdev->dev);
+
 	tsens = platform_device_register_data(&pdev->dev, "qcom-tsens", -1,
 					      NULL, 0);
 	if (IS_ERR(tsens))
@@ -3655,7 +3658,8 @@ static int gcc_msm8960_remove(struct platform_device *pdev)
 {
 	struct platform_device *tsens = platform_get_drvdata(pdev);
 
-	platform_device_unregister(tsens);
+	if (tsens)
+		platform_device_unregister(tsens);
 
 	return 0;
 }
-- 
2.35.1


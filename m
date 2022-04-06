Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1569FC433FE
	for <linux-clk@archiver.kernel.org>; Wed,  6 Apr 2022 05:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbiDFFoi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Apr 2022 01:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580862AbiDFEQi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Apr 2022 00:16:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42692B518B
        for <linux-clk@vger.kernel.org>; Tue,  5 Apr 2022 17:26:55 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q68so1166133ljb.3
        for <linux-clk@vger.kernel.org>; Tue, 05 Apr 2022 17:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZJIDxh5h3xPAYvxF7KaWafzjs7B60rYIXrQJSv7BOCI=;
        b=Gui8J8nHlGvZsHcPlfJUcI/1dbl8mbvBGjGtKplPWHsVloJjtznMuBxCtBhzS+NLjx
         fak+MpqzR7vdpsamMOI6IT4zrMUZCaSURzjLWy56gL8sg3SIA8Io1MBmcoWe8Kpwp/fk
         3B5gUaWKARJplHhkXeNtdPTqg/nDSKRuaBqlCTitqeF85d+K5AbkIE9F6jRpcN0Q0sP7
         EArUAvxj2N7BugF9i7CL3ixxi4E28gzGutknc0i6nUGwj0I99b4G8wTlPw0zHttfrx/a
         a+cid+aoo3phnK0U4rZmY3L1ObM5s12VvpnmIhTjBFj57zVb5stxmbj+yhjZCBcP2cKz
         3LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZJIDxh5h3xPAYvxF7KaWafzjs7B60rYIXrQJSv7BOCI=;
        b=wFMKZlN6tId/yH91D2YZkc2SZbUErrt7fB14iXL4iAMEwEptLx7ibbT5OqHeafaGAh
         DS15028ZJV1IICVnY96OIvjKRFqoBqK5CE0Krgl7JIRbIQ7FOngLkW6gw8L5o1jQ4RSA
         En6yvY2Gm0zbrOeRSlMcU1QjHIUzj4F0P3k1F56TiN81n4XNX3A77sNdX5rXLMBc5HB/
         6A/HsmQaQ/ZTqPDVwWh0vKNMQRkcj/LJci2ZfDXEXTAiqA5R0cxFCPyRatfXugTQKl2j
         TVU9Qrwl3t69L2qYSDMkicdG97vgk2gIzaHOPBJHjuaL4063XTwTLDGC0gcPfL8jnY4L
         e0DA==
X-Gm-Message-State: AOAM532x7wuO4/l92lX53sa7rdKx1Xps2tUfXgCPM/WOrgWVvTkXLMDN
        zH285chYnEdqz8odNddUh5CVzw==
X-Google-Smtp-Source: ABdhPJzloO/bpr3ndOYIgiINYYgIxblBzRDIKipWU4PxFSXgtWhAlGaDjroKNFIKMRi3oYMTamsYZQ==
X-Received: by 2002:a2e:97c9:0:b0:249:8404:a5b7 with SMTP id m9-20020a2e97c9000000b002498404a5b7mr3638092ljj.57.1649204813240;
        Tue, 05 Apr 2022 17:26:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512239500b0044aa21dadeasm1660270lfv.60.2022.04.05.17.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 17:26:52 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 3/4] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
Date:   Wed,  6 Apr 2022 03:26:47 +0300
Message-Id: <20220406002648.393486-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens device. Don't create
it in case there are child nodes inside the gcc device (which would
include the tsens).

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


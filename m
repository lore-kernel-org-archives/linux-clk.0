Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60394C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 21 May 2022 15:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245005AbiEUPOt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 May 2022 11:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245003AbiEUPOq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 11:14:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303B056231
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:14:45 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bu29so18872613lfb.0
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=hzG9FNEkMe+dTUP2kJxaSwv6J4SipHrlqe1p0Pz8ZXmAGWn+hH0N4v4EEAzbn0J2Uu
         cBu9FsyMTQJPIqQYu/pXkch6p/l6hIp9ij9r+IMUaafA73aQ+BjKKq4HQ27HpJ0umSqL
         oGzyKzOe29KGTLQj8AA6kYJGTapyJKZXJVmb7SNsz++Ra6D697zsfQKMvWL8QG5uR40W
         Wpyzn2+ZKCfrooPMXbq5WSz/dKbxwiAlpicz7owCMZssQ0FT5DgcXg0tv7zcEjtyKh3T
         rROuFmfE+mcqNnCmu5fr5hVin2MqHuz1VsSQsqvOZqb4Tmc6fb1r2AejH6prrExiu0bx
         XZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=mLECF7TQ2kVJghJ3SBIIXvbgsDM5FatVOWQIpotmnhBeuAoZ9TAOAIsga0boHnwZYJ
         nwyWGpr5R/1n2BobtKzgYeZcmQ6ct3a1PChhtCJlEEsWoXNVCz8WPlTXRoXxG8PiPMkg
         MagzPrlPnMHmBWLDYWb60vx+IUEKzwDdcLqi9CD8RGTbtq8daop4OBpLlLe8vLgFJjvh
         hUafk7B4pTocLhQzsKFlzb/QuCQeathYandsjYTrykLGCTvzTtASbyQFp9zNeDjRMrj1
         55xckdTZuOrbqEf2m6Fyf1Y5x/Yk2seJQsCNxpFEurqQgcw74wCgqxLEF30P58WIVSOp
         5vlg==
X-Gm-Message-State: AOAM531/34c0TLgTi6n67i0v8nw+yQd26o3cD6BZmMzbGWs4ke5JeQID
        jZmT+8ALC2+pqv8vSbH7bhgssw==
X-Google-Smtp-Source: ABdhPJx/0yIIyAnQHBUfRGiVS5yqAF9VpDKkIoDrjdRFBF0oNiDlId4enthaB42ekdhjApUQ+KHZww==
X-Received: by 2002:a19:f818:0:b0:472:3d96:bd2d with SMTP id a24-20020a19f818000000b004723d96bd2dmr10647863lff.329.1653146084762;
        Sat, 21 May 2022 08:14:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e7a16000000b0024f3d1daedfsm716849ljc.103.2022.05.21.08.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:14:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 3/4] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
Date:   Sat, 21 May 2022 18:14:36 +0300
Message-Id: <20220521151437.1489111-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
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


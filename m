Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A60C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  3 Mar 2022 08:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiCCIt2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Mar 2022 03:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbiCCIt2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 03:49:28 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD8B16307C
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 00:48:43 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id r8so4974487ioj.9
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 00:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vNsqVoa00YCDeFZ4I2281SG6Ep4/CfQvbPK2hEihXH8=;
        b=UbCCmVXg8hNoLQLReHYqeOJ7u0Gm74D2VEnsK0mPF7Jaz8iP8l6VAzXY1y6BOy2c9w
         9BivdYBL18kBvDaziMIY0Wml7/AWAotMvmXEyIIZRcIF3UyDCuqXvLplh0hnTNksyFR9
         YK4UYQAfDOgcErBEsvP4egeZALszSsOQbZl3j9atoNwSTR/06Dfh0ttEvR2C/3L9ZAvk
         Sz/f1fl5gmC1+khQ8iCkhfKcRAAEGMT+q86OFow6AGLSgpYK1Zydy1MgE64Qn6VegiTu
         QCWk4Yo/P798+V3CWQ5qdvqy8G3PqQ2TGqJJreB5LKYAQMyO0+peNIAKwkOCgd8faHek
         Lbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vNsqVoa00YCDeFZ4I2281SG6Ep4/CfQvbPK2hEihXH8=;
        b=Dk0UHbhLcKcNV3np1iDqnq0mtRpQ4BhLHygtIH+zvLxbpTv5ANSG7RwzLFem5xNAnr
         tRbdPMHGPS5n9Of8Awi283erWrSgisarxTttVUS8mvii41ZOvZ8JtQc+B15kab436LQx
         FUUbSXxFSW6SNbjdSJdIm2D4eYqwKOlFYTtyFHnXdYPjWbdMvaHrT5F7SWOLpbJrFmnF
         S/Wd6Qp2H2cJ6jTTEIyU/HY1lIUZJEB8flmxOMTPLyr8dOXJPARbLN0FlCtCru0DOPv4
         hF3kfxpheb5eVoceZlALA+SNTHDx3lBgTnMrVQe0/i45ojj2vL1rsQpEMpf5E36e9nM0
         gbiA==
X-Gm-Message-State: AOAM532CR69QE3j7WcTePZDYbxSeViK6z2XH3BwEwRX6AsUhwIykH6M+
        x2+U5orvqX9Fz2MlUHLmT6MaQQ==
X-Google-Smtp-Source: ABdhPJzPZl/TX8TodBaONLNjGojjs18uk/VVKyN64V/MKI0fF2TryeaN4V/+BsDCuj6q/nXa634yIA==
X-Received: by 2002:a02:2a0d:0:b0:317:380f:8fce with SMTP id w13-20020a022a0d000000b00317380f8fcemr14891422jaw.205.1646297322652;
        Thu, 03 Mar 2022 00:48:42 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id m9-20020a923f09000000b002c2a1a3a888sm1480704ila.50.2022.03.03.00.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:48:42 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: net: qcom,ethqos: Document SM8150 SoC compatible
Date:   Thu,  3 Mar 2022 14:18:19 +0530
Message-Id: <20220303084824.284946-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

SM8150 has a ethernet controller and needs a different configuration so
add a new compatible for this

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.txt b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
index fcf5035810b5..1f5746849a71 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.txt
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
@@ -7,7 +7,9 @@ This device has following properties:
 
 Required properties:
 
-- compatible: Should be qcom,qcs404-ethqos"
+- compatible: Should be one of:
+		"qcom,qcs404-ethqos"
+		"qcom,sm8150-ethqos"
 
 - reg: Address and length of the register set for the device
 
-- 
2.35.1


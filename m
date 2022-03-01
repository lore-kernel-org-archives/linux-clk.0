Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBB1C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  1 Mar 2022 07:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbiCAH0Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Mar 2022 02:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232871AbiCAH0X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 02:26:23 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803EA7C14E
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 23:25:40 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id v5-20020a17090ac90500b001bc40b548f9so1366307pjt.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 23:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fof9CkST4Iez9KEZB3PYpToF0QIXsHNFmiNSAPmb4CE=;
        b=mS35quprXRkh3xYjAL9vHqcV+okVffowXCO7eIPZmmO8mjlTW9z4+UmHrXfb/88P6K
         eBV8WpjN/FKiz4UG3GthRrs5B5HWV+y46hjCKsmRfEV3w4+pj57JiDizjkSvq5MvCEdf
         y75x0qtUPc1hMp/+XZd/k5g0MaFaryzgaYqfeMnHM+4UVvgaLm89nfd7O5HkKBh7i2EI
         dkY7o/YCYFzLFLOgNDYr7sN9DCmw4+VxLesy8rBqnSom+K+oZhenB17nGLjv0wO4tJM0
         A3MvntKeydzDghlin+Zbt4QOoCD1S5vCuWJ+SLyLQHxImpewVndRsNNHwiakUlw23FRC
         eRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fof9CkST4Iez9KEZB3PYpToF0QIXsHNFmiNSAPmb4CE=;
        b=3RsxR8YZCIKXxwA7pQMxyLsRtzTv1gCvUW9lbBt4Ze9x3v4+IuvOutQ6QVZxNsCrFh
         4Ltge7TLcSQAhVnwfKl+0RsqCIEjHvxAz7c0ozLBr4DPSR8oUx9JqrVidG75Dw/drD7j
         4NAZBRmUxdH9bOipb0ercbcyBZMWj0LO0w8iRPVMrCLqZWvriKXPPcAE5QZ0IGNs+pNW
         e3cy5GA5UZN3bws2NXItvjdgOr84GWPdqhmo9S5lCbafWGZgkOaLcWIDzdTZjOI3bBiA
         mcb4fx4tkyg06Z5Of8ZYPSO4Sjnrc4jO6U18PaKuckP9dT4T4k/Q26RwPKcLhhF9hnj4
         D/wA==
X-Gm-Message-State: AOAM533cUfoPnURmRQT+8l9RHHDDxRFwLTJdf/BfUFbcBlzqLRxvEkSz
        PXz4SwOnIkBkIgZKlGQnNInhAw==
X-Google-Smtp-Source: ABdhPJz1k9zK//3L9NGXiXfzcJBZURlbeiRKF63jElIF2McavU/S1ImRohMnyQ6DtjmNrAbrUUErMQ==
X-Received: by 2002:a17:903:1cf:b0:14f:ea85:4be7 with SMTP id e15-20020a17090301cf00b0014fea854be7mr24268797plh.10.1646119540016;
        Mon, 28 Feb 2022 23:25:40 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id m6-20020a62f206000000b004e152bc0527sm15680445pfh.153.2022.02.28.23.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:25:39 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY bindings
Date:   Tue,  1 Mar 2022 12:55:06 +0530
Message-Id: <20220301072511.117818-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301072511.117818-1-bhupesh.sharma@linaro.org>
References: <20220301072511.117818-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the following two PCIe PHYs found on SM8150, to the QMP binding:

QMP GEN3x1 PHY - 1 lane
QMP GEN3x2 PHY - 2 lanes

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e417cd667997..9e0f60e682c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -38,6 +38,8 @@ properties:
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm6115-qmp-ufs-phy
+      - qcom,sm8150-qmp-gen3x1-pcie-phy
+      - qcom,sm8150-qmp-gen3x2-pcie-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
@@ -333,6 +335,8 @@ allOf:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
+              - qcom,sm8150-qmp-gen3x1-pcie-phy
+              - qcom,sm8150-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
-- 
2.35.1


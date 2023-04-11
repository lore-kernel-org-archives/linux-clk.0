Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58366C76196
	for <linux-clk@archiver.kernel.org>; Tue, 11 Apr 2023 12:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjDKM7p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Apr 2023 08:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjDKM7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2023 08:59:35 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F36A4EE9
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 05:59:22 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso882684wmo.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681217961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5SvLGWiNz4qmlRx78+7Ty5fH+kaR1oDoC8UPKZhMno=;
        b=D/9uWMyGk1Hrj+4toN4XStrE8KQKPdXCs1L8wJLAHIIYSv8bWwKpaiXQWgOxKzpsza
         Eb6qrR7gyKM7gdceNdyi36w0lcrlkUXfM/GTW+57U5c/sYDtGFnDei4eV8UyR3FUyBdE
         Bsyvk3AoMODLaeR1Dmjbg6+FAqfZH2stDgfZaVJBU8DcWabCsMbYevxGaVyrGwXsTHxr
         W2hBEZ9lvssrTFnR4pi5nym46WbNcSOAjbixq+SFxPdXMI6N06DiztlF+H/6+BSjraT0
         8sJAfVnTjMq7zyhgCx4xSfMXm8XW49KVq7tTKO6Fcu5nzEuzaZfqbuJrva+slA2f4dMc
         JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681217961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5SvLGWiNz4qmlRx78+7Ty5fH+kaR1oDoC8UPKZhMno=;
        b=aTGh+um9qaJjC4SWUZhva1BwRCtzSIEu2boVeISk2PpWnrL2Eqb0UW92DCsJuJU9Ki
         HtBDZR9gOr5ZQJvFiwIKNsXwShzvGmqxTkrZB3Wqy8c4yUYYkoeOZqOzPOUzrexYR0Ey
         G5yJiRXXj60KCSa3jiWWVS2SXFiZa/qtGiwmyoqJSGISptT/pYWREy9IaGrzvvxWWAq9
         UnngEdn8lyOZMpOCtO+NsFxhuti7rN8ipCu26Vr0PfUDkSMnxw0T+lY3wql0IqErsNg1
         /97MEXmTAbOeFpfTHl++VTdKKPkqtaCCj2kD/OQrcHOJqVxIeJ4kBcQ/Pc9mYEZ6QvSU
         gpXw==
X-Gm-Message-State: AAQBX9dK7ZLxU4HPr09gmemTRsYEYHBCX1UonxpSSRSB25N0EAQsvZ0m
        nG8dZjP4JHlUbbYfuU4kxEp86A==
X-Google-Smtp-Source: AKy350bBD2bgvD4lyvkS8LWoDViy8rkoWZiSH6bPVKfr7CifLxmGkc8oIQN02kxSR+VYq1YUYtM15g==
X-Received: by 2002:a05:600c:2214:b0:3eb:2e1e:beae with SMTP id z20-20020a05600c221400b003eb2e1ebeaemr6773198wml.25.1681217961408;
        Tue, 11 Apr 2023 05:59:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003eae73f0fc1sm16944591wme.18.2023.04.11.05.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 05:59:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 6/7] dt-bindings: iommu: arm,smmu: enable clocks for sa8775p Adreno SMMU
Date:   Tue, 11 Apr 2023 14:59:09 +0200
Message-Id: <20230411125910.401075-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230411125910.401075-1-brgl@bgdev.pl>
References: <20230411125910.401075-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPU SMMU will require the clocks property to be set so put the
relevant compatible into the adreno if-then block.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 807cb511fe18..d966dc65ce10 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -79,6 +79,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "arm,smmu-500"
         items:
           - enum:
+              - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
@@ -317,7 +318,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,sc7280-smmu-500
+            enum:
+              - qcom,sa8775p-smmu-500
+              - qcom,sc7280-smmu-500
     then:
       properties:
         clock-names:
@@ -375,7 +378,6 @@ allOf:
               - nvidia,smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qdu1000-smmu-500
-              - qcom,sa8775p-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
-- 
2.37.2


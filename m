Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F74C76196
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 19:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjC1Tgw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 15:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjC1Tgt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 15:36:49 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984053A8B
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d17so13340713wrb.11
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680032205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II92TSP623ZsHMmNH1N53jKIrTirkMn1oZIUlYAm+4I=;
        b=UnBiVK6YghsHl07XrmVA7iw9ojH5dODe2FfxWjWLyqPnoJBGNIU3tc5LHJ3eJbanTj
         7dugiriAO+w7cF0OVry1r3E1hmnlWGmeRpE9XGMXXthVvuWMIk5xBY2uC0YiTmQomv+R
         e7iPeUndPAjKlUWvIgkOKH4aCrNMsZ0Mtst6UPx8DKbOoz2x4s9myH08n/NILU/oz0mL
         t4cLcYRGU1JZqxZy90nDNquYyZNIqsoCNC4HKyHWNMAuiRaA8CDlzPE+ngv05KKeC9T+
         sTDgrZ/295ZUYBj4R8+xg97VJQYV85XyrQ/Tx5HHqd7SNe0G8Lfralzt28aRMMd4JJIQ
         4MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680032205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=II92TSP623ZsHMmNH1N53jKIrTirkMn1oZIUlYAm+4I=;
        b=Q9KIfkVqtRs7igDlbaHNYkI9HCDFHlhQnfsdK1xuodqdpUGn0Q3VSvOWlPpKJamllA
         jDauPcSX5Fy3bm+U+Ramp+Rvph2j8nOCCF6kWWLt8WRz5v5geFx6GfDMv9cG3OfJMQNA
         FgJSYaXLviINEj2JJMrO8uw/TM/L1PMDAztBu5b7gOgcWRcK89brWwRiBv0BrNFp7hzx
         FELHAVCH3BjxNeA3YuZiynsuaRYgCV0CShrBjDiym/fwMcrx2IJf4+mIREtRbK4LhQlh
         J5Wlp2XF9VsZplaLh8MNVLH7DZDBp6SmauOoxMZ4R+pU9UJMMxxsOMwdxvkjyUDHNHWi
         xQ6g==
X-Gm-Message-State: AAQBX9faVbT62Fw+o7wySxo9UGbOFm4A6anE9T6cYyLxtDDkeYGFPSZN
        eTTAtbK4Yb//luvjWm5mmsZo2w==
X-Google-Smtp-Source: AKy350bXzku4wzIl4NfIK5nnFFMfXZalChqSzoJjak0wdI+0zym8rUOEJnnzJDdLv/O+FcLh/nBjBg==
X-Received: by 2002:adf:e70c:0:b0:2ce:9f35:59c7 with SMTP id c12-20020adfe70c000000b002ce9f3559c7mr12069185wrm.45.1680032205100;
        Tue, 28 Mar 2023 12:36:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7b39:552d:b2f1:d7e8])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003eb5ce1b734sm18060544wmk.7.2023.03.28.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 12:36:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 4/7] dt-bindings: iommu: arm,smmu: enable clocks for sa8775p
Date:   Tue, 28 Mar 2023 21:36:29 +0200
Message-Id: <20230328193632.226095-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230328193632.226095-1-brgl@bgdev.pl>
References: <20230328193632.226095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The KGSL iommu will require the clocks property to be set. Enable it for
sa8775p in the bindings.

Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 807cb511fe18..74d5164ed1e8 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -375,7 +375,6 @@ allOf:
               - nvidia,smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qdu1000-smmu-500
-              - qcom,sa8775p-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
-- 
2.37.2


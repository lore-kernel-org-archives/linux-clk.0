Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65751C77B79
	for <linux-clk@archiver.kernel.org>; Tue, 11 Apr 2023 12:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjDKM7g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Apr 2023 08:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbjDKM7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2023 08:59:32 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B0B49D0
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 05:59:21 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso882622wmo.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 05:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681217959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuLAeQGEV5K3iInBKoewzkhME+2oUBqCQOoUHj0zOJc=;
        b=PyPA+z9wzuCADbJtJNpxfh193DbvsBKQKRFsnEfdj2lux9LDV4aSpKu/Sl/j/gaY6D
         ff1p7jAPq70oW11rHUG0e/JHYABUvaI5p6p9GAY8Ed6gQvH3EyelCkOXAmD0OLsu5IvE
         3On13qxxWDP8hytuA7PMIGBmRRi3Ajv35irx15owRr11QSYeL1uZ/S+ci5YMEt25UfFz
         J3jUc7nvNQGsFxBDwZgQVmuwS1wEMY75SVRm9ZLYiWMgtw5rXZ9grW2MwCw+D6srA522
         d17sR+X/yCvaFxX6XaJ+jMVpEjFuaX3+dTC4FAUqWUG8Co7PMz4BS3urZXyS0wJGih8n
         2Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681217959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuLAeQGEV5K3iInBKoewzkhME+2oUBqCQOoUHj0zOJc=;
        b=QbzkAAMMM0alNdmUOtXMVJq+Ha7Ah9a3CWygnnl6yV4BVGdcKRl/w3BNrbHZo/pC1u
         4tvZLicaopWQ+dtypaGZC5rFlBActJv64G4PrG7WfT/xbPMCyKj0wUDiiTYZWScXeNYs
         5kJuZbqO3odYJyKJGA1ptpMysO5nPjIk1GTaHzR5+W+etR2WFwXco+xR9PFmm2g6Jt85
         N+A7jfobohWaxBFsqsmvDoAVDP4Y6NxGxLS1paOVhUIuu7T2FfeLyVBvAkbwbxMJdcJ8
         ceTSclE2i7ocgSbahVAKXDN2zfmdgUExtJLIJje4EiXBRsTCxDMGBadekBkABVVx0LFK
         GCbg==
X-Gm-Message-State: AAQBX9eGAiRCUZgb0Zln1DPMZSRPhpdfMjuPK770SUkQ54O25ztjvqZ0
        O4G3wpKIBMegsKPjvFfVREc0IA==
X-Google-Smtp-Source: AKy350bBn4WjRe9oZZ13H+/2ZdNlHiC6u5ndF+nHtCFdwE/SHGsCimjWqVYVI8eMvSCk4yMuQkOmNw==
X-Received: by 2002:a05:600c:2189:b0:3ed:5d41:f95c with SMTP id e9-20020a05600c218900b003ed5d41f95cmr10128112wme.11.1681217959220;
        Tue, 11 Apr 2023 05:59:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003eae73f0fc1sm16944591wme.18.2023.04.11.05.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 05:59:18 -0700 (PDT)
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
Subject: [PATCH v3 4/7] arm64: dts: qcom: sa8775p: add the pcie smmu node
Date:   Tue, 11 Apr 2023 14:59:07 +0200
Message-Id: <20230411125910.401075-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230411125910.401075-1-brgl@bgdev.pl>
References: <20230411125910.401075-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the PCIe SMMU node for sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 74 +++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 2343df7e0ea4..a23175352a20 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -809,6 +809,80 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pcie_smmu: iommu@15200000 {
+			compatible = "qcom,sa8775p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15200000 0x0 0x80000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+
+			interrupts = <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 954 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 957 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 958 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 887 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 888 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-- 
2.37.2


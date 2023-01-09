Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27ACC678D6
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 17:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237549AbjAIRsv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 12:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbjAIRrH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 12:47:07 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F551167
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 09:45:54 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t5so4595562wrq.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 09:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z32OObItYDU5Snv+OKv7I8Kte9b3truphqMhTjg9bvg=;
        b=V0SBMwVnRaQX+3Qqk9nABhO/dRGl4eb/dljK1gQ5Zviw+b8Axzr52HngVGgiUxmz7f
         jhz26jhU6WQM9ewMJ8DZIjcAYP6jErBIUidEuOo08WHJ6RIW/lISNoS21pvcEW4u7ZoU
         1qws2X0PVwSAoZzkIs8HgOsZNv4bayRKsnXBaW27tl+v1hiLF9/g4J1I/AJ7ZTQpbyk3
         Z/Zk+aqbPqwPt5vhyIniaEIPhrlalZHlKLpm2azb2EsHxSpjcanaDlBf/S0LItgjc2Fu
         jNLjgxA/M5XUSyyEMNFT0EigNMXp3IjqqtXhmdFxinbNEa3f3z6CwqJ24CvSmJ/J44LC
         RAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z32OObItYDU5Snv+OKv7I8Kte9b3truphqMhTjg9bvg=;
        b=7uePp0uqRMbhEVPSj8NvV64h9e7iNQrIIOVKzuov1FGJKyBGQUTMYSGRRh15g2xOwd
         9Lh8aPeoK8jzhgiu9ZWBTMwekJuQIiJpMBa5AQC/DQZ42w+JzjpxUKhIxQPtYgudPbHc
         VhVm1uSjcztdpXVB1r5/JTTOckYLDJAk+KrOwXQtNffqGBM6JtqUsVXNqRsq83nS6nQ3
         tg5oOvRW4579IfAac7LL1pYEUgt5rBjIq2OA9aYKCpS1l5+u2TSKBPKSYY61CZSP3LRs
         pTMP7oauWq1TKiyIceMD4eSnm3D3NrlMfpK5d9WMZKVZdQWQEmrxzEd2UuH31YsEStJt
         P5ZA==
X-Gm-Message-State: AFqh2krkSio9puEd6y98ycysCcPqEO9147oWInLcCggglnSSJw3fDQFX
        1tLrXSe3C5uu1RH2ItyjOjqxhw==
X-Google-Smtp-Source: AMrXdXswgiQkZmy7UbcCgilLLNteNPIfoelgr03hyWLBncvJUD039+3M1xfBnxxIZ1BJEVW4NHg8jw==
X-Received: by 2002:adf:fa4f:0:b0:2ba:f3a5:d0fe with SMTP id y15-20020adffa4f000000b002baf3a5d0femr8184847wrr.63.1673286353546;
        Mon, 09 Jan 2023 09:45:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c88:901e:c74c:8e80])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm6142902wrv.113.2023.01.09.09.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:45:53 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 16/18] iommu: arm-smmu: qcom: add support for sa8775p
Date:   Mon,  9 Jan 2023 18:45:09 +0100
Message-Id: <20230109174511.1740856-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230109174511.1740856-1-brgl@bgdev.pl>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the driver to support the sa8775p platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 91d404deb115..5e12742fcfd9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -500,6 +500,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
+	{ .compatible = "qcom,sa8775p-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
-- 
2.37.2


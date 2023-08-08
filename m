Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FAFC001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 20:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjHHUn6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 16:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbjHHUnn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 16:43:43 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DDB12533
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:29:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9dc1bff38so91523311fa.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512153; x=1692116953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KW5W/BsMVq6+QNzWH4B7mMdqsIsqWz/fCs4TWl8ltY=;
        b=s/1krStfVPO1jrPrXqOc+BfTUI6JXBdnb5QrihxXdXMQ+71oyAq8EerHSx3xVinmNC
         gqsZL+LkNrE2FBJN110RkzDcHPqYv4SraO6TNA90D+n91HBC06PsY346On4P8QcQh1vs
         FFWM7et+d5LWkGnGXOkGncSYSlmSTXApSQigjqmoqzy8okui7G7wUYMIllYTylTO1VG0
         tcpKquk+lyvzp5meOHegqi+fW98z3WUoIo5YthFL4uux32drxbv/BtObsf+n1lIOq4Iv
         uXke8I54bR461XSTwFKN/oVWcM6WvloK8QVqwsyHFT7h2XCCFWAZs064q5BSZP5XWoTA
         TPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512153; x=1692116953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KW5W/BsMVq6+QNzWH4B7mMdqsIsqWz/fCs4TWl8ltY=;
        b=T/TyfCRWcwsgzscsqN1pwGodRUKMQC95nJ36f7AkA4LTfO4/viyPdE/JbQXPa6lnOH
         fHjwF/aB+P03ULpcvScwG+JKBbCk8H3hIAd7oaKZ4QLYXigu90fsv3yscnZ5mRrw+9xa
         QYPrvOEHXL9/3weGpwWzs2RU6/t6/WiUr8BRz4IPrnfHfNzSfjHhIzRzFkDYTYfPsLR1
         pyaq9VEah9uGyn69BRgqsjh870iR1s1S/ECpmbb7dzYa6LYhYnr8FG+pNvSmh4Sp6x1/
         MSjuQBNNWQaM7FzmjDUG7hi3NW5INFyxoG1uHEQdCBz9rI1naX3n6kjM3XuU94yZ6xDN
         aGzw==
X-Gm-Message-State: AOJu0YyOMuHcPfEw1e47uW8GJtahxPg3e11QnUKqQx18+NN+X3DtzJ8F
        lk/NulCKiGIotwN8HAmbUeMTbN9FJYivGXFZoUA=
X-Google-Smtp-Source: AGHT+IG1IYYssFkGiczWRJXJ2hNd7aUPVrG4bPRpm+cL/fBJQfj5HgLT+UBhH2Xhh05RcC4OK+d9Kw==
X-Received: by 2002:a19:6518:0:b0:4fd:d18e:be33 with SMTP id z24-20020a196518000000b004fdd18ebe33mr7634340lfb.26.1691487889572;
        Tue, 08 Aug 2023 02:44:49 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:49 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:41 +0200
Subject: [PATCH v2 1/6] arm64: dts: qcom: msm8998: Drop bus clock reference
 from MMSS SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-1-34273e275c51@linaro.org>
References: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=994;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3dPVka+1yoTBWJAX5iuBqo/JljLJGzd9OEipOW26gpY=;
 b=P/xfTwdFTTKmfRH1cHDGu0mhCVETc7DhmfzfJHr6hh8cV9OWxxp8ilKs4ThwIArS2RVFHOVnf
 uG9mGb1qwVACAbr6fd75bvJra8iZTVEziz1Kd1WLVE66/LQYZdFZUkQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MMSS SMMU has been abusingly consuming the exposed RPM interconnect
clock. Drop it.

Fixes: 05ce21b54423 ("arm64: dts: qcom: msm8998: Configure the multimedia subsystem iommu")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index a41a34dbcc3c..e40f6461f4fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2743,10 +2743,10 @@ mmss_smmu: iommu@cd00000 {
 
 			clocks = <&mmcc MNOC_AHB_CLK>,
 				 <&mmcc BIMC_SMMU_AHB_CLK>,
-				 <&rpmcc RPM_SMD_MMAXI_CLK>,
 				 <&mmcc BIMC_SMMU_AXI_CLK>;
-			clock-names = "iface-mm", "iface-smmu",
-				      "bus-mm", "bus-smmu";
+			clock-names = "iface-mm",
+				      "iface-smmu",
+				      "bus-smmu";
 
 			#global-interrupts = <0>;
 			interrupts =

-- 
2.41.0


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFADCC001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 18:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbjHHSP5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234256AbjHHSP0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 14:15:26 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D9F1E4F4
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 10:21:44 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bed101b70so847016566b.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 10:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691515303; x=1692120103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+614xtHjgD1nkm8xRBKqqyV2uZni5hqr1Y2F11sHVk=;
        b=QbkktjXmb8Ofbkap/hW23U+ThcpD7d8vrnMs3qdtL93ozYTHKgofmUdcgapA8sDAN6
         PPLETx080o8w3aeYeuUjnI4NksB2biYTgcUwt5rIs8ER7hAVTqSvsL++fI/Ql/+dSLc5
         +/zZOMdBAXhMN/H5eI0fRa1axUfJ0/49kRaDEEsyCMbDM+GN9nC8IQQTJERjrN+gg+TR
         V4N6FuEvwP9B1ddaQyamtOpCaDl1yg1sjMZaNN0TuD+FF2PLkJdT8HM4NYd7YPVrLSNB
         AfvoOaWsge8eB5WleCuTgxmfKZyfzRTXmkGf1Y17+FUAHsmHAfs2SHMCtFX65Mcl1OV1
         K18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515303; x=1692120103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+614xtHjgD1nkm8xRBKqqyV2uZni5hqr1Y2F11sHVk=;
        b=aQ/oD5g6wJdqiyRxcqJAAi+5RgYkL7My7V5M02C9EfTHw5uSuX4GuoGM+Qd/hJzTNa
         p1vJL+rZk3fmP9IERbH+jKIbqCXYicQj9j8gu5zcK7fA8N8mJts/mLTr67whXQdCJBQ6
         yNR02+Nb6WKtNuKrG0hsp3TQdr21uNlWPFHvmJxeSWNYM523qvajwb3vm1v9PRsWtvA8
         CkyR/qtckcOlAnHKFLhm4baESRcDqJWM9Qd3ZuhRGVWYm6vlPE0nr/VT10lHAUQUTpMs
         95rBOEOAH2e2DSTE2Qjugo1+07YcLlF0RJymRBcJRM2rZGNZ92+yHS3DEdwA15FZfTUL
         zRQQ==
X-Gm-Message-State: AOJu0YwaE1vUPLZMcEeFRZGJZCHBz1nPLQCugWfCAJu30DPKGrmoH5Sp
        hq6u/uljml2c/EvW++hfUUsxinA/HlHnA3mRMNY=
X-Google-Smtp-Source: AGHT+IFVMdcEkHvqjIMX5oEgG2oBE7nbsEMOVRk5VcpuTnRc1mcmt8mNUyLq7GYjCrQ3jyb2zmb5Gw==
X-Received: by 2002:a05:6512:e9b:b0:4fe:5680:db1f with SMTP id bi27-20020a0565120e9b00b004fe5680db1fmr7912704lfb.53.1691487891249;
        Tue, 08 Aug 2023 02:44:51 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:42 +0200
Subject: [PATCH v2 2/6] arm64: dts: qcom: msm8998: Add missing power domain
 to MMSS SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-2-34273e275c51@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=854;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/yznmFUOFfvt3H81R22ABUv0eOeLe9LUwSr+QNKzGV0=;
 b=6ok/LWtlPH6zSyy5UMAq/t5bgWP3Ud7Ij9vBySuwjh3vMiS1gJVjxUKw6nLHyS95ARxX+LJAd
 Ibm+ib3FKxpBIIhASbXVDOfZYxEwn1cNsRmJHG+sQTEmtuUOfL5elUO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MMSS SMMU has its own power domain. Attach it so that we can drop
the "keep it always-on" hack.

Fixes: 05ce21b54423 ("arm64: dts: qcom: msm8998: Configure the multimedia subsystem iommu")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e40f6461f4fd..39db67211fae 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2770,6 +2770,8 @@ mmss_smmu: iommu@cd00000 {
 				<GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&mmcc BIMC_SMMU_GDSC>;
 		};
 
 		remoteproc_adsp: remoteproc@17300000 {

-- 
2.41.0


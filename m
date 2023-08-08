Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C995BC001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 16:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbjHHQDU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjHHQCG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 12:02:06 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B513F19E
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:40:33 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so8009016a12.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509217; x=1692114017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAg8mzz6tXJyaH1tEofpHQ5TEsFiQj+ho2hy+w4Tmaw=;
        b=mSKTnZOpoMTHi5LfGjE6kLZRbwS02BVOKHFnGld2olD1+Bjvmgs+8Y9uDePJsIh3NW
         3fYAMgZqfuDkJ2mwbTtGlO4wThAvPIts/uwrAFjqJJVks6LFl6R55lMVd4uGFIhvj/zA
         1Ro+40n5bqyTX/YMGrbcMcTJ2HoNUkjwMF7M++gnd811PvMDHV6HV6gXs5n9u4pzPBVV
         ZFihRFt02GWyzWdB8VzVP7NT/PB2kOZrwGGa898jeS23gBbuE6FYHB1tUw5HW5whPts6
         CqvIA7e+NV8CZDNKlOII0Xn50cplugXdXOejH391yQa6vTMLTmmcHhMDPMv3GEMBd25E
         vsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509217; x=1692114017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAg8mzz6tXJyaH1tEofpHQ5TEsFiQj+ho2hy+w4Tmaw=;
        b=FClnFiojTIB+QN6Id6xipGcXicMHv6VKCjKHWh4thvuj8lqOpIpbaW4AmMjVxR402E
         vd/7caSDtM0Q97kJhRwacgODJ417S/4mRom6GHTGc7StYbzQfhU8pJiE+HZ0BcB3DTY6
         N0zO14GfqV1leLZ7OPkpqQYpatL3y2wf25DDSLrG/aObESIJEnBF6dd61PK3DlGXTU4H
         p4vOXkDCZA8HQt1UUAOWcuQPeSy7oAnj63f2DJW7YkvxNo2XqVPeIFFAV4cpxCZqgQKJ
         T2Pi1rEUXAFxiQoazHquHfqTeuX0+uIA108GM8sXxbncc7bRPXjXq6me5gfAZkN8aPZs
         gn6w==
X-Gm-Message-State: AOJu0YwPqfbsizC+VPoSmmI8c7Z/vTDZYmqrWqxVMp+h69/OTQa4ZZM5
        vYsglxIpbKd0iUCEZ5xWGwhAzITaXnRsT/qCI5A=
X-Google-Smtp-Source: AGHT+IHZdXCtug2ljX6dDSj6oQkG8V1UJLNKTYOKnSjmV42sR9+Wv2CCmrrKVl5VAmfJlHe6DhBOLg==
X-Received: by 2002:a05:6512:2018:b0:4fd:c771:ed86 with SMTP id a24-20020a056512201800b004fdc771ed86mr6615303lfb.67.1691487895251;
        Tue, 08 Aug 2023 02:44:55 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:44 +0200
Subject: [PATCH v2 4/6] clk: qcom: mmcc-msm8998: Don't check halt bit on
 some branch clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-4-34273e275c51@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=1407;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=haDOFYx+cWB8WYF0AFsxGiNUFhwDHpLSQyDe+vgkap0=;
 b=ZrMZ0b0kru/BioU+kcPyTGDosiv5UYR3dvjZ97R7NYb1CKIWbtfb6OQL9uoCg1eDGTN2RtwgC
 KnIylLEWD68BzoXZqSp7GXw9MgJJMQxVOqARg8YLk04oG4zFHl8Kfq8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some branch clocks are governed externally and we're only supposed to
send a request concerning their shutdown, not actually ensure it happens.

Use the BRANCH_HALT_SKIP define to skip checking the halt bit.

Fixes: d14b15b5931c ("clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver")
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index c62aa270af1c..d0a5440e2291 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2452,6 +2452,7 @@ static struct clk_branch fd_ahb_clk = {
 
 static struct clk_branch mnoc_ahb_clk = {
 	.halt_reg = 0x5024,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x5024,
 		.enable_mask = BIT(0),
@@ -2467,6 +2468,7 @@ static struct clk_branch mnoc_ahb_clk = {
 
 static struct clk_branch bimc_smmu_ahb_clk = {
 	.halt_reg = 0xe004,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xe004,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -2484,6 +2486,7 @@ static struct clk_branch bimc_smmu_ahb_clk = {
 
 static struct clk_branch bimc_smmu_axi_clk = {
 	.halt_reg = 0xe008,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xe008,
 	.hwcg_bit = 1,
 	.clkr = {

-- 
2.41.0


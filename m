Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FA3C001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 18:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235873AbjHHS3Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235870AbjHHS3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 14:29:05 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE7C7A95
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 10:44:41 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so7857511a12.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691516680; x=1692121480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlY5pXEYcBgHeb5qjzLwZeG+1V5JyWmwzq+8kailYB8=;
        b=q6BQSvBUUyzNzU8BC60uJUdGlgioG4XTeUve9NtaZnGmFx53ImMLhnr5Rzl2+85jvD
         BtgN2gcjncTkIRwSZz7UI7kat8hl+5Eyc1WD4v7Ukf52j5lpf9Gt1vZF1AlPliN041gs
         ML8PuWFQQWqRivGwXYLaU6kunSbw/cXxDsASXqCFc+mSIIjEIDYYCs5zAy6mQs2e9mza
         aQ4SapH8nTpCWX4Wmv1cAWqi7hMd9f1QWwvEkdhTZPb7m+wIH6rpfrWJpYw3Yyselb+v
         fbvPJEUp5rZcIzK4+a/fQ50VFTHLDAywmEml6mo/Fv1zhFkiNvVKPn40gcNUxlkzrqXE
         WcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691516680; x=1692121480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlY5pXEYcBgHeb5qjzLwZeG+1V5JyWmwzq+8kailYB8=;
        b=G4SergPjt1hlioztNC/XNDgDTFevxOsNiyUZj60jpKIGUnx6cMeGoPYqgMrMjTXwBP
         9F999bGrN0QXMpPzrlLS754c6KiGEfh9azhI0EQfnqDC/Piz4HcJfBa4EdQvnFjAOb6R
         JijJiXkqCVkL4D4k9fmRPuX8/aQktVO4hjWSJfffvPRrbhFGDsvNAJhdx15g4nfhv2tz
         nlfmT784XQR0YE/9DemTXEJd5TZB2uvHNH+Z0hDyZqflIpmY2vnn96gTStRG3h6WZgNa
         UnFfU24w7YJJR+JT7kgk5ElTHE0E0QTPpp8Evbf0Mcd3wGJbVrQN6GJklhreufyEkAFa
         VLdg==
X-Gm-Message-State: AOJu0YyBkp1Z2Z3bUZO9dF7L78BJgKhgOK29IsPk2FqaCSd0E9Zv9Cx1
        4GpYGxT1Vi3gjaI3IKBV3B3S4SqzJp+5FCpE0k8=
X-Google-Smtp-Source: AGHT+IHh37iYuUiKI2GbU0AYhtJBCPFDqyHRg6hHZo0rvcAp0zMmu3aywLaX3w+vkrjWoKcJi+lCTw==
X-Received: by 2002:a05:6512:20c1:b0:4f8:58af:ebd7 with SMTP id u1-20020a05651220c100b004f858afebd7mr6593359lfr.39.1691487897383;
        Tue, 08 Aug 2023 02:44:57 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:45 +0200
Subject: [PATCH v2 5/6] clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-5-34273e275c51@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=1105;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=87zmBNCrKExC5fA2pDw1hJreUEORhjqL4+NYXqa3bgY=;
 b=VT9trWuRQROU5ByyIvzOsud1+jUCahMFSSwl7lXsHgNEroaV6TNcWL2Qi+2HDnBgH+uqXNQKx
 XLni2Mv9lxlCRZ/eHiiHKdcIHZUZoGsQGa7E5QjDCIxTVH8MTuWmOw8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SMMU GDSC doesn't have to be ALWAYS-ON and shouldn't feature the
HW_CTRL flag (it's separate from hw_ctrl_addr).  In addition to that,
it should feature a cxc entry for bimc_smmu_axi_clk and be marked as
votable.

Fix all of these issues.

Fixes: d14b15b5931c ("clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index d0a5440e2291..4fdc41e7d2a8 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2627,11 +2627,13 @@ static struct gdsc camss_cpp_gdsc = {
 static struct gdsc bimc_smmu_gdsc = {
 	.gdscr = 0xe020,
 	.gds_hw_ctrl = 0xe024,
+	.cxcs = (unsigned int []){ 0xe008 },
+	.cxc_count = 1,
 	.pd = {
 		.name = "bimc_smmu",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | ALWAYS_ON,
+	.flags = VOTABLE,
 };
 
 static struct clk_regmap *mmcc_msm8998_clocks[] = {

-- 
2.41.0


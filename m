Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30833911D2
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694488; cv=none; b=Dh9o7xmN/BPXaKC315KF0MxlVc1xNV5lNMTO5n0NkNvVE/oHmXASqSVMh+Ciy9qBGiT/B4HTFs2/XlXS2UxbBnQKsjQy7l3+l5zurrp0zF1dUW2rkymwTtvzSe4buKdLPsr8UQ0BN6tUH59aE9G7vCmF5HROtf5Bpu1+ZbbqN/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694488; c=relaxed/simple;
	bh=6nHArGMO3Cwv/SXwhHS/jgwboqG7plRanKvO8l2O7Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4zCKmF/L8jj75DDXGKWpWAC+N9Udv5nI9wGDEfOFEZZVP4fz8VdJM571Vsxmllu5UmAJUxNj2v8hLGoLlxCEVahIv3WSi1b4hcH1IwCdqvygG/50Ae4cAw+HedlILha0hhUfk8WdxMec3P0Sjcl5Wq7vr2+hMiDlDDbUmOgJJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e56v5nQ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7XIOckc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e56v5nQ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7XIOckc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UDXG1734962
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/e3KYoCSscSnW4+7EnpoiV6X0K4TPliZfldkojZIAt0=; b=e56v5nQ+8StLrK9Q
	MHioQGwZIOrleQ0/cswDbsuUn582nrziEmd4ZZTQSbxYdE1TLoQvYJXLc3d6x8L3
	874oFKfCPcLQuGMlLP9zFq+O87Awp97NmvYFBecB4lfpPo/miSqoUQb0QksgLRAm
	y+u/tXh8Optga4cd8ZWsYA+OKv6Gj9kPjJCSj6aWKbUJEBV6OvDzarn8XxuHvoqJ
	RsROc4K49g7Oq7NYDiWGjuYfPALXPVCpLXuWpzHIkkhHzpkOJcQyawd83px1AIn7
	73ZJcPf+ZQlKTqgCZOsOnp0q9jugGICoQBUIJivAc10V2vba9WIQtRXJg7Md9mAy
	r4+EUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjtjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84240b58211so3798260b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694486; x=1782299286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/e3KYoCSscSnW4+7EnpoiV6X0K4TPliZfldkojZIAt0=;
        b=O7XIOckcqwExrPwkB8SzOncn1koSQk9q+hZybH/R8bRmtOi1IAZ82p+029lYGCT/CR
         rjEAQJMfOEv6NU/cTE2ZcOkUQVpDe4UmYR2v3zLkSH2tbOTUIhIwb/c1D5W1wRkitt2l
         Fu5RZ19oV04jHSOP5oxPjsEZ9JqUIa7w7JM7HG9x64zGSRCaWGShoQzVyuhkm60+bknB
         PassIe/fV7gIArarv/eX43J+OjZdtbYKUAB+0UcRuO6qh9a/Zhun52y8QPywZ8oi8Xa+
         SUL7oK7zBWOYwiQklOIAiX+ISA10y/wmcPH5Y9HJar2AG0mkqEd9pbpRgAcn6clfeuXT
         WMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694486; x=1782299286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/e3KYoCSscSnW4+7EnpoiV6X0K4TPliZfldkojZIAt0=;
        b=NfDVNg8iGRTe1n7DjwEaKb6yrpuuyGoXsdqbmgAItKN6ahzb1ZXmQWGMYP8QFBpvRP
         CHGfx9tr1K3oW0QObY0kHeW6WptPusAwfAc24xS9KGcaM4O9LjeDy2+/pV0MYaT6izw+
         FeDIbdfh3B2Asp92/7aD/CXOQWesp1c7u70hyYuQ0UaQeApy5VyKN3fFhXsKeqCOTmgr
         A3y9t154QE/9sqcrRu7NbRuvnFwnepVwlhH4bRC+WJlcFB431xqLT+n7oQv3jFGhbx79
         CTHChGodKqtoXSmdnwbqEa+CZvqZNql9hZJAjkY2oyewQAiir4Mt6Mz+Q20WfTgwlMJH
         SmnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AmDx0BxerZh1ZjJ7/g7WuP5afdQYP9NlYAowstX2Omn+83ZPDz41faWl5PX1ItF1Vw5WkyIfmlKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3M81oPh1+13Dxlf4irgXma90Ng3ccaC8c27l+pB1Xyte+qne
	FKKQMxDj1NU/yMzPhA+T8+Cs8nFFI9IRucYuzjSUB/mrIYnvg3MVD68ozFJlO+Ja4809LVWH4Fz
	vleqDp1EUWGGNRmxK/s41gfxCIHTnhq2kZuhWM+fzvn5vH6TVV7DoNc1v9OZY9v0=
X-Gm-Gg: AfdE7clgIys/cYgBNd8K+DgIGIthVyTpoXI9HhoU2HEOC9sSaIJNDUZEiAGiN8lkl0l
	vPKlLvsYZmt4FXy1XOWmHXO2WSI4rsqXlIaXNRIMk987dOIhSVNat1JV35MDnUD5699b1bdit7Q
	sRb4hXbfC+3WvnQTe+vep98jWDuqDPO9yzmhLsdulVtVECamPcF4EkSHNjoCdHwExk9Uh7eHRW4
	nUABcRRa+Zk3KEJUjIhYTkQ4THw0sRz5ul91cMBdsZdb+84xlCA9kRAoaS/0Rx7Gt+AWufjc7au
	q9DtcfH28lARcKiGm82T/PF3E5eLobWHxRZBEmUAbkvRX8vb1ajA8zx1cSvJvDf02bzZ0QvoqLB
	jdEMbu2G47Wk627DOfovGneD+XUpDEamcNLI=
X-Received: by 2002:a05:6a00:1748:b0:842:4612:55f4 with SMTP id d2e1a72fcca58-84524565b69mr3457702b3a.31.1781694486209;
        Wed, 17 Jun 2026 04:08:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:842:4612:55f4 with SMTP id d2e1a72fcca58-84524565b69mr3457655b3a.31.1781694485756;
        Wed, 17 Jun 2026 04:08:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:52 +0530
Subject: [PATCH v2 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfXzZmOIYBDEKQY
 Oe8QM4e382zQ4Pj9WrmtDV8Inz+CWYkmzBrMf8LG6LUEnQ1GiYrP4b0QRqRv1y8sT8+5Nw2S7rw
 2zamrCbcJ5YwRAkVjAb6JlhwPKGAN8A=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a328016 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6SqLyIFWvb7f5ISMJ2QA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: DYRU-xJ7FtlxzOUteQ6l4rZwil9GBPtv
X-Proofpoint-ORIG-GUID: DYRU-xJ7FtlxzOUteQ6l4rZwil9GBPtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX7QG9JqfM3D3Z
 xjkG8ep9NWYOkdNX4TG2QgPBL3qwtSGLLZVc8eH1EWjtgNgm22qNz+JLZMuFOCz7BTwqS8qQjsC
 4TLBHsu2mm4ajwLMZhhDQGwXn0aXZJll2qm7cVqGOgt7aUYbnOBm0PWxIFLf8NLQ951R1RNqIIu
 pV/kLYBTAwI4RC2fbvwbPijHQ0KwOj0aRbapNZWb88Xibpp/kD0zIUxUw4ax4Nbxi6cs9swdTli
 wUEev86iBnLcx93dGd0e2R90ftVAYGXXVeTR26vmy6uOmKGgWIQFcnEXU9dbQTkIdG9UJFwr/7Y
 asGds1qjYcrqoXWHtRr/3u3mNsiAZ8vVvd8dDcnVaErdFqXp4lVeqhRevxSXSFixNwZjekKJi5E
 VhwAdf/NTLJIBzPyO0WKBizcOqS96Zxnr+vW7AA4eCPdMEtaUHdEqCPCvLJ+MurCUiG7mdvLTne
 tUaVA4S4+VTXrSwnMCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170105

The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
registered as standalone GCC branch clocks. Drop these clocks from
the GCC clock list and instead add their CBCR registers to the GCC
critical clocks list to ensure they remain enabled during early boot.

If these clocks are registered as normal branch clocks, they may be
gated, which breaks access to the EVA clock controller during clock
controller probe, thus leave them as critical clocks similar to other
subsystem AHB and XO clocks.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2736465efdea9b3cf9ec945107d4b002e123b59f..32d23bdc819b7a62472f2a1ad23c9c8a66cfd0d1 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3669,21 +3669,6 @@ static struct clk_branch gcc_disp_hf_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_ahb_clk = {
-	.halt_reg = 0x9b004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_eva_axi0_clk = {
 	.halt_reg = 0x9b008,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3714,19 +3699,6 @@ static struct clk_branch gcc_eva_axi0c_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_xo_clk = {
-	.halt_reg = 0x9b024,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b024,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x64000,
 	.halt_check = BRANCH_HALT,
@@ -7993,10 +7965,8 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_CFG_NOC_USB_ANOC_AHB_CLK] = &gcc_cfg_noc_usb_anoc_ahb_clk.clkr,
 	[GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK] = &gcc_cfg_noc_usb_anoc_south_ahb_clk.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
-	[GCC_EVA_AHB_CLK] = &gcc_eva_ahb_clk.clkr,
 	[GCC_EVA_AXI0_CLK] = &gcc_eva_axi0_clk.clkr,
 	[GCC_EVA_AXI0C_CLK] = &gcc_eva_axi0c_clk.clkr,
-	[GCC_EVA_XO_CLK] = &gcc_eva_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
@@ -8545,6 +8515,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32058, /* GCC_VIDEO_XO_CLK */
+	0x9b004, /* GCC_EVA_AHB_CLK */
+	0x9b024, /* GCC_EVA_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A4E4F7CD9
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417275; cv=none; b=uGobH4eSXXvPYzwPYPclLupM1r++fdT1nsZvgri57uFqpShLhXgPIv3b1SKKgAJQtnvkvJonkW9D7jE8b0sl31X0lEI8nkpgB+BPSBNVoYao1hRxTYlBsO4McfBtoEXc2lJZdqETPqrRzs2lO3aZzuBFuyd3PvI/bT/GQsrUxfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417275; c=relaxed/simple;
	bh=BEYJ3PjZZ7p7Bq/7sFN68WmC1vt6JpB+i7/cAbN4XVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNcedjtCjB9pQAoc1mE9bJ+NqPyM3t3SZdaOCadv6nBmbkKIcRBFRAhqPq2hAG0xJoajAFu4QhbjL62sOOpsCg9uh6GHVb+fvCHrh0ucGz2G+ND4TZJAUOWhNLkFd3gONY9FSLAtA4Elw7nzTJ5XM4DKztY899f9WUJBMBlyvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdP5pjG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=So/k1nBX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdP5pjG6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="So/k1nBX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OkXV1348030
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqmTL40Bx8JmMR7cfBUo+44d2IWK0GbIqtG9x+D4Wp0=; b=SdP5pjG6wGdv69Ej
	VDNppuq58hDPKywMZJsuHZpu0hJh0zjcNrC70vVHoVdcl2C+8E2fBbO+B4fxIpOX
	z8/0gCoxSwbsaybHjXTE63bo2Q8Lor1w8CbWCraWgyZcskGxtCCm+pN03r20GEU2
	MhhenQl/1Ie4nWzAVxom7Q2lumex+yMCsrwD+sszuzU3b0o9xNBK/Rcy3jw552pa
	l25kv3ibaQHfnQSMqmKSu5BKASiXeBXTaufEZVFFn8NupDmX0rkeqeg0gciYiCCo
	uv+P5uO1NcsQ61gicaCA7MtSJ1K0x0aMqqgp7QUx3JTHxF7mwgA5gEIJrJOPMnqT
	R9JGCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhb1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so466677085a.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417272; x=1793022072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqmTL40Bx8JmMR7cfBUo+44d2IWK0GbIqtG9x+D4Wp0=;
        b=So/k1nBXEMWqMR9IoKVdQt04v6w6PK/MBGRetMYG8b6FFtjT/vzHGWi/efaKXY0YrO
         n0o3SLsWFQNNBE9PkDFvPLWE/mbhrpzjD0l8oTiKlz9ahbwqt+jWd0+fsWoKLdTUO5En
         r0amDwDdUD0N2ZvtDf61RVpIA8czOZoVEuebA7Or+bI3yl21a9Nv9VN4D7m/yJ2C0atX
         8mAEOlRQe2yWG4iTJpzTBouD8QCWHJZQ7huCwAZdINyxas9HMx60VA/eTpBuoiZfMf61
         +VjhFVCdG5p7JWWx97yEd0znRZLZkbI5hylslDVE2DnWVkTvPHoKbTqjDnDVPO/RJHrQ
         nDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417272; x=1793022072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqmTL40Bx8JmMR7cfBUo+44d2IWK0GbIqtG9x+D4Wp0=;
        b=bqrkbgQbb0ANfwSv0jQ25q4PCIbZxG5slZTUtzhoREB60wjSm6Q7qUBxuddrF0ymvh
         BI8ivoppsEpPyDyLAtTqgAXEcDec2dTkeqC6hnGt+yLdSd3O7x0+OIboiacBM444qHv3
         wRm8UTkmktQIF0eiKM2uNhFI8GSc+Q3KteO2CO0CDlif9/WFo6rafqMKtyfYMSU76nFF
         ZM0UPg0GhWltAgQSMjT59dSC/y7UTkuHSm+xTzbrZOL7E2YHzC3qGXho6ZdVeU0BP+Rh
         LxCuiBoXZHXBnHbbxI65M9eIs1FS2A1BKmbddtJLOiK8cPtQyHrfFDxD5ugxaQDjWaXF
         wn7w==
X-Forwarded-Encrypted: i=1; AKwUvBxuqgaBVOjz8XI8EUVisqZ/8GXd+kNRzIbsuFLU761taJCqGjKPsH9IKMQAfxmDjJYHnT0padLI/eo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0wUhYSd2rn3zWCNQe7kK+jZUJVxQbh2d20JCu5avY2Kdwi1p0
	4d0O6kCzitt5M2C2x834wEdIo2kY/n/+jsR2VBa3uk46N/D4uHfYS+ddFP7ynfroZ0lugBIBEyE
	cmflmFlxi0JoWtbtz8Mficzne6UffMknfNcYGl75lO07B59wld/tSfj7a2vaTL2c=
X-Gm-Gg: AYBFou2LRv+xcSDaVnYgqp1y5Gpijq2E97lzZNpZA909eREzsEVMVLnCWOoxPcLBLhi
	C0pCTN3Nwlk4z+oLz8hIue1c76CkcmUgRPRin8nRgqSuLKvVdSXQ5ZsMG3XWjr1i4UB2+q56Twr
	jYkhzzokEhghaEVIKSrxen9NPVNhAufTILmOOTlrG2HoNAjQQqcdA4TWMLEGpowEagaHme3PzyN
	pD4ANmgj8Ml8QlDRsSyoaj7CsjScwbSBr92wC04If2QRmvkguIGCsyyIgP2MyUPkVppEH5xXu5V
	tu35DAU1sjWrN1uhUHI8AtH2qfQRDT9F9Wb+1vl2+HadrccAsDljTiAP+8NGu4w0qhOFWbXVhkd
	CP9cBC6PzHXhYA/y+LWOHQGVXtli4ORzRYBeWT2vtyD3J2CTsjatIUswvBP1qLbIhX+HrZ7fRSA
	Iu8L79RRarJM+S
X-Received: by 2002:a05:620a:4455:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-93f29db4fd7mr1345415085a.68.1792417272221;
        Mon, 19 Oct 2026 06:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-93f29db4fd7mr1345408985a.68.1792417271694;
        Mon, 19 Oct 2026 06:41:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:00 +0300
Subject: [PATCH 01/10] clk: qcom: gcc-msm8998: leave the GPU BIMC source
 and SNOC DVM clocks on
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-1-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BEYJ3PjZZ7p7Bq/7sFN68WmC1vt6JpB+i7/cAbN4XVA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3wcWKx4bud7imbnwPHHveDKsS/2WR71eS3h
 wcR78BFLn6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8AAKCRCLPIo+Aiko
 1XPFCACGx4SPE791lDuxgz7lf5DBvwka+OqZhewXGkjgPBh1t9lhRlB+bMpF7NVMPBH67BTo5gB
 6txWx9dkyBc3GaZaFWuOXMqTvKKsOuCqh+ii4M8bsvh6rpI3Ixa7rTAoC5398R4sOFSUSlBNoVE
 QOkFHvTxYfgeQ0hr3XWqAHq0OsSQSPwW3cUBRlMapRmmEa+OgJjZVwYFWvdVnsJkV+u668/lIG2
 5DCQ8l2xvM8Rlww5aMr1DBp50dtwLjIQAHPGcbq3xmpt//jZEygUJepIvjg448ZwA1n1CYcKski
 tUCL2ldYXCbs4sI0cEPTayR/3ohMJTC7GNzy3Bzle4eMqDIo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Lw-cpGtgNBWhVB_m3fGp_5FwslOsAMBX
X-Proofpoint-GUID: Lw-cpGtgNBWhVB_m3fGp_5FwslOsAMBX
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad61df9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Qc1O1OEMXXGGHZRTuqEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXzFnf+tltG5uw
 TH0e0Q1lZIWerP6STX2aXhvwmuKJ29TkeUEQrxUaxSgEAUHIG+F7ej5Zvd91Y4dYl/d5fPbdioz
 DvfM19KO7BXDYRvp0jTWIMMDYsf2lHulvopyTIygtaCU961cEUodh72d4SSpKN+ZhyZvIN3nHYa
 qaM8xTXlDKVBPm9V0hnXOVWfTbSdg6Zj+Zg3hHqRdJf4RoesF4H94SJ3WUp7MgKIobqcr31FnrV
 Z/Yqeeal0Zaq+SfLIlCiCr71PObCSUIX+vNKBjZaMX+xXQyqwlKYknXTqe0N0kn6+zd63D9EGWR
 LabQxMGjSeIY9ublvXlcr7qekzV9TERMqwDe+tTthILIYE7PdO6JY939VpABXU0eXkurpFfXcMU
 OCTI9fPvllPESnNRkrl+Sf1yeHyRtcFIWRtkC3Qdav5SrsGvjD+s6LEyry/UWfUw+XIYED27Yxr
 7o66187KSxNiTw9t9qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX2htbHoapQ3o1
 lShBIhKVc00V0+Fn2q8vEJqDD3D8zHnSe7nvCUVpNm/coWGMl30vKvPeDNDFo0IEEW2VgV58jlQ
 9b2JICS43ztM+7fTVevLl/6K0bVOEx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

Booting MSM8998 without clk_ignore_unused resets the SoC shortly after
the unused clocks are turned off. Nothing references
gcc_gpu_bimc_gfx_src_clk, so it gets gated, and the SoC goes down
within a fraction of a second, with the GPU idle and with or without
Venus. Listing it as a GPU SMMU clock does not help: the SoC then
resets after the SMMU first runtime-suspends.

Downstream registered this clock and gcc_gpu_snoc_dvm_gfx_clk at
first, then dropped both because they need to be left at their default
ON state ("clk: msm: clock: Remove controlling some graphics clocks in
Linux"). SDM660 got the same treatment, and the upstream SDM660 driver
never registered them.

Do the same: stop registering both clocks and enable them at probe.

Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-msm8998.c | 39 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index c9701f7f6e18..97d4968c5bdd 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2135,19 +2135,6 @@ static struct clk_branch gcc_gpu_bimc_gfx_clk = {
 	},
 };
 
-static struct clk_branch gcc_gpu_bimc_gfx_src_clk = {
-	.halt_reg = 0x7100c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x7100c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_gpu_bimc_gfx_src_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	.halt_reg = 0x71004,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -2167,19 +2154,6 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	},
 };
 
-static struct clk_branch gcc_gpu_snoc_dvm_gfx_clk = {
-	.halt_reg = 0x71018,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x71018,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_gpu_snoc_dvm_gfx_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_hmss_ahb_clk = {
 	.halt_reg = 0x48000,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3088,9 +3062,7 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
 	[GCC_BIMC_GFX_CLK] = &gcc_bimc_gfx_clk.clkr,
 	[GCC_GPU_BIMC_GFX_CLK] = &gcc_gpu_bimc_gfx_clk.clkr,
-	[GCC_GPU_BIMC_GFX_SRC_CLK] = &gcc_gpu_bimc_gfx_src_clk.clkr,
 	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
-	[GCC_GPU_SNOC_DVM_GFX_CLK] = &gcc_gpu_snoc_dvm_gfx_clk.clkr,
 	[GCC_HMSS_AHB_CLK] = &gcc_hmss_ahb_clk.clkr,
 	[GCC_HMSS_AT_CLK] = &gcc_hmss_at_clk.clkr,
 	[GCC_HMSS_RBCPR_CLK] = &gcc_hmss_rbcpr_clk.clkr,
@@ -3323,6 +3295,16 @@ static const struct regmap_config gcc_msm8998_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_msm8998_critical_cbcrs[] = {
+	0x7100c, /* GCC_GPU_BIMC_GFX_SRC_CLK */
+	0x71018, /* GCC_GPU_SNOC_DVM_GFX_CLK */
+};
+
+static const struct qcom_cc_driver_data gcc_msm8998_driver_data = {
+	.clk_cbcrs = gcc_msm8998_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_msm8998_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.config = &gcc_msm8998_regmap_config,
 	.clks = gcc_msm8998_clocks,
@@ -3331,6 +3313,7 @@ static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.num_resets = ARRAY_SIZE(gcc_msm8998_resets),
 	.gdscs = gcc_msm8998_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_msm8998_gdscs),
+	.driver_data = &gcc_msm8998_driver_data,
 };
 
 static int gcc_msm8998_probe(struct platform_device *pdev)

-- 
2.47.3


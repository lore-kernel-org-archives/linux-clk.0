Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C732B9A1
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 04:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288181; cv=none; b=OxwQo2D8U7Tiz6g5IBWAuEGOKbzoACjvCBSuGE5PfT0m2hUjCa1yuQe84WtSSYbiScNolB0SXd49hfWKLdfIqHU5lFX60hi8R2oc6QnB6kftMVpasN6UPSU9uhCO7bLT3jkcisIylwJzXzIGlBffyAR59B5J656m5x4jIp6yzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288181; c=relaxed/simple;
	bh=aXRQZElnRbpEtEVaDUl5up1XNmweAtvQg9gPf2/3Jqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECp5Tdsfya+NYn43gFs8td3LhEaeKLE1SJRBtBS6mZru1IjGYS1YxQ5sib3/oh50mbWNF7emP62PFmSHswfTccwYd/pKgNXN6LeJZrNIbFrmEuQmi2Vtni/gMO88NJQaHXeqyTQ2tSKJUuUdXFlHmKWwdqp8FqofaQVm6d6BxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSBnK4IA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bf8J11yX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSBnK4IA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bf8J11yX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VJEG8w2434925
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 04:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=; b=SSBnK4IA8dgg5f99
	Wbpwj0xU8/qLTacA4RG00XkNBRxrl05XhNoFyaBQYauNYF9mHnrYPnBnsTGax3ms
	5VGiCbSd1y5zTlO5+t/zfhBzHZ9cI9aAW1CxDBhfoYByvdrTREc7GZGd6AP2mQ9s
	cekiRQrUBbDVHAlLJWsdzgSNKAR5PWcT682CMzkja2y4ewT4NpTkpaIBVCSQaAEH
	wIjT9knAmACJlLGw96ZenqmUYCey6AEnEu049zE7DXI6+L75K08lbwR9yf1rAuvl
	WBYgcRa+pM+cQdnYiCrAJMvjcd49csQKyqsM/6VJPOE0s+3+WCN2j6dgNm/QYHWR
	ZSURjw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7nr3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 04:29:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32259e0eso26302895ad.0
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 21:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780288178; x=1780892978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=;
        b=bf8J11yXdcoqBQuyWAtQNFbE8JCgDxhCpJz3N/VtJhBaja9FkRdqpLbgdbiuicXZww
         uMR64SpYzyPSa6N66eYzXr56sUpSxXx0MxyPyW+p8vmhAhibGSJULQR8apv7hL0bqlJr
         arWAkt6CYJSw3h6s7ESTzOquMYwdOYDCjmwB5vxkXBfpvz85GoXcB+MbP/XnO/gFS8MZ
         jRAm6csq8CAKtc8zxb6DyDn8wXeymNyknge52TH87EuaiwK9AlRMjjNeqPianFBS/Lnp
         nwPVwy3qm8so0BiTFq2YaGJcH0ME1FH3Jizdttr3VDQ8XuPzESPQXcEAsUIsB2cXPEx7
         vOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780288178; x=1780892978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=;
        b=J4zs2/MFQhEw4e6FMKBXcWfo49VFA0b6V00Eyr2UcUOfiLr5T+BOvJf/B+ik3lTIHm
         GWuXbh3bv6cOweHq1Q7PwdLZyvy0AMCoARil6GX2avEUzyoPwbMkpFeVj7DoOsBEi+9f
         mNuWqeoS4SUj2zlMqYUwQvFnaTIWbwP/dWx0ZrRyhUea/Qcmq0G9VwNETApg0DlBCDkC
         e+c0C4NsXKG7Xrzgo7x2aVF8yI0/DZrOhvokRJjbNibbl40MX4tB6MGnDKXVey8CHQa4
         R/JDZ3yQlzMNYMp6ouV5zMJ9Ibpbq25nOQhKE/gDHJPMqQo1vMT6CMWlMa6HyFdFBwKT
         9w6A==
X-Forwarded-Encrypted: i=1; AFNElJ+CygWxFtX07Ro/zeJ6c36BofUQR0WTxh2rQ39mfVK3uTjbNZa93mmEA7GK12h77BrzFvm6GB1VVlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaIdgXa4dvB0JdKlaU0sZGC2IGdmaMx3FHPUiRKmVOFiSFROAW
	Pfd+OrFDUvlgZPFQFP9zzc7och7gQyB1wbWg0ZfE5YkyhdOWQ34uVpOR5PzQnfZ7PFvCq+oogFW
	kt6zunbEy6v8VFEqRTcNuaA225wkHVBUwtp15hQVSGxPEdY/J8Ql3kVxjHwJVCX0=
X-Gm-Gg: Acq92OFz5NGJjWS9BKACqeLrHA0nawv5xnGvIa5f5fODkFlq0EMqfrPt+NP27+Yc5P1
	tz8xNGIK7Ts0cyJFSyOC6mSfIZhBJsu82BV7CPJ51XdxXFekZMunxyVxklyiJlP4O0gmyo5rOkO
	xpWqqrw0mM3ojDy7uQkLuPUh4PcJZ7PQxmBcHvVCiTQWVrKXVQPnRIGWROxoVXuQKQ4PiLKH+Vw
	YAmTjBl8YZas6jc9qzfo6voFMITjIgXDenPqsYNsxnFwCpiNRax8R26GhxOlhV4NkXBINslCKEI
	WXpXH6cCkwPsX4GJQ71ZhqEocpQTU8Va5OwYQddgu4i/xtyiZpB2WbvbPZLifWc8F/G6TTKwheb
	p3cPWFoVm9+OU5Y7uXCXa8pgzi+sD53YwvxLfDefpSF03/wMDsO17VoWMknq+GCs=
X-Received: by 2002:a17:903:1b2d:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2bf3685da0fmr116617285ad.30.1780288178059;
        Sun, 31 May 2026 21:29:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b2d:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2bf3685da0fmr116616875ad.30.1780288177628;
        Sun, 31 May 2026 21:29:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm117215715ad.41.2026.05.31.21.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:29:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 09:59:15 +0530
Subject: [PATCH v3 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-gcc-rpmcc-clks-v3-3-76c455f5d579@oss.qualcomm.com>
References: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: AB1ITNhTPpNeLtayn3_ct5jh-uRmj9ac
X-Proofpoint-ORIG-GUID: AB1ITNhTPpNeLtayn3_ct5jh-uRmj9ac
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d0ab3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L5rjUTd7AGozPMB3QYUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0MiBTYWx0ZWRfXyJn/4NWrawv3
 NDwuwWSARbR+OFKdBWMOSJsRZgFhxDp+yZHzLtkBgO+afdScgp7ZhOjXKXDdmXqsprDR2nDf8LK
 4sHy48jIE2haGL6AXUVuuBXGu4B7ud6KWvoQElJWA5Gge0xn2Nq3PZvl3M2xiAix6nONFmHKZUK
 Dx15n7UhCn/WYUA1+nMUDu4x3etQfT6oEsG2GMkDHHpWAO90yk/2l9dlhjNAwDpd8rEsANtxZwe
 34DwAQrFhd6pDZfqPDoV4VUUkN2nEsnjTamKwl9c5xihNlQFx7eKATYducozGAqhWTE6qCN8rP6
 fkhchDjlzXYELzyNNQ8rOi9KW2Aml+Xu3lrDHu8MzYr2yZR229hrG1Qv2s5gCDv54STQQuTjKUN
 iqJjCj/VJJjQCkDd3etv5UfOpWqNGEj4wL9Ig+HLMHgDd1tBLrHSh+mhsjNp7omlgr287ZUMIAF
 uarnngJNpbygco68BRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010042

Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
list is same as QCM2290, hence reuse the same for Shikra.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..d0d19bf0616efd5f1bc2caa037ff36d830a3495c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1289,6 +1289,44 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
 };
 
+static struct clk_smd_rpm *shikra_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_QPIC_CLK] = &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_HWKM_CLK] = &clk_smd_rpm_hwkm_clk,
+	[RPM_SMD_HWKM_A_CLK] = &clk_smd_rpm_hwkm_a_clk,
+	[RPM_SMD_PKA_CLK] = &clk_smd_rpm_pka_clk,
+	[RPM_SMD_PKA_A_CLK] = &clk_smd_rpm_pka_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &clk_smd_rpm_bimc_gpu_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_shikra = {
+	.clks = shikra_clks,
+	.num_clks = ARRAY_SIZE(shikra_clks),
+	.icc_clks = qcm2290_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
@@ -1309,6 +1347,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm429",  .data = &rpm_clk_sdm429  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-shikra",  .data = &rpm_clk_shikra  },
 	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ .compatible = "qcom,rpmcc-sm6125",  .data = &rpm_clk_sm6125  },
 	{ .compatible = "qcom,rpmcc-sm6375",  .data = &rpm_clk_sm6375  },

-- 
2.34.1


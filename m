Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F43358B9
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 04:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215952; cv=none; b=WML/qpY7WRs9gijOVMloQ9Y/8bpHxk7oY1EcVBteeIoXDL6tRDWaWP0aOhX16B6VegJJAzylMYMi4cAqrP7/xlNTg8I9/SnNM3mV9+MQlwBde4AgIompqvwFRXsGILP1zyy1B6WKWDN2dsKHWRfBJ6phu2DkDY27fhweKgncxxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215952; c=relaxed/simple;
	bh=9M7+Un4uOA2mP0+irpw/9cfUa3uTDc4U4GO2YOaXzqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=abJYCxZNQ9SuFiu+eNXnFkTTQVVFPwnswuE+viHxC/mu/XryfnCioxQPshfIcH4EoFg1TwiJLip8/O+yyrHnALTdD7+qbsDAK1K+zSHCmKesoeKego04/iAhS0YakuivUwAXALZFHVSPyYhV65BDX50BGpl2cM0i4ezpwOjkDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXFMNio8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULHrpjcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXFMNio8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULHrpjcy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LsJGm1173959
	for <linux-clk@vger.kernel.org>; Fri, 8 May 2026 04:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxIxOuAppLbUqNKehD1V/7+XyuShk2Wq0w5OaqEiRkk=; b=fXFMNio8DIUiQ2/1
	u74NSdfa45+Zrj0YWUhI2oIwZ+qBF+DKf6H/HaXpQfUOj9Y9c+eMbnW7aeUY2oRP
	bvv87ruqbehCMr1+pUoZH7FXrCzmweE5Syv3ypK8Ecs7gS/1Rc3xewIYhdYsEle9
	StLV4fO4W4vMv39GELwucni4KCAz/KMfERgqxylGHJIpqsBIAAB590Ik6BPx/NAE
	7euOaqQgVqY0R6oMa1w8pdgvZbS79rnPuBHP+vmWC1Q6mpCe3Khn4s+oU2i+m4Fh
	Dv2Q0rbMI/TG87KzrN8OyeYYWo29yuYOOYHwMZQkdXg137hQPFAq9hdaetQFqk+i
	o3CXFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h95kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 04:52:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso1270224a91.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 21:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778215949; x=1778820749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxIxOuAppLbUqNKehD1V/7+XyuShk2Wq0w5OaqEiRkk=;
        b=ULHrpjcybwrZUqSZN5Cnt7mnBfbV/gjEu5dpdv5J3N73V7NICDMs46aedAvbHN8BOH
         WRcEAcavkjNCYinfH1FB9bGE3/gA2JxXgFkPmn4BpsTQcA8wSB0PjcMQI+fMvzxh/1Vz
         d+aSNPDzrVN8CiA9iDF46iRXVFGI9C30CssXwWlkq7oqf0wJKB2DhayPH58YZ0hknvD0
         0n11rHFvA69MUGAmw+YrLjL4twag1pk/IwbbKNK84OAi4KpjB8xrHZuKJ1u5PxLig3sZ
         ZCYnrjhStVi2m4JyxjYSdrJUsfPpZpl6yx2TCRAdlzsOiBUO0WaYCcOK8m7IBmRyiWHF
         o8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778215949; x=1778820749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LxIxOuAppLbUqNKehD1V/7+XyuShk2Wq0w5OaqEiRkk=;
        b=EO3PDpEqVZWNtm98ZV4hu6qsZLbTGoI2ZrPw/SexVmvHLC2HGJ7mhX2wKkqC+1EXFh
         1IZEOOWkNpFHM6QhcaGbvqIqm0nuy8qLkNHTlIo/nT0lioeEnVS2VNfiDN7SO/G5OzRj
         OQ9j9Rz5Z2GDyalsx5vLSjq7ppBS+kWDvAWUzqz0IyYBW1jcLzut+MWJP8P+kIOOyvcG
         il+GbsxMe6mSq+XlXP9bQr+sQajcDh5Vsa6nrnpGaM+skCk3Ho1xy5FJe08Nqc98tREY
         EXpl2pxeudRYpqx42ALyLvnlYx07uws2PpVc2Rp/Ue0Wb0J8wqgLjPm8B8uPy2NR9WDw
         9zMg==
X-Forwarded-Encrypted: i=1; AFNElJ9bHYINDcFQaD4xGFmOZHciKv9sn7/8G620t8c+qFVAT9VFT5TBVkVErMr5JlvLyyfTTCZyBc+GSC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdiHWuD1IOku7CgRkcKE+eugFVelA3bdZvp88sqxNdbmIKlkFw
	MBR81zjnBNmQjTvUXk24wW5e5yKounN0uUvTXj7+sQPqO3kkNWaUldWOXPssW8b+CsKDr5WmUea
	YiLnB0Lr3XTvbv7MDGUG0r0lTQLhezrNuIyfmB7gD12eg57mABAPbpp2/bZnRlJQ=
X-Gm-Gg: Acq92OFUwxwh9YEoIOvw/kXQNTAvvOkNgKZxOrk+qJZRfLuEsoRsrEBoFW+JEx/90hs
	xyfKfEWxef2Og/AD9esfM66kbuiruip/yeFHTbvAFKZXCCrjbNQ1kAJADK/S53rYc50XRbDmpvr
	rW0Zbcn+/PM7qC5btDCu0zb2bf5mA3fnQ6fwEwC4VYReGp43O1LWFp0vd5DFied8fsQ2n3kbMwX
	kHJBnlPZkDKm3Il01VvQoYG9ngHM5SYLXQloCuu6ugnbO/XIAv3E+G5hfPCWFca2zzhKLjaDhth
	LQzfpyrMnENzGCR60w0Tsf2IWhR3GwQXohnDKkN6jb2BClLo5uLh/wfLOUuav6De2zGVzcOk5Bu
	qXsj0h8ilsvHuIf/6HYYe+sZ8LaWFpzB1j/ibMS0CWoqJUPfrB+0c
X-Received: by 2002:a17:90b:134e:b0:364:6558:99bd with SMTP id 98e67ed59e1d1-365ac47c3b4mr10419199a91.23.1778215949261;
        Thu, 07 May 2026 21:52:29 -0700 (PDT)
X-Received: by 2002:a17:90b:134e:b0:364:6558:99bd with SMTP id 98e67ed59e1d1-365ac47c3b4mr10419163a91.23.1778215948743;
        Thu, 07 May 2026 21:52:28 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bb9c02sm556076a91.1.2026.05.07.21.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:52:28 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 08 May 2026 10:21:52 +0530
Subject: [PATCH v2 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA0NSBTYWx0ZWRfX2fAoLHGwTQaf
 T4p34ZaQJRs4aV7eCWEatndChj7xWVajxNouWo9nJ00UJCjkakDWSmKygVRIb7/ViuGZrUnrpHV
 a32hzXVr3o3ePhKc2THFYrxptj6APLvvL+3Z/c3TRjtjswiBRrzsHYnQ4f7THkT+oxchjOPwIsz
 76rzwAgWOqAksylXk2QhyCdTogHzjsfL52H+6xQL/fAXaZ0539HnE0hFhePicf1h9jDr8SQOga1
 PAjLgYWmsPUfc3YQqvMhoLTmV+7SAVeTjy4BkIjosFfnOEytKMrDFAm8jZXsmYXNqTMvxulurOi
 /OQ7LzbcSoPTohXQKgIBbjBGeC4So96yhUUAbk26aiAvqJTMPqgXchqyMDLlZa3b7UAGcpz/Qkd
 +bBqe+0OUSEYpiYNSFIyOQpfVL6f7kJ2OBPLwzyeKjSSWPD+ukc5ktaWHR6z7vazGSDfc3JYtVe
 rScuUhADF/hNknCzkOQ==
X-Proofpoint-ORIG-GUID: 5IPLjNaAC3Fbj2HEA91SKC3Ox3Ss2BfO
X-Proofpoint-GUID: 5IPLjNaAC3Fbj2HEA91SKC3Ox3Ss2BfO
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd6c0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L5rjUTd7AGozPMB3QYUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080045

Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
list is same as QCM2290, hence reuse the same for Shikra.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
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


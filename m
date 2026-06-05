Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7D4D98E1
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658387; cv=none; b=H0SH9RxCXWqStHrWrXw9qITqG1WJagE9Zq+20jbqDUbCBohILWTKdz7JynIBlyL6cd1kLl/28QoDcIWir/FeZuguMwsSdnlUcx3c6gpAOpP9fwPr5QlqbdNtT8hJrdgd7jKmCbYUlB7nazrMBh251ZWtXF9Hqg5RSsXsK3sOqTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658387; c=relaxed/simple;
	bh=aXRQZElnRbpEtEVaDUl5up1XNmweAtvQg9gPf2/3Jqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gyu+3v6vcugpdunBzn08L7EeUP3d0tY1mERjT1IsZ+dKbWPNcL1sQkACzeGKyz24lBEcFcaXAyYinic+yXnar4bj+WUfnMVszlVdEfsLS1Dq4DrTmLyH94SEa3389eEue0SuhmdHeI92qr2F70nfc2Abc6NBRB9f01wHALqOwuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzExSNc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuguP8Eh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzExSNc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuguP8Eh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559Aawn821063
	for <linux-clk@vger.kernel.org>; Fri, 5 Jun 2026 11:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=; b=LzExSNc+Sfa7fOAq
	XQ/w5XwKHh71l8AC8eJXe5O8hwUs+5HjeVKq6b2tmJkzzQsk6SQF306uqfv/DSgO
	bfz2cEaJBw0iyNZoOYEIlFab5ffJ2Ljs9KMge2+drPbPO5LHJArkwfKo3OKMIIIl
	NylW6AEqWwRO3ZYCrl215N5r9Ai8pJS9OSqDqpu/e/DLyawXPumeDzvLT6LH2Ks3
	2tt4Zhm+9I+ge7qVaMBZGE2nx+iZbr94GNWrGM6sFiUhDdMDkJ5gqBn3bTBLfeB9
	UyCKFW+kf2WOxd73EXHque58scm+LrpPVTEQcCr/mdG/6fIrhp/So6/dmEe7XJag
	+s5w9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbhy1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 11:19:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32259e0eso23861785ad.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 04:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658382; x=1781263182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=;
        b=FuguP8EhLyy4ggI4CjYF04E+G92kwiG36i7sn2iJwbtGBQtEtAsoc9XuwIEqy/M67y
         5jMSXGWaXu/NJnF73jleFGKjhtNCB+QmnyVeQvlgt69mOKoGgv9Y0PNAVvJLgreKgEwd
         qwXU+IbK2gMDI4sfWhdkfkw0CxE7sBXKkhkUJ19Azp4GEQ59ebMd/A7BF1dZJPsUWBS7
         x3x5nRkWQmC1QvW7iJKotfagmgwO/4REyzCpBsNx2hQ3vYL7E5B4gbGKelaboDUEqAcT
         jdXEHYyoBGD/dj7IjZTx+P2dnknVDz8IVoGF7PPi8ZMUwHN+UjAoQRhAtxYcACGkSuRM
         EeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658382; x=1781263182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=;
        b=gtyfRwXJk9UgbcDEFRplCPXkujcWZXc99fqLvQsTlEH2AmA5P2kD5IrTf3T/5X1Vnl
         dL3XQInRxLjh2B+ifYHMN+X92CEoh5CTIdjAZN1Gbd4yvXc0rTxlrVgY7xwZ6j80p/5I
         wvWOdbuzfLWVproCU6wztcSbxNPwszIN77jO8MEdu6z7CihTubDWpzlX7bnXHw9fPD9I
         pvQN4FU05E6Lpakd9GGjB0xzDaWUTOlKsoaik4z/YoInQbBjbDtX51VlXhCFFULWr0MV
         mVt5s5uA6hixOoekxovK3k8xXdBSPHKDTx9bHRhAT3j+oHf6HUbuckLxZoz4htUl30RZ
         7noQ==
X-Forwarded-Encrypted: i=1; AFNElJ85P1Fc9tEAOl6CJMaN6viUphu+qJfMdhUO3VvUEc0RhbPAv6PScqrFXVLJh4KLaLqhymIAXI4rL8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn7Ls4PpXbRVNnt34v77ZJXmQw5qkN0KRtlb2MrjrTJ/JMI9UO
	hDFP3iC66dm8tOEv3IlD0rRgzz8D88LShHum7IeYRCbHf5J/fIH/w4hO0MbQmnOGo8KKnMLr7rT
	ofpjWhGEhsjnxbXhOYdlYI6cAIzdHT6rE8ZpaEOcxkAU5FghFL8GhhY/8yQ8uZNc=
X-Gm-Gg: Acq92OEkgD6dFmjcMLnrNhzIwYuz8IkhmhOHIrJ4gYR2YmxNw5gxHDgNkb43UAW4C3I
	3km+Q3iYpaXH5pRlXfYNg9ZS4jwuYjqGkgT+e9wPBxVoGNYrSJ1mjuHd/DEwmNbcBYNw/QmHlXz
	cjh1psIRMEKyz4n9BHRfA30AtvNOj/5KQLpiiZ820jZqydYeh+9G7Tg6hHX2kWAEMyUF7NeYZyh
	OEQlhX0BkH2A3XBQgVHUVNJBk2frpX5hSHv2ihbT6LgBPGx7ur30/tP2HsM8uLuwDdfW+3Y6VN0
	bgAo8Q4ZAw6PkIbXnvneoPHR5vCF7ga/Vp3wNui4bocaIk0NDC6vrwQMw04aUyTNFVysft2GRzk
	cRdIks0x5nzXO9itZ2NQkymDcdk3kSB3ww7xHZGAh6Xq2fb/8DBWLnCewxiRjQLw=
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr33173405ad.36.1780658382434;
        Fri, 05 Jun 2026 04:19:42 -0700 (PDT)
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr33172895ad.36.1780658381951;
        Fri, 05 Jun 2026 04:19:41 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm124551665ad.17.2026.06.05.04.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:19:41 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:49:13 +0530
Subject: [PATCH v4 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-gcc-rpmcc-clks-v4-3-a0a7bfb44455@oss.qualcomm.com>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a22b0cf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L5rjUTd7AGozPMB3QYUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMCBTYWx0ZWRfXz29u1ScL9LD8
 DvWE762H8u3+GoYMjUK52myEEDjLzfmssSe/fknXGE/oyOrT44vsuO6v/CDcHxMzdK2/yxASrgw
 vbpyNX4yScl6IKmQRSU3ZeaElUn12xNqHRyMOaccKXrReLhWQVp6GCkEk0G5nag5/fHHiduE57K
 bw8y+GCGrU9/sKq1HCXkYGH2DdOiE1Vqk8FQkllHKCBCQALPhqxaIc0ih2vzj4zx5f8v3TCfkrE
 RZ8h0f9QPny1CgEOGKEVXnYDrWAhD38DPeYy4U5o+hWnWIX2tKXJv4m2bMofBpMfGq9d0Vdqlg2
 f0EfWNZom60J9lQ7irAhQb4WI21TwKAt+JTRvtTSjFNvM8Rhl/OSYvuWwQMIADhiZ23pegd/sga
 kxrPt5LESuT8Ktt+Takp6K9vdtz6jcTY79wGQVPQuJCaB3bLZPyagjOFziFHxpw9CYTcOIsHSk1
 fBPtNUQfwUBbpDPlRNw==
X-Proofpoint-GUID: Iwk6cpVnkRc9w3W5HUXq9ChdW6_KiQmJ
X-Proofpoint-ORIG-GUID: Iwk6cpVnkRc9w3W5HUXq9ChdW6_KiQmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050110

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


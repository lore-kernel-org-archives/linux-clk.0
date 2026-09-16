Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E774E8E05
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554652; cv=none; b=glPGcmvHNa0LdnGkzzl55RJQTSDx5ft5R1hoOZgzz3Hqs1LduP8Vc+7K0p/hanNJrCo6gVVBE8KDYFogam6nQAnpbmmlMn3WRsdHmuhdSZJgItldubvetPXBqdOej6BJtL51SpRv6a7YPMoyqlYqvf56ZhMIu9XFwMvkxiiFhBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554652; c=relaxed/simple;
	bh=UuHusSAWdgM6WkJmOEybYXRkNsToWIC4FGkiG1wyVbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4h0Ff4ASrCghWO7xRVsJmRETlJ9DnxD+Jwp9ze/V+BU+xIyqfPNl7kvg+jrrr0SZJfCrMx9YuiBt9VK7SCT9jNIg50aSEjk5fF+PzHVFX1Vq3Iz72+5V1r5fTtNVKSEWhnKiAqwAO1GeW9xf2vcQUNwSCx85JmYNnnZwLKHMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFiBKRjb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPTh8BYB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFiBKRjb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPTh8BYB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92uAR1721195
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfJk6jGdIjBTLREvvzoYUDH1lXmRiQ/Skb3AdwLGEZo=; b=DFiBKRjbK8O+a4Tx
	9FONAbCY2OHCy0EUHUWRoBM0BUJDj04uJAVMdbXp+7u9VPJmXXbcg/B9KRhw+qBN
	pFhqOBygssjd+iD+jgO1qoNf2elA+cukKDXIl7wpgYP5screEMHJ5DWCnfhsdCQ/
	R4KBownxbyLaGISlUAmFbvGo8khpYv62uHwrRuzBj6BQmnoCvnb4HUejXrGKDSU7
	iYErRLBMVCnPZBGUz6UNKQRm8CnXyxXV940ts7tbaVOXXZN/YdJYhTgCpAquLEhw
	bPMhjPv6jpkotl8lwcoewPCp4QlqsnZ5KarJkITqbAKSI7NNbugAn8AimB84Du94
	Oe2DhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkc0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso868246785a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554627; x=1790159427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfJk6jGdIjBTLREvvzoYUDH1lXmRiQ/Skb3AdwLGEZo=;
        b=WPTh8BYBEs1bxrxHhahfsxJPuJ8LAv3dqFCHTX+4bmLPIUDfh2CvEcXaz4ZcTJPOml
         7ZqIAfDQcXK4UV/M6oJ+asemQFZk9py7OmBurS8EDujw6l7Ob3ie05x0b89qtWG2pHro
         Qx2XtDG+CSccEWU39RKlU/JOuYuUxcagIR7HKryGWIkr13b6cb37XIlpP5EaWuKPQBV4
         C3dzD+5BXyuZX51GMg6HLRYN8OlCkDRsKHPGvBjpPA+rxFFASUflmWV+vs6AV59N6uu0
         H8Jgz54nEGQFnV7pwopdnoG4YQTGYg99HY9qvuDbjx6znp13mkvJdWdVG/yRbtRq+FPv
         Mzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554627; x=1790159427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfJk6jGdIjBTLREvvzoYUDH1lXmRiQ/Skb3AdwLGEZo=;
        b=L7gWySdxoH5TxMlTs40ZucKy1nsKBLipGE+LjsV8XdBRHzmbmClXbekQrhaQ9nOkA/
         UQjkju1o6ifM7RY71XOY4H6hyVz8mppwapk9dGm3sMpUcVJ2dduA+b2X0/jGG261T79U
         AVPD+Y+uUZDnFPQeBRz6qChWEK43z2nkBh7I+VKDKNSbDaKVeYzEV4aOnEqsLnRHecY7
         Ye7ZfuEavw+mkItijbvBY2AoZWZTJZ4ZqzVehaqeXBeJr3aCUMParOiMMYTdkMqgYZJU
         hxZNbFWlGXwLxer8jlWRImErtYalGgvCcW4zctJPSt43OwddrY0b06fh965NtUp59hvc
         nXgQ==
X-Forwarded-Encrypted: i=1; AKwUvByRhzpx97qy4wf8O/xyFQtD7w1wBIyHtmjeNGl0LZeYAWfGaPO7rcUf7kDN/9ij22ZsIQpp6iA/Zm8=@vger.kernel.org
X-Gm-Message-State: AFuF++kRKNTsH9Bv37d0tal4zTSxMGcDA+kxIGu2DJCBtyCxrTTyNwW8
	ysyvqrPUz2PzuUZ8AufCQtvoYp0TfocCSAXrWSCEZ/ipx20YRQdoL7AelNP++DWIrfNOuMEcnPT
	HvT5ubYpUf4fkg6IzqV+9vidYZhJgnmZ4OCU9F95A1mfE76IDv8bvDnREU1lOGTg=
X-Gm-Gg: AYBFou1Khm2qbziQZwtsn8W8ydL2uQFqkO9fhrCZpxq5pwNgLV0nIcPIcniug9YdLjY
	+Rvn6LmOj5WZkiIzy1f5isgOoGg6Jwhojgzyi8uQb5xead6GXca0fwlOSmThcK/dXhY/QwyoacC
	lHThda0QexgsGCBqFT5xMOzlqE60akyUH7nTKg/YfF37H2DGDI8GwpEzw4A+mbk3emeEFJQxLQ/
	nbbtgN3lgo1TDaqoQ98R0umT8pMpV31QnuvsI+ujQ+pu+8gNmLPnIxc2j0wJ3lAVfz53ItzKFkQ
	IEW7awuPn4ESOmgU2hb1zXEUIWT7BM8yY6YpvRqDSe8+d7XfTPGo3FayAl5XRvBAf5GH9GXrBrH
	REBECghU=
X-Received: by 2002:a05:620a:4889:b0:939:a199:45b4 with SMTP id af79cd13be357-93bb78f1df5mr294728085a.39.1789554626737;
        Wed, 16 Sep 2026 03:30:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4889:b0:939:a199:45b4 with SMTP id af79cd13be357-93bb78f1df5mr294718285a.39.1789554626001;
        Wed, 16 Sep 2026 03:30:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:50 +0300
Subject: [PATCH 34/48] clk: qcom: gcc-sm8750: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-34-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UuHusSAWdgM6WkJmOEybYXRkNsToWIC4FGkiG1wyVbs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9sK3hfkdcbjz2HW87sbXaJ24B7GuspbFAaF
 u1WIolVPc2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbAAKCRAbX0TJAJUV
 VqckD/0cRCuD8D3cv57PEVeFoqb8QKcXRUktU0Ihs0/u0CjOw/Z144+U4VtOnMHGOWV+ZrjTP/k
 exHTyKMAFWR3XO30mtgwwbduVQqDXDBShcRGH+89bSKIxfA9NsB0231NPY5dIVYMoAo0aHoRIf/
 hmBckCMV7O3eb8Qo+1W8WjwaYotV30Va6CIc9DmHQSzUZ3Fyo7KYuMTYkSMGxItv0ZGvyr2y0TV
 Yqp2B6TIYnTCkdu0zAK2oLslJF7aU5035rhkWeBTNIViMonglAG3OJUjvNeQoq8maG4raMBLOBC
 HZ0/nSIMrkg6EH5A2Ck9jFyO5STLt23Db3kDHLJmPixsNdFifo3ApfsYsO1GKB9j0tF8SSeiRQF
 CR3N7T6J5GVQy+78MO5F2g61cuv/grhUQ9WChanyVR5kBqPZuc7MvOaK0a12NKqBkrVUlMjNJHI
 2JqOghST4F53RqTEIVII+vrc7PIYS4ZoAE/VOUOlrCncJaGMqwpDthqD52qvMIdRpGtz0kNW6b6
 KYzaTyDFDACkOLTAw0yHBq2BbiorF91ioACdAFtU4FmjbnxYKYtRVmFwtLGyfaG+XbH5STkRDmx
 kohZeKKN+BSk6EEiRBkBXeg1mgXICAJQr3t0mzPFA/fDdJ1pBIE3frDtg2kf9hBDZBgR7np+rR6
 H8ykjTq3XRn6jww==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fc3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xSywTFWZ64xYcUwTHGYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3mQroUSdnZhG
 UGoik7e7SyxpLsplyaiR6RIpn0JhiFQJ6oEKXEd0aYpVZvdIgEofWwW+u55n3ShI4CBqbR6CbLu
 ADmtOG8UaEP3+j0opH0kSOkTBaOISBkFew5ltCuSEKR6JTaxQ6satTnUSsm3oktIUp0w0TmQCm9
 J8y0ADm8FnC9UgKtOHd+n2byETKsbeUtHp1o5yFfdFPnsVK/2aBgu8dCED08VT12CRpvS0rAP5C
 rH9NFpLTla/CgcOuYkfkuoY02XPd0jr17fwJo1gDEbRxe5YJubYWVoeNOR7svjrCklpGPkVI6JD
 +Q+ONRzbZRF4s+Qbxx3mVI+QCkpV4Y7xS0gkPSBnwk7GzE7p1ux4JOFMZwpG6UTYXXEedeFvrys
 CxQgv99yC0pK2t01WrnJJvu6a0JY6qJLBy5QMmv8eorrs7KUky9qDW6U6lFhbNCq1Vcc2JYwAEW
 IAitMgo7Zvetyaml80A==
X-Proofpoint-GUID: k7fuD9KLIe49J7OfFYEY4ihZr-Ik_Ew7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXwY3Uu/tFdLpE
 cgAJ8nGHIxElqdyzVXbZ5jJIDNpgCkE7/ynCJUTHPNvUnwEYjuLRBFbTbmDemVEMZ9AZC1iafS3
 C0dFgALaPV9kdHsg9KC/Cqyc8BHVXh8=
X-Proofpoint-ORIG-GUID: k7fuD9KLIe49J7OfFYEY4ihZr-Ik_Ew7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 76 +++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..2adda0c8b95c 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3188,7 +3188,39 @@ static const struct regmap_config gcc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8750_critical_cbcrs[] = {
+	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26034, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x9f004, /* GCC_EVA_AHB_CLK */
+	0x9f01c, /* GCC_EVA_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32038, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8750_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep GCC_PCIE_RSCC_CFG_AHB_CLK and GCC_PCIE_RSCC_XO_CLK enabled. */
+	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20));
+	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21));
+
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8750_driver_data = {
+	.clk_cbcrs = gcc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8750_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8750_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8750_desc = {
+	.driver_data = &gcc_sm8750_driver_data,
 	.config = &gcc_sm8750_regmap_config,
 	.clks = gcc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8750_clocks),
@@ -3206,49 +3238,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8750_match_table);
 
 static int gcc_sm8750_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8750_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/*
-	 * Keep clocks always enabled:
-	 *	gcc_cam_bist_mclk_ahb_clk
-	 *	gcc_camera_ahb_clk
-	 *	gcc_camera_xo_clk
-	 *	gcc_disp_ahb_clk
-	 *	gcc_eva_ahb_clk
-	 *	gcc_eva_xo_clk
-	 *	gcc_gpu_cfg_ahb_clk
-	 *	gcc_video_ahb_clk
-	 *	gcc_video_xo_clk
-	 *	gcc_pcie_rscc_cfg_ahb_clk
-	 *	gcc_pcie_rscc_xo_clk
-	 */
-	qcom_branch_set_clk_en(regmap, 0xa0004);
-	qcom_branch_set_clk_en(regmap, 0x26004);
-	qcom_branch_set_clk_en(regmap, 0x26034);
-	qcom_branch_set_clk_en(regmap, 0x27004);
-	qcom_branch_set_clk_en(regmap, 0x9f004);
-	qcom_branch_set_clk_en(regmap, 0x9f01c);
-	qcom_branch_set_clk_en(regmap, 0x71004);
-	qcom_branch_set_clk_en(regmap, 0x32004);
-	qcom_branch_set_clk_en(regmap, 0x32038);
-	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20));
-	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21));
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8750_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8750_desc);
 }
 
 static struct platform_driver gcc_sm8750_driver = {

-- 
2.54.0


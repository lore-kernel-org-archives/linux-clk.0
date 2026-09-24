Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6D495037
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251745; cv=none; b=Naq6UFojhqyzEEmyH4nNocV2dBtCJDJ6CdNFZkoq+CfnC5mDRHltJdKAL9n79bgmza3wdubQ6qlfULtgyUeoTORUQyrY/DovwVnrr6mGfJzc2jQWAgf5T9CG+T8WYwX1MP9Qn50XbVnzAzOX0VwudV0O5FOswhuymizHAG286rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251745; c=relaxed/simple;
	bh=c0wYPNUgewRDJMW5F+vd3xsVEtdgJT3QfwAzWTspO3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIqcisFCTUvKfu5i+mvmXvRKw1wZbN1YCAWtRm/QmfQIy8SAzpo9urpIap1qLTD8bm30ZYXXocwsaXoJZYB2J5gO7LG9dl11xYBD+4WCaIwnEWLtpiP84aqIAUlRES2rBU4Pt3JzyH/TtkudVZYTQg+JU5L+6y0PmqIK3UlnjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qp0KlL+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uts076WM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qp0KlL+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uts076WM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC5Ber1430342
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=; b=Qp0KlL+8sSm9NYbb
	1uLWae2ye9pU00CprxrRVIW3vJEWeyDdK61aZuGF6erkjKIijx6MierlwnoDdnVu
	MvZjcpyPvCEEJJB1jXlcicYfPVVQ2sy/2VAhQIIX3fmTKTbzkFd1mKi1JFMjB00s
	MhZKM5oniciI7jCaYIBDeloRUxWG2EIkk3uIha2uqMC6973BixZHs5HxJutgSM+5
	8ZX3DB/y/fMSSv2xKItFv5bEA8QtNN4AFMqTaoGGRXDq9t1bQmeYh200V3GWfwP1
	gAI4NRloS60dZW7cV86oYeWe4ZtGo3RBopMtTVbfnXxKZc4jm21lQkt/QiL4jYdR
	KOXQ+Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9vp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a04805f8f1so1803461137.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251742; x=1790856542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=;
        b=Uts076WMCLbbRiGQQi2evgoLAmyMWcXxlVfvfBDLnoj1+esg8KIiK5qsDB9XUL9Rna
         7HCYYkiNylcZ+KLLf/euJp7c0GTroORUfesfSsB9sqVLJzxnbvYIE7yziJZqTfVwfS1F
         BnBarPQh+UfWKuwmmle8c0VFdakv40mHmq90+KcdTI3kSdb4Iy4IH5APdpE4TtEdajDq
         MAGPVoA8GInf4RsjFOGneESpAKQyF0alDBVItP/ZZTGl3lHmmq22gjKMhLbJ+fTGE8zA
         nKIw2+Yk341j6sQRPRA6cgGqn9+xQ1QNuZFenjPV+wCDne7/OG+JoPGsp4/fIp6PxI2Z
         pE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251742; x=1790856542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=;
        b=Y1e3wJquNYB/L4bLhu0dtwLq3ueG2VD6psgA3odePXRp22zW42IQArfuG6L71zY7Rr
         t7j8vENXWU/eflcK8EvcK98XHRz3DCus/MGBYXKyv7PxmvppjibIrqjQ+zOZpIJQtf1i
         JqZjucz6x6Qrj59kSye16WKSUm2IIZvt5WFzyjrQf6kBhSOnd7tweDjk9Xf+Lf9jD3Rg
         vjjLMyKaIpXH8i/m2uIOZqK/vAzbvecQhKlmtC+oGEUcOjJPddoPYye3dIBKNCa9SZNp
         2JVNF7WyvlAb1LwPyEGHjtJJTelcRDxmFgFU2Ys1/lId338u7+h60DvLAmWKyNyiJI2G
         a3sg==
X-Forwarded-Encrypted: i=1; AKwUvBzCXLlhV+ej1pWjpxGN64lRyIbYJvR4r9Gu+0p5xe5LwThsTDbyP0ZfSKZdK+w4d1DMow1uTtNL4NI=@vger.kernel.org
X-Gm-Message-State: AFuF++lJqSz6ZeoxQQ89q8GHpeAensaTZXQGgskjnYmzeCq+mQrxVxNx
	4UPWk+Wdpj4iRBvh5bamj32H7n7iD2go6qnt9BA9KYVw9m/XUzdpwIA83eet4r0UogL4DcBNggC
	KWn5miHzPECej6BXNwfGLViTZvrAIH0AAcSkjnMNSkKUqzbolrHpY353i8BipS4g=
X-Gm-Gg: AYBFou0Zmau3vIfNZTIIs7+LiOha+a2zW7ykpsCIR199wKheddSMjGd+mHlb6AY/14C
	3lZzwEsPaKDAJf4+X+MHtkdXk+ZlpccwtSY8V0fbAiifv6apI9s+8ZC6PhG45EpcYSJoDWHJAVu
	1zqPn0vQwiN1ADVhasxwxOyIK/sr8UVTDxsjZT7FqV1fVGEgFYEqrRPCe2V2cxkjXFxAelZV2/Z
	wdLoI1wfHVXCSX6aJdEed5OuY9Nb6o5kVlQyosTFsx7RJmF6UVRlVcpLC3/hYLpLMTJ+pXduqb3
	pyzXxBSHVb+/qDZS0mqm2chJYVZum0VxeXfEVTla4VNDCf5IsQ0Xvim73EPP7RFpLDqii+gz6Hv
	NJKyErd5t
X-Received: by 2002:a05:6102:f8b:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7af1d6c2e25mr1025331137.20.1790251741906;
        Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f8b:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7af1d6c2e25mr1025312137.20.1790251741280;
        Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:49 +0300
Subject: [PATCH v2 37/48] clk: qcom: gpucc-sc7280: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-37-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=c0wYPNUgewRDJMW5F+vd3xsVEtdgJT3QfwAzWTspO3s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJl/9yp3g10naQVMDMNr5N+hsbFUv8EWIvVJ
 UnXbdxKer+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSZQAKCRAbX0TJAJUV
 VqjND/4z0NkhOw/OWCCz0rQkE8gUjGr463luBVOcGHGelzCG3o+vOs60/WH/LQaH5hLqixx8SN5
 IWGsrWnOkWEOhAjm+HEXgtrltybm8OnSqVFOWkSbJWsmWVShxyx6tAWk1/3mIdt/3I6mE6SxCZ6
 pra9ZwmS/OSojq7kCf4idb8iHDTKbJVKC8h12wby/jeq3CSbCTnr//Dqzb+tR88scZg4QjmIhpb
 uTF/7vBZK6MzMfJ7+53UzSwwaFNao60RQjT1MiNbh6GwUl7jZst5avM6lBPLPk0BCpO3wxOmY+w
 JeZHKZx4HT0FooPRY/otkqII3JKrTSrR+18xeCn66hMpSrB0nRciU2ljp2NVmtVu5nYcYWHzxa3
 EHrMKyGA4wsPYjyRwJhWsYILqgW+LeFQeeZ4gT8KPFKXEnnOWa0jJKN/WzseG0rfE/KwN5Ba+kG
 TW5HvPI0vY/fYpTolNdsafTi7BF88EO7jx3b6y5IbjBDbcCSo4d1S9B7BMQ/c9MhPyLO9+Bub+v
 eULRWTEaHwN1qQGuI6oqbmDaHZJf4GJA7oox3yAYskPBjRoynLYPwPzc5bRGsS1ZTmV+g/S4HU9
 1eoAVbGx9YGjMvTwEJWIpUAE8D+3jaTYW4mXvbbbCdO5Aj+Be9S2BI8J0JOJbi5CGTGVnPUZj+T
 axSlTRfrelsbrnA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab512df cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W2O9Cv0nt9n2xGTIkqUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: FtZGXo-dhx2uP8-x-usVox60CyUayv10
X-Proofpoint-ORIG-GUID: FtZGXo-dhx2uP8-x-usVox60CyUayv10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6PN8s0sc8lx5
 ksLRe9zkP7PE6r9m9+kgEr5HNRp0UYcZ1ntiWDjOYi2xR2M5riipB6KWtcrICWeeQOS9gaN4gMY
 HoHDku2J9geli/djJjkgkDFexyzN/Jc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+7UilLXdS+XP
 487xN8+W1+OsrvHU8kXDnmoRbM5BbPnXqZoaFN7VYLFBaf+4UUDZJGp/ZezWathUfIZqANrczkR
 9Yt9CKdg8LeRRpRRG2xEQf9hx+dbEUv9CQZxh+v5ou5X38i3BdUeQkV5UnOCdfndGc3NyDA4hfg
 LWApsGEjlenp1Ak39pxTxy1bROBFJ/1zBWJhlEdaPy5PNCMn1uu41Ib+Lr3z4HUwfCsJAmaOGgG
 k770M0gSJTW9I14GSCni7eynmQ/Dlueke5FVFkYd1gCS2iCjeqZY+3btS3UmAc/Vai6sipYhcTy
 gB7UvJl77FsY7DVw5LqCpdE3Uaz7dplGcZOKDWtVTAD4hWZf40qfLiCDlyGxz5fsYDSi4yQzI/M
 SUCrI+DSmvuPZHfLVAzLJ6sR742fSkTeRIpiWO5BJ3mRCsQRSX5f4w80ByYMt6cOVUqDDQMAT0R
 OShoDABp1MSwzYhEjGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the GMU branch register update into the clk_regs_configure callback
so it still follows the always-on branch enables.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc7280.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517..9b267276eac7 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -440,7 +440,24 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc7280_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x1098, /* GPUCC_CX_GMU_CLK */
+};
+
+static void gpu_cc_sc7280_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
+}
+
+static const struct qcom_cc_driver_data gpu_cc_sc7280_driver_data = {
+	.clk_cbcrs = gpu_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc7280_critical_cbcrs),
+	.clk_regs_configure = gpu_cc_sc7280_regs_configure,
+};
+
 static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
+	.driver_data = &gpu_cc_sc7280_driver_data,
 	.config = &gpu_cc_sc7280_regmap_config,
 	.clks = gpu_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
@@ -464,11 +481,6 @@ static int gpu_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1098); /* GPUCC_CX_GMU_CLK */
-	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0


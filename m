Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5204F7982
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554643; cv=none; b=cQr05f8vVGAgL0+XWi9J7HWrYnf+m57Rcf0wAvLwUvgZx6uQ9yxVfELp2mT4Ld3NEFtjsP9/ROvj1xGJ2Ig1XAD1OxdALP7bnpMKyABj3EkxZIwOnWXjehC4koliPwKTwfx2v7ffXPjce9Led6PvnpmHLF6KFv2hKmAy5W8BcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554643; c=relaxed/simple;
	bh=fR+QNqt66RcwAL1KPanC4gMbaMKXHhKCMmJQy6o4IiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpNoQitn/0GMEDtoiKv8BsBYWb1rQmPcTwgghQ9YtncA5do6AwmMkqZm8XzRb3j0DEHrQ0ACsX2WPb78BhllVC7hVa1SFBTXi5rMHyiSZnyVtZLPdp3HZ8UkHcG7u3MPvNPJV8kVkpQDooadm0aOkfIGXAPVDV2lQY8axpQE1ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rte8fK4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hu4311W0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rte8fK4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hu4311W0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92vU91721233
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09Vbw+V0BNVZt49aE7j3dPPO+Gyf986E8iIZPb4OUVY=; b=Rte8fK4VXDI+M9p6
	Yrdw10vWb5u6wHfqBdXEsBo0hCQdZ0bDte2nfWVRaTp+Cgr1Sg2UUZb53eNjgPrQ
	9RoE6MeqyFL9Zk3XOCj+XBPWR2fZWG+Jh6m077cvWe1yWJJMG2A/1LVCErDOTGoF
	qK1VlpdiloF9O7oWSwn9Ihy5tk8htukLXObzaS9IZvRQOTxZx9cw+lmOy8yTthMU
	iB8yYp8pW54JAdD7uD0iVCKYPC645YR2zxLZWw7mtm1pkZaen2JOUKVOX6pOFauM
	f0MEke4W/4rohTWr8rTHiINS5YgZxkIDLbDWdffHDDqBGujgYw2VRNSG/Wmpr0FK
	0k5qjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkc0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1bffc2eeso912722185a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554629; x=1790159429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09Vbw+V0BNVZt49aE7j3dPPO+Gyf986E8iIZPb4OUVY=;
        b=hu4311W0JYi2JLoY8CTjKX6niyocglOAOJ+zrYly1BB6n010feMEseN9neNhN2lGhn
         4kxQMUGKvl49RhWre5YwrivCEr/wOKUtncNmdn7COtUjInZfXCTX+6FE2Ar2KWOq0SQM
         UFjeLCbc8+6VlZJh6aqCgvn7onOh2EcV7yuMOdJ/G8R43Ms/3y79jB2K2MURJRi+rcK8
         AMo7hqdpCjrnPhazrDizUr/by36Nyt9ocBf0SlmVSS72VozXhigz+gkpwtGR/rBsQium
         lVXz3eP4wdj43lKU9+XgasTe85zOSb6olloldXO3wnquwf9ujXJPBK75mfeVE42P5gRm
         AU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554629; x=1790159429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09Vbw+V0BNVZt49aE7j3dPPO+Gyf986E8iIZPb4OUVY=;
        b=FE+lke/tlVCALoppkKESmZfYeV1VCOsVE8uZkC/VUIFsW0jn4bTSjfFPkUCjZGE7NN
         fF2CLoH6Y52zDoBBKo3JqurcJR2CRBF+1rUbn5QhFH0kCcMqKr9B/bsBDj9H7YscwS4n
         cVKM+8fkwTMO1cUwgKQhCM0mrtSHHcIvzWJMN1CE6X1rDoNa2QvkuXQIv6Jcm+VDBPKP
         pgYgD5ZtJEeZ9DsYdfuySH467fLU8s35zvaJXVOrJ6D5No2FA5dGdiQO2+PVkRWdcSdQ
         dewnh1XZvAQgJWB1B/D4wVaw0KL18oDZIZc92xJRdL+Da3/Ceo23B2lmoymJOfoPIT+j
         i9JQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4A9eNrtDKueDp8pPPU+qGCyqvieQMt5d3aBBTBHZwPtE6QG+9crcBZsbzNZx9aQEZ7iIxkA0EoLg=@vger.kernel.org
X-Gm-Message-State: AFuF++lvaWZ1NE7hGh64BkzGN5DK45rO1K288SdWl0bOt1L/7MOwx6C8
	hz0pt+KJh9ZGE0Qk2zapxbRGhiZh8NleuvRaGMLVtcUivqpG1QGLjZgdOxCi5TSYUruSNMxoA6D
	kiZuYT4OUX12u8HoCOTBGIw36jPgBtwvGCv8bJOggYvklQsDfLEJU1zQ8MWBTb80=
X-Gm-Gg: AYBFou21bsxGIU1Nu++XXu1PeU3+OEs18slKp/jiP8mybYFIKt4pYxXNlctR2BfoP0F
	Wg03/LlpGcqqCOqaodyXSnBG2+2/vhL1occTrPtsPE3V3UEkqjWxfksdWyjtwoQK0Nil9LjrGEx
	hn5HPFJh+sslrlW6JktKg4uFhO98rrKl8Qy59IjuMkhIAbO3qQb12Rm/bFyRb9rxBqquHgA0Boh
	jWIbEaa4o6K0ibR4S1yEE1B4anBz7Wz8RG/8leFqVE9qdIcQWjtJh3pOU8BrVLNJL4WqK1v0nGe
	D2DjEDq9aAO4Iu8Crxy7rbWCr9QB0KExaXaTEPrXoJlpWSctF/4355fEelFWMtD5LFYHVzCUSw4
	ZRUHkgxw=
X-Received: by 2002:a05:620a:2a14:b0:936:dfbf:85b0 with SMTP id af79cd13be357-93bb783445dmr299929585a.35.1789554628876;
        Wed, 16 Sep 2026 03:30:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2a14:b0:936:dfbf:85b0 with SMTP id af79cd13be357-93bb783445dmr299918285a.35.1789554628025;
        Wed, 16 Sep 2026 03:30:28 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:51 +0300
Subject: [PATCH 35/48] clk: qcom: gcc-x1e80100: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-35-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3757;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fR+QNqt66RcwAL1KPanC4gMbaMKXHhKCMmJQy6o4IiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9sW9VFotN/xZ8nlf046gxwkgzBnnfPkueCo
 +Zh8DUoZVyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbAAKCRAbX0TJAJUV
 VqLdD/9FNgYEP4E13VQsW4BZwdPMolsgEblPCPOzt4uNMRjJg6f/F9o3szk004/2xF4HcR0sEYJ
 PZGCtzPRate1GxKL12pMslAQEN7xbw6M4OCrKo3/oqmMcMT1gu626PqQ/CoCDNPdEG0/qO5iKWX
 ood4PjrId61ummg7ZQUBFR8CNjJQbstMYO1MfPBEfDizWlDp8vl6NHXbtolvuCClagM6jDxb1fU
 gS3zFDw7N8kIr4SFyWeiwrds/IR6fj1sZJEsJWqMQIWBdM3EMqkP2IaDnknDpe5jdl/i4+W6hvE
 lvWbQ1pLU1wnwUMI/oGpXPpedqgFfU8tOKrpP1nSSuLkFGdsEhgJvSHTKKKd8JkH1udi/FEsg0b
 aRFPdadv+0oATgPycm1GFSEmXu+BuSIr8Qi9FgnifuxoPOHwSVxRU5KjESn6pZKS2cIUAGTOiw3
 LW6zmCqqOZKZaWmQJgZPIJgmUFYyi/N7RfAQKDnvjELdByAYW7HHFUehHF9GZRpwBrXyVx5+s5L
 tJA7/03JPzoZ1hJz2MTul9jjtBVO8JAukKQEkOGZOdI+V7uoCPjDRS8+qSIMfIL/Bs65ETb70ZT
 J8nVRx3PIHzPcbEVw9fDwbJHiPyGmrEw3fi9oHShJsgFOEeuQDhiOQZUnquInblOVLFex8jbvM4
 YdsJCiVxnpncV7Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fc6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/TanZQR2jsaa
 qbE+UorUWGh8Ukdmje0EFwUuph7WAcKSclxs3XuWOuPV7UraH8sr3N4rvvsw0/FtTS5M47IOSxL
 nMenPn20Eh0Lo+3ahtAD+eOh/bw+OTzmZctOD2cc/2Et/TGpnYbqRXoSVxdmKHmFUzIC/cVQ780
 ECwaf8jS6bkwNh+Nh1Ko5oIOgn/YoNCfBDG09cfyK9PKxb9exvd0UnJyc/7iA06C4zMGLCJJ9W9
 +xzs6SMr02A0mQeIrpX7xOUhrjMqJkSRX11nSJ/nILlH9qHoco3wk+wQ2pp+8k6rcuUqefuVT5t
 t7Y0KdjgMFwb5rqStOrYuzRzRb4DL97ADpjiOMBbMVrUvzC2aDJvBUEFE3p5iMfLzmgMC+IYwTQ
 hB05Fv+ptjWofB9/tzV+Qmuk7x9J0fYz2Fl33NfroLLKGUyjyoXXAjDi1BFml+GwlWEpYkEJKsM
 Xou67R/+nN/n4WKRvew==
X-Proofpoint-GUID: mv600UyGrtIi8mK0iwR2_DIUfW9XPbIx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXzNZro0cxYork
 6EZiVboldpwnDtPmzzDHE8QwrKvC5Hocxw3S2prdHiuYTwbXg358jmA9rgtV5eLHhmROpzhf0CS
 M5FUCsXUTWc/2bCD70psvJCnWyFiMis=
X-Proofpoint-ORIG-GUID: mv600UyGrtIi8mK0iwR2_DIUfW9XPbIx
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
 drivers/clk/qcom/gcc-x1e80100.c | 61 +++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 8c146d62c077..65c4df8b7d69 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7441,7 +7441,37 @@ static const struct regmap_config gcc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_x1e80100_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x7d01c, /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
+};
+
+static void gcc_x1e80100_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52224, 0x0);
+
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_x1e80100_driver_data = {
+	.clk_cbcrs = gcc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_x1e80100_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_x1e80100_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_x1e80100_desc = {
+	.driver_data = &gcc_x1e80100_driver_data,
 	.config = &gcc_x1e80100_regmap_config,
 	.clks = gcc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(gcc_x1e80100_clocks),
@@ -7459,36 +7489,7 @@ MODULE_DEVICE_TABLE(of, gcc_x1e80100_match_table);
 
 static int gcc_x1e80100_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_x1e80100_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52224, 0x0);
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_x1e80100_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_x1e80100_desc);
 }
 
 static struct platform_driver gcc_x1e80100_driver = {

-- 
2.54.0


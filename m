Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F94EA361
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554649; cv=none; b=EayvvCKo4e+ieT53TB/ZKH0SFMP2ebL1qjNOXtx6iLF2ucRg7nCw3mX4MWT/MaMqjdIFlvNhNstThOZybkSq6kLav72sSdardepNJmH0tTP0Ife7q+rGaLtMSNCPM444bPQXsx2mCTPtRgmcm2U5iIuWr/j2/UDWqQHoTTrxxvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554649; c=relaxed/simple;
	bh=dOWcPm4PMu7C26gubY+szdZhIzmbdhBFQ2hjzKZc9HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neBCEtKqgmXeSqgyJbzbxzz++an5KusUzhikkWeYf/LwHWgej4tL60JOWgyU4jSG/UxXaND+kViHauAHl73LUrezr94tlcGnlxRImbrlP7u8usMcGaHo3kFRtR9O3WdfEeZNkBNVtf2PX5q+XLvgrV5KMAgmpsnxYhhWo2Dn1As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mf2F+YXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKgnSija; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mf2F+YXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKgnSija"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92f602477683
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIifXueKGL64mhkXpHFF3L9lYKQ6XACTTZUiT4her98=; b=mf2F+YXCefj2IZti
	tMCfeS2NvMn1OGI8KVY2lEpZBlXAsyHjayvD9xgnjX8Gn88+qBwMLIsLeWgcYQnc
	FcRHsm0ZEMFQ/gc17Io6Iem7+1LhxNF+73+iXy6KH52+6+gDzCtvzrU2SEn4ReXx
	9tazXtPqA8ldTYO65hGZGLzrQSgcDTXnePV6Aicm0rGgqkDEVRNV9VUeC7sqx1md
	K2aphoBBBwMFn/uXH5G2EwqZIOna3mzyECbtQ15lzTNDq580wP8Idw38dJhg18jP
	Hd6fNseUkfVdTd+G8a4EOEfhl3E5acc2D0iWy6pOMs8+D1VHhSCVGN3jMEHeVew6
	OvnY4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939062ecda9so852985685a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554624; x=1790159424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIifXueKGL64mhkXpHFF3L9lYKQ6XACTTZUiT4her98=;
        b=EKgnSijaF6bR8PQWLlvE/wUXGjrjYdowUuF51yGoEjs938kfAa2Yhy+bzWRUS7+BbA
         iQmziLufvlql2ZWt9IkLMcyPKoqmYu+NlGUjb/I4CEPTX2bN+hrjiQoXzIbXJPNUTuZy
         PYIfDFAREK3nIkzBMMvHcH7aq3qp4zhboRfuO6P13CohU3lGY/keJM5Izc/Ua9jIqKyc
         nwXfztLASFSmwQ/shdirjSwhPGXq5DZ3zToMeDS1wU3I3ulrdZYnSAc4v3Y5WHUnWEEJ
         5xzuyfqFajDF4jf0SBLzG6u/xBVEapljsB2yuhhvw1jJJV0MUBznUvc70wjlrCsWemDm
         aIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554624; x=1790159424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIifXueKGL64mhkXpHFF3L9lYKQ6XACTTZUiT4her98=;
        b=DLRchPacvYTCb4awOLBr8VJO9BvvLCJ7ReaFw9mFqjSPGM8cpz+XIZwTS4K+JbsEVz
         c8F9BWEjMomMjyHQO7z5FZWwjuQjsBxErq2QjFeLjkzU8LzD91Vz05RZjjQcDUvWhRaQ
         x/ooiiA5qZ5gWrS7Suv484K1zIObEUwgX5Czywr2NgjDxL9fBcLdKVm4VVrBgwQ5H17e
         GyhzfEr/tSk5BBYpQeUZzd6y7rZ6TVz7oVbnWCZ9IX2CR7fQAgwWe5Fnz+sm06ByYV3W
         OAUbCWMXqjzjoyjrFGy0q1fSgVromszH+XsTuCSvWUgLsap+sURzFGmn8oBIypHujuB9
         OW2A==
X-Forwarded-Encrypted: i=1; AKwUvBwu5Brznk9GipE7G9T7swU5cE+Bou0qzZzJCjSIbgmbtsVCgOCuDksx8yRMFFPBdgRF7kx0GHyH+Go=@vger.kernel.org
X-Gm-Message-State: AFuF++m44xxnP2PVljd9VjiXgXS3Ohm4bOXKObrLjNaG9fga77352Vkp
	+PdhWC6BqmqhTu6S1unp5riENDU62VmDkWozGYgkmYJ9W3tMH/fnftYaDEiQKfLNh1fBaz8sLwe
	5kOspmhzckTuxfx7xA9bGxebpWTaIpdJ7dw0oj8Dj7oSQrOqT9roV69VEeGdadU8=
X-Gm-Gg: AYBFou0VUEbwuWC2uN09bwD92zHrb7eQ1NRPJJ2TmAVwFAGrxSMMd9hL6fM2YP1lcHH
	RfyzTU1J2mPzZbcYiGbsM/lqlb1wMonSIFyMZLfwUyolADzIVg6fPsTfMsMi5iExoSdK1h8EGzp
	OUzg+PtlZfNGTJMlMkn4NMlwaURaoblSKB928Lz4CzW+KiHtJAdScfpFMdAvYJkMYFzc5AH+9Eg
	f483qVccV+HhOThIEevqk3n+DZkwlOwOcAPo5qf56Q40Q8b3i3bDmg2kQaBZx5RrjT1Ce7hjSFB
	q0gvnLYnw2/rrwOHCiz52EkgFncsCRrvWOcOgRhLSR0cJ/pG2oSJCkkPGiBXtewn5ktUkh2poYz
	P8S+OOoM=
X-Received: by 2002:a05:620a:3726:b0:939:6d2a:6e38 with SMTP id af79cd13be357-93bb789cf2cmr317102385a.33.1789554624292;
        Wed, 16 Sep 2026 03:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:939:6d2a:6e38 with SMTP id af79cd13be357-93bb789cf2cmr317095185a.33.1789554623755;
        Wed, 16 Sep 2026 03:30:23 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:49 +0300
Subject: [PATCH 33/48] clk: qcom: gcc-sm8650: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-33-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3563;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dOWcPm4PMu7C26gubY+szdZhIzmbdhBFQ2hjzKZc9HM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9q/YvA/KNqUjhxVtrP76Ct6z5wHw4avj/Zu
 EH7oKxgW+2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvagAKCRAbX0TJAJUV
 ViwBD/9eMxOPyBo6cKX2DupZuINkkHUElVULOP3PT24lBJrXBxZ7cBGZvX0pygZTw+CpWzNXTh/
 5OeXPiWOjpXeiEWHilTE+iBOvORY+QaIxgJNlkCZ+zqUWdNoLngNGJPl2s5J4H94ysJ34sfDaCg
 PA9cpUv/LQjOzJJgjnuL5Mmdh9P1iREfVM+z5cnOkQcLoSliOSC/ZJg9mnK4QtVRaWN6eQMBfje
 phgU96utaPhqIPA04KJ+6ULw98W9Ks21mtg4BjvewvhjLEK4ha3qaHw27Dc1SttdtPMUCpsVe37
 tm5vPri6dVqI8wgfSU8eA/DpwWYCZah50eUPIH6di+kEj4QmrA/iLatAbOzO9jYFoVJrcSEMj80
 RFKEZgoXLCs0ihTSoSxpDaQyKjGFWLCSQ87/V0jR2WjQXc4Obf6vYAujrxCOBg462TR6nXZ09d4
 mWyk5AYe+gRB/WxxdZgVQqrQbn/FnAYYXOwEMnbyARZsRKBls/EfSKdRaKPowobpDYt1TDFVhL4
 MhKmPxaNyKMblI0QAW/l2ibWIh6uj10mpO7ZGFx3djZbmbcixguKiDp6E6ccYokoD/tCSa+72WL
 14K+j+ufndXMzvMlc9ccv6eSsAfhfGVnU6W4dOr+STHrnOrPwHqiTxfFq90A/eJimP49/19xPwX
 wTt0aDtb8eslb+w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX8QXdtSL29RqH
 cNdjhZHpyQmgUa1fWtUIxJKMgVbZHZUj49fnAo218SG/jEZ3OGOFCm1bZrgN3EJb9eIl8IkG92p
 0pP9IBDZFtoYI89ZrDsW23JWOMZv5lY=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6fc1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zVTGKPmrq-ksKY0k6ekA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZpWWQDwABpcg4Vy0YPrs70ts2ZlgIP3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6u1P7FvUQqrt
 A1t9sONEsCKM2OpUPVQl6lcPUrC88aEbL5PckHIqxZNqWH2lhX4/i7gysMCRoXBsxAm8gmMHliO
 VpYGXc1FU8l8vIsPDA9ChzqooyW7iXy16PJP/GKRWH7dQo4sURpsSOrX1G6wLmP9M/hUAiXH9KP
 3z9CZQ468KvfrDMm3fN6wI1m1/BwRgfB+9Yk8vtyYGljivJTvOsy1xL0SBq+kyiDLp/6np0oECH
 KqhRh00e/4BcdLIhCJ6QJx9LmL7dOPYC3CZylEo3HxO7Kv8puDbJHCKgHJG0e28/7Nva4knWgC7
 ByqMyMV2RqCRz6CLe4ll+ROalXTQALyq4g72NX0kOW0IGJB3b/7gbLpvlMIakcJJlxR2HsdyQY2
 CIJvlRfOWBGKm8EmL2pYaNIKuHpdFOI6tHqr7ALG+amsJpLMmCMF0iH73taT0s+ZzaoMnuy3/HY
 W4AaNnGswnoOrYL4mpg==
X-Proofpoint-GUID: ZpWWQDwABpcg4Vy0YPrs70ts2ZlgIP3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8650.c | 59 ++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index f7e2d7ec60c9..b9f9657e9d4a 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3777,7 +3777,36 @@ static const struct regmap_config gcc_sm8650_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8650_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8650_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52150, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8650_driver_data = {
+	.clk_cbcrs = gcc_sm8650_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8650_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8650_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8650_desc = {
+	.driver_data = &gcc_sm8650_driver_data,
 	.config = &gcc_sm8650_regmap_config,
 	.clks = gcc_sm8650_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8650_clocks),
@@ -3795,35 +3824,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8650_match_table);
 
 static int gcc_sm8650_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8650_desc);
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
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52150, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8650_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8650_desc);
 }
 
 static struct platform_driver gcc_sm8650_driver = {

-- 
2.54.0


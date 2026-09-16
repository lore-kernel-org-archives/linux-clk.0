Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329784EC656
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554620; cv=none; b=P0bPLxQdEYkj4MxpiyfUFEB845BJgXi7VtmpYcNJ6qFJVQr7YCCw4PaxNfEQ594GjlX2uMLwreCbacy+rb8fJBJX7fAo/QsCbpXsnqd5Oj4YOUrIkawDEy7jqY1imsKj9OWz5suhfIQRImy7SQUgR4VTUdsNKrW2t4N2WB2gp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554620; c=relaxed/simple;
	bh=kjH4U7LYJXMjtRl02/2G1xh38BvQSw6adewBLYe/qq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ick7kLkB2Q6bQsYB/oPOPyDlvE3cKmRYqlLoZntergVRBlYe7W5Ngpj7VVKBJ7miVViOW/R/umf+huKLqiVoWc5e6xgocLLYOkuxVKE2tIcSwRKRs1e02YLwvLoNT4j9nmswVawGiAzD7+UivV2YgFizxpbjOUadX52RZRKoRFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI2vOmYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCYt7HDn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI2vOmYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCYt7HDn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934d32226512
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Pq00aNEwXnERpYAbSOyarBrxtxZMRIL85tSGWJa8JM=; b=lI2vOmYB4+Efa3zJ
	NM/xtppcOZS9HaFTJ1T00BzcV8OgGrpTxWwNNea7XLSOpQ92t0odV1IKSFpn8qLL
	PGE1x2utCdS5cBoJIDVTfbsFjBqYwyT3wfDkmVaFZQn4csvLkk+k0vBu6O4d4RJc
	+QArhV+NJuN0SKj8xaABira/OSrvlBn3+ds13oyg2X92iL3uwwsvNws65SXd7eYI
	bboHbnsxT70geJWOWnc3rpDUEUqSbjEnGOmEIdgF/6kp48o9iGF4vtPDRBUChFhA
	EmjBb7/Ab08WhWiXTng0ZAmkTz/p3yuiKPMasi/8Gjo2i3OMXG4AfJsA1InZRfkG
	SDLLsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f925ba4eso19950485a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554593; x=1790159393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Pq00aNEwXnERpYAbSOyarBrxtxZMRIL85tSGWJa8JM=;
        b=VCYt7HDnWYRPs2QOI5ZnIkrauN2GHZiK5UgeXYRhJoHS4Y/kY1auj4UyW3QmeGIQAV
         XU5F6ccFbejWceDHSsVDaunQlIZuXM0KCYCo13JGujiqiP3UVsihqPvGooVji1NAuR96
         Rny3A15Q64lTzbPHbJU5nQjHMTjjidou1DZ8UT6YHpuzJIWH4DB2o2bmUT0Fwjjb32dm
         0kwh75FtTB4mGUCusgdQ7FgWXskp+SxwQAkx5prJ0EKSGKBACaMgyfb+NcWMsgNtwUok
         P36CTmIAd5C/9Ni6SMhuD9UUuUsLeO9ua+75WtiIr5VNz3+GIJB03CfOfBUm/QEPWnZS
         NJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554593; x=1790159393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Pq00aNEwXnERpYAbSOyarBrxtxZMRIL85tSGWJa8JM=;
        b=lEylXh9ajik7fj8JssdOM9+FKTeSAcQG0cW9OuZ6iPqRyxL8L+ZL78OdRmtqfiFxxe
         Fzq5nttjOyz5noCS150spDTvSeT3HebaxesEHVwXWIztxyFtqCjp9uGs3I7pDwFH6UOF
         EYaksFBh1BADX9dFzQDcO6xVObCS1cPX8XrpMMLpb/CdhPVNB9iYQYEqccV3eAlYlLMk
         9pxaLpuV3xkoUw9NLD1B1BwboHcKCklGIVBiB/0hEfft08cnC3pygvANitPc7HOvMCA/
         eLIoMYE0BFI+n0ZhPHiyW7RHeeJLt+VMuWhGbwZqI3WGOLp756ISszxbM+t/Zg65ZxrO
         S0mA==
X-Forwarded-Encrypted: i=1; AKwUvBxJW6ZG6HY1lMmysT4NUG3FCl4FfWfoZWzu0kag9RCamWytm7yomRfjBf3dJCkdeL+qdglTPUypA4U=@vger.kernel.org
X-Gm-Message-State: AFuF++kzCLslrKHdLCk2cEiBRT99dN4nBh3IxrHHGu0nmGCJIW4E1LoQ
	nP76l9SMfuhc/bOdRVwpl/4NHEMjtm5VpO8A/BzQ3J6sRykxA5ytFS4zXr8+RuAnUxSsuM0JBCC
	W8Sn61aSRwAwxPNPx0dkJhBNRtiBnpv0DLzZq/HvINK+wVnOisGLZo55XdDaRkAU=
X-Gm-Gg: AYBFou2vM9nf8OpXozHQ15jyF8qIA46vmBTA4A8Xz2u7GhwpSQrI3Oj9CB1b5jGBD4t
	EYKoqO5R7RMLdvMVaIGpunLIEpnqRq94sDdgiljeiawSOO7DWnTwdxHXEJG754BGgoPNIC54Ycz
	NepBDyCbyH+KfqhTTPAq4QXAhUbhyDza82HHQlKxChCyhXS1odewktAGkmkTvBeuRmjl0XokQ2C
	Jd0+c1C1o7rwxePArcr9ALic2P40SMgD01uycOACQNpYmbBAj9M/gDlfGkLhOlQ55I+0wqNAnEG
	+iksu2NUgPCItJl+CspkUpDZ5sud8GQqfUyYcBWmMPGZWSYkCC/Xv5wSBpLDLKhKfWB+Y9z4q/1
	LnSHwCfU=
X-Received: by 2002:a05:620a:640b:b0:939:6de8:43de with SMTP id af79cd13be357-93bb7953614mr288353985a.50.1789554593361;
        Wed, 16 Sep 2026 03:29:53 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:6de8:43de with SMTP id af79cd13be357-93bb7953614mr288347985a.50.1789554592846;
        Wed, 16 Sep 2026 03:29:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:35 +0300
Subject: [PATCH 19/48] clk: qcom: gcc-sar2130p: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-19-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kjH4U7LYJXMjtRl02/2G1xh38BvQSw6adewBLYe/qq4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9dbWqOt1O1g9WDLyMbnlHGIsNq/Bq6jM5jW
 MiDdAtIU02JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvXQAKCRAbX0TJAJUV
 Vo1CD/0R9BVX+HbFMDRcjg9h+jKWehS1rTcWOccAV5sdHzPPfqnMLscDAtGuW5aiiOfD64cutuy
 V9wA809FEcoT7MryADHApixYXSiEKYT1S8HAOhg5uYqynkQ2LLnx5uC4Fzvgqkdow58koaCa0gd
 9U5Je4ER+G09oa1CBytff0BAKYWa58GriaT1RkVHfm8RYIM/g4PSMAAOPPh1viddRiadvPTAUtc
 nk7bI0zeHoDg+IU7XIyTWRN+3qah0hmUa4RmKXorB6y4vf8T9A5gEOgdnYr4X4hu+2tj0oWXvGG
 B2pwr26GJaznMNvG4QldgyoTgQijdU3kA0IKhzzTWW7yQBcrWrfaQyDiDvPGSbjRXVIlBSkpRAR
 pX/2MibCbEw56SNP4xvB7h4/DK9/yFIUnq7j3My2PNGzRAcoxQYuMUvdBX8reML/6ZEFZv4kGHE
 Zj0zTu822mEQdSFwMwMhEKsB2BwG3SXzo9ff4TxuLmkww7aDjRD+VQXUtkCQSzE/13WCyoYvPYp
 YZbfTE88JYFGSgVoZIW9IPIgwyUXJ5zgn+FxKkSdb/603mXTfIFZ/QKdoYLxmYAyYQQSyEGn+bl
 J8Sz9ZLx/inENm8mmqgmd8i9Jw6BGOkDoIYcUs8Ud7QxLFwqAcdKwPPND7cdO8SITSBVPp0Vnps
 8lSasmctzoxBLew==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6fa1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XazbkJH4cJJKrr3KiP8A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: r63qYuqWBPNCkQls1bjpFPH7numntxSe
X-Proofpoint-GUID: r63qYuqWBPNCkQls1bjpFPH7numntxSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+BUV64tNugC2
 NKQcrEoU2McGpz6ZlXFq37PIR/UM8fM9TGyrc74I8oy2TKwcEo3EmsQvhzkVH3PFYcAKpt4QUk3
 IaoRPPBYpq0XkhPDkd/Gvrz388yXltQv9Tb0IyanzkFs8UGb0p5NWOZ9XHC7zLpaRJb8ieTyViE
 5bVdHjG9bF4rgZU3IJW7I09sLcAugF+x2b15AKVknnxztA7bB2jganQx65w+upDXtjBxwi4lUBq
 sPOMGhFh3eHzgxs+vMehcp0/gzQ0aFYIGghHElPsow72QG40UtT7FuRpWEYM6hjMrJcG5oDTO0L
 j6f3GF5djgrzeoCg3DW2DDbfeZ7NiI0M1qLWKcm5Uep8s0KzVNlQ4A/L4rjRugHYXdeae/P1SWm
 evdvDhgfQ0REwydU5jyH8mwENZ6kPgGptyPagkB3dXT0TMMopeJjBQqFQ+zQkGJdhuqce6X7Ye9
 tB1+DcHg2Ade3hZM+6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+HOpIuDTbve0
 K4lrgGkiGYExTAGzvZ9TwMCmukE1NqW1D7od7QedsbAMCAKuA0bD4DES1uTuUP7kADWI55T3eOH
 3wuUYw2Fl3EmsxsUIeGSot1U/nV4A4Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
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
 drivers/clk/qcom/gcc-sar2130p.c | 45 +++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 475e2cda3618..3882ec7424cf 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2300,7 +2300,29 @@ static const struct regmap_config gcc_sar2130p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sar2130p_critical_cbcrs[] = {
+	0x37004, /* GCC_DISP_AHB_CLK */
+	0x42004, /* GCC_VIDEO_AHB_CLK */
+	0x42028, /* GCC_VIDEO_XO_CLK */
+	0x9b004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sar2130p_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x62204, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sar2130p_driver_data = {
+	.clk_cbcrs = gcc_sar2130p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sar2130p_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sar2130p_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sar2130p_desc = {
+	.driver_data = &gcc_sar2130p_driver_data,
 	.config = &gcc_sar2130p_regmap_config,
 	.clks = gcc_sar2130p_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sar2130p_clocks),
@@ -2318,28 +2340,7 @@ MODULE_DEVICE_TABLE(of, gcc_sar2130p_match_table);
 
 static int gcc_sar2130p_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sar2130p_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x37004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9b004); /* GCC_GPU_CFG_AHB_CLK */
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x62204, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sar2130p_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sar2130p_desc);
 }
 
 static struct platform_driver gcc_sar2130p_driver = {

-- 
2.54.0


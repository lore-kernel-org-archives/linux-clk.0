Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8453DB629
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838814; cv=none; b=ppM6raL/NijR7MI+R32QZshSrZkkff0o4SlInBqQVOasE+MXGAFa0trEmxhKO8W8NRS3hRAXqtoapsX8Yiho1AdX9ZyqkhqbYDq6WaxbujTDkge83MBlNeA3QcKtbinQY5nmcoYzgKImrkrvpHepZrvf02L48Rgot0IZkggGylU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838814; c=relaxed/simple;
	bh=TzUOmasvPOMM6OLooCKEI/dOAGex7b/pquhEI+XR0aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y13FE7fl86JrdZRv5DZ5Ne6WOOXlnnTYWh+IXaHHpqjjGy4tcj7NWsSUFPlJTamIk78rN/XqT5ecUz3N/DCm9R3nPQLQbpalRGtt8gtU12cWr3fwNbORvudnMRDS9o4l7CbaunFDkKaaoqzwT+QK01xFLt9tAEIV9jwhpw7IFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR5I7z9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fs5/cAmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pR5I7z9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fs5/cAmr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AF5r0G3759346
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 16:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D+NXYzu1gj0gwTGsqn7k4GwpoqHtGh/2P7C
	+KXpS6Co=; b=pR5I7z9PDLedsrRpwQXflQzUHBOihnDpBCr8hw8+Z9wInqzrILE
	FTIihdJkAZXguQJuhNViZstkAKCy3rAjCXwlHhkSjVOoOZFZByYXvbmDu2rq8UJt
	LTQFnOucI+o9jY6jLk08jFwbS5TwOZtk5jxRYwSja+LvWW3q/4Xp8cB3EB+CXL5d
	vXenSFRihkl2KPWvUxDQbxVGb6j8gXXcNq13AC1hZHc8zUYVsv70B8QovNDrfKXF
	nhFfpGtMdlEEtdjogJKCadg+eM4kTNJLz2mAFk1Qoz09zgkvoUOAMdgjqH/mdNTM
	U1jlfb7kcMi92OAo94O0yzQmh4hKB8Hj4fQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3j1g94q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 16:33:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e4c29caso55740241cf.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775838811; x=1776443611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+NXYzu1gj0gwTGsqn7k4GwpoqHtGh/2P7C+KXpS6Co=;
        b=Fs5/cAmrjwpNfvBkvvuarpNGzXN5VDqkeWhpFbB4ORXpJrbb/A9BYsG9ovHeocmlfP
         AI+8VBLYaXWbOzaWOVvZ5VP2DmckH9R+hiIRhE1HAuBQPHrWa26TuzPxf7/eAdF2P9Pb
         /+gWN/euplLgt9qkUesjtE/Ulu58DaYi3eaadhimgAL0jyl6+BAizQb0f4xvV3H3Pie/
         tOSkD/BbsQXTG32K/u7s5vjZqgtSuQ0ICGtOeIIS5wsNd9g+/dsPqELKuanSp2eLoaht
         fbXjxbpy/IDePfSbto/BTAqyPBzScrfJv0U+fS136VcurpjfHH6ifJmXoF4eVXENqHj4
         rbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838811; x=1776443611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+NXYzu1gj0gwTGsqn7k4GwpoqHtGh/2P7C+KXpS6Co=;
        b=Wd2TC0JZ0uPO9xsJvJK2cJeSjGvELj1FbRcI3ohTFNu493kdPgemLOnC22iA2bPFc+
         50coRb6kKG3Nipk2QUUmT7J4z+YGEQOQE/ePlCX/VLMPq0qPF2718lh4UfUSThRT4eoM
         0qJFbSTLLobHie6RF+APILT62N512Eb7MHe6oELN6fLSpCU2dCniiZmLq+3vev9unwI9
         c8x5EOKmtiy8EyevFIeV8XUl6Wv0lKwzrTsulJAaW7tenS/F2UVlXHdZM22fQBuNg1mB
         VG6EcSWRvUPkuUEt277EGi/A0xfGDY89H5Dkz6y7Kss75wwt198Vmp7XYMrPWa/dGtHR
         TjyA==
X-Forwarded-Encrypted: i=1; AJvYcCXj6JcPZSQ2yVybQ4D+wdIqj+nIZdiIpHTBzDYZxiZWRYcQF61MIcYJWuyKZUdyWZlMuVeP3GDsnAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrw7nJh6alvnrF62u5OVHFKBLDFT+RFASb+o0ooZc9E3NAfdsS
	IvEJfzCbnKhafaLeP/RImsWGL1gg0qKkmSQJVnw5SmwvkJJ1p7XDLBJreO72Oznkim/lNOnoicS
	c8lVsC1LKcOyY931ihNo7yugCUCctCroKReim77VM+K625/x/+DlsjrLjcN6EXSw=
X-Gm-Gg: AeBDievh7VPcSMD2qNZOsvuO1XbXhsn41zXGzGfBQwA7mzH6iUX8ie3rZ8bRZFXyPfc
	gmx5bKKCUyPzcqhuJPrD68QVP6hBp5NKpTwmeLOis8IANuQgK0FcxvUontYllvh2mnpclQyKaI2
	78UITKuUs+hZGygCOEBb6iDQW3HtQe+h45aOmF6L7BFRL+3ots3KJTq/RDMfOP3U1yIYiXNzZ1w
	u+zoVJN1cDD4fzkfDBwhlgFIv7tMRWBP9fi47484D3WIgn86AJP1EOmuuPqK4YWxJQWu5dJ8L2Q
	mHBt/e92Ig4XpCDSf5+mtT7C+LVmVFm8yI8T/Wx5t0ZQr/8InQ46FnupW7xiXRJTKyhUaBJk2ix
	SdcGLWnThnrxcWD+RjHKC+t9o7GnJMemHTotL
X-Received: by 2002:a05:622a:1344:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50dd5c3df8bmr56506651cf.29.1775838811448;
        Fri, 10 Apr 2026 09:33:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1344:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50dd5c3df8bmr56506141cf.29.1775838811010;
        Fri, 10 Apr 2026 09:33:31 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b128dsm40569745e9.2.2026.04.10.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:33:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Fri, 10 Apr 2026 18:33:27 +0200
Message-ID: <20260410163326.566093-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=TzUOmasvPOMM6OLooCKEI/dOAGex7b/pquhEI+XR0aw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2SZWER8JjoPEU/t3kOyUEefK5eDSCBot85mOD
 MwYnr3+i66JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadkmVgAKCRDBN2bmhouD
 1zX3EACZcWObD6gkcRPnJvDS3U+KbCn6ZHkljQdOT6WiRCIrm85EC7RGeDv5uJ70dRjc6/A8zkq
 ermha2285IJpfVE+O4S13uzVCBo9izcDeVfLYZdkqa0lh2UzV1XcehukBAVmrb8HYMi31/2/iKf
 cub2WL/ZQBHQ2aRSeTTWvbblVGdcCpVVXnaMpBw6bndZpMHbfVlyXHNgHYavYZF99WfIMgNONd+
 GVaXsMZD4PGXRQPpcI+arDXzwQgz7bkCVdvq3FS4Filsst2y5b1vSujB8MNPtnp7H0uB2bTn7ms
 twOnj4RHRriHUf3OZ9dKDiFm8rMnAdRBrM9ip08+q5JCoeCjQ4IiTGx898wWKylXwOhb1m1wqQx
 HNCFEmk+zR/puxOK7ZajMyawGxAcCXYr4+cgH99fpfNmv256jA47PsiKlRotJJOj+yX7uST7TnP
 hFIIqR8EC4OQXm3oyvSwz9+c12XwyRGblCJBaqbQ4ANrOJ6QaEQMyPzTOAkdcGcojQNi/1aSJR0
 2Cmy/Sp49FGliO7HIaLYRF9FFGvWEMPau1GcRptq0Ilc5NIe5kOdS2BySmatSN2KGR3Pi99E2gA
 FrwMiywEd/BvVfwcMonsc8HJq+bYA0MJDYnRhhDHETKlb0mQHlRrorUVZL5HnYmuE1BxpepVihD PmmW96sxcs/8HGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE1NSBTYWx0ZWRfX9U5iHsreNVKQ
 1l0z+FEffhrevNfSJc+htmEnWAFEl9wonLK/PAkQxLjxbmtcr6VebNbRmlo0PVdJ/dRo/BARTtg
 TiHiKveqB4A2h56UlSkdGLvq+46pWwzqXoUQnyBRM+mxZ//tl0P9AUOIhG38pfn6eEs6npT4sRx
 H7BgefgKHwRSxeBr0WxcIOYgPe/M7pWS9U3u3DDCZttjoOWRRilh7T9wd6BDgLzLIgocg3zlJdp
 MqEhZYm90iPm14UGThw9Hk4D+9AgbyyNW1XaJuGCOxXycrsUP4JbSm48QmVSpDH093USWqeMSmE
 QGYN5pU8RWvVO3zA4bPNmB/1JmQLAtYt17V/udQVE6A6wtOEeU+rj6lKdjTvi8IX+hJBNGdpGio
 bnAnJC0qaVy0FoaID7GjLu5Ln/5f+EODU3EOsrBiBOCQM4km5YazwiHxEaGMCbuWjyvUK8ikVp6
 hrZrHFYTT3eNPZvrOaA==
X-Proofpoint-ORIG-GUID: Yx7EaebEcSeFtgsYH4-1lO8KlbEMvpIP
X-Authority-Analysis: v=2.4 cv=AbKB2XXG c=1 sm=1 tr=0 ts=69d9265c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FGFQUtXPFg5wjx8ao70A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Yx7EaebEcSeFtgsYH4-1lO8KlbEMvpIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100155

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Drivers introduced after my previous series was merged.
---
 drivers/clk/qcom/gcc-nord.c     | 2 +-
 drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
 drivers/clk/qcom/negcc-nord.c   | 2 +-
 drivers/clk/qcom/nwgcc-nord.c   | 2 +-
 drivers/clk/qcom/segcc-nord.c   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 3098d8fac0fb..8a6e429f2640 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1850,7 +1850,7 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
 };
diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
index 5d52c6d8b5e5..1466bd36403f 100644
--- a/drivers/clk/qcom/gpucc-sm8750.c
+++ b/drivers/clk/qcom/gpucc-sm8750.c
@@ -421,7 +421,7 @@ static struct clk_alpha_pll *gpu_cc_alpha_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_sm8750_critical_cbcrs[] = {
+static const u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9064, /* GPU_CC_GX_AHB_FF_CLK */
@@ -430,7 +430,7 @@ static u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x93a8, /* GPU_CC_RSCC_HUB_AON_CLK */
 };
 
-static struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
 	.alpha_plls = gpu_cc_alpha_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_alpha_plls),
 	.clk_cbcrs = gpu_cc_sm8750_critical_cbcrs,
diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e5..2cb66b0691a6 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1945,7 +1945,7 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
-static struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index 163ab63c872b..31c7fa06ca92 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -641,7 +641,7 @@ static u32 nw_gcc_nord_critical_cbcrs[] = {
 	0x1a044, /* NW_GCC_VIDEO_XO_CLK */
 };
 
-static struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
 	.clk_cbcrs = nw_gcc_nord_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(nw_gcc_nord_critical_cbcrs),
 };
diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index 1aab0999de4d..c82a56d97154 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -1568,7 +1568,7 @@ static const struct regmap_config se_gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data se_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data se_gcc_nord_driver_data = {
 	.dfs_rcgs = se_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(se_gcc_nord_dfs_clocks),
 };
-- 
2.51.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E84E3ED9
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554635; cv=none; b=OF3YYrQK9eJgpjKc9C3xw+DEsruVgxd82klyi4sm38BZzoAEv/KBzqusFxC+BfPtVs1QWpaRO6ck1ci2GyeiXac27C5aqeunHtACe+axcd6lmgMnhcdAPPTN2cmc7XAZzwGWq0uHqW2orqa4X6w3iEIRLsSp/bT7eNR1m+oPbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554635; c=relaxed/simple;
	bh=N+HmXCdTzCHtsU952EonArMOSy8WiO3S8aIl7REabXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UA3OrEPTxWiIhZiSC+I/khOExlqXtGod0ybh21vzscpg2pd/JUSjoLIZLDs7Le3/8ZtbGhfV3BiRHwK+szEIIFL4bHbeh10QZheJXYbRMqs+4+Xgo9ekDlRAwEHBFfV6wQuNwIgQpZ6DEY80kL1D4brqBi6L88aIdskEL24SZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRR29ZUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWv672x/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRR29ZUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWv672x/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AbH2658312
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O82bOoWRfdyi2RWvHQNhLrcFnnZraxub/08fychyubA=; b=cRR29ZUtl/2IvxXq
	D61c19+OcWty8Nn45oMy4wtvvVXjSDG9s107s6fW1tpVgC1LgUoLeh5geL49JAS7
	YjkrOdXVgsb3nnlp1qi0k1FZeh9jGBSJX+H7Zc642DgubbgKTg/JjWORSQ/75Ys3
	U74Cs+ZgOl67jgSOhzUvRxAvefQqwGqBwmfAfwcKirHpBSSL5ugoJhUN1fPfL2ij
	JILFHdz7P2jBq6cvNumbeyFwRBQAaApR/rUPGrfkaTIWLH33grL6UayTqaXZBDGA
	QeDlpRQQ9I0H1i6gXa1wTcr99vEzfV9rgWrGe7yiQt01otV/w55fKmG4Cmqy1sSU
	0/MYIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujar4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a08ff8451so657737985a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554611; x=1790159411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O82bOoWRfdyi2RWvHQNhLrcFnnZraxub/08fychyubA=;
        b=fWv672x/pA2bWw7Z/WRvXDWmJUCNdYLWy6aNMFhZBtRdPfnTdZPrj4p5p/qha9WpbK
         PrGFe3AWXNp7kuq+Zahy+OCE79Ril/JrNEqOnlxfrYwT+prSHv+xF7VKrLyYKV2tPQq3
         OhCx3p5Jumpdwy5/E9Y/Ad/1H/roAh2PXREOpGXJ8yAReXek9WeVhY5K/DrdLsueE6Fn
         r61O6X5RnrC+S4+kQlyIqcTgosq29HMrDhFYh23OHAwP3/l8NfH5o+dYQGZny9GbaYKE
         3w/+n1Dh9GffHT/gfhY3p9Ci1qy9L1gJmWgECtlqNMBQi6BWI7C9+NqHuT9l3jA+ALcC
         1PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554611; x=1790159411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O82bOoWRfdyi2RWvHQNhLrcFnnZraxub/08fychyubA=;
        b=Zoq7xFRZSk3bbyboacZRRrx1Ywv3oMKMsA6vXGLiuZEyGFVcQ8IM2zR09nIXiVbAu1
         hsaT3rijgsxPGoABc6MDhkr7JJluYDMY12MBYW4dl36iOSc8/DW522YA9lf4C/VPq24j
         B9nuc4QN90tMnXu7qH3GugZuhA3RjiBn0DtzdAiZJkY0FRxS68FcZ8n9RPbs1m5EcR9O
         WfOuI/d0VaFg8/4Qt6gceTsaNM31via7AmOmcSpVguNjFC3lPUft0R6mOlSfnIaT/DuP
         i/nRhnoN1mUkm5N7+0n1mPp5i5P5my0osuW5ouCZsbmr5cPhNQxSMt8Dtp8ehOXQF/hE
         1+iA==
X-Forwarded-Encrypted: i=1; AKwUvBzNOdHgpuVKPnb0CLhgqMHunmk8u9V9/lmuc5hpkxDivJHyLd7mNuRGkQHhXbIEJBdn0hpcGk4VXXg=@vger.kernel.org
X-Gm-Message-State: AFuF++l7ORGzT571zgMtDVPFQKSJtUwq82oJJsMyT1LocU6+tI/4HmXr
	F+HqdwEt3lLjZMlCUbLeNq7T8GdkxzF935wMtxNhEwe+uQcH/MCwCPRXXzvYmQrHbOu2RehEFtq
	xjOqzVASXP5FqWiMDQ/28GFE8SJ0VO/XxqPj+DFqc4ETBDmTK2np5fJo6B9gKDNo=
X-Gm-Gg: AYBFou2lFZrfsYhN5JeoACjrvqJK4HA4dZGO51UIrYchV02/TBJoSUFJ826xPJeAWqd
	0mu+3Wh4Gp9vFpx5RSoezm2pfO2g+t3prjG5gWrrOLqcBJYLO+pO/cNGMo1do7ii8Abh+QTrOyD
	MvC7Jzlgwc0/4gXCsRV70Dut8nTiTQQDt54xBE1j2pOX1iLtO1Q57eVPS6eGcFLTvcbkPwNdJmG
	OpvNftrv8rRnpNCMhPnnKZCexz61mN7z6/62rW0NE08lFQ+tLIX0jz8GaIKALLnzHlk24OQENEs
	3BskURjOLAfE4jzPNRz6ceQ/DfzRD4ZvKpXn0ONrshA98QbZZ/tj+jdYD/3PQB4tfB7pfGQ7u5H
	MghItuys=
X-Received: by 2002:a05:620a:640f:b0:939:a6eb:735d with SMTP id af79cd13be357-93bb76e72bfmr295855285a.10.1789554608154;
        Wed, 16 Sep 2026 03:30:08 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:a6eb:735d with SMTP id af79cd13be357-93bb76e72bfmr295840685a.10.1789554607052;
        Wed, 16 Sep 2026 03:30:07 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:42 +0300
Subject: [PATCH 26/48] clk: qcom: gcc-sm4450: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-26-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4252;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=N+HmXCdTzCHtsU952EonArMOSy8WiO3S8aIl7REabXg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9kUKqaLaqFdfQ88jwq68Xdzqjto/pq5YQlf
 Q6wslb3oreJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvZAAKCRAbX0TJAJUV
 Vr5lEACxMFWA+xVtK4NAWGzUx+zdRzkz72wOTWPaHhSYdb+dOVxTzloeXzAgNPIZ1B/DbUT9Opr
 BM1VHKtYfMH50hL6/L99NAx6c6dIdDrqbq28K5YuOi4nGoIlAai6gAXn1oxfq9hiqu37kZefaUi
 M3sbNOxuI7tdZVjnkRmLcIBO6A0xesbhhiG0bwxWvPsBliVNll0osvpO58EVSZBqh0brSvw9Euc
 NAYPRuoGv+Ht+8upEETSP/bIdlBc4TcyUtBdNg4K54kdg3+QOFLxQ/hM54+s9Prafu7uCQxIWsQ
 mhyWBeW8zmxw8UpwBhRStK5tmfqZFE+q5HDz41AbMktX1/o1b6la0kF1ToRk7W9L6CZPwEiQL4c
 0ygzxvxuKz/ef5e6CBC2rNaXrx06QrKv79w4AxIPXHuR1RDbj27h/Ldnf9l6ZVaCI8CBSTRhU3a
 iItdrNDDa87dMDrw9VcIdid062oIPVpU55r1gCDvC2eVKZA8ZC0lssXUYtdw0l4JTArxfCDI5YX
 jHW2a4ds14DPutwE23VJ7PBcbzA3hBGW2jbvrZzcVUT8GW53MJqc4ogjGOfKdxQQ40naE/Tqluw
 kF1Dw9m2ZJH8qSQLO2CMYO9mq2WPLigDjzphTJuZg4l1WB0XjQOhpwEcY4doYryJoRJi7EkzdcA
 QJzhnhq/eW2R3+g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7BiW8VT6oUBy
 QJHhB7Cnezp0NwI6Pvp3ZWeBQ6rEHnXfUS9MF3Us3baWrlYUxn96wIGEbF7PyP2I/IejWA61IN2
 t8eyQJ5n8Gm0RzYpSYKK/sj0AoKEdLdxbmLkFXUcTaHmeS2eHEqT7/EpRuaVf5+pape9W2Gpjkc
 DLsq49gG7Sml/tLVbEybZXy9p6/fPub3WJa7h84ylRztpLw6r1j9I8rWQjAzXgbPS9LoiSWjb3T
 ssHP8V5ffa5DqhjyS7xDM5YCNG2yRQb6yLLeKdrT8QkLZ8wX+24K63VvBS+YmpxkiVX05S5ond3
 VHGaW33ObXr8I6ikgFgE0wvc7ysntzOrVuP9xIZhv/yRQl+oRwsHTV6pVTTQrgIVAF1FUMgu0FY
 f/YV7wQ8+ZSkv1G8YE70QjQ0o36L5TpJWWjLTSNrF9fryW+OikatS3tzjCFe0U96WjKE/b0opFY
 tGoFgSH4Vfv+ISZpVvQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6fb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rMBTewrK3YKLiG1KudIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX8XcS35rPp6ll
 jpvwm446Jwzd/7Cvw/CoYWy0ZW36lwOFYUINXaMBeLspFGXRj2lHULT/td5xz6h11S721/Eg8HE
 eoLJFIzE8XMXXhwJ8lvJgwmBVrPzzn4=
X-Proofpoint-GUID: 3__ZkeJwkzpXD_uY4Xx9Wp62xGH1fx18
X-Proofpoint-ORIG-GUID: 3__ZkeJwkzpXD_uY4Xx9Wp62xGH1fx18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches, DFS RCGs and GPLL3 through
qcom_cc_driver_data. Associate GPLL3 with its existing configuration so
the common PLL setup invokes the Lucid EVO configuration helper.

Move the UFS PHY ICE core FORCE_MEM_CORE_ON setting and the video branch
register update into the clk_regs_configure callback. This moves the UFS
setting after the always-on branch enables. Those branches serve the
camera, display, GPU and video blocks, not the UFS PHY ICE core clock.
The UFS setting is still applied before GDSC and CCF clock registration,
while GPLL3 configuration still precedes the branch enables.

Use qcom_cc_probe() for the resulting common initialization sequence
instead of open-coding it in gcc_sm4450_probe().

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 64 ++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 30fc7af09930..f9361f906396 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -140,6 +140,7 @@ static const struct alpha_pll_config gcc_gpll3_config = {
 };
 
 static struct clk_alpha_pll gcc_gpll3 = {
+	.config = &gcc_gpll3_config,
 	.offset = 0x3000,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
@@ -2815,7 +2816,41 @@ static const struct regmap_config gcc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static struct clk_alpha_pll *gcc_sm4450_plls[] = {
+	&gcc_gpll3,
+};
+
+static const u32 gcc_sm4450_critical_cbcrs[] = {
+	0x36004, /* GCC_CAMERA_AHB_CLK */
+	0x36018, /* GCC_CAMERA_SLEEP_CLK */
+	0x3601c, /* GCC_CAMERA_XO_CLK */
+	0x37004, /* GCC_DISP_AHB_CLK */
+	0x37014, /* GCC_DISP_XO_CLK */
+	0x81004, /* GCC_GPU_CFG_AHB_CLK */
+	0x42004, /* GCC_VIDEO_AHB_CLK */
+	0x42018, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm4450_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for the UFS PHY ICE core clock */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
+	regmap_update_bits(regmap, 0x4201c, BIT(21), BIT(21));
+}
+
+static const struct qcom_cc_driver_data gcc_sm4450_driver_data = {
+	.alpha_plls = gcc_sm4450_plls,
+	.num_alpha_plls = ARRAY_SIZE(gcc_sm4450_plls),
+	.clk_cbcrs = gcc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm4450_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm4450_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm4450_desc = {
+	.driver_data = &gcc_sm4450_driver_data,
 	.config = &gcc_sm4450_regmap_config,
 	.clks = gcc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm4450_clocks),
@@ -2833,34 +2868,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm4450_match_table);
 
 static int gcc_sm4450_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm4450_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_lucid_evo_pll_configure(&gcc_gpll3, regmap, &gcc_gpll3_config);
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x36018); /* GCC_CAMERA_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3601c); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x37004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x37014); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x81004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42018); /* GCC_VIDEO_XO_CLK */
-
-	regmap_update_bits(regmap, 0x4201c, BIT(21), BIT(21));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm4450_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm4450_desc);
 }
 
 static struct platform_driver gcc_sm4450_driver = {

-- 
2.54.0


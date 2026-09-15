Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593B4BFE8E
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474088; cv=none; b=VW21elyCo8Gp5ZSKUhaisiz+di+KDcobB9yuLAyy4s6n2WbhhpOz5NwgV304LwnTmuX9gTpXDoIa7BHsVqzy6lJFwIJSwwHwV2SVyZShnha6wyiXpRdv/3V7aCxA6mkR7RT9XqEkjrm4rs/wp/fLkOlG5lk6ZMCzyN2X8Q5NLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474088; c=relaxed/simple;
	bh=+KlOZu/f2LT1ws+Y4z3u6rNZ6xKFpD84brrnYx3eEWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMB6fZITqiXhdjBZu1Em7TzH9hHa75dTriyopyaVdQIqU0paeaJw5havP6bSPH4u50BOHhyCtRp9jQ7I28xyEdVtXCwu+xX2mZDbvvpGNfUedU9Czn4qlXbJhBB3xR+x14ocYCTN2yCFtafj6UPxM5YZQTt4cUI1FH0wcfS5qZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9ZXZaSB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0O+I8Ka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9ZXZaSB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0O+I8Ka"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvpC2584537
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qz79aCejNO+w6+x9f0Iot27RiEWAJlB6x4gOUa3o1Vg=; b=V9ZXZaSBWLqKUTwP
	0JPh7D0oNn0U22psWdWlvlwzhbX/AgxBVsYaUtOLfuazKFbIV1ICV4aB1U47bb62
	5suEyH9D7Yks++lzBlsLJe7J+oy5mqLLQPxaZ8NVYPIABG6G9zLTt6X3X0zf+N3B
	x5HoK4WoRfD7hmjgJoJB42hBJCyxi7+Atwfy2321fXcXaPhR30DLaiJGR3DcftVK
	xUgS41Yk8U9prJvvsJXlrRh3xdqPUt08R9m/BXmFPn1FrIb83ZWXpy1Fu0gHvKrB
	DW6HYLnANgJ/GG9rnxtoD3ddLCuLMPA0Qg51LTPddf5fMJt0pbW/xhJT1EGMm+Qz
	mRG2xw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9wfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:08:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7449645a91.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789474086; x=1790078886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qz79aCejNO+w6+x9f0Iot27RiEWAJlB6x4gOUa3o1Vg=;
        b=L0O+I8KaDogxJjO4GTNd7RkJRG8FeEr2+mEiBslXTzAKtssmjZIa9e8DwPhgR+q/gj
         79RI6U/eZkiHdTJVz8GzxErSimY5jDlNXp7m0RVgmSB/2MmqPRecRLa6+csP43sbXDgA
         3g8JYYNCSpw+/G3KZ33K5UqQb9z7086y2gMvx8/HKVfJX/sS1nQERSIm82EdLhLBKTZd
         gYuw/oC/CbssVa23WxCE8Qj7iJ5jeg5fal9fD+zs7Fw5mBfQXAt914by+M4Dx8vH296Q
         qC09iQ8Ahqk6UJQVKJf9nfJa60Wm9jab5v4E3jZ+84kqhwPYMma1QEyArkQ/9UwtKZSw
         9pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474086; x=1790078886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qz79aCejNO+w6+x9f0Iot27RiEWAJlB6x4gOUa3o1Vg=;
        b=Gdasu5hsyESTFCIogoA04z23tWrlXqexHWr8P5slhbd+9UR8ph03Qvp+Ht8XxwsOAl
         VnehW3XAOGLmvV1xvpZ+3MoqK3W7dr3EHMVotoA1iitp76fCg5tlpy4dcwrd32WtJwJZ
         OFLYjOlK68T0WJMYAYKjepsfK0MLeMzomfuLvv2kW3u/69WvUVbsPMp+x2mlyDw1kHL/
         9DL+3uoCOlGLXen+icjZBHon3a4yswQVdY6ZzSXaYUVhA7saZdBQIjBIZ+zX+LKPevst
         /KHXubrZsmls8hoPiZn12pkovD7q/8EYaiSJBvL+NVVcBFfwrFPcpesO2/Nk2e1TbhZr
         WhSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHMa7EYzpVHlLlqIeOK7QIGAjT416/OCPeowE/taTpgviedE2IPm9EseH3JdgcJnSh3bKrhvtPCs8=@vger.kernel.org
X-Gm-Message-State: AFuF++lknhtc8mQM21MFd95zfnJqkrpDJ7X3cxTX3uwTUyKswcQ8EQMs
	iA7PoCKV/5X16yF2q/TrxNWe43k/gd22zIacMpZvs1ShUkjTRwbTfdDP7A8gJRNuAibypUhFiN4
	0BSOVcVpOmlIpJVGpTo36TWTPIpiSvvWF/rPRhu/I1Rw3oQweaPDs0PR/aWtT/Zw=
X-Gm-Gg: AYBFou1hqOYPiiXAfyuetqMhMZ4GO1U78m2n6MaV9m9hoJQE+TMYPmzPSYp/rheQXZS
	zBKhE3dGDdPiOGnnug3zwXyJGFoMRdYLxmCJcI589rvGVZgx9XsAFkSEKYU/uMAvnUzxON7OoOS
	ZnH3ROvm+A8uL9u0gFPkNzkfQWfXGPFpucFuNsatKaT6DvLvROW3NPbAIcBQDrdAxkWAJExepaH
	WU//tbJ/ycUy2ayE8VOSFuv+yW9RTk/miUF+rmcIdjTlli4wfs2s4MYrGcJigeH6i6SUfhaP2TH
	pcLhByd0KqlXG+fA+GLZkFizOqyupKxzT5BTh8ygx/yjM8WZnKeIvv2IpkEbrZwtUSKQDH1LefU
	PIEPX3F3lUE9d0/No4Vy90bbDIOyTmaU=
X-Received: by 2002:a17:90b:554e:b0:39d:f823:ecff with SMTP id 98e67ed59e1d1-39df823ed94mr10689637a91.11.1789474085954;
        Tue, 15 Sep 2026 05:08:05 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:39d:f823:ecff with SMTP id 98e67ed59e1d1-39df823ed94mr10689559a91.11.1789474085412;
        Tue, 15 Sep 2026 05:08:05 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm4905004a91.5.2026.09.15.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:08:04 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:37:32 +0530
Subject: [PATCH v2 2/2] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops
 for GCC UFS muxes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-glymur-ufs-clk-changes-v2-2-d0aa1c60c269@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfXwBRvSIYzFLS1
 TaFsvP4Lm2FuFjwX5/cFrRO57VvXSrUNgTH6FEeSHupkTB1dliK098cuydL03k9Uv41k8VMP/qY
 2fXRaVt73xMwYNnSxxdf3PweAjUdyjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX60UXw3w2tp/m
 HSOVG1tAAexBZDvVzDNalEsbTUTXp0mwXXx9gZefuNXo/cNfbsF0KfG/gei/nubyn3ezbBPUUrD
 E+0tYr2x4nsTQdl59BmCX47EJ2Z0xbWQMJHz9aPaGkBwCPYum1AsnkjjBEzP/t24wmrxtjkQiKS
 XC/aOpwYaeWGhypi8dGgPTMEu5msr7ZW91RZNA829HiWw/igrsT7Wv2XcPpMrc1b12EwayNtNLy
 7UUVC3qMMQz2HEHjwndBzOw7B/V8P7ngYfMdth3eHw7mvYacLAFIUcqBpKHZ0/ARsl32dyTbFwZ
 xksUO+6xxkVJ28EFcVIGqxz05OlYa0ntuauoabtwQmcLRVCrx+8LoTpdD1gzlWOj3kdOOZ/glw+
 9dn1SKnNfCYlWUANOaSLSZwROZOem0VOVaIg6+j78RgMNn9nPtYwOI5PGt8cRGA7mvrTZ+zOSN0
 oHTttEFOSRxvfQIHl5Q==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa93526 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dqVVpOBFKaflNhj4CZAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -j-707LF2sX8SeF_Hm3zgKPx5YP9g42q
X-Proofpoint-ORIG-GUID: -j-707LF2sX8SeF_Hm3zgKPx5YP9g42q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150175

Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
automatically switched to UFS external symbol clocks during enable and
safely parked at XO clk during disable.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 69 +++++++++++--------------------------------
 1 file changed, 18 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2ee4820b6fdfb1ad2cdb15366cf746651fc1a36a..a47a2c6b961ba01edc69be91e299a190f4662c3e 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -481,36 +481,6 @@ static const struct clk_parent_data gcc_parent_data_17[] = {
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
 };
 
-static const struct parent_map gcc_parent_map_18[] = {
-	{ P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_18[] = {
-	{ .index = DT_UFS_PHY_RX_SYMBOL_0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_19[] = {
-	{ P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_19[] = {
-	{ .index = DT_UFS_PHY_RX_SYMBOL_1_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_20[] = {
-	{ P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_20[] = {
-	{ .index = DT_UFS_PHY_TX_SYMBOL_0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_21[] = {
 	{ P_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC, 0 },
 	{ P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 1 },
@@ -907,47 +877,44 @@ static struct clk_regmap_phy_mux gcc_pcie_6_pipe_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
 	.reg = 0x7706c,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_18,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
-			.parent_data = gcc_parent_data_18,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_18),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
 	.reg = 0x770f0,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_19,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
-			.parent_data = gcc_parent_data_19,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_19),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
 	.reg = 0x7705c,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_20,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
-			.parent_data = gcc_parent_data_20,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_20),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };

-- 
2.34.1


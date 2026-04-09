Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104C53B3BFB
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726520; cv=none; b=crcvWqnYlJIn33+qMHKURlgs6G1fM0SSFD9SybpJGgWpRRXIMFGLuBkphxyMq0Irh4Sck8JZNpqaY5WeIoh6zzJfbfeS5B3nS3epQz0be4l2MbTdZk1wQgPNZ8Y/RbpwDD4Yf4iwHRyPuY1YUGyxT6cBYsqSmKaOdq9fsILRXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726520; c=relaxed/simple;
	bh=5dBJhx972EX/UgMMLPtbRbChHzcFnbr/i1hiQLaiw1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbJ3xLKoc/0RFOLwHcbQV0+Oe9Qdw1chdew8iL2jEHIZY26j92re6B24cUw81GGt8H5muOI35+cGBT0eP/Dwaw8y1Wl3GnMzvvPTA00jIc+bH/WqVPOph6MvQOOepOVLonABGCJrUkorcKi1WuclGAlkKy9lG/oohXUomuWRvA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSe1h3KS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFxEknEQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSe1h3KS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFxEknEQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397wJBC1072630
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 09:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=; b=hSe1h3KS78HdDdfb
	4NVqJU+/cJrJb+Q3UjQOeZHob3cRCIPjCaWeNN25Q5N0JLuXtJN2eyLZK3CIWHIX
	rikfpUW3d3HFyp2OT3GyKgpG8ScxU5A2zOc6POXNPm2SV19hyLa5Jn2MWVXxNC0C
	6QGe/GaFBis3ZRDM5EGKhxYL4JLkclRJQHVq09+NQdvsDitp2Dm1v7eV1WlS/szg
	vR6al147DMzJfXlcpMmNMSnAJWcdhqYmp9WX4w3mhqTVAtPw3IScgVqoNCoi6Qjp
	xxy83sCgltXPOh+ByOahad5gnHBSONR+xP3fA2ABLrizlFs6rMEXiefzEj21Tbay
	FyftXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3bbvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 09:21:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b249975139so18994265ad.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726512; x=1776331312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=YFxEknEQzT6fEmdlFC0NW2fb+T/gZ+Lk5J1F3Rgw8xeNN6ZiEFH/zyKD8PF5026GpQ
         boLcQT0sjJpc3tpIsa0PfbL+DAVMKRdf4Qnh9hxpHD5byqfprm5+qRwT39mReSo65Wzi
         KGURavCVw9i8dUcstgvcp1CpGXI4X9lEtcN6/1+jfdlBHlkF0SDaQhk8nOf0l7oLnbuw
         4NYJW/dJId5cH1O9p5Lh+c6dw8ZxLfc2ZcCZ7LopmHCqkKqMc5C1mUHAa8/3fNDUKLVS
         0a9dZKXd4rAK86yX4jDBsaQHCKSMnD5gnDgtVWY6nkSyt1degraKqrd4jb0Zs707TeiO
         eOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726512; x=1776331312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=LjqXLsg05qX5/1NycNhhHrlRj4bBjV62I7Iv2nvn3JZIbbAQPGFsqHlSWv11grrkau
         U3i4as12ckydEQ44y80UVMkrUheM1jSJPsrfLzmYJmkzLJhf7uGVUJP9nyWsv8aWGVB4
         u6ABGjfLFzRnkly7qjbgZZBHWaSYN0qdmV8rJvhBJc1VP9B7RZ6fDp6WuVYWF4VRYJA1
         UnH7ANQLQrsFUCrEiv5MIPOpE0Gi2P66BA6LFitirQxJ0wTKqQ490xNkQrckNY5YtKHT
         WigF5qlIZeKGgaPBxLwA8HLL7s8hLka1jgNAQj29b+p2+o9LCabPEuXJZWrkGdrqSNB+
         IAhg==
X-Forwarded-Encrypted: i=1; AJvYcCXa8ONusdxr4hs4nlX3LXlTvnBEdbLOqHo8/QHlJQawStKTHskY199Btf2fICQt2R9Ha0tNtDHeNNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ho+gSQtVcnoVbRp3eIaCjfLlApQ/h3DPwHU29JGYhdUDazsW
	XTbk99gDFLLVnG7oTnT5SChpN55O5he9/cduI3KGP61i1z8cyXkCxoHgfyW/6VLn/6MJby3j/KK
	pO46ssnMd/jADhrLtN6mPJ0yjmC1WIKpfynEQnQsz/PRddFpVamz/T02C4jnn4zE=
X-Gm-Gg: AeBDievGs/+7caYNEbVDSKN17w4SMCkmFx5zKafVfzmcB/asfbamJSafP5sN/wuxW0W
	FLU0EjGrimjh0AKnGBhCoWYRIwKNo/DoIm7KAwdYXnGKRrjAKzhbtAhOcisYf5k8B/jvyitqzIz
	BpJH1YMi7+Cac0VlDXrzzKjf5P2dDg3nMWy3eX9RBX9YGJmwNTDsKzfE8z1bf7ENRwmmLd+EsZN
	G9Sl5FOLmTBN/lkvaqwJkwGIo5De5RVV0y70oy7v9FoDmCf6GTG+bnxm3jErGl9s2XVTfNbom3w
	83GpNQhVhk2aKZSOijWNQqCg7PczgrWcHUeRJvXBEt5RaLffyjSXecmrSL5u4KMAzFYClQiqXGU
	SOZaaRHsIwHKBl4oitNc/mbT3R8JaYslTrZ8sTZahUO10YTvDTWPj
X-Received: by 2002:a17:903:17cb:b0:2b2:58c7:2cd6 with SMTP id d9443c01a7336-2b28167569cmr290510195ad.5.1775726511850;
        Thu, 09 Apr 2026 02:21:51 -0700 (PDT)
X-Received: by 2002:a17:903:17cb:b0:2b2:58c7:2cd6 with SMTP id d9443c01a7336-2b28167569cmr290509775ad.5.1775726511415;
        Thu, 09 Apr 2026 02:21:51 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:51 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:06 +0530
Subject: [PATCH v4 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-4-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfXy7c4oMcN7L0q
 KwzVE9oEoeksTttXxTBHn7v5zUh87JBdHQj3e+ZOv/mRgKzFK4+P/0w+DsJkypsJwEzMncoBHmW
 RixP/Nt5EoWE32XfHwQt5oIHAnkWGpfJYU8zf4Z/OFdgVSz+1/QpYzsqNLm2OWh6zfykuq+cWIt
 aATwGan9wG0GjFZ4xhV+C9X8wHExXEB/EO10LXDB5IntUCobSU7J69qTDvP6kxBryQV/x6X5Bel
 /SVhHXCmEZV6n2XHY8fhqszhP7aihUnjvZkIv40nNaUC5rfnzJQLrxyU6OM7rY8GyloMOIk902H
 BroJk1YXdSsjWJ1jxm9BtkxI7KamWgVQSUbhbXAp/Vp4uWQtgGj04qCjpEn5gIfyMIesBJ7tqyf
 3i9O00kliBelTt51DE8/39vDrJJbP5GL7rOhxC7xdEXgBE/MJMXZDVF4aD/0m1dFWdYvb8rpKik
 YVTHsCu58rgnPUb5CJg==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d76fb0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=F2hG9-dZ5E7o3FMX4mIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iLn-kFG2c5hUvSlvrUnGhCoUbJsuE5Sl
X-Proofpoint-ORIG-GUID: iLn-kFG2c5hUvSlvrUnGhCoUbJsuE5Sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090083

Add support for camera QDSS debug clocks on X1E80100 platform which
are required to be voted for camera icp and cpas usecases. This change
aligns the camcc driver to the new ABI exposed from X1E80100 camcc
bindings that supports these camcc QDSS debug clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index cbcc1c9fcb341e51272f5595f574f9cb7ef2b52e..7e3fc7aee854eee841176a1330f97dc91af91670 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -1052,6 +1052,31 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_CAM_CC_PLL8_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x13938,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_cam_cc_sfe_0_clk_src[] = {
 	F(345600000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
 	F(432000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
@@ -2182,6 +2207,42 @@ static struct clk_branch cam_cc_mclk7_clk = {
 	},
 };
 
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x13a64,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a64,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x13a68,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a68,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch cam_cc_sfe_0_clk = {
 	.halt_reg = 0x133c0,
 	.halt_check = BRANCH_HALT,
@@ -2398,6 +2459,9 @@ static struct clk_regmap *cam_cc_x1e80100_clocks[] = {
 	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
 	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
 	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
 	[CAM_CC_SFE_0_CLK] = &cam_cc_sfe_0_clk.clkr,
 	[CAM_CC_SFE_0_CLK_SRC] = &cam_cc_sfe_0_clk_src.clkr,
 	[CAM_CC_SFE_0_FAST_AHB_CLK] = &cam_cc_sfe_0_fast_ahb_clk.clkr,

-- 
2.34.1


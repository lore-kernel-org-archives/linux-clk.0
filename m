Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333BB330B07
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132353; cv=none; b=O1QlKTjP17q62GrEt42BCcnMyPz4qChKVs/FeKulZin/EeSPRlwNX/Gxuqys6d/J7Y87MelsTk69+pBBx7HFKK0cFIH/gYbfmcsGA3pUdeyspBrOa7M07BiozxkVz8nZin18hd1ukBTkPIClSJYqubPPli4CujhDm/zQszL3ywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132353; c=relaxed/simple;
	bh=wgVXCfHv9HFZOezc7cbXA1mOEQVApLKpcn+bcT51ksU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSWens7WCIRhJTTKNiktkjdE4I633RimIttKQ/NThNLDYHV0WNDi6rcHVeNOe7Hl2CWGscsNqsOh7BzKKxkcNmeUMOeWr58K/HHawBAGX7OmVDJrY5GlXDWvGzjzRzd+Ohn0xNgPiFQrKfMrxSD2huhZ5JMi0Hm8N547ZXmOIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk00+noH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Em2z6wJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk00+noH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Em2z6wJQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647462UM880188
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 05:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=; b=hk00+noHmLJ+sqJD
	f78DRJum8/BTcJXy4Dfrjk8voyiLUXV9TA/Q7iYw73HZ/ng3yxSF1ZMu+ic3yAMj
	qlzbM1yrRP9djOVfmPqV5asHZVbCHV7mpGz+e7BMh87BXPoJ5PnZaLuU/cmbEp7m
	YPrfD51ZG+JtChxDbIrK57FD5SPg/IksrxBnHbk7zgjtiw4VlQ08btK5gkQ1MVLq
	tIoZc3uc17+iW/PyMQzYrlNH0g66TGXwTtbAecNXGl14yyZ/jCI7qW1nSGIWe9VP
	pVh8o1m9Qne5+kDQNdS3VzsX+W5uAqadCYepIFlAqBy5YN/ixaYYJMYQtrGRTFO+
	o1KUNw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq08gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:39:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso305857b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 22:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132350; x=1778737150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=;
        b=Em2z6wJQ2Gwf+RYmgQ61L0T5wejiVDtHbHCowgfGa/qdd3IxcfpdfyhC4XIIffmiS3
         CsnFwOPWkB5Sc42bA0tAC9wDRvKnISGYOXTWYr+mppu3teThqlFTirtCakjuChC+K/sq
         Tsunuuqd676GcrrudgATh5GisTKM1q8ndrxXpLZ30g2BGMeTL+L4+7qwXsd32ufLc7HP
         jMQExTVc+bG/W0NKPEpCr4nail4HuZv8aNKvTqaXQqb8Cg6Q58GUoaSM11JeY0kELEfB
         OitEvYiBCQi1Xu+0qbVtlaLpl0LCQKHmHOoxKdD/Gi8v/p16y5ZhOSvBQfhdjSMhxU2F
         ulMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132350; x=1778737150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=;
        b=CNpKbhhuALWp5OAR6T+o5tuoapZDwOWEPih3GtPjgaEEH/hyIFhowcu/RGYSozQCQL
         WQwLn0K0RYlQ4FaecwV8MGPMSENNYcryBVzLcwkZyVQvqVMwPOpNOaCoTJl58/npsyIl
         /mK7gSnwYwRo3bIqFx5QYcYQkxK2tZJGOft+GEvi1KdI9SUDgG2b5mvYQ1shQpupvNFr
         SDygAFP3UzFKy4byUTc8jippgi5H+IKUUt/pG9U7GBtdPC30x9JzvBLEdY+NNYg2sSAR
         N5ebsxS8X954igvV/iHHaD8MnpodnNchh073pyScvrZEe3qDNluYcClD/tcKSLKXRlFU
         cvKw==
X-Forwarded-Encrypted: i=1; AFNElJ91DSUX7lmGw/kt9EbjGYrnn0Hw2XTabREMjJDTt+hS8SvtQ4qY+pGIlyT9NG3FABgUy6vpRO6ipGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrz7+kWqLTmyaUxlwhCpIqhbueeFtj8YWOuVm3wr3u4ldQUtLO
	u5AL6q8OGgFuLmVwZFs+8B3wifFxsbOs0jojXHf1rvIjiq/bSK8nuKT/sX1TcM8E7Hb+PfzCp+3
	2mk6pwOA5FFGxZa/O4lG+iMyZ3kr5Oi5wIaq2mYo0SK9qo8XZW0f+isrCN4WzisQ=
X-Gm-Gg: AeBDiev+4no11O4UOcXGTygoDCPH0cWroc1kY+IWF/jOrdXMPlwgviXvhc4Z573XX2N
	OnCZHCyo3Abh+lMxoirBMXDAou6BjjPHrQOUIcMcl6ifZv3Q2JFGYxuwHQ2siUO9ustpHgNwMTU
	kDJ/x/t4m/5jKKW5IdSPzVbQiMIln48TqPwMXO9sHt//yplwRlybV7oqPFGv8dEIKa3YiHjz9Ql
	TXm6mSf19HtvargY2g/8UZFafiWrOQ3Z1jxFUR8q3kt/+FPcmDLaglw4yTYXpZ/gmULa0LOVPvh
	i39lZvucxfnkODxt4BMmH8rAp47WDAnp2oTcG7o3ba+FmLWOuh6p5rBRcxwBcxhVd85wLaM+Oc8
	dbkBwD9XfatUSUdNQNZQCpz6SBSJEo92mGfOeweLESfTydDKFSBVui3HUPdkQbJrWr0gwSogAAA
	==
X-Received: by 2002:a05:6a00:2182:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83a5d3874ddmr6299570b3a.29.1778132350024;
        Wed, 06 May 2026 22:39:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:2182:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83a5d3874ddmr6299536b3a.29.1778132349529;
        Wed, 06 May 2026 22:39:09 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:39:09 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:29 +0530
Subject: [PATCH v5 4/6] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-4-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc257f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KO62ueLImIrNyuj-9MYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C2GXZ-GvKP1AGNDA4F-6DyQ1X8E2OS8s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX8xzFmfrqChxO
 5R73H1LaPhjtCiDRAlvbTJhy/6Zhrh+mmuAXgPFKjD0Gwpp8T84cYp8bGujcJHu/3G3gFx/XwUx
 2nsXbcmsEpWucY1xCcrZiZixj1whBS3lu8G9dAYsRbOKyKHZdNXEDpS4YGlu1B8fHLnZAMlirJq
 gxX7O0078nNbnk8AsKxCQh1Dmq8mz88F25lDDXrpsP6gEy1zBpq9UnqC45rXeQU56KzKJ77b7F5
 cQvjBQ5ag6lCIv66yx4FRS+6fJGp6koH43O0MFmbsaXlRE723JpHO24VGoy6kxA3165DuKn/YS2
 jNEYPTW5RDKWCqeVLLcW0g8sajttDO+Lw9g0hgAwnmXYV4G8r9K8/p8oSCccutRVi2ORhhPAB0A
 3vw93VjMBv2S8RsrWUO6vUV4RUbVqZZztEsIUOjNqBbyQS+1AVxp4kSN2Fcs6H6N6WYIufjBXQv
 b+hSa+3D8mqlGWVUi7g==
X-Proofpoint-GUID: C2GXZ-GvKP1AGNDA4F-6DyQ1X8E2OS8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052

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
index 81f579ff6993349f4993fd2de14605379711f90a..c12994af42cfc4cc1a2a32663940313b83311919 100644
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


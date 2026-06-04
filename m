Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9BE3BE65F
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550796; cv=none; b=msLajC6qiNSu572nqw6ZUjO4m7Pqnwlv8gW57kHku0+xw3eH2acB98kmTMzwp7ohJzX+1YTtAfocwbpy6ngT+FQ8rqbr5hIQJQD0055ONe0GoXWWwVH0l2nU6qlo/FHp14Xl3FGZfb9kgIQEosL0kdx6eYfQpUOSVJWSSIWM8jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550796; c=relaxed/simple;
	bh=BVccFCmjXwoxPbXDwMrtGs37J0RlIlOlUSSCQBzfvOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvdjlaqMbUExAUCDpUrydc+qeKoEFtmAwYSuigbgUUBP1SXaeNLdKU6ov8u23RXOzuHOy21jXtB458uX+oJi4R/CGRSe1Y1GJzc/+4MNrDhMDOzJ3KpqAOf0oW6rZsg77e3/KM8frK6sP1JEzKrt+IyiOoUQ3n5LkbfSIuKrHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuL8J2vc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0/4QHBJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuL8J2vc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0/4QHBJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540o0nU313689
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqHvjj+Oc3HiPUaRfQW46Ggf7EtaZUjvLHZxHJcckEc=; b=cuL8J2vcO2XECja3
	1fsR0cXMtdJ5Qnl59hY09yOA5PCaNt6K3JXBsqmjopbnVnofnUOYkwq/Iky2PfQc
	shMy6K/GPYGKueHYTSPf6LJcGHZBmRHH3BHZ3Y6sir57hDx94DxEQdtWRzCDVde/
	4ljGE3BA/LkjKfHgtP8qyFx15oC+SHrCZVyX4zwIvZB8Mh2ymZGKXk9Sp88wOpiH
	ELGgEs77BSJe1qMkBCITvnCp0kDtGaTOUPoMzWc6zcyQVuTad/30Sv5Ssc49DDWq
	p3TOp2Zi9FSBcBIbPP/1Uq2a8J2Eq1H93kz5lZLBg6KMrwEMlLi6TxFTc8XfOt4a
	U4jmRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0ss5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:26:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so229785a12.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550793; x=1781155593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqHvjj+Oc3HiPUaRfQW46Ggf7EtaZUjvLHZxHJcckEc=;
        b=T0/4QHBJ1E7i8PVKuuIz2X4DMBOsOhXnakm6c4RzPd8pSckFTNg7iBkRW+xAwYn+ig
         9CeCnzynqFovm2Z/UaXURu5tYdW+OhTK2jOXloIk0QDTFzBfyYehSoUBAodcauEtAnbX
         4aTz1F4x4nB4BjH262cdcVbM1akUijPKQARZgUTM9EwtAajJuSJFNIQfoPaEcHK3kzWq
         1rRDaWUFmxccTuS+mZkqdm0xlzdM/I85n9Vm1P4QDNwk7ZYFgxmB/GO9bZ/xn5djFZkh
         cK0GjMIxBNznO2aPVyf1MEEdI+w9uBg0dJoTCTXyMqKE/5SW3VRCmmgz7A2RUOWT6TBS
         wqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550793; x=1781155593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqHvjj+Oc3HiPUaRfQW46Ggf7EtaZUjvLHZxHJcckEc=;
        b=A7U/lfpdKaSbF5uDtpPQDFkB4QhLSYu5NTXfd7WYYXJSo9rFNFZwiBxfeDVIpG7EBe
         6BOtMZQbQJ3yO8UWjqYIz9TfLaLP5XnyiT3cf2erloDlE6DF0TPbpWr2itDq04d07uyk
         PPh/t4259rqTVVnB2+gZK5NDUAGoVgo/d1KD+GgRv8kOLryXkvgWcWG6Tu1Ok4biLj13
         6HHRC9OHjxTLEbODMap+U6LbRrzwOH7+DfjcOQb2CZJcd9Y/GqNZDLMOCf6zuII2sCzv
         ighSQQ1bDxN0fomGRe702h3xm+EBJddodPL/xuFB2kFXFuByAnRCHmlblMcvOYlJOEkJ
         hjLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ay2qNaxUavFmegkHBie6gowobZjn6T18amJCWQIGO8rAlEEgHzzmnJY/ktPCuvIas0ZC0PN7+BkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoaMOtOU11c9R0aJzSkLxtNhU23clREiwYrg1PzET/osqYrEp1
	3f87BVRNJ4xVAGWAYIQfRW/SeOGHalLKYrwYugRJBhXlolzV3sPOr48v2ebdOM/z+txl92KIas+
	kfnKZv6q4qUYoP7e/7+1Vy2Tocs9A06u4eJmWSpxapLfzonZ0C3KL2k5UGN24xno=
X-Gm-Gg: Acq92OGibDNM6/YXnBpy8vqDgSOyMR6k5oRYUZ6xPVtEerqqOHaTWboertDIGMytB0v
	fpuQQ+U6GC9/doH5rZwIslQ7rptsKXcGUYa6Mdkao/Mrn3iu7YNdaucdpS+iQrjaVdmoqKfix6h
	lnjFTVC7RquBeJ7DZpgVlO0qFNC5qAJldgzibpk8Yt11byygh3+9RAKWReJhLvDTuctH3Ny6MMm
	eKfSQA5kOFs574VuIJgxWHJfG9AjJc/K+MqHZF6YyX0+swDYrtmMmD4hEAk73Okk1QW233qMpBQ
	KVgQMb0X9hGj5JAFP4bkdAJ2zknTt8GNNMMvF+B3SGpqJIWndtppJ055kyyPmzQq77FMDpX5T+9
	wCxBnYnhbPRc3zeKVgRdtBg4jQJF4O0Si+E1LWaS5UkMvqC5eeFqVIsHOel3FzP8=
X-Received: by 2002:a05:6a00:951b:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84284e36473mr6824953b3a.7.1780550792927;
        Wed, 03 Jun 2026 22:26:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:951b:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84284e36473mr6824931b3a.7.1780550792451;
        Wed, 03 Jun 2026 22:26:32 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:07 +0530
Subject: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX2Lv35IbVDN50
 WNiqtm80sDG689RkRaPBvQ6cCcFApmZl6GYvehRdZd7BB98tcZK5vDAnZ95+hMbbXeDRyCO3j5w
 LVmbFkIZtrX6J+b0SxuhSYoUfXu5+M3mik3NVlUHHFwBVy9HZRLCGG6+WW+hyzS7T26v8rBFs/C
 ESnBErNKQG6LZeT3E7kd7LbS+8FBUyiaDMPKl1/s8XFfNVO73XbF1AvPCVgVlwFv2L+ZJ1bCeqY
 Y1iQqyub4Pxy+pyxNGxTFeunRNqelLKXyq/+NfgOnjA7GccvyZDVxEkWrSqUyWRIPKeVScnWj2v
 pSrzVCQanFwZaNtH+pc7OJRHyW+SH4fLWC/UUZblKkKx1a4h2LDE25NvMux61sWy5WHS05gYdPC
 IletS+VD5lLXdueaK9yVJ+ffWUF8+xQ2mALALYh+NNVsvm6nc1r/7MxOpWL3j5cx9I4Ogu4TBXc
 i3nXnPlSBYXAEzEMUvA==
X-Proofpoint-ORIG-GUID: TRnfn6QSaI4ldzOf2yrDOhgIk_ijTAu4
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a210c89 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_NXGYkT8nB-KqtbFvMoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: TRnfn6QSaI4ldzOf2yrDOhgIk_ijTAu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

Some GCC branch clocks are required to be kept always-on due to the
hardware requirements. Drop the modelling of those always-on QCM2290 GCC
clocks and use the latest .clk_cbcr convention to keep them enabled from
probe.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
 1 file changed, 18 insertions(+), 142 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 6684cab63ae1160848631d1f8cd3c9cb691ff4ec..8d18bbbca0aaf92b430b749caa16cbae79abfcd7 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -1397,36 +1397,6 @@ static struct clk_branch gcc_cam_throttle_rt_clk = {
 	},
 };
 
-static struct clk_branch gcc_camera_ahb_clk = {
-	.halt_reg = 0x17008,
-	.halt_check = BRANCH_HALT_DELAY,
-	.hwcg_reg = 0x17008,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x17008,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_camera_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_camera_xo_clk = {
-	.halt_reg = 0x17028,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x17028,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_camera_xo_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_camss_axi_clk = {
 	.halt_reg = 0x58044,
 	.halt_check = BRANCH_HALT,
@@ -1825,22 +1795,6 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_disp_ahb_clk = {
-	.halt_reg = 0x1700c,
-	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0x1700c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x1700c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_disp_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
 	.reg = 0x17058,
 	.shift = 0,
@@ -1899,20 +1853,6 @@ static struct clk_branch gcc_disp_throttle_core_clk = {
 	},
 };
 
-static struct clk_branch gcc_disp_xo_clk = {
-	.halt_reg = 0x1702c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x1702c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_disp_xo_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x4d000,
 	.halt_check = BRANCH_HALT,
@@ -1964,22 +1904,6 @@ static struct clk_branch gcc_gp3_clk = {
 	},
 };
 
-static struct clk_branch gcc_gpu_cfg_ahb_clk = {
-	.halt_reg = 0x36004,
-	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0x36004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x36004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_gpu_cfg_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gpu_gpll0_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_gpu_iref_clk = {
-	.halt_reg = 0x36100,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x36100,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_gpu_iref_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
 	.halt_reg = 0x3600c,
 	.halt_check = BRANCH_VOTED,
@@ -2439,22 +2350,6 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	},
 };
 
-static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
-	.halt_reg = 0x2b06c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x2b06c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x79004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_sys_noc_cpuss_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_sys_noc_usb3_prim_axi_clk = {
 	.halt_reg = 0x1a080,
 	.halt_check = BRANCH_HALT,
@@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_video_ahb_clk = {
-	.halt_reg = 0x17004,
-	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0x17004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x17004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_video_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_video_axi0_clk = {
 	.halt_reg = 0x1701c,
 	.halt_check = BRANCH_HALT,
@@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
 	},
 };
 
-static struct clk_branch gcc_video_xo_clk = {
-	.halt_reg = 0x17024,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x17024,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_video_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct gdsc gcc_camss_top_gdsc = {
 	.gdscr = 0x58004,
 	.pd = {
@@ -2775,8 +2642,6 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAM_THROTTLE_NRT_CLK] = &gcc_cam_throttle_nrt_clk.clkr,
 	[GCC_CAM_THROTTLE_RT_CLK] = &gcc_cam_throttle_rt_clk.clkr,
-	[GCC_CAMERA_AHB_CLK] = &gcc_camera_ahb_clk.clkr,
-	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
 	[GCC_CAMSS_AXI_CLK] = &gcc_camss_axi_clk.clkr,
 	[GCC_CAMSS_AXI_CLK_SRC] = &gcc_camss_axi_clk_src.clkr,
 	[GCC_CAMSS_CAMNOC_ATB_CLK] = &gcc_camss_camnoc_atb_clk.clkr,
@@ -2817,22 +2682,18 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_CAMSS_TOP_AHB_CLK] = &gcc_camss_top_ahb_clk.clkr,
 	[GCC_CAMSS_TOP_AHB_CLK_SRC] = &gcc_camss_top_ahb_clk_src.clkr,
 	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
-	[GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,
 	[GCC_DISP_GPLL0_CLK_SRC] = &gcc_disp_gpll0_clk_src.clkr,
 	[GCC_DISP_GPLL0_DIV_CLK_SRC] = &gcc_disp_gpll0_div_clk_src.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
 	[GCC_DISP_THROTTLE_CORE_CLK] = &gcc_disp_throttle_core_clk.clkr,
-	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
 	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
 	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
 	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
-	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
 	[GCC_GPU_GPLL0_CLK_SRC] = &gcc_gpu_gpll0_clk_src.clkr,
 	[GCC_GPU_GPLL0_DIV_CLK_SRC] = &gcc_gpu_gpll0_div_clk_src.clkr,
-	[GCC_GPU_IREF_CLK] = &gcc_gpu_iref_clk.clkr,
 	[GCC_GPU_MEMNOC_GFX_CLK] = &gcc_gpu_memnoc_gfx_clk.clkr,
 	[GCC_GPU_SNOC_DVM_GFX_CLK] = &gcc_gpu_snoc_dvm_gfx_clk.clkr,
 	[GCC_GPU_THROTTLE_CORE_CLK] = &gcc_gpu_throttle_core_clk.clkr,
@@ -2870,7 +2731,6 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
 	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
 	[GCC_SDCC2_APPS_CLK_SRC] = &gcc_sdcc2_apps_clk_src.clkr,
-	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
 	[GCC_SYS_NOC_USB3_PRIM_AXI_CLK] = &gcc_sys_noc_usb3_prim_axi_clk.clkr,
 	[GCC_USB30_PRIM_MASTER_CLK] = &gcc_usb30_prim_master_clk.clkr,
 	[GCC_USB30_PRIM_MASTER_CLK_SRC] = &gcc_usb30_prim_master_clk_src.clkr,
@@ -2887,13 +2747,11 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_VCODEC0_AXI_CLK] = &gcc_vcodec0_axi_clk.clkr,
 	[GCC_VENUS_AHB_CLK] = &gcc_venus_ahb_clk.clkr,
 	[GCC_VENUS_CTL_AXI_CLK] = &gcc_venus_ctl_axi_clk.clkr,
-	[GCC_VIDEO_AHB_CLK] = &gcc_video_ahb_clk.clkr,
 	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
 	[GCC_VIDEO_THROTTLE_CORE_CLK] = &gcc_video_throttle_core_clk.clkr,
 	[GCC_VIDEO_VCODEC0_SYS_CLK] = &gcc_video_vcodec0_sys_clk.clkr,
 	[GCC_VIDEO_VENUS_CLK_SRC] = &gcc_video_venus_clk_src.clkr,
 	[GCC_VIDEO_VENUS_CTL_CLK] = &gcc_video_venus_ctl_clk.clkr,
-	[GCC_VIDEO_XO_CLK] = &gcc_video_xo_clk.clkr,
 	[GPLL0] = &gpll0.clkr,
 	[GPLL0_OUT_AUX2] = &gpll0_out_aux2.clkr,
 	[GPLL1] = &gpll1.clkr,
@@ -2943,6 +2801,18 @@ static struct gdsc *gcc_qcm2290_gdscs[] = {
 	[HLOS1_VOTE_MM_SNOC_MMU_TBU_NRT_GDSC] = &hlos1_vote_mm_snoc_mmu_tbu_nrt_gdsc,
 };
 
+static const u32 gcc_qcm2290_critical_cbcrs[] = {
+	0x17008, /* GCC_CAMERA_AHB_CLK */
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x1700c, /* GCC_DISP_AHB_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+	0x36004, /* GCC_GPU_CFG_AHB_CLK */
+	0x36100, /* GCC_GPU_IREF_CLK */
+	0x79004, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+	0x17004, /* GCC_VIDEO_AHB_CLK */
+	0x17024, /* GCC_VIDEO_XO_CLK */
+};
+
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
@@ -2960,6 +2830,11 @@ static const struct regmap_config gcc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gcc_qcm2290_driver_data = {
+	.clk_cbcrs = gcc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gcc_qcm2290_desc = {
 	.config = &gcc_qcm2290_regmap_config,
 	.clks = gcc_qcm2290_clocks,
@@ -2968,6 +2843,7 @@ static const struct qcom_cc_desc gcc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcm2290_resets),
 	.gdscs = gcc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcm2290_gdscs),
+	.driver_data = &gcc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gcc_qcm2290_match_table[] = {

-- 
2.34.1


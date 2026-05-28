Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A63B19A5
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962853; cv=none; b=DzxSlq7OY1EahfIS3EcKYIaqle6V64OCbsTfw5jOwLyg2EnronrVi0B3TxbfN7+jE0HoEBwctd0bInRpPSNwWUK7/x6p4vvXA+iOVAUq5587Z3vLacL0k7Mzmrmqyjw/XpxA0OpbIPlfEXnhFWpfzz9HMp1YFd6irWqrqDuNjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962853; c=relaxed/simple;
	bh=68zWRvpjU8QHObMz3uHIjLHaDmh63aqgDyO3HfZkR9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmefer2RBJ5EWsOFKewYuzNn35pCXN7F8VSmzoEnFbqw1rJdhGq3HV3g4Vzje1okquXt10KRQYHFfta5DdUPLrYzXooImQ/wp7OkWhR+7sdDRCznNjqbildcfV8CeQyv2RE6QrXC5kB+agw6J2vjlnBs7I/4M5nzxB0cZTXpWMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWYFZEKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTyUFaqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWYFZEKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTyUFaqz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vN1I3545339
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWQIMKQJ8x/ASCMhx3DXWBROAETZZ6f6K/zbVu+/b9g=; b=cWYFZEKoep5IFIhG
	PJaMm06YqJtXX7FEaEfbgATN++iq2dcYPQVg1LXObXuSpsbNJmgrllgSWg1AwjuK
	LcKWAx8jrCll8hbM/Y1EiU7GDqSLHcCejs4LvvnTfhBq2sdEsgyCrika3cTtQhe3
	rXlK6sWnpUpfgCmE94DHKqD6AUjQL4ZAmNEC55acUu1OqY9TTl0Mi3H5dOfrypCx
	FOTmtNtLFX1wHvv4ilm1oExz1fU57JoxT8MW9g+iDRtH2Y4PA6f12VHN4nbizVoo
	Mbt/0wZfEENNXx2OAs3gjFXVcWw9TkBAObGbENC2imqQJf2AJfamGIA/h7CkVEth
	ZPwkPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tabp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so130442a91.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962849; x=1780567649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWQIMKQJ8x/ASCMhx3DXWBROAETZZ6f6K/zbVu+/b9g=;
        b=HTyUFaqzSjMWX2DXJt8hLdU8sawtVkI6ru7s6xlAZmkrVfmfhSJqrx1+wkmCGw/30Z
         KF7lERcY3rRWGo/IoFRskt17y+K3XBuuKiUvnw76GZub+DVlEl97wbrhSPEeQHfUWuzT
         utihfopZuee1H+TWFp9TAUnYOK23MABAuDZbPubQiO2KoZZPYWm6n1yXqAXmnbNxxusf
         9eCnLALkXlnV5MSNM/WUeR5Fakq4Z3w1yhA5d7DmgtKU51I6ZnNxVDOPUcYOP/o9JsHw
         mwnTqit1rdYq0BmS+HR8NjYoU78IV+BQr76rLeVawbUjn9aT2VePhDZkhRuxgMO109Mo
         YzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962849; x=1780567649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWQIMKQJ8x/ASCMhx3DXWBROAETZZ6f6K/zbVu+/b9g=;
        b=de6IFcMh8JLdvhb+EXsvisl3St6xpXxrhnCMKwzolENWOrwdCuHMDPDzmDWYdmho0A
         CdISSlEjHpZLmnFErKFaA1g7SHyS+ua6E1a9aAoWzT4BnZSR/39LeWlVGOabOrG+BUF+
         rfK7hBJuDANEjbIZYziyV5xUFiBayFORrID611iF6n4Dci2wFMct5b6ji/wtiyvMry9Z
         HwR5ZNSrkXhy2XOVU7sf/JAU2fVbjOD5AOqPrK2pHuz3bsNw04gPGXCBvEVfEF1nWs7C
         yK3xJZQcwm9FSbgTKIP4Ux76CKD3NhWnKgBQOiUfVZ4JzK6UKepyJGTvYds3XyoishBi
         fEEw==
X-Forwarded-Encrypted: i=1; AFNElJ8OaKjcLujdbXIxERuhjJeCBnLjBxs/SrKA3kbdCzyeqgXwnb3NoU2gsHzd5EQA84X012To6UgGpLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNM3hrvr78qg0issH3WSeOrMuTjqZ6QQE9at6bXhUwi6frDNO7
	n0CZVM+aG6MSuJATMeursfFn79fLIMvRLKJ/9I93ikixm7MsYkvhh+Eik+jyQfwTA5pnHwKvTPm
	9FfLmJFo99R+ThCEjG54HPdboyZF1ImcAoHfv90kL8monvdGsfAqKvkumD8rCy50=
X-Gm-Gg: Acq92OGP7d750p6UdjmWpiAM7XncvFBKSifV/a+D+4o/K4W8sFRYEMfbk2jcQOr2riU
	OIY6KUx6MgOjvhmROHeOjY1iUew+uCvhZa4Bs/fea7U5cIX4G7AgV2vsJ/J+JzWRKuDQ2s7c674
	rowwUntaZhvd7up3ruKCOKb2s0FDwYdUnzu32WRdi5aONBT04z+MZv6+2XcAz9EPnSNOwm4P08S
	99n3Ihzd6q4WFGSz4lmDwCpu6mUFMJoNPVaKOqs529wfMY1B2dBaeKfXkq4zccobS0qDNJYHcEn
	nxWcGyirM4/tecZ7P7LllI0q8hVhfMO47X3zTLlxDu1tCmIykt2zcPutRMokQSPEYWKT5OimU+t
	cAge8ttLdK+VGb9YZGpPUYMWJU55Q4eBo2vWVgYOsguiZ0/LPuncL3ttz2n0pE+s=
X-Received: by 2002:a17:90b:3807:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-36a676291d3mr27620682a91.21.1779962849284;
        Thu, 28 May 2026 03:07:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-36a676291d3mr27620657a91.21.1779962848769;
        Thu, 28 May 2026 03:07:28 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:28 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:02 +0530
Subject: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of critical
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: O-dhuTMfGnX2f2T_KLtJ4UTX6VBuW0bV
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a1813e2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wO6r28kiU9IfGTHmw08A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: O-dhuTMfGnX2f2T_KLtJ4UTX6VBuW0bV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX2HLTaLAfjJ9t
 i5gw22ClD4HySBOY4jL+iF5ThlWR4aPY+sdcmhLSRNDF29bzLAOektpcXUaJBn08sEQWYVEpEnq
 f9JVrzxM47oAOu74ZTCWUIYhC+3SUZLaLWPOyc+byNUn5qV2ksIaVQ13It5osfq5WYibkgZ9mkH
 Ty+/6pzsYNGG5k9RFMSsSNDXQ3KTmig/+oOt1QHUxZ+d4RxOKpsf7RVxZCtiETD9515qSrl+WV0
 51Lgoi9G/6KVWTxC8n8DgB9nLOcv3Ij77EG4GlgRuf6bc/tXUjfqJ/gjNAgTidYMTweVHaxwiDu
 3x1bsvsqiPFEqHfCZYbjq6XqochQzzp/3CCDVQtRe36u2AUiqmZXGeBbMZ6hflIw93BrdbLGYGf
 bfMAiY0jOmfJ5Tjl2Y3mdRZJ49XkqNN5Q/rDTtM/f6xJ0izoA9zw+qjp7K6+G72Vl+xuOxjQydR
 Nx9YWC0mMBr6/sKfp1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102

Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
enabled from probe as per the latest convention. This helps to drop the
pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
 1 file changed, 11 insertions(+), 142 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 6684cab63ae1160848631d1f8cd3c9cb691ff4ec..937db68a45b17b190aca7f3164e0dad8deabbfc8 100644
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
@@ -2990,6 +2848,17 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x17008); /* GCC_CAMERA_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
+	qcom_branch_set_clk_en(regmap, 0x1700c); /* GCC_DISP_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
+	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x36100); /* GCC_GPU_IREF_CLK */
+	qcom_branch_set_clk_en(regmap, 0x79004); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x17004); /* GCC_VIDEO_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x17024); /* GCC_VIDEO_XO_CLK */
+
 	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
 	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
 	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);

-- 
2.34.1


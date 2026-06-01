Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369993112BC
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338129; cv=none; b=HdUNrINCm55VKBO3YqmC/tYHbmK1Uye1n/t9kABB1+3wZlLbgvHe1wNEbzAUx5988dftfemJM5Cecp5KLcHqmQ41jUZoTaijgTMUaG39itm4AdF3arl+gfkIFMWFFJ9ektDkqiXvvLRDchjM/oMssAvWTl9YYdADRZciIplNwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338129; c=relaxed/simple;
	bh=BVccFCmjXwoxPbXDwMrtGs37J0RlIlOlUSSCQBzfvOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6YHOPEcY6HRP9LGMO5X1wfshvKFu2V39kvoQ/MZCoAHSrrjZTl2GAJWlXoLoE3hGUgz1RnfrYamx3C2DL5G+idP8T4vj0NUnsUyUILHXUUkslRIu5LLTZ8UtwVH7MCdMbX/KGUFN31e6LYJpJcZVAS6/TvXK79TK8VKIsvTnbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPliWZfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSRvmgic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPliWZfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSRvmgic"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FCbQ71214107
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqHvjj+Oc3HiPUaRfQW46Ggf7EtaZUjvLHZxHJcckEc=; b=aPliWZfRs3DAQ+WY
	8wx5pimi6yZ8djL0Qq8j5O1iygP91OaNkNxI9+KISO8bi1aj9QAUyqFZMMtDr6Wq
	9lyrvhPR7wsixdJIFEkkT7zltvc93336JKogIlbb4jQ6JWrQnXBUzJeenrpsGNnj
	hYvs7W6xHL8bG7daq080fgBwlk/LlaFRaYO3XWhQq+ZemiWwJzwNOWuxjOcbwMh6
	E77nEsRTXb/8U93+n1RuNWkMYysZra6bjSUDyaspAVrpMBmxJ6XAITsRxYAMvLeL
	VinmRHuMwf5iWq+efrAunrve1M00iQRcpqauaoEuQzq/0lTddqaSpcnejhIt1LLy
	VAkCFg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s9afre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bbdcf36f0so2536082a91.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338127; x=1780942927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqHvjj+Oc3HiPUaRfQW46Ggf7EtaZUjvLHZxHJcckEc=;
        b=CSRvmgicVkiEDR/8K6UeBkbvi6lx2otSaGsh9nhWScgRTocgPyinBQBoRcXJNQDH/U
         lmyaQSDf+pqw0YNTmJjg0gW+3fFzjLaXjRN5nDJtHMW4Xw3HFTH75rUmwAg/3CV4qNZw
         EQ4OD3FDn/FpYIdpXZSEek9opUnLPrxvohJskP0U2eZ13v7I4DZy5tbRVBz0CwhxKNVA
         VDmRK6ktDIwoZeo5/64K16kAoNfMQoiHSbm2qgOXG5o9faV/ejZWVBzg1h2tVVE7ogxo
         kXij9CT8fW/x2nagnXrPd4UuY9C9z1x1XhC4arde/Rct4DYqsVl8RYCFf8xfOMIKuivp
         XoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338127; x=1780942927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqHvjj+Oc3HiPUaRfQW46Ggf7EtaZUjvLHZxHJcckEc=;
        b=gR5ImYB8Ixp1T8lYpc4Njctufx0ElJ15SOLCALuWwF5KL1644faMZvATUOnt8A+qjW
         HNb7tiXgMkZ8LB67aZBFwZiqA9GnCBZEgbsBIigs9yQkMP6MDKEnLT9hlJ0kQSYYZpZk
         twmoPWMhvVM9kddzjdaLoU1EWCxxMU+Z5HvvcWK0l9x1Z0ACU16IB/1wunXdYN6jvkZL
         lKIgwyNvJvLALR/uqFMzW51U/jh1cZB8qjazn2wMZfqm+3QWe4r18emvaAfozG7fnKlk
         Htd2TpHRiPWp2ZXduGQfuN8h9FGkUxjgrNT21ptyPU0QO/QYqOOk6Rn5+79l2mkZLWSd
         7jRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F2JKJZE9bwWr2ad01RuUsOqtxScT/o+q8QJvYoYG4+naNaVCUJmR3J7A1CpDNdbAZuS6+4+hUDaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+069coOwXEe05xILzQVTZxMbsQYdbCa7QfeY5mikjm3Tautf
	v4LOGOmfcf3dvg/Fox/rfXlrPF6DR9UQveqLK/nJMyqbj5j83tcPkt0IxIv5kKvyf925ri5Q5BG
	lzyiZrDu2FWBIMKZ4ZMA4CJBXzjNLz9dkzNCV9wyc2V0CWTUHtO+PDrWSJB74k2o=
X-Gm-Gg: Acq92OGf6C3//yzjAK8uSvLbRhNsdMhpnj7UQDbCDUSoemHrpnizYFtvqrCO8FKhZ6T
	jUL4ZoabYWH85lLQ8Mz5LCMmpOLlENzIXP8Yw8xDM3/FkvBvrwGF8GgvjX7yRpPApG6rmlsr4go
	fZmTeWnxHGpaY1eexVtSrDJnEemlxQzMTPi5PPONgPP82xs+IP0aWSMnc7Vq8M6kFSVIA8IV446
	I7Z+aeM8A3r3dOhuA3QDXrD7MrCq43DxDZqkm4Pk4mcyvVdrda182xMCdpzRhfZScEhZdGTw/UO
	MD/tc/9KKVyU7iPuDM9fUd1WpSmPZkSG+eKKjKeixQ5WJ9ETrIr8slzhob0DVOgxYq3Zu+epmwY
	bryZH1eycd32erG+APlTqJafhufxU3qFgO6X6vVO5R/o08B3bDlghXs1v5Ql4kgM=
X-Received: by 2002:a17:90a:c88d:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-36dd91b95d2mr449816a91.1.1780338126644;
        Mon, 01 Jun 2026 11:22:06 -0700 (PDT)
X-Received: by 2002:a17:90a:c88d:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-36dd91b95d2mr449783a91.1.1780338126033;
        Mon, 01 Jun 2026 11:22:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:05 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:23 +0530
Subject: [PATCH v3 01/12] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-1-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7RxNGiZfYonze7VAP_Oim2IizscCEgZh
X-Proofpoint-GUID: 7RxNGiZfYonze7VAP_Oim2IizscCEgZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX1edkrB9/Hwcs
 viTEyvxkw/8yWPycHO8y7idWKJtNXPtTnoLHZvSRzLhOhVlBYLjDysBmXER1exldgsTGis3QdwP
 u+UwgUTK/nRvQOF8om0BMwXuaIopkRPlZDdXG6LMphZJ23zplnuiFLH6+rG9wGxXyHOghEcabYm
 Im/YkLkcpOWp1JkXHnJ13Dymyw8Dach2tMTlxn4xodK9qI0/DrVyli0btYjS87oVGBJFnVloBY1
 AhcvWejVfLHL0sbaGfIP+ylUatIS7FSPvjXrJ8Od70dzlmf87y7C/94a2ZSFZaIPak9n0C6zY1K
 kJW+m3vK4XhHRbrh2gVKs9cYvahDX5SR336VYtz5dPa71vW3gE/vRemxnUNh/OdiUAFfpny+rIt
 O+UrIBPOdqAMMfb8VDQWAUJAoR4w6d74QRvSRN/VLJN93QLGHB5rIMsyFwYYWY58ltXyKusb/XD
 m+r+bc9UL8XG1YO4KMA==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1dcdcf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_NXGYkT8nB-KqtbFvMoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

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


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37BF5733E
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379400; cv=none; b=su7ynJOks+Z+TKqNXjIkPfqy36bZlk1Wbtjyla+bg6ADGk6ZQ9lDp26UwiiTe0mrSRSc6xkE7JYXTQ8WbedX4XQ+F/qG4DEY23v08Vj0NhbhwmIum1urwWnUxPvgOUDqm2OHKfSURNmPa5QC43duNAqlluD8LXtlQvApVwQjNu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379400; c=relaxed/simple;
	bh=CHzpolRA88Lak92LmBKIGhucK+vWml703wx7BCrEw/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVbletEwvXtm4yXl2tnmj7BcieQPDxngQv0hmUqzbx7zW6LlobBrgdvSh0idi0VsSr1BuW1wpEyjDstutksVSMjXyOZpfGjNlRFhoPvZzcElykDD0mPA8bMB2ZChgq5XrN0RguuB13HZikX0Wh+6OyQsZvGPtR7pSog8WLXbc1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sau6B1J5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9aYBA/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sau6B1J5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9aYBA/y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAIT8P419225
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ApceOB3OV9EzMhLZFOuCCS9rEPXB0IuGi9Y0PwKyqk=; b=Sau6B1J5LfDZX2jr
	jWqgWxbjYVu3KzC0MqFgR7HjSGQf0UoJwvEIICbcONnTu5Jklu/j061Z+PihaZoV
	ae+C/2mn8FSjHt+l35tfBMME5jJioqLFQxbaoe4IjMKFS0puo1cdzSSOIkVmaGHI
	jXddaZdc1tKehjEIdXsk0MslkN8ZzsDLIRL6r4rh9TApDdgTqCPf5bVLj2wkeC4I
	Zz9Zp1O0zyd0+BbfJSYv8rqRXLaJgP1jMVKIo1OLSISCU20mWvTPxiRxVOJbKUVm
	7tON757fM8wuJp8ufgKkbZZjwzyliOPhnRC9t6rFaV6y524ot0uS2Dh5c/T18pVL
	qRZ3+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc0ryf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so13172094a91.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379397; x=1784984197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ApceOB3OV9EzMhLZFOuCCS9rEPXB0IuGi9Y0PwKyqk=;
        b=A9aYBA/yTqxVdM0/2+4altdpOJbYqUsGOyQyZYO0nfnWmPmCy+5DVnqR7q/DySiB4R
         kMVlKFcNCq16uIMz7e51RgtFQ6XjlF3KkHJge+ZWrWd/QoR9iPEJTHJ/JnY0ktT2j0Or
         We3cZ/FFD2cJmmSg8WAWbaj7Op4vc1QJIDgh1P/6kKJj3KTHr/ZYT5EUTqmBkpmZn7sX
         kMJT/10fqUMJBxhvMPvW7f6Nc5H0moGxy+xakIVkTiPc7f4AXZsF2gZSxxkvZfipBSZn
         NyVQWNFb6EmEUPan/WdWl7EUU6lScBVfmQ5MFD1kSPdQ9cTfsXCS+AZn761uXEmiPupn
         3FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379397; x=1784984197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ApceOB3OV9EzMhLZFOuCCS9rEPXB0IuGi9Y0PwKyqk=;
        b=rsnPgQima8zx1xwtbfNT4xch5kxlicADjAkkcpKC0kKoZlvnl0Y4RCtvDrlcj8WfK1
         XW8105+9pFff69FjsnTVTWWjSp8i1fOrqmhwAlOqUnHYR/xolGORVC7mqjcecCqKpHkd
         tr2vdx7zzgP2a7rc0hMmLSGwO3SWbfQAdBSTWDJB2zPLrMgofi8Q8twsrgnB/CGQBL0j
         Kxf37q5TkKnLn7L9TBS/qoDMX85GX3ZPFyxrnEa5E5UCTDCJlP93KePitVmSGo78nysP
         kWGKyMAOZQFE+PqhaHblA2eTIW6F0mVQ7DLsK/DSf06b+vAiG6yvMiuh615GVc5bVM4Z
         buQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqwc4WLhzBob25EgHk7LdNLHRIsSd84Udh21ewdgIlVvkiUHIccwiv5a8ejJLvqZjPNrfXQZhJo4nQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCur/2ZHIyy1+Rx1iXqd+sMQG3YUcD3ND7San+xRB7oORAOIsY
	5c6tKXorqMiqlgVKATH18aexN/Owi8EvFVWMfziFZ/YbtzbkFQvcdiGgQvJKwnxrPXb86nNzter
	mdAw7zSR2vYAENIpvLdM0ztJviQSjF9SV1qDIlrkPcR7lKx7Izcj5XqrMLMUaJjQ=
X-Gm-Gg: AfdE7cnAPvzHr7fFULRNagy27hefdCX97iiErmpzYHQNp5Q0HVZ0lKNJE0HdOLCYE7l
	8OhMj2mMoXExqFGoaraWi5Rwskn6IspHrYGRObUPCWWfd3HEdS0DlmAmfwsW/ArCMP95/Rmh98F
	gzCgTe3P+ur5ZBDFc2BNLDfyU/EtWVrDt+duo/BXMrYWKNshASREi4LeYxWASwgZU38Bq1V8TIq
	4DiZkxSowUU3flrYGly/Br9I//u20bfsybNXmxG0GBtm1Zx3GvRMmFXQ1Ky9H2hF3O5j5gtyR6w
	KQxEKnomHY3ly0oIqxQewN1sPLWiDg25XZwsykOe5ODNVHpV+AOGtFTR6I6Bj10wkdiXadwu4ze
	XA9/zJ69wpBtLfwWxSFc+J+Yfsiiedkk=
X-Received: by 2002:a17:90b:2c84:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-38e4b422bebmr7142242a91.8.1784379396756;
        Sat, 18 Jul 2026 05:56:36 -0700 (PDT)
X-Received: by 2002:a17:90b:2c84:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-38e4b422bebmr7142214a91.8.1784379396267;
        Sat, 18 Jul 2026 05:56:36 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:35 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:09 +0530
Subject: [PATCH v6 02/16] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-2-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX+XT9YtQGFIAH
 n4lkiOBvom/NSgSJr+44RLhB5t71qh7NAiGS6k4X9cui1OTrNhm4qFAji8hz9zf5bpC6N+Esl8e
 rzHPstgJByVt7dQzIZkruBfMXmvzToo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX5LpFxtdmeaQe
 scExL3M3RvZE3jCok5Fm9vWzNn+CscZaLXMM3FbcQX8crZSSZDcmfSRNHQjgY02Ix9klOblJS9b
 yhVdEAV8svCTJuZHF+C/ugsREgFfsnH4KogombopZM2ADZcqrsEAUNM10TZNTs1AEH4UXlQxX6r
 R7K3UUe/B09T5OdO45DtFVmbf3V5xAiCPnL5rN2iZjCMwzYjs+bQl/QYhHh5wL8tCbIIiCt8BI8
 EKXTXu/ok8MpUUlAov7zT//VvjXXOfiQtqhzjK4bF8aGiyL1930rzW8ysZ28Ga1Y2ciTZsG0Tuh
 ayBA7193fbaYA9B16Eq9RaqDxFOppnvBHOlfs3ZbZ3M4wJ/0vGae9Q+iqbXsseLl/TA+78QXNnG
 uqIRxjZaNCY/tTGm/FSR9o+IdTEAnAQfL+crPIBVLiwgsrlqvj6T9wsRFFd8QS1DTfbYmjnFjPZ
 +77cIQHPmGBVjvM9ZIA==
X-Proofpoint-ORIG-GUID: MCe0LSoMNTRqEmK2UHlvF7jwsuD3_J9V
X-Proofpoint-GUID: MCe0LSoMNTRqEmK2UHlvF7jwsuD3_J9V
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5b7805 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MT0SBaNxHzCOmR3iQeUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

Some GCC branch clocks are required to be kept always-on due to the
hardware requirements. Drop the modelling of those always-on QCM2290 GCC
clocks and use the latest .clk_cbcr convention to keep them enabled from
probe.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 113 ++++++-----------------------------------
 1 file changed, 15 insertions(+), 98 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 6684cab63ae1160848631d1f8cd3c9cb691ff4ec..c6de8d368ec4c69d38f59a8efaed6d66ab14a5b8 100644
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
@@ -2439,22 +2363,6 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
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
@@ -2775,8 +2683,6 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAM_THROTTLE_NRT_CLK] = &gcc_cam_throttle_nrt_clk.clkr,
 	[GCC_CAM_THROTTLE_RT_CLK] = &gcc_cam_throttle_rt_clk.clkr,
-	[GCC_CAMERA_AHB_CLK] = &gcc_camera_ahb_clk.clkr,
-	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
 	[GCC_CAMSS_AXI_CLK] = &gcc_camss_axi_clk.clkr,
 	[GCC_CAMSS_AXI_CLK_SRC] = &gcc_camss_axi_clk_src.clkr,
 	[GCC_CAMSS_CAMNOC_ATB_CLK] = &gcc_camss_camnoc_atb_clk.clkr,
@@ -2817,19 +2723,16 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
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
 	[GCC_GPU_IREF_CLK] = &gcc_gpu_iref_clk.clkr,
@@ -2870,7 +2773,6 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
 	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
 	[GCC_SDCC2_APPS_CLK_SRC] = &gcc_sdcc2_apps_clk_src.clkr,
-	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
 	[GCC_SYS_NOC_USB3_PRIM_AXI_CLK] = &gcc_sys_noc_usb3_prim_axi_clk.clkr,
 	[GCC_USB30_PRIM_MASTER_CLK] = &gcc_usb30_prim_master_clk.clkr,
 	[GCC_USB30_PRIM_MASTER_CLK_SRC] = &gcc_usb30_prim_master_clk_src.clkr,
@@ -2943,6 +2845,15 @@ static struct gdsc *gcc_qcm2290_gdscs[] = {
 	[HLOS1_VOTE_MM_SNOC_MMU_TBU_NRT_GDSC] = &hlos1_vote_mm_snoc_mmu_tbu_nrt_gdsc,
 };
 
+static const u32 gcc_qcm2290_critical_cbcrs[] = {
+	0x17008, /* GCC_CAMERA_AHB_CLK */
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x1700c, /* GCC_DISP_AHB_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+	0x36004, /* GCC_GPU_CFG_AHB_CLK */
+	0x79004, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
@@ -2960,6 +2871,11 @@ static const struct regmap_config gcc_qcm2290_regmap_config = {
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
@@ -2968,6 +2884,7 @@ static const struct qcom_cc_desc gcc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcm2290_resets),
 	.gdscs = gcc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcm2290_gdscs),
+	.driver_data = &gcc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gcc_qcm2290_match_table[] = {

-- 
2.34.1


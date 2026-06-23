Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD4C3D0BE4
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212067; cv=none; b=WW+/en+c+o5C6LgoOnTabaD4hWfN1v+QSVG5ySBNRhcjnVXIL51vnuD9syb5UEOqLCz67N5toqcu/thAHvv/9p/+L85iyqU8jajJ5O8aboleftK2+SlVX/TFHPlIktFGrTBgk2HtdNMguBBTNnKL5e+6fsqynyDWeN8XzH8fpBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212067; c=relaxed/simple;
	bh=bbWtU83+E0lxCYxjPllAAq0uNIiwu05NnGRfi0Uh9Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klJ1IUIp4JXSpT/IK/lVUPzpccy4B5QB+5yNND8kpcSfejy8XZ3lqtXBw4CRFV9NQV8ofbypDum/FB/bw2MB/1poCndKmXh4MdRRKyYfu/GrWHl0TTtz8/iuXlZXeNGL1tWyhXCH1wCdqvOVoYOYXH4lG3hzOPHsKIIgZsIL98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCMCaTfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCY2xdey; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCMCaTfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCY2xdey"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cl3A3564081
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=; b=BCMCaTfSdrCvVyJp
	2tNkWiWqtgbnhsin8XmIwgh1/R70wu9VCw3tj9j9Kooq8vAUHtQN64Z6DTrxNVzj
	5hesRF+cPXXr8rx7irt6zEYRspwH+6cO5LhyeSj6D47TiM1cgncjf+RJpZDp00lg
	5O/ZmBXeLbpF7RUyNR1Ihn7d1xOnbchihB2M6/KpE3JV1968pbmrq+J44qP6HzzL
	JVm9guMQd3ghA6bsXRAsg3VdyOtfUqRV8yyxDbBodxqzgNnYeHwM2twqqfThdBfl
	rUa7C0G/MQrc88Ibh/Q5vz51ltnGecMdqK2rW7HxRziPI1w24gmuc3CGiX9e9eaX
	+vWrCQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44ddf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0532a6588so48704245ad.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212064; x=1782816864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=;
        b=kCY2xdeydjN/0WSotaf57NRdYo5ofKv0Xzpwe04SiwtjCnf6ih0HiuWBpgdNZyk7d3
         m9kZVsyJCETpiPmuVlMlb4DCX4/aZuAFU09WxSbQzOxmMp0SVdHd5CQDr/Yw+WmqVkbY
         ylwd84/I5rdYFL+j1YXPa/8UZYTAD5yO7gCRG/aWHUKdOA9N5LajuQ3XFx65c8MRtebP
         cvs10dp7k3fe3E+spXtFiKHKOqohdYHu1PA9E+jeZqlLT7arxQX13HZNFbEdIYeLAPMd
         fZu+n99ps7TNIVrhBX9HmzQwx1GdUsoY4KplxautG/DDkHrDC9XtNimZkXok4r2vtXiR
         hqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212064; x=1782816864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=;
        b=futMNlSB5uc/vWrgSIpov1b704RCm9Tt0fJka3BSJuyIetINWuLKNBZtS53K/6Ol0a
         HG+hky6tiRXIg/lhY/+rPv81L0x4DjYA4X7elf1bvUfcM/DM6qEuONS3LoWvHdVf04Mg
         KJuMdITFJT1/IbJLSAYXMasG0RjiQdQY1eQ5/gqRuSISTyG3EAJ8lJEfXUUjc+j28VTQ
         ckZ8jx7/t3IQ2qjgZJRPUIkOJS3QBg4ETuVU80o2UnQ8l11vOFIsXdqHsR9bDFkFyYqe
         6n9zordS0dsBCCwyTsIqw+EFtfbQVHnf+0Eqq5dkatPgult4O91pTV+0tZtfVQpDq/ac
         7L2A==
X-Forwarded-Encrypted: i=1; AHgh+RoERg4WO84aBHHyC6ABop2jC/UwUhR9+tlL05qJsO+mh71EiCx7f/cpljLQeKD7x5hC7n3tzhPsbZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCTEuYFWGUs6mTaJCTofy0S8dtw1sXkK16rn/oYREHaY99UPko
	jd2jvQuleeI0QHUznCQ4cF6wOvDGP7rxQjgHyLJgyyHlU1cEjEyhg1RuTUgULuom8MLBecJ1HNV
	9z3hVWsziOWYxMdwCjTRBpQ2SS8IPh+1Ak9AYl3Xt67W7ro+9XYG3LsUDgSp0Y5g=
X-Gm-Gg: AfdE7cnttIBNZmHJtCmbj6vYg6x4pO0Z4b+WXwRNOpqa0yIrKFXT7hCp7GCMlOUIyeN
	C6nh7iRUjILYhgJnwp5oD3GRnGo2dZPdTmg8Rine6yd5DdJntQHevxRIlZBJa4LOFgdneBxSNsq
	c2AT1wq5aZZzx5hc5EB1tEUy0ckupDpwO7KNCIePMb2U/kI9hLFwJ5BriJ46P6OjPAB51lWzdcQ
	Dp0iqbTn4cfSoJWmkwcEQNQ22iy5vFyzPlOfBGFch3tFVzFS//5tCdJtTJQSpaBRHirIHNA/T6c
	mlWG2ymhNcBeP+ougfvxqcV+UzY/V4Bj/eW/uMBFZaEHu6zyeQTrtMaWPEDcGynBUey2fl/bFvY
	Ds1B9MwbqxuTyQqwc63SRSkNipcWSbwWBgCo=
X-Received: by 2002:a17:903:1106:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7c99df0fdmr20220455ad.24.1782212063967;
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
X-Received: by 2002:a17:903:1106:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7c99df0fdmr20220085ad.24.1782212063513;
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:05 +0530
Subject: [PATCH 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via
 critical CBCR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXzk6tVcw6smoS
 RpR34RBXon0Sf3jdKHowh1SLwQ16L1UfjBmxQmHbVnlZ21sARgkbYeJ+PvElzzGr3BFOfaljRm7
 EgOiYadDNqUZRiOSgbdeKP3wZafaNJM=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a65e1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mEVXwad1GdBeBoogAroA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: pIpc13f7PEuzlUd3VPvfhKKWaEdc3Q6X
X-Proofpoint-GUID: pIpc13f7PEuzlUd3VPvfhKKWaEdc3Q6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXxHlpcrEFnqwc
 9O8LAr+vOeJ+t3/P1/sCosgYFrnwxbJ011P2UFV97ktOWySV1cjKyqgRSXSXyAiaI4kTowHDxj1
 YLfVVnjF6VQiYDufjXrlHnX+flO617a9O72dfIB7BZRihh8ExwiSVuZHn3Tp8DUnYxQ796kvZB0
 ZzLhCh7Te4hOJcgN6C9RpINYW6G1iG3IZId9kKKUW6MBSXB0Cvq1kyE0pbaN7hQgeKSoP0OHOBP
 hE8kq0qez99hDwjRFodl5Z1PIDXnZqgt1eCm/OV65SwqQ9SnyrX2EkXk390XMHaNKGM7fEMZhgk
 zTzbs9ySE0St1fPVDKMIZqEjilrcStyDxO2wnZU9whzQeNGe+meXm79bP6ortumx+VwGFfL19rx
 72uz7XoheDvE5rye3ffNfC/1rgW7k69D7r2leg0yPBZwzREXWFty6gtHrjeCMWXBoQtTVtrqWqB
 bnaMNHq7+F0mFjCEDBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089

The GPU2 CFG clock must remain enabled for correct operation and
should not be exposed as a controllable clk_branch.

Remove the clk_branch and mark its CBCR as critical instead to
prevent unintended gating. This follows the same approach as
'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
Qualcomm CC drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 2e653ef0fe0e304f09ed354d5578fdbed9151d20..bc4d478d5606ad7478431573f98b62f6f9b7d9fb 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -952,21 +952,6 @@ static struct clk_branch ne_gcc_gp2_clk = {
 	},
 };
 
-static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
-	.halt_reg = 0x34004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x34004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x34004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "ne_gcc_gpu_2_cfg_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -1817,7 +1802,6 @@ static struct clk_regmap *ne_gcc_nord_clocks[] = {
 	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
 	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
 	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
-	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
 	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
 	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
 	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
@@ -1946,10 +1930,16 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
+static const u32 ne_gcc_nord_critical_cbcrs[] = {
+	0x34004, /* NE_GCC_GPU_2_CFG_CLK */
+};
+
 static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
+	.clk_cbcrs = ne_gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc ne_gcc_nord_desc = {

-- 
2.34.1


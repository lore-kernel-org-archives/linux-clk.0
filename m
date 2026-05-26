Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D92D8DDB
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773403; cv=none; b=SDnWdbcsm6lOr+TZc6Xev6lUAFRNTjYwx5YsJ7awBrm1sGCsckLL0KtEgFgws7nETntAsivATyVgbhY2Ip7lg3ic9kf1GjASaO/UOKRdq4ALNxNY/33J46d/OyRkAoYlsKiq7v3JKDOO49T5R9wiEwoKSORMzK+6xHwvAh9Q8Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773403; c=relaxed/simple;
	bh=uSJLF7RNJtZ5PlwbCa7e1h6aBxkEzjFbwa9KTWahQDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ER2HdM9OihXEqg+FFxxX5v1W9eM7zJvr7vwr1+I3EQ/MdOC8BC8UgcMHbKi2RSHGn0I85U48LFTeCV2IkVuSwNNyFXV7H1qWIZ358h1p/DEDHCtZLmwxPwG2fhEc74E+yQlOYQD2kv2IbLdXU/S4TpQUCVyRwIqG3Vb89CH9wJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA+h4Gnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4TaYNaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OA+h4Gnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4TaYNaR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PHYnWA2145625
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rvkZNUxGALVC/TVnWmKKOdJ6HzDEfUiUd21M/kwiy0=; b=OA+h4GnbYCN7RNQ2
	wM7/JhMyfizCJnLviygI24DcoeW54AZWOI1wiF6W9s8AGs0jDpvfrp+KdRzH7OWT
	ioEX7buGcK1GiGyzQRkDzTywEeL8of8MOQhEi6nFBXZxBq2/MT6fZL3yoMNzFENX
	195wb2+B2ZG9mt+uuC6vTCZRmLNzrYwS7HWmbKS47sWi7a1F9jZCaVZ8625a59hO
	8uA3LhCu/INcaFw4FhYjoOnt9O+kNfjY7uFIe8bOiPawbKoirJVcICV3Dl0lLx1S
	xp423JaV+A0WFS6Nc07f0iYsx/wN5oKbTwyAJVe17Mief9HuDxQUmgT6foz+/BER
	XbrOjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv30na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba838d3fa4so101843645ad.3
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 22:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773401; x=1780378201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rvkZNUxGALVC/TVnWmKKOdJ6HzDEfUiUd21M/kwiy0=;
        b=S4TaYNaR0AVOLrKcFArO8eRBnIBRZkhEshyUpjEOhTgbLfmljiIVziG5mrYX8pY4Yt
         AMPgnwJA9Rbzk8UdxFo5aIeTx3Zgfxqlry6u1IwKDlL0gWR9pPFqrs26Lly0xKDncEFJ
         pyFqDF8b+DyltNpquJttSRy7ZMuWcfINITjGcK+KtvIB6oulTx7ScH1KH6C1GBg+zTh6
         8VJcZc8KjzEwTtjZzT4/N+1dLIcp6HJHdyRp7vhbxbO2MvwP5bHvpKHB0wbFwpMLGBdt
         N30SJtN6c8hg50kJjS+C34J5zB/aI54LH2Et+iVDQ29N0Rnk0EgdV/YYNJ9PXri1TuyK
         9M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773401; x=1780378201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8rvkZNUxGALVC/TVnWmKKOdJ6HzDEfUiUd21M/kwiy0=;
        b=QeN6CKhwRgzEhds0k864JvdOxTICUoajjx1QSF/N+Jw3GZTp4QdKY5AyApXTpcFosk
         JKBpNCdZ+kFj8tJ/eN+GwIbE0+THwsU0+k5kgp57lbKNpMg188weLNCfq3zshZA5cTIH
         pcyV9kydBFKlVz8B6Avj9YxB9/9qhL56rrQJWP6dWOVX5/aosFP+joxRqo00UgQvL9Ro
         p3OJ9qv3g1mNCrlUrXJ/OKBoeJqQitLON8f1+kzlV+0n6J6B+0WOK1Qgx1i93JQNl8Sp
         OK0GjuCX5OyJ8+otYCk/j37LE3Ip8YsH+2zLAYJlWrop2Zo/xTRBZLDOOVTUv154O4rZ
         mRMg==
X-Forwarded-Encrypted: i=1; AFNElJ8DROYFSOcuniuM2x0QoXjnCk2das6rYT5MghyMh+jvqbLlv6izn2qp5alI7Xal2hJWD/MMGWHAZBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv2UsMUnjT+Pr6Q+Rr/sEZI8DEVU+mV7QKeUdFYDc1RLUnQgjT
	+FffJ5t1sI/t9eic+TL4pyJfYUHUASn7uZjyyQJ59KrrY+oT1KEfLWe7K6CURaiU3mo3z/4ifGG
	TDb8htUn3ZbuMHST0KzUqNgPxkXQswdBB4WdNAEjf7d7WQJowZ4BclSREZsRwQw8=
X-Gm-Gg: Acq92OFS3pBr+9ylqjiEQzMEupWUsjOeytxmiFIQ8+JoCb2R6AcstaYi4qEGfhYUmVK
	1ns60Jmfc/Ju46MdP+G02/D3nf2wSDGlK1mOOc00rbzG3fC4PkNB7YckChm1KJV0o4LUvfDCZDD
	MByWT9NTGf9gzRDJDXYAIDQNzz5mk1pmOHF3QIFJVPFbtouSyN+8282m8inQpd4h1Kmrfz2Rt36
	KbMWlyL4ZDOoo469Jpbct2idqfvlQbdWTTRWR+0dhFnwA3sIn7efIPHBOgQEkrBmmXOxci6oWyu
	GDlFLQnWNkNqrdprHS7KEmjb3reqUTOJhS2vNAc/J8guieHgG4UuO9wN4VE89OAeBGVDH/Ep3zy
	xkyxgAVt5Ux6I79KqYwZWtfi33hTvDdEjssUd8E6TQazuJOvZSUc6E95x
X-Received: by 2002:a17:902:fc85:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2beb069e6c7mr187180975ad.38.1779773400844;
        Mon, 25 May 2026 22:30:00 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2beb069e6c7mr187180555ad.38.1779773400370;
        Mon, 25 May 2026 22:30:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:44 +0530
Subject: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX1p/k89ORlK70
 YiZWxOsSB/qV07P4yPlkBX93bYgC3d2oM7aIGWFeFB9bxMapR0qHI8fSipC8sjPEY32iL45jFVP
 Z1/SZ+3p7sOAfeMdc9J2689PBs7P8fRiHFjoIa6qmYgBXzIjBj9coV2Fb8H8TQx8wjZfb5MwTxr
 BOsapF/GTylsH3VkEKs8JfpcBnx7H1IkekIwk4MdX2cv6LZiIZUrX5TiGc++/NZn/0n1XlbUuhP
 LCAXetbyvaDzTz9+0qMW6pKy9q7sWSpBL8z5UdlZBUlSMEsU243q3cLeebusTHOUaZLsRHhgCwh
 IEXIu5aqrDsg+gr51ysiwblvhib8ZP2F+B2fp1u2nuwAOWghXoPT6UHJNO4XrmPvqfT8r2atIsC
 tuyOyoUGOP2pgbRAyoFg1e2McC/TRCy1ehq3Vu85Y4vIR6BGB7VlmTRRDAD9gs/ziADC4fIwcA0
 12sUfT5VW4zodzd5o9Q==
X-Proofpoint-GUID: dYat4RgymAmh3eFbapBGCgwBlC997K2I
X-Proofpoint-ORIG-GUID: dYat4RgymAmh3eFbapBGCgwBlC997K2I
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a152fd9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6SqLyIFWvb7f5ISMJ2QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260045

The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
registered as standalone GCC branch clocks. Drop these clocks from
the GCC clock list and instead add their CBCR registers to the GCC
critical clocks list to ensure they remain enabled during early boot.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2736465efdea9b3cf9ec945107d4b002e123b59f..32d23bdc819b7a62472f2a1ad23c9c8a66cfd0d1 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3669,21 +3669,6 @@ static struct clk_branch gcc_disp_hf_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_ahb_clk = {
-	.halt_reg = 0x9b004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_eva_axi0_clk = {
 	.halt_reg = 0x9b008,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3714,19 +3699,6 @@ static struct clk_branch gcc_eva_axi0c_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_xo_clk = {
-	.halt_reg = 0x9b024,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b024,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x64000,
 	.halt_check = BRANCH_HALT,
@@ -7993,10 +7965,8 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_CFG_NOC_USB_ANOC_AHB_CLK] = &gcc_cfg_noc_usb_anoc_ahb_clk.clkr,
 	[GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK] = &gcc_cfg_noc_usb_anoc_south_ahb_clk.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
-	[GCC_EVA_AHB_CLK] = &gcc_eva_ahb_clk.clkr,
 	[GCC_EVA_AXI0_CLK] = &gcc_eva_axi0_clk.clkr,
 	[GCC_EVA_AXI0C_CLK] = &gcc_eva_axi0c_clk.clkr,
-	[GCC_EVA_XO_CLK] = &gcc_eva_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
@@ -8545,6 +8515,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32058, /* GCC_VIDEO_XO_CLK */
+	0x9b004, /* GCC_EVA_AHB_CLK */
+	0x9b024, /* GCC_EVA_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.34.1


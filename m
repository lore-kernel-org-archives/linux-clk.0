Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF45D36D4E1
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934702; cv=none; b=OrGKAYk4j2EoSuvGT6lv3293pb8eI9X0jDbG7fabiKs9H88thG7B+HNU7ZPUdChXR0kFGy3RYEbasNyhzWtz+mtKqgtd+6cv6d0mpd9vPpucctx9Zjs4jUAerv2lwZYA5g49roAZJBn/G+KXf0zNWhF4KySMC7QGZP1qxoXeWPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934702; c=relaxed/simple;
	bh=5dBJhx972EX/UgMMLPtbRbChHzcFnbr/i1hiQLaiw1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Afq3DHIQoPSwQUSHBb8jH4oTcPc7QZAZODgm2kwpX+UjugOrJo58OVT/1oeiQZIKLZNGWLQ4HwJzUPLy7qDllUV+m/9SC6TaYJuBJBnOOEDeNuZvl77wvN5R7rk9GMpOmBO9IdDBTAYh6k8EptM7GezT6t3NFc/XdG02tkL44MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6zrv2Qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGVxEpfe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6zrv2Qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGVxEpfe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMCZMp2391339
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=; b=F6zrv2Qe7GnzMnv/
	k+IAmH37x7OjnuDw7RQlOFf13MknULBwjSOPPLBv4CJ+Ikwym/Xm6XwPe4fo1uqS
	kUJp1DDAvcppa3cNCY1pTptw3Jxg8iGwtN3sjO1Q7qIG3VwnCowq1raqhbAUS/43
	V4Opg6DEQ0EERxpCCmCsPw9dTEq9KZcVWyDjkkFc1U5nbJuFa+tHfOHVE1fdSYky
	oiuH+DK+My+gmb867IQcm08pWTRtdWdfbtF0fOYSN4wASFL7YmdblwcKHUp+wL4E
	4lNE5AqQgdvksQjxItsMnhhbGD5TAWVD3ecVLRTlirr8mxBHWlcGf9OWFS4yP9uc
	/6j3Rg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7jsd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:25:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso10178636a12.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 22:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934700; x=1775539500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=FGVxEpfeaIsf0Rs+CP5oXk92yDxFXb1453JA/PJE3B+n99ysJZJSObVHgDV71e+WMB
         RjcCcaoFWOZ/AoHRU4C6jYoYf/2+rQ3PcAdlBPcJwjZe6E+hghd2NBeRHlN1lED1DnAn
         3VmUqbM8s9RA6poNPxrIMZN7CzRGOJXfhndk0enhBvVoHYi2pW12Odc7oZtrEmGLSaGe
         n66g4sC1TdGAPra3OWFY4Up7fBgj2RC5Nv2ynafbdznq1vToojrpe5vZ0loWq4W1ToSO
         dn/fUYcfp7iHX3sdnp+mYARFCca82xomSdtj/pmdryxt6YgjuM7YTg1Jbo1zbjA1ZDcf
         CXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934700; x=1775539500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=AsWkUejB3Auc8jTkPcbvbdVsqS0KXPsFnWxNUOtvr16Wm2hmCDaydNfZuT4Sz9wG5T
         UIyRKPAoxQfMLeQ/PCQccyr14g1i1UvVW+F/pokUxeDhkw4SYminAd3CkfARxe/b6FnJ
         DAdDUfT5sL6Xb542ssSz5frOE7jOs0IDOp6Y2aFVbbAHW3aENjBf+8AyGwHzV2fuPtH9
         N6o0rHgS6J7yovinE1+ZTJnYJrPWHkDLgmFAVQ+sI7LJ8QppV/xHOC2SbI1F0FUy9/mv
         we2xhVSzNk0WiDMQiF/08JNGb6ruZb249PUnzFSiCaU/Nq43Gcv5/h3sTsJN6JuHLO3L
         gnLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHwAVANE3p98hHrmF1xWo5jmdKh/uUrLbDtf7C0FNtxodZkZVL3Q1+pIiFQ9vrzHFhBmd1lSpH5sE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YOJtL0AMjeRNj25UaYBC3AqsSnhV1ZIvwsDv0zm0P2J0fDYu
	0rrblJSk0luMUDzNK4dDv5zW4+g0t/dgvyKBDczPSN8ubrqU/nijWgoq34jFINYN1D/WytbqyQt
	0TABk2mVal3gzKcpaPwS61TRR8lFencSx/OWDnNi9fyVVh5mLxc4hkddyf2Oq97Q=
X-Gm-Gg: ATEYQzwrYCuKZ2CYMkok2kv+G9J+7Dd1Ozb2NnIdQOf8LTmiuhMfqve+Hxai0jH00p9
	S/qqaQgNd+wToS/OpF0NJmPxEl1s815jfhr+IR/CSm7yuCYJd1nstOuPBOFuqOdEGI/wT8b46ol
	frGuw5m2UKeywnweIHCjNhmJ5ZEwRAKUVNpsfLOsUuw5pwcSlYS6SBruSgB1jDQWzheezcp7txT
	zHOZVcQtj+nQevN3vAGG66Bz5/kqPjAgXXrTIe1tmH9ItlP7Mf8+5CHGhS89Z3rDiEZd63b4WIb
	yCQDze4eztIiO3xrJbpzAxCXsgDeW54g2zxl4DvrZyfrqr6//M2vgdc+e+sDCeVB7VdL2kefJt6
	pnC1RlUBUARgiFvXcBsFW4EP37cMFug7fBb09CvUav6N9Yu35bRVQ
X-Received: by 2002:a05:6a20:7fa4:b0:39c:787:f185 with SMTP id adf61e73a8af0-39c87915751mr16564441637.29.1774934699540;
        Mon, 30 Mar 2026 22:24:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa4:b0:39c:787:f185 with SMTP id adf61e73a8af0-39c87915751mr16564404637.29.1774934699108;
        Mon, 30 Mar 2026 22:24:59 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:58 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:13 +0530
Subject: [PATCH v3 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-4-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfX59mxgaTrV8Ao
 SY1Fyr602dxS0wsARNcixB5VOqiqx6Jtydjo4vZnW9gVbZ5KICndJqejEwoSmUm32e4udI8EZuU
 v4QeTvHm6mpzz8y8vfaC+OvXZvIt4RUbac5hwJ+QabfGhtkZwkgYTM9UVsSJtmkG7fjYZPNsEVo
 6D3e470msuVc2YLncVwS7Lic09bLDPzH8kjirDx18zZQl4Qyhi3dTG2mgX1PV8azHjth6JpvRkW
 y0hgA4TTVghSw8SfCJxGryL6VUkhy46drTVPXHTvCIVLfBxuBNPZqFfTF5OGDEqgCnp/WECT2ru
 MyMW+8uwbWyKpvRYzyNvbFCQlmc3WFNSNMfatoklYChZSUwRd0cXIg4VPauSl4n4UkAxaFx1HGZ
 PpBywWuySNAiDuL3N6Ylg68yPh99f3+QL6ChqN5a/VGUvadCEgPiAdfdUSJRzf4ma2q5yvEJc/E
 BtSUdgs2PFw9nYwdhxA==
X-Proofpoint-GUID: oRJM0G0gg-zdWPX5PnkSnU8xcBGEkS_i
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb5aac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=F2hG9-dZ5E7o3FMX4mIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oRJM0G0gg-zdWPX5PnkSnU8xcBGEkS_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048

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


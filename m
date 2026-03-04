Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D53CA48E
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 17:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646094; cv=none; b=fGAhL/Rg3EmVcFNP6bEgOoCMFa+pysS6g0KqzKFGN2nxYMXhijrmazZTYgxb3f+l3YLcpULB3L+5F7tgPkOc8S/7UlJGH8EHcx2A5njF7pBIwKb9IYcnVm0fzH5WERVKELUqnPo5URf6FtudTqV5yhrWq42KhKp1CSKtIOZ3DTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646094; c=relaxed/simple;
	bh=OL4Epd6l4mbhBF7WNIPFfHQcOGLSdv6qnBiTHQvvHxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2D3StoM4FRd2qjP5+7gpxTxrDK80THVQonaQtNeNYvDI+cL0qt0UlgVt7fsnPjkFPPyiAU7Vmbd/TYGNqyaw+9MsrUukF3U7xEWN1x/xGd4hGabJd0/ceuv4qQWQO5SkZDnYgA+y2dBIBNhI5EGAijwJos3eMbNv1plsdBOHVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkBK21wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj+cnsdy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkBK21wn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj+cnsdy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624E0af2029422
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 17:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HolbXLYprWxs2ZitZBWwrTqvQVPUtHF1Z9ZCTY+6+to=; b=YkBK21wnNGI2hrZX
	Em/9t7b/Xk76/Ue3tXoaawGc1t6Ex4cky4rSYAMOSCI1+7WzT8n7jYR/0GZ5c7eJ
	d+2hjTn+0AhUMv1PXg5mpkKgq+mBvJ4geZpFGElAEaXqFwI152NplAHp8CHvqMb0
	l9v5LmhepK70VFxJi0B5yEbcUqFbUzp+bjL7C+AyH5dfXZJyoIOxAr2W01d6RW0o
	nqCdVS1xeryLuRqKW7QONBnSonJdT4QsVbvjoIQgtWFVaFAyuvdBFUWUg9hZhsTG
	xXKpLncm3TsgVX8kW1bngD4U83GqhEwnMlvuk5TxVKHyRidtYKG6uHDfNuvnPTSF
	JWDyqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fgstb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 17:41:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35980a994d6so20643995a91.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 09:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646091; x=1773250891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HolbXLYprWxs2ZitZBWwrTqvQVPUtHF1Z9ZCTY+6+to=;
        b=Nj+cnsdy720YpWb15QiBki71Cc/N/hnMNKBJoEokaYSUwqXiaOyNl4sG7yyml2UGPL
         xc2s+9uHLT//2qiHAQaxs/5y/1ooMIM50PfzC7wZFkGl9jdi8vkKtzReWJkIp721kcR4
         MbOF8AvZDSp/+SIJfG+GVzo80se64KlAuttpO5C/KqvBd2zTVUZN4O/XaVscyKagFdsK
         RIyFSErNEbNlJMxzuzXhRiM+dD94ky98P1VMc5KpPHj808kT/0/lDxGAkoe9FRo3laq2
         B4mi/BrZhfMf+zOY+q9Zf6LQIYJcjdaGYexSqytrXzPzPcsiUnPxHPhhQ89pvH4u8KNn
         PUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646091; x=1773250891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HolbXLYprWxs2ZitZBWwrTqvQVPUtHF1Z9ZCTY+6+to=;
        b=GsE8a00dhbEHhxqQhDUynkyG2eHgo0zAK3VdorQx9rsKJIlOEDaGKVxkth4ioc8Jmb
         oC0gesqd0FAr3CXxj4Uv5P0bYtqaP14pgdq9vivSbDDdxv/Cou5hZ3FJ8I/sfHncY9e+
         bFxjaZ7DGegQsKDUv8GooluyqAcTyZmYdb9782bTyPffTahEKVWscMz8RUSya98c9+tl
         XSA0BXcpXSyB0G0x8wRUCG3iExY7tulbuJZ2lcVtZDhjxdOGGJHZjwhdtbDc21I59dAq
         ++3Cx2v11N8Ym2SzvAPPav+T9WMaqP85BG80pibN+/8+cQ/DN+/BPIAwHr7TVf5bCkS7
         lY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU63bIiWT3MZ5zac6kJQyNM/1mgvKkDLiB2Scu+YaB8qPaJ3zYPw1Vqz6Y8jbDauZIUU7jMOB5bGv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6LtVZ/24bHLyBcccKCv0MyeuX9O4NPOI+TqezA/Aq4dj8CkvE
	p/UegodaleArIRGwwrFHzhfv/XvP9DUUTnHe5UkaycH/adpvghMfBp1IamxwisPpbatfAYvhG4C
	NtpUS1yWru6fWNCSNrxE1dpTJYMvu00BkJlOkwMc9BL9dL7RlM21qgyem0iohmgk=
X-Gm-Gg: ATEYQzxBDFumzqdsd6XIXSMsKfcn4VxdAsvFWk9m7UVflFHECWEErg0Qpx9CYehY+MF
	W1RfZq0CVPQRAMEES+L+zWQQia2NSlXKApl8dXiIpMF31Vk9QPiip1Shols8EtES/C5lv6f9tIP
	BNaub+u7ecokDMm/M4TQBvTq5ZIFTQf0Upx/YQmIMUO0T3r/p8BY69vutVEI7nSjK220XcTwDA2
	/O1X+W6SVdyxOlTua4QKQoObBx6p5UMru4Cd3XJbnLfCaE9K+IrxYAwI/NMWyRQrbtC2Ed+Emw2
	yw7LA2DrpxXUq7JzZU+JKKvKbly3NnyO1Iz4th5yZJaCZRdkie9gz4uy6ZLIFtNasHcMf0U0Lru
	b5PwKImsGRqF0fsnHi+0aPHokXMB8A3isDrYuruxh0ldv320zTbE2
X-Received: by 2002:a05:6a21:6e97:b0:394:5dc9:9758 with SMTP id adf61e73a8af0-3982df07e03mr2732901637.28.1772646091106;
        Wed, 04 Mar 2026 09:41:31 -0800 (PST)
X-Received: by 2002:a05:6a21:6e97:b0:394:5dc9:9758 with SMTP id adf61e73a8af0-3982df07e03mr2732879637.28.1772646090660;
        Wed, 04 Mar 2026 09:41:30 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:30 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:54 +0530
Subject: [PATCH v2 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-4-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Ac9G2p3i58-a3bVsIE4mnSEpTncD53XY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXw6fPVxyZWMxK
 DbIKGAQGX07LRmnkBzsoDkPBFuxeCKJ/QGIxDbTxs7iORq3RJVFhnFW7IqqIk76h6by59KcTHSF
 06QKRkMWQiyP98ju1aIStnZADHbfH4MEQLrejrTBjd80BIgGm3fFxTqUAyza4W6TMcOfALACmQ1
 b/3hZ3cboYg4UsPCevSXIIN/UIr6A/+uqDo69I5q7Bf2BTzXWrvwIMDGDdSgH0OGce7W7Pi+XZU
 1xkyTkLO/YO8vkEWb2opH7xpHUPdn4gKZSjrVJLcqKHkcxur9r9gPWkDZ25imdyw0Cl00e8OdS5
 LVMPsTHkQKoRBw9JG60KCJncPePb+Xq0hCzurafFnCt8pitTPg2VHjyTZ45csxLJILRm2aJ4NGE
 7z+LhhTNA5joHl3VyEe6m372k6lggxgiD3wmMsCGI7LvMzNzTemcob/T5G4l8TLeZLUQ2TjwFcZ
 23rhKVzm6Cs0Ca6Ug1Q==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a86ecb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=F2hG9-dZ5E7o3FMX4mIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ac9G2p3i58-a3bVsIE4mnSEpTncD53XY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144

Add support for camera QDSS debug clocks on X1E80100 platform which
are required to be voted for camera icp and cpas usecases.

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
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


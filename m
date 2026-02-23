Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656C83659F7
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848119; cv=none; b=tA8DhWMlPvxRVU673wCGjcqBf5UW0690KwGNWQ/a7lGsDaaOKk+x3iqmIAZPit1b7vFxCV+ztl70Y5vQ9ODncFj+0aHtRUrvp2m0GjY3cUjGoqggKhqd7zsn7K2aWztx3NKi93Lh+9q1ffAeHtJqU+5aYMm76KF3IDn3xPPdsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848119; c=relaxed/simple;
	bh=MmbwTnZejqoXZwYss2/ok3DTFscJl8ejhJtrJnSujeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPpiY3TfvUtH252hIgTS7SuBpivbGUntxaCBFCXjk0aH1CiTeKjlebgd7coY39r6UNydKgL+GjDMYLHcXCTPtLTDGW8eQ5CEGVfyi9dgQX5/yeLteNvjsAMIFJkLj/ApyBBLx4GDre5p0jzIX6DMYFnHSMYiHcGXzTklMtEiYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2QEzmV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KStDzeZ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2QEzmV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KStDzeZ/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWIP73733250
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=; b=b2QEzmV8phUetfSD
	E1Z1yqDI6UXJ+brnb8rF7lmkYR5CBPKcnbNm8cFsUBEmdPJ9ZxjAVtLt8E1JqXOq
	40fdneYkMXUTS4d3pYClOon4w44p8pwJ584MDZ+I2nhkvMyPb4XKwuLHEa24Lwxs
	qoHshc/pfnZC5TBK/7rAKhAG82FnYhFK+xJOXXwgQGhwf10qmlN/lS/8V7pA8jWH
	ceEfpzRPDmvRIDkF70m8nqSn2N7hXiK1/6asZyZTTZJMlz6OUSTGggLzceTjGjjj
	+EvXD+FesU69/nBjFLZoaXX78pQD7KejLMFkUsYNka8JWJeY8P6/xYaIu9e51Weo
	6BBmIQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t88an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:56 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4c27c728eso45625499a34.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848116; x=1772452916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=KStDzeZ/5iO220pB7BAFtE169nbkpK8fjTFTKWojMKZZAXATNTbWpJhGDsnVVqHVb9
         eKi6uWHlSmwy2ktMU41d+nXSuWgx8Sw9MV3OZJ6EduBggr7cm/a1Gis5jBGeDL5WXiKV
         BpEs5t7tMTmP3CcvMakGu2W5CmSzBQngunRf1ttJohpl8Hnnpsa5NAuGqcGftQ1wHtzT
         YhkLOyPWo2mXYAAsRtPN/sm/40OKUSyUDwice7eqoWZYbOcuHSSlbd+W2UibqCGTzPc6
         YAbKeZ6hyJjtNNd6URleEYhVnCr7P7xr1PIva3D+mRf5jyWuBAoL0RNZq/ixOnMgAbfH
         LXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848116; x=1772452916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=ptK5BhtwvCwh+QM7ZEFvgaVRCGQC8v+c6W58e+JZ3RFP4+acNYEvsvP8LPDTKypyB1
         W5OiA95i8htHU/kLliFkzGE9kDRIwRdUzbFH2BE5O4Ewy1N83Mu7AynVVTgFi7RwIJXA
         aKd5RfnxtF6CFXfy3vJfR7MmYd580Zo1YTpjk7zD1g5G4URFeSzbCkfQA8shZb8hAhTy
         AfC+E308pEu9yNsduspHt8vANGe+cK4soDYyiurNzFnahWwiSuFvLMvGhYjVnPseKf5q
         rxfObahPTJcjRB6z65ixDvYY/XHGRpu8dwljoFSZrEzqmZGQc7YC3nNRD6ermzFAZuh1
         JYLA==
X-Forwarded-Encrypted: i=1; AJvYcCWrXv5XZWz+lw7M4ouwzinwAy1DbyPfzOGTnm47ec5HvFAS8aprg3JVGLAkUA4WMrkEeugIzHVU9bg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2X99pAf4BS2FTcE2uB8NH8YX7J7xWMVC+TXzOmw/qG6ZP3rcu
	5BH1nEu83AKhJCX3H8Slj3PIj+5J3FKXaxjHoaEnMTpMn+E40TVNF35BHAeWt/ruNAkSfZuDv6o
	0whUYZC9Mm+0Z/uxgF0FoMK4Airm6YI0XIEFMQbfK1uY44+T1XU6nCNOcKxUpWyw=
X-Gm-Gg: AZuq6aL4yh1qATMTmENrDunuUADS9KxeZ0WQIoK835XPsGZcj+KGSSu9kfIxoRmlVy7
	96S2mIE2uSG8lPB7XZet8R0Jq6TerxCQWREWj6zVz5oYd6tmDuXtfdjA87KteOoZoXwkNujBu3t
	hc5od/rE38mH+GwMhv163pyY8jZF8pEhUMUxTZxv7JCJZHu7/CKib3NOl+AP/5ntQbtSHFy7U7F
	YAVqxzUqztkuFYSLLQNnMt9oIME6AiChgmiZg140XZSjW8tv8bsZC8yb6w2b42zOKtParwHsQma
	UPGHL7Om4gQap7CDXiF9MR2pXP9Es7Ho9Y+FZku7R3NiLg75tqZnBr4EYsi1Li1UvHWBCJIB8nh
	NtaU7x65Kxij0kXXfd9ORZWJpiLpzaw==
X-Received: by 2002:a9d:63d9:0:b0:7d4:be1d:e9a9 with SMTP id 46e09a7af769-7d5169e9cbamr5267124a34.6.1771848116011;
        Mon, 23 Feb 2026 04:01:56 -0800 (PST)
X-Received: by 2002:a9d:63d9:0:b0:7d4:be1d:e9a9 with SMTP id 46e09a7af769-7d5169e9cbamr5267102a34.6.1771848115549;
        Mon, 23 Feb 2026 04:01:55 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:54 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:01:21 +0200
Subject: [PATCH v5 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-clocks-v5-4-dcc66df713c3@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0WfDXTaoPjhSkdPdWPSYcrpiPi2RGOcbaSM1A3kW1B8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGkHQ24yOe9wHFJEWAM8TJrX4jh1DCqhifzH
 Z42fJNb0y2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBpAAKCRAbX0TJAJUV
 VtcjD/9F0+4XNllgAuDwAr5PkRbGdwY99GabxqIsd5YvH81DwbWFsISctl2j6pDYZk0Ug6B6W/A
 itdQq31aeNbb2GtAxq+v0sNfXzD51BxJmRH/t8CL6MVZHiK90uhtFgm/A2hSWrRS2lRahs3wsN1
 L8Wf04BrTGMLdUKcxfDHRyXyGzea7ayyGgwAZLiNAn/xaWiRAglj9c8FFnVarWWje6WimbAzvtD
 ooxXOOIWDT0QRLk84G4Ee56cHDv/Gt5cfg/TZ1AL8t+c7yNpoxGSLxSzIKH2+sZkPhiI5IF+CS0
 ilZP3lCPkVFSJNv7hh1I5UcO6eiyEUja02Tg+ceiF9zvoxyIvdhWkhofZtu8B5tao8QZAE3tNWA
 NFHyJYeQZgkDyfy4WaO7MvvLamhge6ltJXdf0oufRFo75SgHBX0ehMM0w4IwmTbGSMs/LO/6n6S
 b0wXsoepd7iHqaYum1SItVefvbgmX48xu/K5J8r3Ox080Z6h6t3H3DfUS1sKJzjaIODa+O/TrYl
 nBRHJb9fmQl0t7skH1/hydBylsK+2qen0zXii2FWPpaBAUSlWwaw0GL6k4MKXK3tNkzYL0ecj/2
 GY7mTOQ+pEuVOL9GHl07L3sv0kaDVvaTAb+UcEhGW6qgy9srcocEwwcxh70XOyIaD5Of5IKYiEN
 HVI3/1UD9QY9Zzw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c41b4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WYKAqXAjdBNwTyPbr-UA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: 5o8EflpCYoQ9QOGoDWVQaoGuTjnHPEkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX+lx+k7ExoVc2
 ztojgnXRF+4O9YsS/9mbfuajy2QhXePYQuXEM4CawGT6wVV2wOP9MVxDqXLdatiKRhy8Dm2clqI
 tDL/HB3wjTrrlKuT61lHR9zJwhO+x7FXuz9Sc7s34YShTylvtg6tQwO+R+aYRU7v8K7dXx81//p
 ID0leNCq7oSwxmarYM32rDiUPtXhE1VDaWTpKjMyY8nRXYBaVPB110F0+bYglO82V4RBoSu3lYU
 vNRmbXAFeDL/eyWROjB12iqOQbu3+0W/gqdWwuxCDoj7pc6tn98vZDV232OKvRbm5ZGS57CJNCh
 wibMO2rj7nuOGTJw6HTW0tQEAddneHeoetS8drpzWFexwsXWseGGmiozDKhToutXQvoKy/U2GnB
 s3KWJHRG8WWKguZMLkyn6m1aocF+cR+ZqPtHK2r+Rs2M8Tn++hKneZ6mYUIe8aiVxd5AGaRxt5b
 oEN5XP1cimNgp3jEl2w==
X-Proofpoint-ORIG-GUID: 5o8EflpCYoQ9QOGoDWVQaoGuTjnHPEkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..6a54481cc6ae 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -372,6 +372,8 @@ DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
 DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);
 
 DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
 DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
@@ -940,6 +942,29 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a2_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a2.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1054,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CA14418CB
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769588; cv=none; b=VjNHzdeItrJsXUA1AltaHe8vToQ45WEZNsqY+OIwuGf2GQcmH0QTD1zSNwT7wHK3DoUzLI/ILVNo67qsIDOHq2rYQfrpXN+2dpJ/397SNnz7tqF12r6WetPnHIr2VzRnHR0bo1ch3VsMFvGYjnrRh+RB+nbzrAJ0vKaCx0RS1ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769588; c=relaxed/simple;
	bh=N4FyLsi/vnMLGsG8W594EiPMPZHDtd5RYGzvBPKBmGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCUDOI/z0bNXB0Ja/sxSD7SbWHb2PP7n8Tr2cJg0s+Ds3vsCMBs757VSJej/XLbxi+M06vy3QZxbbn8LWY1hF972BjhbQJVnoB935BkAZd3qLJJWT/jKHgvdV5IlV5aK0L06PbccAmgNaFZmjlQXbJd6LKPIQOVa9d9hIIVkWJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgeBV6o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePC6lyzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgeBV6o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePC6lyzd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777XOR2668285
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 08:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMeRUk9VWt/DciSMuhzLmvU5L+tx6RdOIZmcnWooAHk=; b=NgeBV6o/6DHKy5T0
	FpsJc1ZoVj5N1/8Blyq1RqstfbhD1djgWis6RJNxwuXsBxlyywDXGDN/uHTCQrl4
	/5qTO/DvER3k6D9omp253eDTc248v8HBn3VBH30JWjHsVdSRDt33/aDTXcjlJ32U
	Jm76ytFhwY1dec8zN06boMF/zWTOhkpTR1Nim8vYvXx50wyqemrv9/ABDbLCgmDH
	fmp0X+URwnItHby+qmbbNIEt6ZxA43iJOlJYUrBREbSONNm6Ys/2ebPCewfyNO1A
	nIOmdY77jFctGNuoqnOtx3RwPnTOugrXes3/Z8adtagHYbCQGfnGu4KOPiqzHGDf
	L3Eiew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca5rqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 08:26:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so4131702a91.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769586; x=1789374386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMeRUk9VWt/DciSMuhzLmvU5L+tx6RdOIZmcnWooAHk=;
        b=ePC6lyzdIHoScsF85FS16O/3xa2eh4+cD9keOUZrDiZRZF8zLRrbE+vZv1Jv1hdd5j
         WyJvxXnqdYpT4HHH/QaZogXaBVHXwp7YlJtfWtXYU2YGXtAb4mSDbYVw6La9GXEVQY4e
         dgSGteAjr+mqNMPnxXQoQyiTuALYTFqlYNkja+A6FajdP3mNTY/pfa9e5j1PzZPPe6zW
         TObilDVtKX1y1g7Qg809k7J8z/oYIgiAesV9srDPBGfVGvv9lDNE5qqGXx+vewEetCp0
         ovvO+hF7bLeWbuTBeq0AST0ER0jCrLJlXsXP9p60DvyfduJwqJCx2q9Uj2FWF1/7CGVu
         V7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769586; x=1789374386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMeRUk9VWt/DciSMuhzLmvU5L+tx6RdOIZmcnWooAHk=;
        b=WKqHBoLEnoM5V3aJ4yXoMSDKj/W3nS8jAId6sTyxP/MLxiZt8HEJcXP5a2jIkEU7Hs
         Wa/JcfC1YRRD1LPHMuXi+3LBAE6C2kzHo0vTxK4ANaJtjVnnRtcMxmjcHJb8JAaI3uf8
         G76vF9H1OVcAqurDxe20EYJ7Vi35VNw8C/9Qt+5+4wXUwnO17QGKhWhttBSgZ5PIhCK2
         3Uik3EpX2vdFu2O1u3z5MRJd96xyjcKsjJY9lGlLDPMP/pXcyeBn1gSJJx2/vk8vqU7+
         x+hfL9PkMVihcF3plF6eaQl5y87zaNa78DoYUP4DDQGUfM8DneoJMHxqPpd3fk0VRGwu
         401w==
X-Forwarded-Encrypted: i=1; AKwUvBwUbxKaYlJGZgnvrncrkDJpqsKCQYXUoI6Pu2ght7piwCCgTEwTUuaVzSmNQArjSbjm+MpOZ9/qAxc=@vger.kernel.org
X-Gm-Message-State: AFuF++mT3TD+iy65Jp12hN9lcVtNnojZZreFiJfsQyvCqQLy3+wOGl1M
	kkfmRyiSte63YsZvHxoo+h35VvkKj/mhjKhcJUUcJu8SASDnl9UZO8avTSfrMgTyrhUnG7alebJ
	TH/5f7Wc68Ab2bc61Usa4nW+K7aFF9FhVpvyVtqZFyJy9A0qXnRvQ+J5gagoSDhE=
X-Gm-Gg: AYBFou3bH0yGDpOt3KRFcku1IYuukPNBgg7UMMUD+GzrKXmcKO3A6zaliUsBUaooDfN
	tM71aK5ciLC4Z3JwyTnDXQ2iI58RWGBnGyaPS1D3iQfxz0WOlteHhgsVVTDT3cYoEFVprMl1diH
	IVyG+o3OAo0vz2jAx7scFSVxYE3vVwzu+ABQf7aw2kBxSoD9Y9AMKAfF6pD0eho2dXw6SfuXUYX
	7e1hKDLALlN6nJbj24XNtazGQ3Bbdu8FBvNE5L9BIiPQd2uF4l5PywkYPKyyLafR2rJTAo1qhFi
	Dkmche0JYprLUWGJ0E+/fi9E7z5vhwc5qJOdu3uMbYG/trqsPjr0Q6Wkl9ViIaHhz5MSUiY+xB5
	/UMzA88sTuE5NjkzWc3SAmzQp
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr35780823a91.24.1788769585566;
        Mon, 07 Sep 2026 01:26:25 -0700 (PDT)
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr35780759a91.24.1788769585067;
        Mon, 07 Sep 2026 01:26:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:56:13 +0530
Subject: [PATCH 1/3] clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL
 width
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Of5yfiX7Zg0mVQK5SreUxsYxZbAMm9_H
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e7532 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iX_rjOfq5r2Sv1zA3QwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Of5yfiX7Zg0mVQK5SreUxsYxZbAMm9_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MSBTYWx0ZWRfXzHLUQpfYrgJ/
 JKI9+uFcAbX3xFHoEagnBN33l/EuAEEXJCFxJRJ1yYwXVOlJtDWgglRRhu5Nrs/KAwS15Um8dr1
 8uTKEWMjZSIXuYLPF3DF6dZEQlm+KqAPdYAyWALbACCLbKXSPHv134G1HofKhzxN83rkoLnKhrx
 xe/ScfMszlRASEkn51sbLrN/DyBnSboDRazwNy2v59V0UWjkQW2xKLpN5XTL3UbYiWOi3k203z5
 RxNT9JtDMzdf4tW9Yg6h7YFzCI7VhLPivLhtF6/Jo6DhQFR3Sd0H0j/Y+zgKLHcEwFNBPaBQnpg
 THy9WN5+vVgA8wisj0Iegndzvx7M5crLfh72dRBFLp8/Tv+WF8FYkesVKMNi9XIxbicaE3SoW/E
 XEGmgZHCNEg+WVDm7eHKaBqyvnw4P3cukOHJL+F86r8ML7IxIdNkbw+ObpqnK6KxQxhUQxha87M
 zre0enz+pJKU+VDisPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MSBTYWx0ZWRfX0CiBsLqZkT8W
 95K8IBcFaGtsmesUXH7b7KCiap/CUv1biGdiYyIVzyjsmTNJqrhFJ8OsLhqVmqdkDBPDFMfoLbj
 w8RnX3H204209v+/EbrM+2LCF2dU0A4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070091

On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
carry the fractional word at a finer resolution, for example the
ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
however, derives the ALPHA_VAL width solely from the register-map layout
and can only express 16 or 40 bits, so it programs and reads back the
28-bit configuration at the wrong scale on both the set_rate/slew and
recalc_rate paths, making the PLL lock to and report the wrong rate.

Add a way to identify the wider register: an optional alpha_width field
in struct clk_alpha_pll that, when non-zero, supersedes the
register-derived width. This feeds pll_alpha_width(), so the recalc_rate
and round_rate math scale the fractional word correctly, and the Zonda
set_rate L-adjust MSB check is derived from the active width instead of
a hardcoded BIT(15). PLLs that leave the field zero retain the previous
behaviour.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 7 ++++---
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..981f973da02f379832fdc0cded3f2b4cae5879e4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -382,8 +382,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
 
 #define pll_alpha_width(p)					\
-		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
-				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
+		((p)->alpha_width ? (p)->alpha_width :		\
+		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
+				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))
 
 #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
 
@@ -2290,7 +2291,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
-	if (a & PLL_ALPHA_MSB)
+	if (a & BIT(alpha_width - 1))
 		zonda_pll_adjust_l_val(rate, prate, &l);
 
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 3a2157bebc52cd15f55381a068953f21be18f6bb..ab3b4f4fc7501df0fa3f59d741d64646383e4cfd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -86,6 +86,8 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @alpha_width: optional override of the ALPHA_VAL width in bits;
+ *		 0 means derive the width from @regs
  * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
@@ -95,6 +97,7 @@ struct pll_vco {
 struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
+	u32 alpha_width;
 
 	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;

-- 
2.34.1


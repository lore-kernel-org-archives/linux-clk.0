Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A146F4BA
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711711; cv=none; b=Xh1M5I3U0zBktLdGm6n4oEIv57HGzumVR9O/stebtCX2SqF93AenHwzrp1xN6kXn4kUCXBXhtN1Zhxb2JUCXdDiGDCOFK3XSTWM8IxODuMBVz5F/XM4UMoXzAFelOtfRl1FKiWsyKP/4/Gc4urw/v7tbbaIizbilCAsGhyVyZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711711; c=relaxed/simple;
	bh=NtUxYOq5wA+7fchoBStjIVzIpRQFswrF2uRB4I6rFcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSN3ro+Org4hlaEU3KbT+Ge24W9MWuOYcp/tx/g0rUXqxUl5N/13kadz64YTFIW3+Zq9ciY+iu8pGTekhCp3FJsl5WGZTq630YGA71k8kBRr7EFEhpj0gpCD0aRxiFjVgqNIranon8amJeC6O087T8haq6qdLrgGOTLuEt6uGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH2rJTPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtaZ2P2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH2rJTPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtaZ2P2r"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb9tI1330854
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPeygXLLeo1e/og2dH46Bg4cvE3RC2lHbXRTNfeihQU=; b=RH2rJTPE/gsc00ns
	xYU7fxtkOvjHCB0V7weMzBX4ehBXlROcNZSFGsyDTI3V5YY9VhXFgkOXtP+f3ib3
	iziCYud2k52DihgXCVDUft4vxc6IKjOPuDPp+VsMtKw3lW+T8ZuvBC8nRt8dtEOS
	EzRlTbbuNwpLL7GQC+7dcJxzc4mOOQ5sfbhJJHaCiezIZ/mSD0YDXYBhpN8czBcL
	r2WCrAW6C2eat+KRjnEPKzJjLbRl7oOTSTnoxOi91Vq+KgRDPVyPQ3KQ/9Y4HIru
	Q/46z9+274snz/EZbuVtkTjCLu6E/N0gshXHujQNFPEihOoRbRab2P6IJGUV3cUG
	b493Xw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g21d9ghn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so1872526b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711699; x=1787316499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPeygXLLeo1e/og2dH46Bg4cvE3RC2lHbXRTNfeihQU=;
        b=jtaZ2P2r23LxnezdfG+8jIoDcDSfZqlS539Q8ip0fzYZF0FBmKhJmjXjys83pCJw6/
         kkH6gMhfMShSAapw1yCYs4f9CM+8o/InoiFtwGGaRyJt+bkuy88HwikPEOXbXzi3PUzh
         nkdiu8T48IKlbZ+a/b4ZTTu05Hdi6cytb6gxGhS+LfvsmEC8j4gsTYgX3pglXNLhJuwB
         DaV/RO6MATv2DOPZqrIRD8kG6MKkXOrfMSXvcbt7UgWuOY8MiA8UpVv2Bd4j9UmUn7vQ
         /jgAA5Bv9j2pOnNpSOZDQ/wTmzLZv5kSQ8ffWUYzfPp14/VmJ3EQj1W6J2UPu08HNncW
         rITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711699; x=1787316499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPeygXLLeo1e/og2dH46Bg4cvE3RC2lHbXRTNfeihQU=;
        b=HsmWfSTf/j+z/WzZnqk5GoStdzLUVOqkgbYPt9QUsk6XwRYtKGO5gXuiiZ/4lht99U
         hbLpwZsvndYbuiaYsUKzWelOxbohUcQNSjlOM8/DYAgIzF8GTmIT5DhyKwD+OpggaA8A
         F16AzrMnN8CB0/yXW1KwIiPJNvkK7Jyfcy/nFAwDNxWxRoxwG9IoSBTpeH2h0gPDa2YM
         ZJodlY4gy1FIqASqTOfZmKFfNWJrsjDaiPWnBIGU7ItI2SHFsKyyakSgrr2liufI0HSH
         VR98DKLEvQUjiIqivaELRKzJS/IQysVQzW+7UEx7uGlc+SWPk7wwLx5oQAA8kOWUvwGy
         iI+A==
X-Forwarded-Encrypted: i=1; AHgh+RpSerV0jyS9EDsGivwwIe7UpAYWO1NDPbe66ue0oHL6enSm6r1aMVFUbUzcLSeRMYUC3M2JaxfjgqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweBepNh4/y0mhKsu778WAGXKAbcStHuARk8iDU6Rw7tv5QiJk7
	DolTLR7b8himq1yUxvfqM2/uqX4rwZSz4zVZiT78LHOG2Ss1e/O1GtGM1dBRSjBVhwJAvdRKds3
	BAwE00SSiOddoTR8sWzOafUwO4AFI1lSj+ZUxRULAQ45evXxIa2pQMDU+QUYorwA=
X-Gm-Gg: AR+sD12jKRkTJO3SdJreTRvaGirUaZNPBerLL46bOem7vG/DGXEee2mgOIaNXqyZdvm
	homjpSDz7CNz2YqKwiXUJn/dIt3UYQbkT4casdfTMo0KIGxVstyYAQv6pc9xPXSWzunNSH00dU8
	FbkuytUvIMLbKhYnOItDbjnqvCfUfFrSs7Xxn2VafhNQzGucCk4dYsPHYYw+pjrV0SMZUcs2htb
	o38ITPrvdlUhTul9yFAihWwCCmA1MIkkFIQrAY6rfVjgICHmgNpjDoBoIA/E6c8M/4EyeyfFMaO
	HhQfgvNaasHIiULQ4eBG4jKutlmiLdFi3p7p5pt0I4TbKD6Ij4NK8Zq+pFVA2FXJ813daTVvDGu
	FwgrWLGhb+WBl6iJu0UYRtIej8XfIrQ1pWXi3G4TmMLc=
X-Received: by 2002:a05:6a00:2c97:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84fde1af5b9mr6346086b3a.16.1786711699285;
        Fri, 14 Aug 2026 05:48:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c97:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84fde1af5b9mr6345996b3a.16.1786711698639;
        Fri, 14 Aug 2026 05:48:18 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:18 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:13 -0700
Subject: [PATCH v3 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=3107;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=NtUxYOq5wA+7fchoBStjIVzIpRQFswrF2uRB4I6rFcg=;
 b=Fy18cu2veV33m5V/4BkPSyg8ppzCODvyKpLif05iN9IIs23ueifEoSD0yq/fEFhOYQ3PNZ217
 bPSGRhSyDfQDwJ+VZKsA22+6fayfb4dK0hU3mpAH/cp4NgIzd1rNdXV
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXwnuhbuQYU6U9
 9cSQdP/8TosvFxzlXWC1bNHw5fRKBZ65sJcVqJou9DVhEd5tDOkZzVf+9mmUPiwExRHtWvtY/kb
 r4WOWJ1BQ1XnQGrVrqMfcGkU19Zw5OI=
X-Authority-Analysis: v=2.4 cv=eqzvCIpX c=1 sm=1 tr=0 ts=6a7f0e94 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vx7U0BMSOfWHh9VQJyQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: VKLFJ32FZ2QYz_eXStLUNnTAc0EzTNOf
X-Proofpoint-ORIG-GUID: VKLFJ32FZ2QYz_eXStLUNnTAc0EzTNOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX2U6YFusVCiPD
 zxhuU0ZwJHB9/LnZQwJuYh4iLfibi8HjOr5naU//01VRQKL3kk2ar2H++wctaxBzj4kmACwOq6R
 gwupnt/bm5Q5nLk2Vbj2PFWHLKdK5THtPNf9+DuaYvaARKwNarMUBQB6P3VUV/vOzLMGuE5SFDw
 Q4Ia7LX1xHBgufhQrlA5l4JmtQzSZt+r8lq/gY3HhZdpg2t2LE26BLxO99hOPElYTfoZ+E4cRkc
 W/H/3waFCKed2sThe2z7A1dOD8/OB/QPyDFLh6T5HAj6Yq/PKqof8EZWDaHQsz1midXGaw8yblB
 FVyxY8s6VlS/c1lO772IBsmpKxpkDO+j5srpf7UzuK1nQq7IQKlA1yn0vDZVSX+UW5yZN1cKwLa
 QDp1vHJVQ8bd6JyUAMaw8SZUtGkLdtB3NX3RF2xrPLnr9GVaBh0cA/lIDXN2xsdf1Qy0kUInCGD
 Cal88ruuME6cU8QPUfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

Add a flags field to struct clk_regmap_div and OR it into the
CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
divider_ro_determine_rate(), divider_get_val(), and
divider_recalc_rate(), so that qcom drivers can opt into
CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.

This is additive and backward compatible: existing clk_regmap_div
users don't initialize .flags, so it defaults to 0, and
CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-regmap-divider.c | 16 ++++++++++------
 drivers/clk/qcom/clk-regmap-divider.h |  1 +
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 672e82caf205..6e12aebf14b6 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -27,7 +27,8 @@ static int div_ro_determine_rate(struct clk_hw *hw,
 	val &= BIT(divider->width) - 1;
 
 	return divider_ro_determine_rate(hw, req, NULL, divider->width,
-					 CLK_DIVIDER_ROUND_CLOSEST, val);
+					 CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
+					 val);
 }
 
 static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
@@ -35,7 +36,7 @@ static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 
 	return divider_determine_rate(hw, req, NULL, divider->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+				      CLK_DIVIDER_ROUND_CLOSEST | divider->flags);
 }
 
 static int div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -43,14 +44,16 @@ static int div_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 	struct clk_regmap *clkr = &divider->clkr;
-	u32 div;
+	int div;
 
 	div = divider_get_val(rate, parent_rate, NULL, divider->width,
-			      CLK_DIVIDER_ROUND_CLOSEST);
+			      CLK_DIVIDER_ROUND_CLOSEST | divider->flags);
+	if (div < 0)
+		return div;
 
 	return regmap_update_bits(clkr->regmap, divider->reg,
 				  (BIT(divider->width) - 1) << divider->shift,
-				  div << divider->shift);
+				  (u32)div << divider->shift);
 }
 
 static unsigned long div_recalc_rate(struct clk_hw *hw,
@@ -65,7 +68,8 @@ static unsigned long div_recalc_rate(struct clk_hw *hw,
 	div &= BIT(divider->width) - 1;
 
 	return divider_recalc_rate(hw, parent_rate, div, NULL,
-				   CLK_DIVIDER_ROUND_CLOSEST, divider->width);
+				   CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
+				   divider->width);
 }
 
 const struct clk_ops clk_regmap_div_ops = {
diff --git a/drivers/clk/qcom/clk-regmap-divider.h b/drivers/clk/qcom/clk-regmap-divider.h
index e75a65c3839c..4fde766b2633 100644
--- a/drivers/clk/qcom/clk-regmap-divider.h
+++ b/drivers/clk/qcom/clk-regmap-divider.h
@@ -13,6 +13,7 @@ struct clk_regmap_div {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	unsigned long		flags;
 	struct clk_regmap	clkr;
 };
 

-- 
2.43.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE445348D
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085615; cv=none; b=WCBGd+zDQeRkKc8oBcyCgZ3TfBGnZ5FVqqD5TKnphcqpxaRdbVrMDeT5fYGQ9qdGgaYIipwH+tVF13oYDdJJ5DF34flU6oMeKvfgYCtpCcanPXEFICXTpeGTryGPQANz0EVpTBD+Z/berttKcWvOaVO2SaxEW+jDnCkBNENV/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085615; c=relaxed/simple;
	bh=uxbVpH4XlgrAkvtkrxKBvgSlTb725f4BxWp2snEJzAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOWz1qIdp/UoUR0j5QvzzoY9jSQGDdcJDaKgu10VcZD/Um6E4uoFphjqk23CmT494lTB29mKnIus1ANvw4rkK3zKdBZ1Du9iWSRBrq1i1ZOQeaLlPzw3H9a75mSiIRgyoH6bI1UPrntUxSN3rDvKTyuyc2QZKuSjaEH9nLdQKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eo/lSIjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIWopNuY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eo/lSIjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIWopNuY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GfEk3564270
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4PxxNucofvFVMVtAbz1rtb6qji9/2bwiwKpuUQZ32wY=; b=eo/lSIjAi0smDZ4j
	bNBsy8JrrvlqBEDd0qeq359juK3/0TYpzEPJf3iwvnVx6MBMd4FKgE2LHHMXQht9
	PL5WaiaunoPIo/K4jAPY2NpE7/xhvJc5ijZAqTVYwaT9igILpK6j41tPvhIQl5hv
	XFGHobcOwoNNGxc7cJCL7ic5RbNQYvwYtxHJD2Q3CtjZjQF6GAamxWwiLZl3QUy8
	705gMx+Yjnc5LMsDUffUXB3/oKHwvRcX2I2phzx1L7e0+6ZrkFOZnSIifo+mDnkd
	dAT/IvRedFAO9oTmPpiVRus8xqT9soE6y/z0e1s5ul5QyoHP4bRR6C3NAJlZC3KG
	tUj8Og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jtj7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so4489795a12.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085603; x=1786690403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PxxNucofvFVMVtAbz1rtb6qji9/2bwiwKpuUQZ32wY=;
        b=PIWopNuYdweCKk7gng5E548x8Gv3qw5dl9O+rGNMZqNg1vaNs6pqJZ9oMsM+FIDCgD
         fWwC0Q9vFGeIttbL7vaF9XkRLvaaGbfE2k4xt641hHKtuYKOMsnahiwT1VehkcPoMbU0
         a/eC4xm423yptLvpNEcP0c0f2SBNgFRwcwcWc8TUegZqJGFczaf+C5ZO/2wweIWjzFLp
         mFhsWy0hSKzj5zWPdFyBFI9VlXV9k3gryH3+LQ0CaLU8OXhsve1MrJ9YF30kRGtCjDSF
         wTGiprhSetqCj30Ede5UfqmxUq4CvpDqY/26OsCOsO4t0M1Z6KOx5ZqNhFzCkR8tUUWR
         MMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085603; x=1786690403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PxxNucofvFVMVtAbz1rtb6qji9/2bwiwKpuUQZ32wY=;
        b=T1dzIoqtimKGgP+XVUsAlfK1jSuOyoa8fFNVtJZk8FdJVgu+XTueISF6BbwjzVcp6V
         eLZy/IXQGcyyr1FOXZijS2/hW28iYdzKLCKfya1dzi+R8t16g6tMpwJ6Dh8PzJr+ZFzw
         pMfi+wMBN1kgah71W3xE7NPuXTds1bhz0CTcnyFIp8grZ9Leok/iIG3+Q5k/IZHy9bdw
         nPrZPj2V/JlXbB0zvoSB7FVIfG7MOP4ZHAxaaUEMm0ueVjfbb5Y8fOd3eguneILCznlh
         eg/XrXDIzd6JScK1EnF7Kcz9gs0R0AkiKNC1FlchJ5VMwNC9A8H4By7PwHxToXcZPREk
         oRTg==
X-Forwarded-Encrypted: i=1; AHgh+RqSkucH9rbSWsnd8H8WLurle3ZffOYJq2AOQcW6YtTilkEd8Nr1HiS+o4NtSLp78UFsDCGWZlBpRj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM3IbyfHQfwBnX5BcyLx8XRRP7EqwRxQQvmTAhZRtxZC/sUFgN
	G4FJoffWHkzrP4541jbKxwZW8HiUa5XIlZyYqgWqIoKzcbIm0rTVhF88/EOoQ3ooqcrYi5f//0Z
	AQejz5p1yYXUmItSFIFR8NljlEzlCr0lLiXNFxMUi8j+zLbxh1PmoQ41/w0HvK+w=
X-Gm-Gg: AR+sD12tOu65ZCb/PCvX+JjC8NY8LIjk2sLYQtsd/mlK5LqmWnXOwA/4tX1DafetaXY
	/XafEeJOKx/zmE0rI2aWQTvOGf7pnktlNhdojoZCd61X5WySTT/nXwh9trBHMnk7G4yIUAtXJ3s
	oC8E4BVRjvSJ5NVHJKZqF83LwwtJUMKlUHNkYGhKaG/Hy0hjJlhZLTyl8wPJ7Wpucgk8POs4aEt
	6y3mTBxd52fR1orSOntq8mNXNr7s4oKtjF6KnEgPMbw7PdVPZKb0/UQ8WlaE1hy5BVO/jaGADxL
	6V6Lgey+kPZyMFf/aR7YtWhdNlh1AdkyqEUr1lgZPwjsOAvO7E10ln83mlXrQQAyPfdnUNNmtsR
	rKqKJC2ZwZmA0K14fRlBjazjtpHgLyDHaiK2u8nmEaiM=
X-Received: by 2002:a05:6a00:2ea8:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84f2e0cc746mr22037613b3a.35.1786085602996;
        Thu, 06 Aug 2026 23:53:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea8:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84f2e0cc746mr22037567b3a.35.1786085602592;
        Thu, 06 Aug 2026 23:53:22 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:22 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:08 -0700
Subject: [PATCH v2 04/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-4-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085594; l=3344;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=uxbVpH4XlgrAkvtkrxKBvgSlTb725f4BxWp2snEJzAE=;
 b=Tf1TSlNqRiNlCIfyTUuTF+aD6By4zFIY6GA5dcNX1SrDsUb1lt6LRwSLnumR183W0L61kLHOa
 50Y6y8gkATXChgk4SAd+UI/15C4RlMxi7/YQJsuZN/38HGPfMYBz4kv
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a7580e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vx7U0BMSOfWHh9VQJyQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXxKBB4WBgCZ+X
 sI4OHWA+pvjXcb2RmgKfz9wmxWFy50OQ/3azhEMVh9M/iHVpffE+c1rVZIr/p6iI2qQTVbXHFal
 MY1F1bW8IzHzxMibQvOGRCqsBdb2rwUYm1kinyJA7Pn4Djl6MpdxStVKSBDtTHs4mfquuofV2D4
 L4GXsTeTbFDWMek9H3oidWn/6ge85KVuRprc4c7GBB9G1/lIPIjBrpieZi+UlY5vqP7pJKr3oE3
 ZKKY5bIjNfoqAwO0GUoqbSkwcw4rGSOomYbFEfn+oaVVJfNzUF2GFbdN/5unVbaJmXlLE2AWEus
 Y7aqoEkqily+71I21lhhPK5fWNqoWnT03OjifIXvmczMZ85Cuid5tBCfn8OcnndfjLN4ed7cgaC
 ohIGOiyzmUAVatrc+6XoCL4eKq7exg/098gwfP87w05NIP3gS67VirllJgWJV2VM8g1HvDS7D83
 cXXzIkNiHKnPw8hsA3A==
X-Proofpoint-GUID: el_38AwUadzx_fq2a5HYsORvYrAmNa0j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXwMx3frdcDM/P
 xRECEvCvLUF1pO640aL38/m1CihgFzx+EH4ppfVIj0kaUZXchAE6+bz/OgZap41ujVYMyTMbUCJ
 bwyuAjKIho5cXbAWYNGqU+5RNylRusQ=
X-Proofpoint-ORIG-GUID: el_38AwUadzx_fq2a5HYsORvYrAmNa0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070050

Add a flags field to struct clk_regmap_div and OR it into the
CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
divider_ro_determine_rate(), divider_get_val(), and
divider_recalc_rate(), so that qcom drivers can opt into
CLK_DIVIDER_* behavior variants such as
CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET.

This is additive and backward compatible: existing clk_regmap_div
users don't initialize .flags, so it defaults to 0, and
CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.

divider_get_val() can now return -EINVAL once a caller sets a
divisor-constraining flag such as CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET
(previously unreachable, since no flag passed here constrained
_is_valid_div()). Check for this in div_set_rate() before using the
result, mirroring clk_divider_set_rate()'s existing handling of the
same return value.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-regmap-divider.c | 14 +++++++++-----
 drivers/clk/qcom/clk-regmap-divider.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 672e82caf205..fe4542b5bd58 100644
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
@@ -43,10 +44,12 @@ static int div_set_rate(struct clk_hw *hw, unsigned long rate,
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


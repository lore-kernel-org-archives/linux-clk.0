Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50F3DAACB
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704298; cv=none; b=N90KV2hs2F6f22f3FY8rYI2pL9Bz1iI7PTV7rbl1FSQfuEydMeaCf9lSxA6bVw+1RLnz8cLsGPCnFbZ+cGBDlyZe7Ya5FdX4K3x26tj7fx8LwYdZ1yNPlG1Nef5YPRbB4nYSWl8YGMyYGcIX3Q92IoFG7NGDtH7RpFC3I3GCmtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704298; c=relaxed/simple;
	bh=jkU+fUoOwa28jJYemXg69Wlafd0L7CgVOA0rnavRrGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E76B8oWsx/ncjnxzdslr3tbRhKEq/ksno66w+rhcw2XnfLB+trN2nm+Vctd4WeJ6owcgMZ1Gi2A3CeL2m/ypIhMFUH+eaJFMGsM48EU8yO8SG9dMHJcY9p3mUcU6t65ZATOZZQgokTwvpLH3vTPiPIY7CBQUYnaZbzSurLzhFiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ans61Gzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haOllgaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ans61Gzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haOllgaE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6861PK45258960
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 14:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=; b=ans61GzsC8q0zBdo
	RqsQrH8ZxWT7Tr4kVB1D4Ne5U/RUNrSdDTtXrv4vFzc+1qosHt3paPwPNqfvBbdE
	k1tqm7y9kB16wtnrbhJsJfdVUe4p3g96UY9j7YDZAK1o3VKwM98ZMXyuAnFGk2bx
	i7EprEsMKdfSM88j9v5xBlGvn4ZWrilPU+QMVH/XC5fXZfsN6elnlbRStXMSNA+t
	4zscfwXFsc9cBoqPPiRwH/vFxau0AAyzxSN3IpRtTLbQlwI3MBVqXKJroSWfFxUf
	ZOSkyXRn9DGEijyWKRA6gsD+dqe3j0Wq+2Yopvsuu+LFBBq3+ya/ztMJv3AzhNpj
	oDBjCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany3gww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 14:18:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so4415085a91.1
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704294; x=1789309094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=;
        b=haOllgaEXg36kInRpK7zexSCi4otbfqItQXZusDiMUc6eVlg7YUheJGEsr8UoVVIhz
         vneIWUR16wRlQ42IStmW29jdFfmJ3cwUWcP+ssp0n4YuYKYvbe37cjU+qsK4yXL1r3UC
         6YD841JSk4W5YKhhaJj2AoylCOcbrINQemMwtxYyozldry+zVfqdoCBEAWrsEhmFlxaF
         WNgA9hrWcsVL9zEe4QlA7AdiNNCeRuD6giTPbeAa/Q733BdCUC9fLpjCblqgezGEveEm
         mYqJQudnV08/kfk52876ECTc+05TTIp/JQsQfKF/nLRNl/sgG/CH+rBruJdIBhC2tMtN
         nIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704294; x=1789309094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=;
        b=cU4cvzHMQdDbWGqadK9I1c/vwwuOb8A162aqMiW4LGAUy8mg+jzIo7RFXE6XDv4bMw
         /BkgUrL2NunIijDA74VZkPGOBJrZdaDKgbZJtDbohIEmho9ixxcBpn1bmf4rVVZKGMVH
         b1U5m6rvViNy24J40skyB7GBJZz+llGATjyyiyfVl+XSkt0H7JFG2MkEM5q00Ra1G/jp
         qb9g/hkyGyiMsieh8OeMn/A3E7FudWFWFyPmCkohKs4L2tKe6G8oev/LJfRSukEy7abF
         AH/A3YzUh9MqvANFPhQTpC5hn2wko+zqUOXX+qlKo2IuwtPMzSxr57WnGg05QFYRpVhl
         tgkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1OHh7n8C4ZDQDBC00bX9NHVpHQmCVyNiVI95Xb/YxY0TW0IArB1hHJYxa73f6M9xNkhR15ZAj7jc=@vger.kernel.org
X-Gm-Message-State: AFuF++nehFBYqn2UXN3eiBAR34YBgoDJk/m4QdLVSn+oYbJAYtVwUjwH
	gTfq1pIBvszxYoxVsIOQwnL5YupgUd8pFMdkV+XTxmaLSd2+g2BLkvWk9QZkybA/DpS4YiT8diK
	cn0eTLSVq8Olg3BH0HE0NPQ3+YVU1qQFkbLnXMy8E6MpH1LZi20wrpfMm2ebeYuI=
X-Gm-Gg: AYBFou0nXhFXacIiLkSckqezPQHUS8okcJQgciexKZxRjLAiDYJ6wu68kBtzO8/R3EC
	vhTxKisKQDWBEeL3Gx5jCj702AQPpmWGBX+qH0/NFCmSg3p3gZ6XhOUdoQ2gB6vYhuzTgRLpH/N
	4udezgTOMMcsONnYxAIWZLBQO21ukoBrLcvbifISGC29LRd1ieGJTtMpfGNwp2/5ktXUewfrQeL
	mfpOafZmAU5p/zAlnptpluNSJ5ho3vbP5SuvwBTWuOcyvxZCkoahhuqN2PI6X7S2SgOR+ZZYVil
	i8ov/iG8Gqq9fHKqTHLTMtVtp/4JX9yqh1f1fMxp9oZ1gkEQ2fzwdsAHNELeHQiS4iAgfVQKZg+
	NxX2Uo8Ozh3gPf7qcsyP2nsssd/lPnYXypFzTOFNE74Y=
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr15915445a91.18.1788704294380;
        Sun, 06 Sep 2026 07:18:14 -0700 (PDT)
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr15915386a91.18.1788704293965;
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:09 -0700
Subject: [PATCH v4 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-3-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=3160;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=jkU+fUoOwa28jJYemXg69Wlafd0L7CgVOA0rnavRrGs=;
 b=j2leIUEhfSDDDrGD4b8B8t3cw90gTQJOvq/BrwUvMJr982mw+sKUjJnDXhj0PrOBZGX5BsJQ1
 dNuNJ7Rh6n3DpMKWk7k7BgWvG6lOa81O+i4zfvLjcTeAktcQKL/b6Rh
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9d7627 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vx7U0BMSOfWHh9VQJyQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: W6CeNsixgheOS_1XbPjHUvQgv-uGF64a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX8HiG975xcuyt
 p07X+n0en8UWH+Y3GRn5+ptdferDrwl44Ld/hk1R0NIvx1tGpBjXyxJ0cZJUHIuX5al1GIk/cdO
 UR3tbRZG0R3s+5bjs9v4ZIipcUE8aPX+DwUfmcTTX7oALozqMP62yAAiwaTW/C2V4VxFaHp0xjG
 RjKv2wyGxABMi42Y9Ck3btoog7/0sRy656RD2zCmouZZZ3JM/ks3/kutl5EziyNyGaohCYSzCXa
 1UenCykPLmLn/+9O0OMMOx3n4j5VQOWgQmeBu9gSdtuKnWYxdgSU3zWWjnodtUQXHIwRatQWvpD
 3xDJl5m2PqaG9WVljJ3UQtSyjKtENcwe8CEl7UgBqfnhGQoCpVhTIqVW0fFiA8KI+inl7SlJCfJ
 xtn1v99nlSZYT711GuYxdUx8iI+xa8e2zbqGg9Zn0zoW4AV3MoRHXKwpnU0zImOPWbpmOZc/0Mo
 qR0bVHkMtx66Wy/653g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX+SMurmZB4yqa
 EVhkfJ5TwbtA49jlADY42KuF+xyj0us31ivIKkXat2Y/DNNokQtaMPhBmlYeRbw5DPk4j/ZYT+y
 BJ1IZ8nePfTYfGOIuQssjQ/tkY/AqXE=
X-Proofpoint-GUID: W6CeNsixgheOS_1XbPjHUvQgv-uGF64a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Add a flags field to struct clk_regmap_div and OR it into the
CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
divider_ro_determine_rate(), divider_get_val(), and
divider_recalc_rate(), so that qcom drivers can opt into
CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.

This is additive and backward compatible: existing clk_regmap_div
users don't initialize .flags, so it defaults to 0, and
CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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


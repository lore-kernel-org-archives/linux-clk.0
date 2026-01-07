Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5D265CA8
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764117; cv=none; b=rdQxY3uenxbtZUPoLdEtfRNmQZg1DWjVKE1DcFDkJJjWBnLHtpsRtS0jB4112gUCDbnj3gVLT9IcPn7yurqwLuPbMECr1AqzQBek+HeLTuuFVKdg8Y4I3x5UGz3ukKVM3GWbm55vodbAFM/oCdAtgKOc3lH2EQl5FHmv209XYcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764117; c=relaxed/simple;
	bh=6KcYHw//2sUplPbK8U1Bd+hDAoWkJLtkjZfQ8HvTz7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Of9AtpmK7vS5/y7NPMSWRBCYg0XSdiFT9CuCgndd9ddiYBwftJ4ehCwHvQZkxv/mF4qKRQar/JzmAQIGtNN0Zr4ZH0SFARy8m2Owd5WDGioj0HtjbxTlWW+yQ0dMsiUbieVSOBPNauKHfNuZ1mMUWs3QS+hhVA3XN1GBdqr6jCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHSkDbrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fbMzPkRd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHSkDbrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbMzPkRd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6075VSw24048735
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 05:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gaj3FGhPYKk+8z7S9CPgUXh1ipZIspnmHtAZVmFliws=; b=lHSkDbrlNFmfVPed
	qXmv0wshmHvZ5jO4lFQWFhKLEtrsToLfHmUWlaahTgEe0dH5i/PbOIBHRnYALcUM
	mxvOsH+2JNxhfo9AvNQlUtEbAkythJVzZYDpWCu4s5zsv6ZhB02dOgn+ESJ4LbsT
	u574ODIBbXy4M2vdEDOWbFiqQzHz/odFnEbKqI+9IIvPna1YlwtUUyVaHBU4xC87
	HNnZDrEI2HUGXps12bqgmrxep08CpIhUJOdE7LwIhTI03orQWGY157NUCa5ggG3r
	02cQpai03aSpp/my5lxckNos9yON34BWajXWYQsI2NcUWXIhH/7HxL4ZpWMbaLBv
	nd4Otg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rtth5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 05:35:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae56205588so1335801eec.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 21:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764114; x=1768368914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gaj3FGhPYKk+8z7S9CPgUXh1ipZIspnmHtAZVmFliws=;
        b=fbMzPkRdWaqwim5if1s5TR+WAAyfed3uFf0DM2DMjJAnc1AsP9Yw6fsCL9ruCbKGSs
         LnBBXnHjHc5fRM73Afe/vujIMVLVXCtB2GJl4pEJYixF+AcTPd3h/Tjwp1Yo0TmPye7j
         gNgBZlrJtEvlK0ZRVVEjjT4OKtjuou9vLLodj5VejHgMm+Iv4ru4iqYNDLnBDTQpiIia
         UDvG9GhBuyto7MJ2fEz+AkKcmF1UpMlh0f95p3a3IUh+1FX1A30yzRciq2CTkV2jZlwB
         kRG0ih7UGvkTs7ZbycQqEq1L5xFNOkObisiUWE+VJj5eqvpRwdNFDqYibavcSsr4qeMg
         +4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764114; x=1768368914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gaj3FGhPYKk+8z7S9CPgUXh1ipZIspnmHtAZVmFliws=;
        b=Au/8bNPs+tlZSzdMzRS2NOjCOcPLRz6k/B1CI8rAcQ/i5UVl1LGVc1dgZ3gHLMta8k
         NjxV1YnZX0c09Ur8XLStA+ZWVQ9wrhLcB1JG+TNeOqYK2P6MCesAgNX5BZ4L5yLNn7mX
         B044+GjgEo4SeZf0Z0Z+VoYx0CxJ4YtWS9KAh4TWKoq23Ne+nQ50VEHNV52X4Q62e9x2
         IRqA1RXvRD0DpVzhYF5PgEUpaUve+EjR0IlVtSPdHxRz+tba5QE+tGGhbKJZk599AGw6
         +UFH8lwfA/4FojHo0U86Vc4VOLjA2+FbABtaIn1wD4M/rhdCT270IKZw8h/0Tg+nyw+c
         TBUw==
X-Forwarded-Encrypted: i=1; AJvYcCXQpFa57zfSqceMzZk/pg2qbfrfDi//Mv0yrTFXnQzZDleiWM56Tq7lCJK0atFgLFW0L0SLyuwRv+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTAjCkbes6vLtCKK4KWTHHpmsVkSaT/cnBsWkQchjxdtNi7IO
	jrsc5bt6x3VGjJS38zE8eeDKG0+V0t+cCeLAGvp9GIFIbawGU0cbJYHmd2R9E4AwlfOftynbMOF
	Uq3b+b8JrCQbIbzpU8mU+GplFK3egZU2oer8bAYWgn7qqk8wJpJon/i0vO0W/oQk=
X-Gm-Gg: AY/fxX4ogfzfnyOgs16OOcUH8wuowf7tXw9CC/UObb/4Qh8gCdNQpbvVvPmHh5RtwWi
	AAdu39BGCyp6fhDudFRYLxUtPdGx+oityzpOSnZbsFLP2tsU8SNu1UInEliVOPYWcSzW5+TzmjM
	dblZYt+jqggAuHA81ASY8PFnExuhhgYDMGQIcf4ipnC0Zbedasmhl0iqpkg/j5nG3fs/Gl64sCk
	/SNudS7Qzq4U3Va0Tpab/oh2ay72uuG8VXkIeJIQdI7U/YBxfX/ZUkYUq/R7BlFg6/9ZMW9h03Z
	9dBhku3cYr0G3qu3078vLQNjlSCmbDovrwVGogKzgu7riPwHZ5E3/bQFwpfc5511yhJ+/rR6X+g
	S4SmPwm8guYbdreYQ8K5a4W0lTe1NRZQghAWzXJTSfR57zsjLBWbr
X-Received: by 2002:a05:7301:1001:b0:2ae:5ece:a223 with SMTP id 5a478bee46e88-2b17d238b56mr1083048eec.8.1767764114017;
        Tue, 06 Jan 2026 21:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAq+ZtdAcknsGaIaPLtgnpySHduFJzXfHxD+tcTHf1ko0mmdW7VyooccCBBdWrfjKfzYgDpQ==
X-Received: by 2002:a05:7301:1001:b0:2ae:5ece:a223 with SMTP id 5a478bee46e88-2b17d238b56mr1083016eec.8.1767764113508;
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:10 -0800
Subject: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=1994;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=6KcYHw//2sUplPbK8U1Bd+hDAoWkJLtkjZfQ8HvTz7E=;
 b=nrET/LLy2cTDXNL6ak5fCp9zpgjbFF9KXciJoKzrv+3VCA1DJ6ppy8QH4s9mnj87lg3Lek/dc
 K/uo+dYQ064BW8CSJ9eEn2AcvgThn1BpPWXOa8NKXHNVbdcn0yUmwlD
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: 0SnOwd2GULUnXP4lWVQN6jZEM8ksZmf_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfX4935tlB3cYa6
 7+RAaKVFvo3Ll8wuqEUO9bbLe1qRGtYvP+xUiZQMI/Nb2pVWitxoG8eaH8RnbArwrfkUceMFRMw
 ZPyE8jv2Q8NjtktkYWIxuKobLsevvvsj6wb4IdGHKtvdHsklsGq2J0uDngHl9BS60GG25tJ5oCL
 9omGaXavGSlQj85g/TrLcZSKK4MEDc9809wDkWEeuJMj612FaERg6vnJwngNWlC25Owb++6P3Ws
 ZL6y1RaMjHDt0vi5B2CmjB7OF58cp5dqmZfF9JEsRiPyFLsxTEY7ThZZ112iw+xEw79SZnF2GKI
 RcFAxSyIj5HMpkDwToSCfDB4pA5tZZQs48C2R9Pn3evNRV4qVuQT9oYV0X6FkTGdU73FKx9VyNY
 fY9PnjZyTNQOx++gHqw/7WkEl71Q7jGTJjcB6UINss3I3FLTvJzLCCV5SsG4T0O61aN/NXs65VA
 KUypsK8ncyt/AahouHg==
X-Proofpoint-ORIG-GUID: 0SnOwd2GULUnXP4lWVQN6jZEM8ksZmf_
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695df092 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S55vJYNB7fQppqqD1sAA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070042

The clk_cmn_pll_recalc_rate() function must account for the reference clock
divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
with a reference divider other than 1 calculate incorrect CMN PLL rates.
For example, on IPQ5332 where the reference divider is 2, the computed rate
becomes twice the actual output.

Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
applying the 2 * FACTOR scaling. This yields the correct rate calculation:
rate = (parent_rate / ref_div) * 2 * factor.

Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
IPQ5424, IPQ5018) that use ref_div = 1.

Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dafbf5732048..369798d1ce42 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -185,7 +185,7 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
 	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
-	u32 val, factor;
+	u32 val, factor, ref_div;
 
 	/*
 	 * The value of CMN_PLL_DIVIDER_CTRL_FACTOR is automatically adjusted
@@ -193,8 +193,15 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
 	 */
 	regmap_read(cmn_pll->regmap, CMN_PLL_DIVIDER_CTRL, &val);
 	factor = FIELD_GET(CMN_PLL_DIVIDER_CTRL_FACTOR, val);
+	if (WARN_ON(factor == 0))
+		factor = 1;
 
-	return parent_rate * 2 * factor;
+	regmap_read(cmn_pll->regmap, CMN_PLL_REFCLK_CONFIG, &val);
+	ref_div = FIELD_GET(CMN_PLL_REFCLK_DIV, val);
+	if (WARN_ON(ref_div == 0))
+		ref_div = 1;
+
+	return div_u64((u64)parent_rate * 2 * factor, ref_div);
 }
 
 static int clk_cmn_pll_determine_rate(struct clk_hw *hw,

-- 
2.43.0


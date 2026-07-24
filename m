Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A093A1685
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905237; cv=none; b=Sj36LLKRTiWrvByh/5LIqj5D1gV/zrUYZSsFJVQhiEFn9DAqD3wL2RHMC9xgZ+w+nHmPrm5pEvGGoCNCPUd5X6LmSXKqlyOB//C7kMe9q67OCFDG3Z/WOoPckgGYPIWjA8rsdBAPghv3GVFlyOtDCOkv3FZ+TFUf+gX3SxnJvBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905237; c=relaxed/simple;
	bh=zTQcqLYlQDlmAy2iVnrWcqgFUMTKnt1qbeSQpUH4RCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UO56IKOHwowjppvNOxOXgOEH3TZQBJcq4tQEEuA5uPpMeTL8c2QCXT+pfTciMS2sXRjlEs3ogtzAFyYFNXfKbr5+9wr5EDWKHa0/eX0sw+YO7fR31hWoVDu7R0NNcRGQRiyexXgfVvoei/xUPMshlATKU9vMKy66OWh/9i1a3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHEJSIan; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9FAZmpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHEJSIan";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9FAZmpD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbSO23090545
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfH0Cq6iojlNXX/T28K0N3XxoplS8jtmiAZYldnabYc=; b=BHEJSIanL4iBan1R
	6YWyQsuqtXpJuF/+MXmaJ7UE4chugT9hTy0alIxsCROHHBabgOSNx8cUtYl7dxSi
	UafwMeGXxfO8FhCAkCnx+yEMRUL5F0p/Qw6LeUwFLONaz+m/oqlhfSMsmC3Wbbdy
	KVFjtAIBAd75gJewuBonotpgsPSwT3qAOykt5hAIXEnv8d79RReo5LajwV9ZqR8T
	23kici0jk5L9+0bwTF8DkB/m0WSpthDZTApqmU11+DZPKAP+CD5nlIITpYsG98ga
	YO/2bXvmUrenOaoTdB0D4fKk8gXGc0FTjkgk7amGggymTcS5r0x8s4k6TkifphR6
	+MQNUw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so831922a12.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905232; x=1785510032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfH0Cq6iojlNXX/T28K0N3XxoplS8jtmiAZYldnabYc=;
        b=L9FAZmpD6LMRClB5XQ8zvu84BANQ9bypXIsrkH2QxE16ZkNVKt53QuM6FfIemNbhEF
         l1So+DMjm5tf2Xc9/s/NclxRdDdPs5ADjFTlvKr6uHy/z/LjTeNlTr/MRLinmMUP2sYX
         DAe6wxiaBmaW1dAINBLYEtuAFAc+GHR8y3EttJydvyq2j/duz1Wk2XdH8r1ikTw8/f9G
         s4hmlVpMLocxioY2hJwqrL6Lg8pb0Jte7z8tkIPAR3qItgs2BtMgMwx9dobz5kRwem+M
         nRPmb5cThuyg1BY2qBg9ZLt5sBfASOCKZBlBPgVYLfqTYUXdYNe/ma5tyyzCsvPKoOcd
         v23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905232; x=1785510032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfH0Cq6iojlNXX/T28K0N3XxoplS8jtmiAZYldnabYc=;
        b=pcoEyT2p+ZVvpTJrpS2hfOtmeQwWjOyjAHWysQGW9nsArtR1fUVimGZdAN+Bj6e+zS
         S/j2/8Nrm4PD71lk2sDjSDD8Azp2K3i79XQOR80ZcUyptWbF7691pLi6jmU+sFSUPwRE
         WmADF2c/FujewzbigDURSZ6Ze/MIpJOmJOY3Jx3jPSuFUqdKZ9bYFpwcMABKBmfSp4kh
         rTqYHaIJ10sVUXmNJp63mBosmnZezc/6p3hIZsWGGyjQy31SKT3saeIl4KJ+tprtQiwa
         5LOnqJRbOA8GiWVrylbu86kvVT5HqTXxA7nWAR7YO5zh5TcO9siGHh2OucxaXOIzOzSR
         e+7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqbuzcbJXol2FjLRez9oThGxwsq5hzV85F670y22j7RQSs0TJncKrryt1kVrqi1QwQRmLESUwMtiIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhi7MthopBGVRF+jJ7uy7/OYFVr/RTg9E/v6n/zp0UGkcJBNA
	FMt7I/XXPKVFMcoBw3xGe/D8Q5aWLt/YPkNgzQJKULpwMfIv5w2wJ2PAC3k1w/2EG1wr3ohd5wp
	VrRVv682/gHMuzgTD1KgtZoCmAAYSEBvK+DxC1BoODqPzXrhsVMYQmicCeXRDLDA=
X-Gm-Gg: AR+sD1353ryLDiP1rb6n0gpCfoz+r0TaE5JPuchmfbTApAn1VsNIF68Ngu8n3PPMVeo
	TK1AOoVP1z3sYlenuTiaWjCK1/coi7rduNGS75P+kKcfPS6t/hvMEFlOgDBj6YX56Bv8IVt8l/K
	IhM4jTtjWIuZKA597HAwhx6Goy0G/H9fYBB0KUcaAhz0+6e6kbDwaLri+VHzeEFrTj65rAxVCuZ
	omPctqzTyUjOu+qtmPQQFpj8eknPnZxdR3sjhVkHcyCcUHvMqfTlB5cXLbsvR4AL1kXq6YpC98a
	Yu8MloPqQ7okhdGBOeSmjycDwarWFlPq6ZMGGLUHHYb/qHiv1EnGCJ0KtyWwdRBTx44OyeN7mLn
	HmXaL1PPdlKPQvU18hb//om57EXxJsEtpM0YwhufnR/c=
X-Received: by 2002:a05:6a21:7309:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c44b00c842mr8660294637.23.1784905231693;
        Fri, 24 Jul 2026 08:00:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:7309:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c44b00c842mr8660214637.23.1784905231106;
        Fri, 24 Jul 2026 08:00:31 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:30 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:28 -0700
Subject: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-6-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=6027;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zTQcqLYlQDlmAy2iVnrWcqgFUMTKnt1qbeSQpUH4RCs=;
 b=A2YwkLkzNpWlrokxMZNvxcXpTPT2ZWECdE9t3Np8aM6eDOSmxq7BTLWpZHFErGa7sVrfjUkoJ
 tcOg2Rbtx5hB+iUIdFf7ODmpWpvkpwp0KptGFC5VjZrawXmhjFRpRGc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX5xQl2tHuC+K9
 15vWXc2JohuDgZuzUHuHKLlJ0rzbG6pjkB69Ra3Bdg+bJqT8RqMxgFn3qzKOJkyeNkijSHhz5ao
 GG2QiYbDLgCMnGdFGyhB1AjGl5XI7nUuzkkAk5uDilXuVhKH2qkZxDpUiLYUBibRB5vxh0Gdohv
 G32Z9vdNX2IQDDiD8pu4LlF0I4ILycYfageJNBQAww/t0tF5fLGDEHpYdwxPsKAwrsyLKIPtHmf
 TOiea1E4M+FsgV+hJElZ+xtqclft8Qh8o22rL3uZJNYowr3RsSovEeHu1ABDVjbnin2euuYnR7F
 zITop298jMC9YwBfnKyc7LoyXJr+rbUtMl1vUlS0bxGqArbGE0Q/PYmfQjIH50i2s9UYblL7Ne+
 TFvjHuct0D+xMsCcUNEPs4h1EXamPVjPC6QXmTPi+lvSRgmB4uGmwNr/wxKkAEaBsJSkCDqY/7N
 LVW/FklVLSHlxCsOIbw==
X-Proofpoint-GUID: 7wMkXwPo-CAAgNwYkFSoyMVjC15UO4BK
X-Proofpoint-ORIG-GUID: 7wMkXwPo-CAAgNwYkFSoyMVjC15UO4BK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX1DF/XOt/c8Ms
 kffd+blpeQG7FM5BJSh8mf1+csUVLkzXPLqB520gddjElmTBdD6DZia/8mvo7QVkVDVuCCPKyYK
 i/qOfrW81VDVf/19pqOh0/TKPZL/Dqo=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a637e10 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8Chi_m1JwMEKIEjeEt8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

The PON (Passive Optical Network) reference clock is derived from the
CMN PLL output divided by 2 and then further divided by a configurable
8-bit divider (1-255). The clock supports two modes:

- UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
- PON mode   (CMN_PLL_PON_MODE_SEL = 1): pll_rate / (2 * divider)

The clock output can be independently enabled and disabled via the
CMN_PLL_PON_EN bit.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 158 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 020ad12ca1f2..1ae32052b563 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -72,6 +72,11 @@
 #define CMN_PLL_NSS_PPE_DIV_MIN			8
 #define CMN_PLL_NSS_PPE_DIV_MAX			63
 
+#define CMN_PLL_PON_CONFIG			0x42c
+#define CMN_PLL_PON_MODE_SEL			BIT(9)
+#define CMN_PLL_PON_EN				BIT(8)
+#define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -540,6 +545,155 @@ static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *pdev,
 	return &ppe_clk->hw;
 }
 
+/*
+ * PON (Passive Optical Network) reference clock operations.
+ * The PON refclk is derived from CMN PLL rate / 2, then divided by
+ * a configurable 8-bit divider (1-255).
+ */
+static int clk_pon_refclk_enable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			       CMN_PLL_PON_EN);
+}
+
+static void clk_pon_refclk_disable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			  CMN_PLL_PON_EN);
+}
+
+static int clk_pon_refclk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_test_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				CMN_PLL_PON_EN);
+}
+
+static unsigned long clk_pon_refclk_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+	u32 val, div;
+
+	regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+
+	/* Check if in UNIPHY mode (bit 9 = 0) - fixed 31.25 MHz */
+	if (!(val & CMN_PLL_PON_MODE_SEL))
+		return 31250000UL;
+
+	/* PON mode: calculate from divider */
+	div = FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
+	if (WARN_ON_ONCE(!div))
+		return 0;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
+}
+
+static int clk_pon_refclk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	unsigned long div;
+
+	if (WARN_ON_ONCE(!req->rate))
+		return 0;
+
+	/* UNIPHY fixed mode */
+	if (req->rate == 31250000UL)
+		return 0;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
+
+	/* Clamp to valid range (1-255) */
+	div = clamp_t(unsigned long, div, 1, 255);
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
+	return 0;
+}
+
+static int clk_pon_refclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+	unsigned long div;
+	int ret;
+
+	if (rate == 0)
+		return -EINVAL;
+
+	/* UNIPHY fixed mode (31.25 MHz) */
+	if (rate == 31250000UL)
+		return regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+					 CMN_PLL_PON_MODE_SEL);
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
+	if (div == 0 || div > 255)
+		return -EINVAL;
+
+	/* Switch to PON mode */
+	ret = regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			      CMN_PLL_PON_MODE_SEL);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				 CMN_PLL_PON_DIV_CTRL,
+				 FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));
+	if (ret)
+		return ret;
+
+	return clk_cmn_pll_ana_soft_reset(pon_clk->regmap);
+}
+
+static const struct clk_ops clk_pon_refclk_ops = {
+	.enable = clk_pon_refclk_enable,
+	.disable = clk_pon_refclk_disable,
+	.is_enabled = clk_pon_refclk_is_enabled,
+	.recalc_rate = clk_pon_refclk_recalc_rate,
+	.determine_rate = clk_pon_refclk_determine_rate,
+	.set_rate = clk_pon_refclk_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_pon_refclk_register(struct platform_device *pdev,
+						      struct regmap *regmap,
+						      struct clk_hw *cmn_pll_hw)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	struct clk_cmn_pll *pon_clk;
+	int ret;
+
+	pon_clk = devm_kzalloc(dev, sizeof(*pon_clk), GFP_KERNEL);
+	if (!pon_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = "pon-clk";
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_pon_refclk_ops;
+	/*
+	 * The PON reference clock may already be enabled by bootloader
+	 * or consumed by hardware without an in-kernel client driver.
+	 * Add CLK_IGNORE_UNUSED so the clock framework does not disable
+	 * it when no consumer has claimed it.
+	 */
+	init.flags = CLK_IGNORE_UNUSED;
+
+	pon_clk->hw.init = &init;
+	pon_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &pon_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &pon_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -589,6 +743,10 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 		} else if (!strcmp(fixed_clk[i].name, "ppe")) {
 			hw = ipq_cmn_pll_ppe_register(pdev, cmn_pll->regmap,
 						      cmn_pll_hw);
+		} else if (!strcmp(fixed_clk[i].name, "pon")) {
+			hw = ipq_cmn_pll_pon_refclk_register(pdev,
+							     cmn_pll->regmap,
+							     cmn_pll_hw);
 		} else {
 			continue;
 		}

-- 
2.43.0


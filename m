Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7194636AB5A
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905235; cv=none; b=cj1JFBBTzU8fv4mNWYRsGnbUkvTkh/UVmJmCF/1vimp7jFMUhmI8E6fLPvubjTckINrzHcnTXOIPkwTs80/+Pgy7UwAbFv4vMexNz4W3z7JIrT+zR4cLLT7LtxBotMOl1/dLYFH8ARfJXF44+7JX27BY1Ye1/qZoJsRHDgcm1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905235; c=relaxed/simple;
	bh=xuqTt5GjoAea9Mwg2P5H1PkIm/qIz8M0zitNWpkIwRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSkHkI6w/EiVsmN86JL/fg8Ub4MBUn0pFTbtVK6Grz9sk/IwMvoOnv3ziQJfkuyHcJWJmSd4LpEqf1bYgRiizl/xrLPKU7H21je74nwy3RyhWUvf9SS7az7NvcdUoTwJ1Q5r4Re2VfSFKYXHv2nNU6YgjTTXSwvZkDnxJNdwSnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfYf4pl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iN3KYfEM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfYf4pl1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iN3KYfEM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbFEj3487411
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wg6WnUO2Nat7npqWfXs1fZwnK4i7Belsj/iJGit9dmA=; b=JfYf4pl1XprLiMDo
	VMIZquFHARKabauHrNPo5E9dOU3ABbJk8hHqJpM8M1YQGERASrH/UMqg5P/vKrAh
	P85o27rbfkGqS+1AqbQejXl8e2gmO7KuEeWkSEPM5LfMle01SxQ8q9arQ1TkTDKS
	eiFgJatDEc4pThD3fyKsUfoHMMdtdJEgfITfyXRFh5BEZqkd4zuxnezLGp0MLg1v
	OdJ+9/CTbjLa2o5BZ0e+XIwxaCFtG7bHWjcqo7TpU4AEzKT9ZlgmmAx8PRrpidqC
	UtnjzR/xiMQ6W6p6PmxyFT7NVtOVc1QUHcv/pYbvSZsaImuZ/tk+r9nnYWbVND2L
	B7+ung==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0c9h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso717940a91.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905232; x=1785510032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wg6WnUO2Nat7npqWfXs1fZwnK4i7Belsj/iJGit9dmA=;
        b=iN3KYfEMhfdcfNfxEX+DXVq7TEIqsBY5LcTEic9GMDpZFM4hR3iIcXIc3xrc+xKctu
         BPjA43UWQl+FGlGtyEjd4dR6Y3wqLaSRlMfh2RuEH6PMQyabLjAXo6OsLLhuw6aGPRyI
         g7xXp0YNe1bNUvlXrRJOHRU+WjsmyguvTBj6wdy68HYZATHE6xzwJK1l+L9v6zyeZAOG
         ek3sqlgGf49k68eDgLyERqts0zcpQZQM2yNAn9DHqUlrgPZn03kKqf7uinUAv9a1I2Xi
         rE847qFzw487uJ6jLGjRFk2bcUrX91U5a7kRslyn0F0tz+XdLtdBjmqTEglM9jiNX14Q
         R5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905232; x=1785510032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg6WnUO2Nat7npqWfXs1fZwnK4i7Belsj/iJGit9dmA=;
        b=pM7GvN4za3ErE9wyMNqe6U5RfX9Nh8Vb7uOBpM9mP677WLR0cJR4hTDbv9SdAhpoin
         2H46ehLxxvqn8fILgWByzU4ZN7t2Bx27Hn0hOwAaxAUm98+P0SMMqCzkmgJAYhQTx/gM
         ccOMbbJ2j6dMPSU55z/9lMMwuJvo8+rEAQcGjPtb/nbPbvWPgop23g8wFHkyRuMb+Dtb
         BsEmV1caimXuXUEj8wjgls7bcCsx41yfq1jj1ksS6+3HDMaTrOLCt+fr0sKADm6Lolq+
         gN/stymUHUZZpJGl2NbjnAFTYCbzEevIs0YFL4jzcvYVTpLMEBwcm6dnoiv4iL2+HcMj
         1r3Q==
X-Forwarded-Encrypted: i=1; AHgh+RphzdFQ83FnJzcOldqKLzicdnNcnVu8f3cvhvr8BuADsiBKZLFTEIw8qTZP/BDsvY0h0OHKNOE+YNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMVJIHnTanV2P702QaUwCNtWtH0tNnMUe37WgIeXPZdhVKTF9
	o6f7b7COZy7pe5dx9yS99L36i5jXQUKYczOXoCnotczeB7GEsgphZY6f4bKao1evQgjV71r2kBw
	nEdaJJS4tZlXZPsfd01TRAYHXuV5TsVkQ/qNhR0aLn/jfXoWeKUoNLomLWCZxUXDMFgWCWqROqm
	hN
X-Gm-Gg: AR+sD11BEqN3apP045HBnGFZ250BHcZfUkAnYBIjzi70y3GHoMeXirfCCjDF5F3CyB/
	Kqyg/D6mRNnO7HkZHZ5t9CJ0AX4nA6P5BQKwy5D1BNgfo65lNgyrZcl2q7/YK+NCThpFdnr65VI
	ZwoSVR+8jontNFX2Yhf7YbMGRIS5Xtw8+y0TVK3RMwQNAZ6plDRFAvOE2LONbYwH4lZ9ZYNsTGK
	ql/aITaDjyqSe9iYH1jiY5ePSpzMDdnhGcuKmSNRoOriCLqM/2CziCBdKfsPaF7/vnsFRzdAv3X
	9BdlpOD98BLsOwmqwXyxnYVJE/qwXEsFdIRmKgytCNcHsYowCMk+maNRudPuFAsMl/14XvICi8N
	pVDKKRZK6NvA2uw4iRkyVKYA3HDBGxZZqoCwTKx4DgAY=
X-Received: by 2002:a05:6a20:9185:b0:3c4:2cf9:2896 with SMTP id adf61e73a8af0-3c44b1c86e3mr8433252637.45.1784905231218;
        Fri, 24 Jul 2026 08:00:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:9185:b0:3c4:2cf9:2896 with SMTP id adf61e73a8af0-3c44b1c86e3mr8433133637.45.1784905230308;
        Fri, 24 Jul 2026 08:00:30 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:29 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:27 -0700
Subject: [PATCH 05/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-5-a8b8679d215f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=3810;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=xuqTt5GjoAea9Mwg2P5H1PkIm/qIz8M0zitNWpkIwRE=;
 b=JevYk7GFcGwCVoa9WHymi/IM/SlxDVKAmgvKVfrGYswravJoGvfvRcAT9YQBYhX3WBvT+5PME
 ov6OXf0oEgCBNbLpNCWpdVKq10sryDeNAICgukGmMTNHi/RPaNpM1Tl
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: 23IhWofxDbyJnbjZQS2CdVyJUSnsVXqn
X-Proofpoint-GUID: 23IhWofxDbyJnbjZQS2CdVyJUSnsVXqn
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a637e10 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a0Q9v1deZHfQL7jRbVkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX+MltqrTnql5+
 ayjTiCWZ6Mad8IpdLcJY/i3qvFNYLi8lCuKOuzuLu3k08fsKpXnRa5PBkuUqziPQDqY6QPpd1Wh
 1GkwKJzexjINywa8GAAgAWq8FGImJlQCNzTPuZDGiIo8ISE/u1dMt2XG4Vf9hSERQjIgqIn+oOG
 ABwyg2Ms/t/84BHwkzI8WDtVHqftxHnQ6Co71X6cR8T5/pYqRheQrEk4xFR06G8oFbhiOEPM/9+
 F3+Hk/hPPlNDjGrJLVQBovb61uLOVvALlyZJu+ImkU9/jEVktuiJrwpAYMsYW8ElYIa2RVgZZMP
 eMuauJwm9k49eas5Xy9MPGfBjnBZdWEUhPccbg+Rq9760tR45fS8WTJGZIaIcLIAFYHraqAvdf2
 NlDaBAbtRGq/xNq5ntLxh3Ei3H06BYI3CkWvqEDwgEz7XfEkEtZsedV8pf+b0rBt24ZlyrDzzxx
 7/yhYbrZfS/J7gFo9qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXySfuO7/GN4xJ
 LPZxUzZNqNsB3wAihIqm3VVVcJdhpQCyU5meByxLghwz+NU/GIoosaloZE6WuTQ8Ng7GaF2cqC1
 V+eEHtErkXTk8xJFR3WF5Eh429nPDKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

The PPE (packet process engine) clock is derived from the CMN PLL output
divided by 2 and then further divided by a configurable 6-bit divider
with a valid range of 8-63. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL
register with the NSS clock but uses a different field (bits [5:0]).

The determine_rate operation is shared with the NSS clock since the
divider constraints and calculation are identical.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 81 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 3df326c22fba..020ad12ca1f2 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -68,6 +68,7 @@
 
 #define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
 #define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+#define CMN_PLL_PPE_CLK_SEL			GENMASK(5, 0)
 #define CMN_PLL_NSS_PPE_DIV_MIN			8
 #define CMN_PLL_NSS_PPE_DIV_MAX			63
 
@@ -462,6 +463,83 @@ static struct clk_hw *ipq_cmn_pll_nss_register(struct platform_device *pdev,
 	return &nss_clk->hw;
 }
 
+/*
+ * PPE (Packet Process Engine) clock operations.
+ * The PPE clock is derived from CMN PLL rate / 2, then divided by
+ * a configurable 6-bit divider (8-63).
+ */
+static unsigned long clk_ppe_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_cmn_pll *ppe_clk = to_clk_cmn_pll(hw);
+	u32 val, div;
+
+	regmap_read(ppe_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL, &val);
+	div = FIELD_GET(CMN_PLL_PPE_CLK_SEL, val);
+	if (WARN_ON_ONCE(!div))
+		return 0;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
+}
+
+static int clk_ppe_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_cmn_pll *ppe_clk = to_clk_cmn_pll(hw);
+	unsigned long div;
+	int ret;
+
+	if (rate == 0)
+		return -EINVAL;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
+	if (div < CMN_PLL_NSS_PPE_DIV_MIN || div > CMN_PLL_NSS_PPE_DIV_MAX)
+		return -EINVAL;
+
+	ret = regmap_update_bits(ppe_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL,
+				 CMN_PLL_PPE_CLK_SEL,
+				 FIELD_PREP(CMN_PLL_PPE_CLK_SEL, div));
+	if (ret)
+		return ret;
+
+	return clk_cmn_pll_ana_soft_reset(ppe_clk->regmap);
+}
+
+static const struct clk_ops clk_ppe_ops = {
+	.recalc_rate = clk_ppe_recalc_rate,
+	.determine_rate = clk_nss_ppe_determine_rate,
+	.set_rate = clk_ppe_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *pdev,
+					       struct regmap *regmap,
+					       struct clk_hw *cmn_pll_hw)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	struct clk_cmn_pll *ppe_clk;
+	int ret;
+
+	ppe_clk = devm_kzalloc(dev, sizeof(*ppe_clk), GFP_KERNEL);
+	if (!ppe_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = "ppe-clk";
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_ppe_ops;
+
+	ppe_clk->hw.init = &init;
+	ppe_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &ppe_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &ppe_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -508,6 +586,9 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 		} else if (!strcmp(fixed_clk[i].name, "nss")) {
 			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
 						      cmn_pll_hw);
+		} else if (!strcmp(fixed_clk[i].name, "ppe")) {
+			hw = ipq_cmn_pll_ppe_register(pdev, cmn_pll->regmap,
+						      cmn_pll_hw);
 		} else {
 			continue;
 		}

-- 
2.43.0


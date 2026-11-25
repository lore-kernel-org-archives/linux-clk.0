Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579586;
	b=5LwO1mdi7/PAg7aMTxcoyD3BN0G1rlg1UhckZClecnUkRXIQZwAoAsYPRwIUQ1ubmu0Q
	 DDRGc8uTBxf7IEdjCfgCz/iwwQ1HChTgKOAPZmDq2Q1iWr3pPZwyCv+bGHDSIhc2f9HPc
	 U1LMMFPwuJtiLkMt2na9OrVHs1rOJ30K2/pxkFlWmVJonLlk3z4kv9MelpKsiP9qOWfAR
	 ws3T4Zzl800wUWQdvmihOP5lloeoo8aixQe6okEzJSIm2LHuTGwMC9C8z9JMcXJWF092C
	 +BcNlmfEmPrig2XZAtgkcwGQpeipXASJkCDO6JY2DHgj4qiPTpRJRGvI5Ae9TLUESdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579586;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4eeMbvFMu2vzoY+6M8rEF9e4tT+qIPYw4qCPCaMDfCQ=;
	b=mxUZgWQ9WWqcPNvLGI3UsTxKWw8L9I1Mj5HrYMctKynRTT0okeJs73b6ajKvV9JMVz9L
	 zn6W/63Y+vwgLidUIXy41hoMt42ok6orNIBxcTC8Xw8j62p+ieHjbJH/S0SOquZabPLFD
	 mLiAEke6DCFPloeuRfqZBy3URZeprMZ3PLQlLVqJd4M5LWvQbmrF69XjKnVHHgxd54xwB
	 16DjrgRoyCAkq5Cu7zRpkw3Wibi36lENgzQAyD+PGPhPOgVKToup/duxixsONHph8Sf03
	 kKY+rwKx+G2DkksWdIdkyHNkvGy2gPR98EuvbD7dyqLpZ9y/Nar2iuY8W28veGYu73A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467C2606A332;
	Wed, 25 Nov 2026 04:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467C2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 358BC859;
	Wed, 25 Nov 2026 09:36:23 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Wed, 25 Nov 2026 12:05:21 +0800
Subject: [PATCH v2 4/4] clk: qcom: rpmh: Add Netrani clock resources
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-netrani-clock-v1-v2-4-9ef014e71737@krgm.moe>
References: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
In-Reply-To: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2109; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=HwiD6+7HyPVYVbtrw+yEWM7KyfKumGTWD1kRzR/4byA=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBl6MfNaE3zSMxcpwWf7QVuCWrnrqmz1TTYg5V
 gWnb2s2V9WJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawZejBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmOLqgv+Lz1qOTBX40KMy1xeRs8fgIV+LM6lNxT
 O81xh/JgpQWuq0SHm2LBx4OLA0jA3V2PUT3cg+0sWleTEy9ry6uL3ROBei41bGm5YszaMcZQWML
 9anApjRamxcwWcjnIpwGa3RaWucq8hGBSBGb1TyrN4/Fuq3pjr8d5PwuDhjVHshCY2DBPiM8iXI
 eyqNzJwDcQrWJRNL1PA6znBXyaIlTQUJcxz13Agf9vt/VJwAroRo7Knc/agXkpXaKwb9+IbJ1Zi
 6CvyJEa9cKjW+Y6Wgr00F68k2oru1RiQBLJ/exwhx8U7iP9oaNZ/OlQNeGq37CpuxEq0ohmGkR7
 5mGeNS5CtnIwx2huh+vQmH1GVuyDJMo8Bg5zxCXVyQBAjuyiW1CakJubqCb8JotgX9C1dGn2jpw
 lh0AwKdHQR4cI0n/BVY00QmEZ4zJES4T+cECF6CO/HqssgddNjR3u2yw4qHU4so1+YsjePpi7Ry
 6f0ga2+PsLg8J814SC0r2Z517wpcO+Q
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Describe the Netrani XO, line/broadband, RF and IPA resource clocks.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a64..389f9567f2397 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -499,6 +499,27 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
 	.num_clks = ARRAY_SIZE(sdx55_rpmh_clocks),
 };
 
+static struct clk_hw *netrani_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a4_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_netrani = {
+	.clks = netrani_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(netrani_rpmh_clocks),
+};
+
 static struct clk_hw *sm8150_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1141,6 +1162,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
+	{ .compatible = "qcom,netrani-rpmh-clk", .data = &clk_rpmh_netrani },
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.56.0


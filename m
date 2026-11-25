Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611624;
	b=Q48MDCu0Co3Ro7RZTOZ7JIHTrPqsH7kGO/lgynSp/gZQ9qqV4L6h2okw7A2keD0rrUkd
	 5Sk9HXrYiIVBq7cvgoAgDUaWeB1ulR/57ydErGSm7dUXe5VGJ3If+JhiGxl0v/Q25whHM
	 PNrZH+/kzMZtMXYadX+tVmjaF5q8QdKajILrOo0fnD9Vxg6hWdxqXxmwfz4zoWamKCWtR
	 fQ4BQi4weAgpUyPB8rdBELFH4B6VCv0p5t8hHx7n9BdnDtTYZLNfVBsvq9aKZxO3owc/V
	 ar2GebGQTSQUpu5tcqHtbeACRlQsdnAv7h3VP0izGjhnOpo+LbtxxH9ThfE1I6HfNAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611624;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WOq40z2mfPPBwx9K47FgPiwzhc1b64jDfDS56IDqYLA=;
	b=zm6D2Dn96DaDBENjhW7XrG3cYp809jBK/iW6NZT8et0RNn+CHZ0wqivgCvQKdYLGxkO6
	 raGXTDmB6ddmvk/fPyIHv3qxCQZ6hopVbUZpXC0+3kNbzbC0n7plteIS1IPTLPsDbfhst
	 +Z+j1aPrvD1Kcyqgl4vsauQpChubhxJL1JLeD2r+Tj4p11BSmmGRu6zCFTsvNcsFCTYm6
	 OGw7hzdZyQATcdO4x+7cRPw4KQx/UatXTrBek7e7U+ioALKzLwgAyI5ZsgtL1sVduh8+F
	 U36yQgLIdmWB0uUUyC09KoSL7DCJJ48U3WaqjnU3dA9HeptMn3d0H068R/P2VCzZE3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F16606A339;
	Wed, 25 Nov 2026 13:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F16606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-laptop.local (unknown [103.47.186.116])
	by krgm.moe (Postfix) with ESMTPSA id F1499859;
	Wed, 25 Nov 2026 18:30:17 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Wed, 25 Nov 2026 20:59:10 +0800
Subject: [PATCH v3 4/4] clk: qcom: rpmh: Add Netrani clock resources
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
Message-Id: <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
References: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
In-Reply-To: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, SignKirigami <prcups@krgm.moe>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2100; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=4D8eIU4ZKD7u+owhYxzQ0nsrH4GpkIfYoFrNiwMWGzI=;
 b=owEBCQL2/ZANAwAIAUNLJdlxtMKiAcsmYgBrBtvCy24TEPIWudt7yP0rbLm3dBDevWheiq8R9
 j46+gFFXviJAc8EAAEIADkWIQQKI/ZJLAWGn9r1JLZDSyXZcbTCogUCawbbwhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQQ0sl2XG0wqIqTgv/eQ+CNWxyYFAYsMiB6qwF8dSivJb/DWH
 oFCHVCwEBLm4xLH3EWjFDB9LiDMWlk8N5f5wt/a+iHzvZB2PWMgqYB6g1HJ46zbMLTuyoTkZztf
 DpuT6X0BZMaGRC/3Tm8H75lYz74hpOC5D3Aqg9HIgijaKBLdIb+S32d4sGrqWHiderDQ8Jzj1ky
 BC+++ejFfd9b6T27cNsnTFfX8O2fP6Ey5m766tEaCR70qWZf6ZpFjZiZDtIpRWAv16kqJx56eMm
 PBcH444HGTPJUTZ2YD9RAe8cywyRNTmsGFtlocwFGy5z6Rb/njY9J0Lmr9fT2wKnCm7pJ/Z8GuV
 ZRAr53obb236ALOqB8MRNcFzxSBQEbljX7V/EhZF5ow24sSD/VQfShALIr0V3Rmf+/oWpm3b3J2
 V7afu2xGDu5SDcOoE0T1lW+LqclCqzfmXx12DP8nP6da6G9NbrsMWAds7dQeRWln0Rs4EjOk/jD
 hSYG3r6xDWday6DpWrPlYcd5te7HZpB
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=0A23F6492C05869FDAF524B6434B25D971B4C2A2

Describe the Netrani XO, line/broadband, RF and IPA resource clocks.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e590..0dd6ea1c7 100644
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
+	{ .compatible = "qcom,netrani-rpmh-clk", .data = &clk_rpmh_netrani},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.56.0


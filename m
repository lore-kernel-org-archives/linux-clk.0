Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513779;
	b=eLhQ3sso4YmUtC+P3fdy5XKl6sXprWBkjgy8AwR7lYMtO7Mf0BNTxz5zrf4k2ADZfUT4
	 BnTfjOYayEopRrJGbYzn5TQDLhrc+Xcm2hKUYvRxr0j3OEQkwmBlhMw3C2SFFl6iXKC1l
	 doPnm5SLyvi+ave97kDaQrgePjHB/TZfk1oRBsFRU+abFmZWHgOJ4RpHdGJefHFLcWR5y
	 L1DVRO3F7FcenWcm1vwRUJI7SXL/mtj/HkUjf32IzxvC2eBFvzE6TnXTany/VsvdQBNrP
	 5vNp15OERTks26YwehSPKHdXIRtGSZibXYHlXXmHxqeEg6EeYBEYLy0AeTHxIYeapNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513779;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0MNLTK0fQhsrYOqNKIOaGGwWA/saDokjTp6WINPbrXU=;
	b=QIdlFus5Efk5wm1mOTb+VzUTDPLCP6eKZ4alTiMMf/x5qowvml55GF78A2fVV9TWrSo8
	 cJfRD/ypcy0J37jCtBe8LGOJCDHxstJLW8YJHUg3wialZSwE1ZGHUk2JEidrMq2wOrB43
	 L3yr1GZ2dZIWcKYuuG8aQX0RsXkY1lD8/mGoT6RqJh+Ofi2AS1WCCvNfTg7KtF3kMHzXA
	 MJnfls781w7KQxfw2det/438VGpFfSBlFogShxd3QUIM0OafyUHGOskY3FWtgy8ivyAYh
	 2zxl2B7p+GT+I9mIkH2XFk7OwVzg1DlJg26s+EhUhlAcONnfPZTBbVTwiijP0Evs30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355C7606CF3A;
	Tue, 24 Nov 2026 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355C7606CF3A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 64EFC7912;
	Tue, 24 Nov 2026 15:19:32 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Tue, 24 Nov 2026 17:48:23 +0800
Subject: [PATCH 4/4] clk: qcom: rpmh: Add Netrani clock resources
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
Message-Id: <20261124-netrani-clock-v1-v1-4-ce10cedbfa4b@krgm.moe>
References: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
In-Reply-To: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=M0YLCq6nAE5vu9Uz1AFFKGooJAbkshl6w/NwD8n+T/I=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBV13mTkpIaTqCmR0HsS8WBtEtjmSEIjHR21HO
 QRQ4L+QZQ2JAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVddxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmNmuQv/fpq1XBWYb55jhkZtiwFaeDUlkkRy40r
 tl4xTiT9BPV5pRwpfzao+MiEOpduZVBM7adKd3nCvqVJ6YoywLQqsTm0loUJ+NVbrJUJS6trNX+
 6SCPiXqikaSGYeNS04XBxgux6Brq5nzJyHxULTlE8eCr9kDg+itfxCR8LmT7pkvnX8Q0+Q3MMM8
 PpAzWIL5ZZ4D5efwh8xOoyCeN9HjsYcNSyvWJTBmFCvc12PwxvHaHl2wTj02DMlmAQOXGn7wqGo
 CouY+XI9crFWpOqupYuh7I8bfdcMuGM44Cmqu22W3DGjkmg2qFgBJuo7UuDi87EoA/ExTB4Xiwb
 32h5b5xdDKTNeXQrY2JR97WE9oaPK2YdFXA77kOAkueiE+/UOgHDHuIHFhW+OiMyxHZZPIW0GBz
 KxhYkfGWd2hc4k9NAuVZ9JouIRtI+I7SqqLzmFz83KDfXqfcSuXZuUXMDwUNORn+lLOW34pXKS2
 08WL9gI8L38902vJcflNsSkAKoxChjH
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Describe the Netrani XO, line/broadband, RF and IPA resource clocks. The
76.8 MHz oscillator is divided by four for the 19.2 MHz CXO output.
Provide both normal and active-only votes for the oscillator and radio
resources using the existing RPMh clock operations.

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


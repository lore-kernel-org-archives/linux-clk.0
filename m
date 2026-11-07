Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073025;
	b=bK5F+lb3fpMA9/Y+1INguo5n7Bd5t+zrmcpit2k/9ids+DQjQccVm5tPEkATDZbY3ZOE
	 5kr1JoIleDkKWfvXfS1MF6AKKOTZ6jBWjm9ugTKDVZP/yjRSIybmGNKKcEd9cw7D9Guzs
	 VGwbmpVpL5hpeqDH49GvCvPTLAv2yrwSsPjgu6KzMZVpCU1Dd2MXEYwzBnX50Iu35jQkC
	 WKidiPNYohturLBJ393Xpvr6iGl2bURHcX72VohfJzoT6lz2KGPcqLXGtk0nBs1omedLn
	 gXw8XOpLjd4YOLjGjJGZAU+ZD4gNy9lLFw3isUFGKO/i3FsdY9hbu2b2d72rY8QCV5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073025;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FH13VNETyjkTkRY82ih2222o3jaQFPd92h4nf0VpBfU=;
	b=fyDVYligBQ3lV4ogP65SZo7Rh1dMagFinpg6d6/tQheaO2VyesSDwx2jaCGvm0wsPfJa
	 3Vl3E/39GH3DkKmst9yI13cWIX9qpbYcgGZOWYujbfvx49IW3z6H63m2ZGV2Us7mzpFdT
	 1vPabUpyIlKqfVr0PcTqV+KDW4FZ0A2LYI//fD23nCEQ1WiypAdUCEkZ/GByivMWTOm58
	 TXmvPe6hruWbTJtlIOxdyWZq8qiY2KWmNWfjUa/IsFqKYxMJ7SucLCmMNx5KdQLw13ziY
	 ZMwV3NecpiBio28jODsNzFKL8UEH6l6kSJdZhOFSQQ9iZvNsX3iqfUiiqMx3++KQ2XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIxbpdYU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F368606A32D;
	Sat,  7 Nov 2026 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIxbpdYU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981361F008A2;
	Sat,  7 Nov 2026 17:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794073025;
	bh=FH13VNETyjkTkRY82ih2222o3jaQFPd92h4nf0VpBfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gIxbpdYUsXEpa19t6Luq31IUOHMl0Yv+LnOyzOiMeQ6qhDViLz/q+O16pr8JhRdiR
	 NflsgLWjPkeRFR9YB1yDVLSwP+mnB31qEPkvuwao7nvL9SlNoSp0seeMJjqzTme5sT
	 FLxtyQudM9JJTDbauxT39MVAjbkfttWrlMxHnQi4q3PTuVgLmqBf8C6MtekmjG0EqF
	 H1pm0dCnb+TbX2NeWGHRFGJfiKouws0uNiATVsO0zqpPyVtPXDgmxZ/WuzplwLnWon
	 /1LFDrzGjH8GHdBWjzMaFQj3FbmS6uC7BsgOG7jZlSuwyCWVZPpxDQ6wGXSsjwcj+5
	 zK4LuWl/ur4cA==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
Date: Sat,  7 Nov 2026 19:36:19 +0200
Message-ID: <20261107173621.3538964-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261107173621.3538964-1-vz@kernel.org>
References: <20261107173621.3538964-1-vz@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lucid 5LPE PLLs have the same register layout as Trion and Lucid PLLs,
but the bitfields are not identical, for instance PLL_UPDATE_BYPASS bit
is not present, and the PLL configuration should be done by calling its
own separate clk_lucid_5lpe_pll_configure() function.

Add a separate Lucid 5LPE PLL type to select the proper PLL configuration
function in qcom_clk_alpha_pll_configure().

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 19 +++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..3062b86f07f6 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -147,6 +147,22 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x38,
 		[PLL_OFF_ALPHA_VAL] = 0x40,
 	},
+	[CLK_ALPHA_PLL_TYPE_LUCID_5LPE] = {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_CAL_L_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_USER_CTL_U] = 0x10,
+		[PLL_OFF_USER_CTL_U1] = 0x14,
+		[PLL_OFF_CONFIG_CTL] = 0x18,
+		[PLL_OFF_CONFIG_CTL_U] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x20,
+		[PLL_OFF_TEST_CTL] = 0x24,
+		[PLL_OFF_TEST_CTL_U] = 0x28,
+		[PLL_OFF_TEST_CTL_U1] = 0x2c,
+		[PLL_OFF_STATUS] = 0x30,
+		[PLL_OFF_OPMODE] = 0x38,
+		[PLL_OFF_ALPHA_VAL] = 0x40,
+	},
 	[CLK_ALPHA_PLL_TYPE_AGERA] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -3025,6 +3041,9 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 	case CLK_ALPHA_PLL_TYPE_TRION:
 		clk_trion_pll_configure(pll, regmap, pll->config);
 		break;
+	case CLK_ALPHA_PLL_TYPE_LUCID_5LPE:
+		clk_lucid_5lpe_pll_configure(pll, regmap, pll->config);
+		break;
 	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
 		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
 		break;
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 3a2157bebc52..3c26ea917f52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -21,6 +21,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_FABIA,
 	CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
+	CLK_ALPHA_PLL_TYPE_LUCID_5LPE,
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_REGERA = CLK_ALPHA_PLL_TYPE_ZONDA,
-- 
2.51.0


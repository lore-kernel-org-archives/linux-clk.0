Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272BB245005;
	Tue,  2 Jun 2026 04:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374483; cv=none; b=HNR8hPexZPadW3OzSGc5FX9jU/EV/6X6HHvPbU8gH9D+ZB40dp5elQgLYB1qdsGwke97FO4JZSpqOM4noOw4VRu+qCSlA0kFP3GhGdEVdij1zAkpFjbMZp/t7XltYnETkVBjXE6UWyIfxG58nFrlMUfB+eRQ1j2gKQM/Y2R7ZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374483; c=relaxed/simple;
	bh=xwvd8joBpatxs8VP7w7a2YUGvWECYByDZvwCy2hfvM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnnOd5/hj9uYmz318SvFMQdG0XOmiJkylyvCI+Bz78+8lT0FrNhxqOAafrlhV8+FAlODRP5uHsMzPjjuF4YoeHKROTy2yF6RVhqAlE4tUTHEI59ONUMwzX5+23Z8dTiY4poRcUHGjqyrga5fXahd16IMWv8d0VM6mwH//qv+yLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=dDlcpvfr; arc=none smtp.client-ip=149.210.149.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="dDlcpvfr"
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4gTyVY4DNRzxPGV;
	Tue,  2 Jun 2026 06:27:49 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission15.mail.transip.nl (Postfix) with ESMTPA id 4gTyVY05VVz3R3nyc;
	Tue,  2 Jun 2026 06:27:49 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
Date: Tue,  2 Jun 2026 06:27:44 +0200
Message-ID: <20260602042747.277270-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602042747.277270-1-github.com@herrie.org>
References: <20260602042747.277270-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780374469; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=SCWH851fieMtYFWbpm5Zj6gXDlQJHoiTdxPMyX9yYlk=;
 b=dDlcpvfrbd537Q+8d2bhdUJUgn+Jwve61yVMER4CCgS6xUaQnIKKMrhIV6i9oURBdKZH2X
 PQNC3ncv7lSLfvDi6XQuOLb8COIhfHneKNkPi1k1m17BxrHvaR1oRe2oSD3jCA8Tog++Z9
 ViSDSIExjI54IR6oONUlrMqYlTb8fR5TzlKUe9L4euI76mboR1wKkajDcn0Ld4IyGLguRi
 RXpJ3WddpEQDR2Q1qmCe9cUtU2UzEDGIEBRIgXiEh85l1NaIqPwpcI4HfsBAYJpYHiO9S3
 l8AfdlwCqJhl7v6trzPj6yf0DzGs1QrF4V+dcy/8RyEujsBp4InuH52OlFQayQ==
X-Report-Abuse-To: abuse@transip.nl

On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
existing dt-binding header already reserves CE2_H_CLK (ID 77) for
this clock but the driver never registered an entry for it, so probe
of any consumer that resolves the binding fails: the CE2 MMIO window
reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
signals that never arrive.

Add a single clk_branch under CE2_H_CLK pointing at the GCC enable.
The upstream qce driver requests both "core" and "iface" via
devm_clk_get_optional_enabled(); on MSM8x60 the vendor MSM8660
clock-8x60.c maps both consumer-name lookups to the same hardware
register, so the consumer device tree can reference the single
CE2_H_CLK phandle twice under both clock-names. The framework returns
the same struct clk for both clk_get() calls, per-consumer refcounting
works correctly, and the underlying enable bit stays asserted while
either consumer holds the clock prepared -- avoiding the refcount
race two independent clk_branch structs would create against the
same hardware bit.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gcc-msm8660.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index a6a4477ccdef..e81b8851a786 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -1518,6 +1518,38 @@ static struct clk_branch pmem_clk = {
 	},
 };
 
+/*
+ * Crypto Engine 2 (CE2) clock.
+ *
+ * On MSM8x60 the CE2 block at 0x18500000 is gated by a single hardware
+ * enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The vendor MSM8660
+ * clock-8x60.c routes both the "core" and "iface" consumer-name lookups
+ * to this one register, and the upstream QCE crypto driver requests
+ * both clock names via devm_clk_get_optional_enabled(). Without the
+ * clock present at probe the QCE MMIO window reads back 0x0 and DMA
+ * hangs indefinitely waiting for handshake signals that never arrive.
+ *
+ * Register a single clk_branch: the consumer DT can reference the same
+ * clock phandle twice under different clock-names ("core" and "iface"),
+ * which yields the same struct clk for both clk_get() calls. Per-
+ * consumer refcounting then works correctly and the single underlying
+ * enable bit is asserted while either consumer holds the clock
+ * prepared, instead of having two independent clk_branch structs
+ * racing the same hardware bit.
+ */
+static struct clk_branch ce2_h_clk = {
+	.halt_reg = 0x2fd4,
+	.halt_bit = 0,
+	.clkr = {
+		.enable_reg = 0x2740,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "ce2_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
 static struct clk_rcg prng_src = {
 	.ns_reg = 0x2e80,
 	.p = {
@@ -2566,6 +2598,7 @@ static struct clk_regmap *gcc_msm8660_clks[] = {
 	[GP2_SRC] = &gp2_src.clkr,
 	[GP2_CLK] = &gp2_clk.clkr,
 	[PMEM_CLK] = &pmem_clk.clkr,
+	[CE2_H_CLK] = &ce2_h_clk.clkr,
 	[PRNG_SRC] = &prng_src.clkr,
 	[PRNG_CLK] = &prng_clk.clkr,
 	[SDC1_SRC] = &sdc1_src.clkr,
-- 
2.43.0


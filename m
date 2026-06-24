Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F056118A93F;
	Wed, 24 Jun 2026 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304766; cv=none; b=oQ+QTMGqv3N8UaKlIFDVxo+uCsbrDsQGIeJHDjDWM+MSbaLTT4dwX/Qkq0bD1gRLbNNBGZz1bWbT+pCRu93b3Wo9KwP/QsJ5qzgz4Do1vlukjpmFfOJqP2Pf+MNuTXYwHEoIlYu7rcSH1OdoSEZZ1+epynC/jXUI1ZaGq7kq+x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304766; c=relaxed/simple;
	bh=c/Ed+Xjrj2IGOWL647EvKEFGPobPOV4d2Us+KTPTolY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dBxK0IRd1j4UlRlio8mFB1C73ETj4/mliYBRrsPyEO07RmeRlb5b3xuA7Ql4Zo7fcD49Og1O8t7XIGb7TYJPJc0ukFy657Z06IBz0scoKiwVUERhcLVh0JIDcx7iBaXtafS8yh13Vm79X1Fx1jZjjIK34U41Ybl+hc27IPei1UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=hhoBPKDy; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="hhoBPKDy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3uSjwmL4EbTen81eC7wTPWqRW/v/A4hMDubGZKs3NF4=; b=hhoBPKDy31+j8iBy4QEpnYSu5A
	bQR0PlKuWEXAsFfki3nNRMmEA1bTicm+cxkoAyDqozQKKM5PvtprIBK0mSYjR2LIxTqfHvDy3AtJk
	ksMAqYguxge46wO38IuZydS4abcIvPkwjoXkx9SXP22YXYGMBqPGprc0IbnxU6sTvBrPxCyOy4hXv
	l/9xHX4l8b1zZrHBZ79m/uZOzVxFw2tdwLNuw2I1VMxhz4tnihVCFZpD8o2CGixuIhG/rdImFMxAa
	RrL6aUw4n+saFeZ67uYhioo9vb8liZpRJOxhxOSE1O/ZsXcs03oXgCk5/FfBTcjLDtxtVV0P0OLoW
	HjM5aRGw==;
Received: from [81.57.40.39] (port=37932 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wcMsx-00000006N1g-26F0;
	Wed, 24 Jun 2026 14:39:16 +0200
From: Daniele Briguglio <hello@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
Date: Wed, 24 Jun 2026 14:39:14 +0200
Message-ID: <20260624123914.1767374-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

No in-tree board references these gates yet. Boards drive the codec
MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
managed clocks, clk_disable_unused() turns them off at boot. On a board
that relied on firmware leaving the output enabled, that cuts the MCLK
and analog audio stops working.

Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
state firmware left. A board that wants the kernel to own the gate can
reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.

Fixes: 02b9b0bb6269 ("clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO")
Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Closes: https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com/
Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 drivers/clk/rockchip/clk-rk3588.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 2ba9976654c..86953f9ffee 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -895,7 +895,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
 	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
 
 	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
@@ -912,7 +912,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
 	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
 	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
 			RK3588_CLKGATE_CON(7), 11, GFLAGS),
 	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
@@ -942,7 +942,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
 	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
 
 	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
 			RK3588_CLKGATE_CON(9), 6, GFLAGS),
@@ -2229,7 +2229,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
 	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
 	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
 			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
 	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNUSED,

base-commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8
-- 
2.47.3


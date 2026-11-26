Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704787;
	b=UfGIUIs4A7H7RPqLZ28qA85c9wtmOJUBJq8b6Ddg7CuEci7fAaNa1OXAibRVh6y755jL
	 XTeTaO4nmtp+dWZtMQhoBzNv+xMy60sw3EgLiOFgVi/LN1SC9VIFtRWDBP25mf8QzBZaq
	 yCpa3LAXqycS4IZI6Ch059SjDhFPXUhVrztSrWlaoSeUDZJuJXVggC25ieBIklnjaAh3m
	 lfN6sVboD3wSa9B2dqRX/rxEvBagw2e2QYYPv6/gfgL1APGmvIUhRtBIYqfJvveGDNNCl
	 WZgq1qyfKkgNK4hAnRZUUviLZyOvwJqp6RqF7ovJBGo6IwHVHaWohr+s6gos7iHPtbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704787;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LuSdbCS6PnEOFW/yBPEagnpefQJlzkts0oUQFSt4QkQ=;
	b=GnM+fVdIjTNsAjYZusTdgN0AyOw6neGjw8V18NmF35kw37IkORmMKQBLHvlxRM9k0FBL
	 8nS3/OTVJsrVKvZDYkwbjLYbOcbXMxs5akkrPF3TwKMijrk88jEy3wVIPy82xd633jKeZ
	 YAHiwbE0QweWHqalCfohAtLbbsMNvLPRmJVV+P3djGbzroiuirvlMeiM9Kln6CTMkY9ZD
	 tL8nihdZt9LZcacB+rF9QmivrzT6jESLXZuemUIl5QXl2h8UlY1q8l7d6nFtSxA4Qa5vG
	 BUuN6WnGR3ZgvdKfFvlveLUHVZ9a7CFTn2c5c/GhXLSImf6jLDBBG6ljIhkqINi6E4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JWiWAJSt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A50A606A32A;
	Thu, 26 Nov 2026 14:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A50A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JWiWAJSt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=VXjQmgPNcP6TxrE9fEJyZi07Hi5P0Q3culnMpUj9c98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JWiWAJStLHRo2lj/uUtvvglAI8dN/zmaCL/VwmSC2+oFe+qVIWaiucaNHbelwKhEm
	 9+RPqJ/ihcaxCZflBG5ggTpttlRkC+/nMzwCBxrHB0oEM7IjSJTyhXpz7Na75yfgpW
	 MDCF7Odlew+LZpAeL0aaM3EZIiNLuhC1jVPoje5lwp9jt6PLSZ1I1ewbgRsmth2h7P
	 81U3ZYUEU8Rj5915rfjq/0fqKQUCNmPWM7FuvHwXu94TQ0kHzhThg0YKh0284cnox5
	 B8FY+jm7BVJKt5f+vdyNCTHCH63bNN5yDlxo1xN4Zfk8BVmBgZ0K1eDdLKkTEk2jxn
	 MapqJCyKC+DXg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A567D17E0FD4;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 63808480031; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:38 +0100
Subject: [PATCH v3 3/6] clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate
 branches
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
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-3-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=WfqRSjYFz7+ljRQE5uaOc11qdMoKK31EtGs4gkDrNM4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9BgLmQS56N3xRiujYqbu7FvWjcjLib8h
 7MqHxszt3xtu4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qa7pEP/jmZJ6C/rwWR+v7DY5++az7FWNw+FIgrGJ5IlqSiFzidk2vKcxyBNNisbI64fMeEMlm
 AF9oSRdCMdoLBlDZmkZjQu64bMwveOM8B6PwFIx72Jd45EIFU5zgbfoKssucGoJHcuNQbHjv/3s
 IvZdei2MSevo+3hUL7OMYUPQdRRWQ0lo0eLkxwZIMOqDh8IdPySfpFlxFPiffLCRvPi07cb/OEl
 ZwcRy3YD+oAKaXuuLve0XaEEThTUpFBVQzVKDCldpARdabgcHODRz0j1UvziTtRPnzVBRow6Rah
 KRfCGTfLfuFFpjRCG2Nssk+psTrCZ8RiQLnabZnBAWCirOxlbRC3onC2pOdEynUWvaOx5v/2SIH
 EPth60jSuSNxkTfR1LVxghCybcmK+0GHpE0SvkiBX5/F4nJri+p6idi+72iAVvpW+80nbru6dw2
 M20V4iK1kV03pFHr0fmHhMdTkrMqDUW03pwNJZaobdyTyu5GIxnepC5PM5HDaKEl/C6nl+vQpfM
 bcIC7GAnP0xjZasghwEBEr3Mz8IGbVUhenm3YTwY+5yn4SfopwSBu91iOAwft287tq+ZvQic6Bx
 gC3PNmWiN66suX44mBfs8sYghVUWyWMt53scI2wX0uo42k1dYZbiNd9xDRC3iuMFp2GXzG2eEKX
 vh1G1MKENO5ej8D5OkgUq9w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

On the Rockchip RK3588, each memory channel has some bandwidth
monitoring silicon (hence the "DDR_MON"), which is driven by a clock
gated by PCLK_DDR_MON_CH0/1/2/3.

These clock branches were left out of the mainline clock tree until now.

Add them, with the proper CRU reg bits, and the proper parent.  They are
given the "CLK_IGNORE_UNUSED" flag, so that older device trees with
newer kernels don't turn off the clocks because they're seen as not in
use.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 24baa0ef9bf3..0485faf27163 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1349,6 +1349,14 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(CLK_DDR_CM0_RTC, "clk_ddr_cm0_rtc", mux_24m_32k_p, CLK_IS_CRITICAL,
 			RK3588_CLKSEL_CON(166), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(70), 4, GFLAGS),
+	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(20), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH1, "pclk_ddr_mon_ch1", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(20), 14, GFLAGS),
+	GATE(PCLK_DDR_MON_CH2, "pclk_ddr_mon_ch2", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(23), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH3, "pclk_ddr_mon_ch3", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(23), 14, GFLAGS),
 	GATE(PCLK_WDT, "pclk_wdt", "pclk_center_root", 0,
 			RK3588_CLKGATE_CON(70), 7, GFLAGS),
 	GATE(PCLK_TIMER, "pclk_timer", "pclk_center_root", 0,

-- 
2.53.0


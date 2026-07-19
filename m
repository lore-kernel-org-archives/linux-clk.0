Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC831195C
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495638; cv=none; b=ovD6U2g2oWp2jxy0elIOJrTF2Eje0AO7xrUzs9Haoy6ObGqxOiX6/TSBXQo7S0a/J/35KKPKmGrkyAsWDxNsuBwzvFESYrJ9o6p9azvYCgZqkqjEb+YeA40aqRRyg/i6rpxkFfJW1b7CNQxWsS0oozpgciu0oDymPaYH6YbH1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495638; c=relaxed/simple;
	bh=DDsOXp+Z72kK9qdiLJoanRdwCGRm/6FA5U02/PGt8IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBGef51b1PfmUyln/YBbASnDgGNiJN9lkpxmZ9tTuspbUBedGUgG+Y/sFg7nfml2fUOoqAhvRStMAmRK4UqpaVAyc09mLgadn28evwaPPJa6mLPpSsSDrD32lTGbe+/rg7FSfFHa6ePcmNc1eda2T5Qc4gk6f4Rw7auLyKeOidY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIa9gVkV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIa9gVkV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954afac04bso20264495e9.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495629; x=1785100429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=oIa9gVkVF2xKl89QwfpcQQrPKVawR0oHZ07CaJK2gaWCEznKeLVAxMfVmun+MUZ+aO
         OLytHQfWCdqHRQTCTs9GnUS05Bly0MoZy8hhBq7pS5lnU3hU1raqAulP0Ix1Z9GGZIG5
         uKBjeJiO/P2RuzR9vbsjBJgexO932ZKEqigZBv4dfXdJEH+ubjFnkotU9SfwzF7n+hbp
         /qN6+bkpWlcRXq+pbfzrYUiny6MOC/5KWujDE8kkT/zY5qmcRTlJVKuLH5i2iYxuXHgg
         zZfQ7PSVzGkGbUk2h58o3KUXctWZvpJ7hq+0GR7ycNH8bNnk/PTY3H10d60TdYvyCwdb
         WQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495629; x=1785100429;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=nKAp81Gxbc6haHUGi4ptID+kcOeu/WqL448DQjvQJGHvurTzUc9GWIfgnOHxD8F61+
         FEtPL/1twNj9NDr7ANTzgSaFtOK5wNjQQdaWd1Fzv6Y8f/XtEmaI5Ah8EWkD12CyvVtt
         X0G9XnZFrnODo8nUqlezYNeXOGq9TGYhaSEwzlxivK5NP8rmLjzL69+lfbBmjHyyLE+u
         Hz7nf3e1cwnEz/Fa5dWsFxgYwdqmkcIJCus0xI1KpkyChFk11DkPcOxfrIlUvftKwy6d
         K5FbETcLbycHG2/oKZL0czFVCtzRGodRtxpPWK8EIo4304a+UNA4BZreKUlR+nm5Nn7C
         l5GQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpyc8HYR/Rop7prjYYlA8m/9Iq9LlcpEuUthRKhKsCr8Dymh+vppjOAmsr0fFwQxU63hrgAV+HIxQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+D5US7X6WLTq7iaVQXDzPAgW+Wqu04Tlm9R+YhSdbKCdIOmGJ
	9lofW0GQWLc3HxmupuVLwRFuH+hBnuhAqrto72RiLAkL1JD+D7MqohF2
X-Gm-Gg: AfdE7cm9BmxbMnymYXuiJnodjZyW7k/DQvs5WkPEfDS++fYPJlP79oHoxTgkgt6eHIN
	EgTqYAF3A/RJdaEE/Q3LxV4QIutHdSGMPuzxgBfu5OF808Yvq7pH8jGqHHy+ls+63nCKlD1ENft
	1NsAMfRDveoXS48r3uRiYExw3elbYAzVuGz0pqomgKBUoJieTsJOdkgS0xgcdAnvr6Uc1zqd/Z+
	e49m2+gJXNfwS90CuNFno5dl7AMJRTIejkGuGS1LVLP7dTaUVXQG3z55ZbDI1/4orM29ePgtGDa
	AeyxncchwhyHXAu6p81wJ0SY4D2YecRMY3cEodtNgFsWYc3BBT0U/yUeitSzUKwwyGjemexpCry
	0oVahe12OUrObd69rq4NQZwvXx32c0a3v78vOwW0WDeqCt3Mv0WpaHD65tu45WKY5PO2BR/Ripk
	ngxDOGs7pQiBerhxKUleiQh7427PlVhGW5mJa+
X-Received: by 2002:a05:600c:4703:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4954e893f8cmr104567935e9.15.1784495629064;
        Sun, 19 Jul 2026 14:13:49 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:48 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 3/4] clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
Date: Sun, 19 Jul 2026 23:13:18 +0200
Message-ID: <20260719211319.982285-4-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register the existing sunxi-ng mux notifier on pll-gpu so the GPU mod
clock is parked on the fixed pll-periph0-600M output while the PLL is
being reprogrammed, and switched back once it has locked, following the
cpux precedent of other sunxi SoCs.  The mux switch is glitch-free per
the T527 manual (GPU_CLK_REG, "The clock selection supports glitch-free
switch").

Nothing retunes pll-gpu at runtime today (the mux does not propagate
rate requests and all standard OPPs resolve to pll-periph0 outputs),
but the higher speed-bin operating points (648-792 MHz) will need
pll-gpu as a live parent, and any direct clk_set_rate() on the PLL is
now safe.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 979e53e63..4341eb66c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -1667,6 +1667,17 @@ static const u32 pll_regs[] = {
 	SUN55I_A523_PLL_NPU_REG,
 };
 
+/*
+ * Park the GPU on the fixed pll-periph0-600M output while pll-gpu
+ * changes rate; the mux switch is glitch-free (T527 manual, GPU_CLK_REG).
+ */
+static struct ccu_mux_nb sun55i_a523_gpu_nb = {
+	.common		= &gpu_clk.common,
+	.cm		= &gpu_clk.mux,
+	.delay_us	= 1,
+	.bypass_index	= 1, /* pll-periph0-600M */
+};
+
 static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -1698,6 +1709,10 @@ static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Reparent the GPU during pll-gpu rate changes */
+	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
+				  &sun55i_a523_gpu_nb);
+
 	return 0;
 }
 
-- 
2.47.3


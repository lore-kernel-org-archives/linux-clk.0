Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5DE169397;
	Sat,  4 Jan 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976449; cv=none; b=UG6KhD7HH2v1d57FaBUpz176eoolKcb6fk5UA4v0/b7MFWC1KUY+MVgKkDdoyLZ3feXwFgL0wsAqo9LCIRG10097UFIPzS1qNXibJ5RzgKlT5u47bA0+V81VcjldmUZSjnsBa3Pfd2+rj8Ovgu/AnzVKBB3RWfT+tnizm8W168s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976449; c=relaxed/simple;
	bh=nFF6gWVnSc4ZHH6uufJVq5/QMSkXaG4JWqQjtwpwgzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQd8wr4FQoEVQZg2rdO0OPSRyuLgk11YSgsFDU1yuaXyAYsgU1+o2/oAOxXVhJfftAdNE/3s+nD6MSwOlcpspntX92r4L+ZuKfbh3TLo5vFa3aM33hDRWaIw0/coqAobaVt5JnInbW9q7I8kkc19+g1xxZ4ac3gDWfox+5qGugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsZfJR7o; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsZfJR7o"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso183722505ad.3;
        Fri, 03 Jan 2025 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976447; x=1736581247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIxbJ2OQHNBv+4wB0JZ4sOT/J/UNSOHviGNvJzFTzY0=;
        b=gsZfJR7oK9jUnTKeZQaFG2+6GI4BI7riPgIvegHsbaQnRqobMRx556m8gWvjtLtzRI
         6ZFSUJvpAG2b6mx8k68VyEVbi7ZtDpSTkxzEQZId288NL6M+sCkQq2/fChUgQfRT3fen
         TSKXtbh+TxxBZL7r4Xp8vSYXPdjXfeEtACpigQO3NPqW+JqLx/TCQSHwnUW8LCt6dNOk
         HtugGk2nwHO9ZJ0OVXr23iIrNFRI4+g/RZuQUsRkD2ek0G6VdTYzXqEhA+bAgcFvJzf3
         us47Cs89HT/O2kIwy5z7bWOT/gZ8MIYZ6sJuCBlavyVyCKkPYnrXvl4Jvpplb9idybRO
         wA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976447; x=1736581247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIxbJ2OQHNBv+4wB0JZ4sOT/J/UNSOHviGNvJzFTzY0=;
        b=DobCUAdT4TR//hlIEsfCKDuiTtCkI4qjG3MbvN/j/Up7mFIdLsCCIJHwCUMJHYDoVC
         +evtbg20NH3j7d0Siid1ro0/+fyruMMPkz13hyJQZ/5C+Um0j04gDX8hHJ7mi5jC0oA/
         yaSgqHK4S3nDyWwJ9cIvzKTrFxWqzSSx6XiMSON+7n8ITVNKkymJ3OEtGTTxzOSlCowE
         qhHjWh8EJZbD54dZ2pIoj2tGrew88z/yPInGnjYql6JuLTJBQ8WftjkKKt+eBYfHYrom
         7KhGK4BHBX8/QGw6eLzTz6OuoEYasRU9oZwpvO4EF9JgnOnYfG4DC8lxYQHxJCsyxODM
         wr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAxu4/aEZ+EBXfJDOx+XLhBIVWIvxqBuo3tfxI0HgsCisOHctM4RZKTTqx8XAQIB9UAHYLDEsCfeW/@vger.kernel.org, AJvYcCXdKmJ8GRyfHJ75vJYZcO9MFa8WkohfYt1jFL9t9ztCvJ17TYPT2i/K5Z9lljZ9W8MPByp0w3sk4qFhDg0h@vger.kernel.org, AJvYcCXreTUNPWLVkQMMsBKi0dqAS9pv8WNRoteHZm6WWPTtQA5klwuN5Ax++89Fy0RXcQuXBYkcJ7wSlixM@vger.kernel.org
X-Gm-Message-State: AOJu0YyYpduYJepztDGSZQZITXD4S3s2xE/1AtfRcuYJ77jcgHET7u33
	qdJb6YPgqXq46rTiAKh4jcTyJRzAVhGH1t3Rc7jYTZpdEniQFQ8cGb5kkyqp
X-Gm-Gg: ASbGnctAhqlHzXHhDFvNieKjkdpx9EeMeHjZPeAhWHBckPMx90ptNS8wBob79ksAQ9P
	M3e3ibBE8bLXi/Zm1Z7BBV4JLFEHu0wAd0q5BkXbzQnmkq/6Ac1dF4Lds2x4xASX2GkZk/flgUo
	CoxfzRSXLun+1NLKlHfixCnomXOXJs0mDZH2XmDoB0lX3ibiM/Os2dAlHh3mBm7f/yWM9js3UCZ
	BLf5bBw3ZtgAtyfzEOlAzIZllGdFmnlHCblpgLOp94+uIjrqg==
X-Google-Smtp-Source: AGHT+IGzouKoKcczOFE/BlEmlBfzMQU1FzvtTcHjF3vHVcWHcn0aI0SCAElSuL8sd9OBoHBrGue/Jg==
X-Received: by 2002:a17:903:2449:b0:218:a43c:571e with SMTP id d9443c01a7336-219e6ebd140mr793188505ad.28.1735976447244;
        Fri, 03 Jan 2025 23:40:47 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:46 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 4/4] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
Date: Fri,  3 Jan 2025 23:37:00 -0800
Message-ID: <20250104074035.1611136-5-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop force-selecting PLL-MIPI as TCON0 parent, since it breaks video
output on Pinebook that uses RGB to eDP bridge.

Partially revert commit ca1170b69968 ("clk: sunxi-ng: a64: force
select PLL_MIPI in TCON0 mux"), while still leaving
CLK_SET_RATE_NO_REPARENT flag set, since we do not want the clock to
be reparented.

The issue is that apparently different TCON0 outputs require a different
clock, or the mux might be selecting the output type.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment
clearly showed that whenever PLL_MIPI is selected as TCON0 clock parent,
the video output stops working.

Therefore, TCON0 clock parent corresponding to the output type must be
assigned in the device tree.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 3a7d61c81667..ba1ad267f123 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -535,11 +535,11 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
 				 CLK_SET_RATE_PARENT);
 
 /*
- * DSI output seems to work only when PLL_MIPI selected. Set it and prevent
- * the mux from reparenting.
+ * Experiments showed that RGB output requires pll-video0-2x, while DSI
+ * requires pll-mipi. It will not work with incorrect clock, the screen will
+ * be blank.
+ * sun50i-a64.dtsi assigns pll-mipi as TCON0 parent by default
  */
-#define SUN50I_A64_TCON0_CLK_REG	0x118
-
 static const char * const tcon0_parents[] = { "pll-mipi", "pll-video0-2x" };
 static const u8 tcon0_table[] = { 0, 2, };
 static SUNXI_CCU_MUX_TABLE_WITH_GATE_CLOSEST(tcon0_clk, "tcon0", tcon0_parents,
@@ -959,11 +959,6 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 
 	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
 
-	/* Set PLL MIPI as parent for TCON0 */
-	val = readl(reg + SUN50I_A64_TCON0_CLK_REG);
-	val &= ~GENMASK(26, 24);
-	writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
-
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_desc);
 	if (ret)
 		return ret;
-- 
2.47.1


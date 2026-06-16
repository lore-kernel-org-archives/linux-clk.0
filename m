Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307D42EEC7
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606712; cv=none; b=dHwCa+2ZQkrhZr5zjm9wO1dSlVJ6Kj8t6w30D7A2uV367MJ7GH6r9qYqMAS8DvZQ3sICntoj8NaXfBazObN7rqNblyhKMM4jwLcMcUP7RYKFM4ao+Ai1lDBt2gSUoeJb/YO3EonoDaUh6lMjFItTmPFkTwm6dN6/5CZ6BRW9Bpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606712; c=relaxed/simple;
	bh=TYiIgFrPD6Ex09yYScNeYAsRnxuNwm3Tf9OTaxyfK44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5FFB9uqVpIXwahIjRFzPKvX0xWmhvXqLc+4tpxYFCV+XnJRm1OXc/zS11tWesmaR4hwrZy21seJcGKYFSkYolzq3yEJxM4xdRhVUxy8eOTZ7n6kLaxegi/GypXL7fmjVanHQ3wEaUuwD1DFfLnItJXPIueFcNYNDMxORLeNfTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On1uQfK4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On1uQfK4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso32920675e9.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606706; x=1782211506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRdQ0mB8T22sJy61YojBzvNldoyOxyXfa5OzvwUaJnU=;
        b=On1uQfK4rERpKO8wAWysRH6HjsW88QMhk9dkf7Mf7OP4PXbyOnuFaq6iiLTYa2wOyy
         0FyQVUwq63uYva6BNokNsjFcCbZpwSicc7SqU45N3whe8oPPPoWjWITkd3LKMoX7NdTQ
         p/eJ1A0bACIyY8dUZeJOnuSrMoR7rxgs1XCQ9hpdkkcV9YTmE/mywTguqIdvO1shM+Vi
         kLuDLOa8p0JyfHYJJGbcYeeP17OUnffshM1DzhaHpMaQcJRSUkQo6zinw9qd7fHqH4/G
         UFnSUPZiuowr1xC6kR3jGYJ8ut4q1i7CseLzk4KunQMMqpbM398oOQx1np21tk9P8B5k
         kKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606706; x=1782211506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRdQ0mB8T22sJy61YojBzvNldoyOxyXfa5OzvwUaJnU=;
        b=o0DYY3vCbozaJ7PFyXAoqe/MHZoCIQNJ/mf55tSH8yXXtfCaVFtJg4rJxwq7W3Oot1
         HyewmhLU8NL+cbFafJswPu+PyJ48qQnvw5EzFNE8exV9iS6IIJpFkThCReFvVy2d7WkS
         27ByeiJvdF4M7yGbi7yiCAv58Xd7nlTzrW0yFd+mHimqklBHmg/enNEvv4ynu3t1eQl+
         ru5HnkOKjwY8FJcAmJ7A/w3tYnZXxB4d7s48BSNwBFB7OG9HDeAxBjdS003MtgJahcA7
         vIbWJNNxd4etrTovwV451j2sR7APHf2eju9P2+QUhzoOa+L1TkuoBbI18HJiHpiMZItI
         H0yw==
X-Forwarded-Encrypted: i=1; AFNElJ/FcWEqSkaxVxD8bBQ1ur5xnSHlW6DvPguGG2yw1guXI9uX40Ht+/MnQhNYeQaIVr/Ng9YeZh7tyEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYBaKsj5+uH4+vm4oDDO/Uz7lsKABQc7ztwnsl7taXTkjWeJbY
	f71q1t+8EGxbpwFcvr+3W/SgitUj7si2bSwFP6BqafY7oN5NlVtO3cyI
X-Gm-Gg: Acq92OHRTuVTyF9fdbIvFDwuVNZkOaOT1puJbFtC50RTeDYXZKUfrew/a1v84vF9jU6
	dnu95DSf5ljfyIxYqzhLtBbDM/nUwVSM6K/oAu1eeTwOD+zoIUdC1j2hlUGQQipQdVRF23ftzB4
	59R9SHuzDakZgTtjO0PnD3bwsbtxopul8x6tLhbYJdZ8YOdYQfmyhqr7Z7MV7as8tVhHafEulHe
	S82h0yGoAe1zodWhgCkLRhkegEeSPvTAET2xMhuB2/jWTyJM+T84pXm/JC1NIofbxk6N3Bq8LOX
	aV5s/FmF3FdtIgfpPf5rGqIqqB3su/iZHKsHWx/lIREwqyYUCCFZmBX0XBe3iRMl5kyIgNd+GhP
	MkRcFjXyWY9doIB0OLvxQw1eAZyW1fDuOHBrUfgZMpuBbEBVp+yeNfaQ2IcHzUyf5sbGV5PzWnO
	DGToHODkmyVC90pbMiph+DMArLth1Y6cY+wkUWZ7SsMIzJ7dgA
X-Received: by 2002:a05:600c:574d:b0:492:2e58:666c with SMTP id 5b1f17b1804b1-4922ffa6323mr30917895e9.37.1781606705902;
        Tue, 16 Jun 2026 03:45:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:05 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 03/10] clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
Date: Tue, 16 Jun 2026 11:44:45 +0100
Message-ID: <20260616104459.410743-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add module clock and reset definitions for the USB2.0 interfaces on the
RZ/G3L (r9a08g046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/clk/renesas/r9a08g046-cpg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index edc83a4104b2..4488bd1988e8 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -416,6 +416,16 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("ssi3_pclk_sfr",	R9A08G046_SSI3_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 7,
 					MSTOP(BUS_MCPU1, BIT(13))),
+	DEF_MOD("usb_u2h0_hclk",	R9A08G046_USB_U2H0_HCLK, R9A08G046_CLK_P1, 0x578, 0,
+					MSTOP(BUS_PERI_COM, BIT(5))),
+	DEF_MOD("usb_u2h1_hclk",	R9A08G046_USB_U2H1_HCLK, R9A08G046_CLK_P1, 0x578, 1,
+					MSTOP(BUS_PERI_COM, BIT(7))),
+	DEF_MOD("usb_u2p0_exr_cpuclk",	R9A08G046_USB_U2P0_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 2,
+					MSTOP(BUS_PERI_COM, BIT(6))),
+	DEF_MOD("usb_pclk",		R9A08G046_USB_PCLK, R9A08G046_CLK_P1, 0x578, 3,
+					MSTOP(BUS_PERI_COM, BIT(4))),
+	DEF_MOD("usb_u2p1_exr_cpuclk",	R9A08G046_USB_U2P1_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 4,
+					MSTOP(BUS_PERI_COM, BIT(13))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -531,6 +541,11 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
 	DEF_RST(R9A08G046_SSI3_RST_M2_REG, 0x870, 3),
+	DEF_RST(R9A08G046_USB_U2H0_HRESETN, 0x878, 0),
+	DEF_RST(R9A08G046_USB_U2H1_HRESETN, 0x878, 1),
+	DEF_RST(R9A08G046_USB_U2P0_EXL_SYSRST, 0x878, 2),
+	DEF_RST(R9A08G046_USB_PRESETN, 0x878, 3),
+	DEF_RST(R9A08G046_USB_U2P1_EXL_SYSRST, 0x878, 4),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
-- 
2.43.0


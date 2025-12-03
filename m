Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C499B2DF700
	for <linux-clk@vger.kernel.org>; Wed,  3 Dec 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754918; cv=none; b=RAMkg5bNkDMb5ExtDuO18dI0p2k1a1uz5SlccEXHSdu0f1IV7YE08GtzDO5M7vYIq05iXuCI9lM6VJw/rBcFSMs7wFJZzBbwx6brvxpzVlPVRyG5vK99RmZwltvg0a29RrO9ykUAujckgZVRclUYa1whOK8E09D5+Avx8eUTjaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754918; c=relaxed/simple;
	bh=RHsfC5vxcciQATxe9YarnQGeQw5YnNq/z9D9sXdnhlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrBCv3tdVFGKtlUgoQR96Ayw04RfKnu3nq1hReN7sPB//02BckKpfDEkrAv79r38SGMMHmn0kUTLbZJ+N8czmPGo0oTmnPJJUdt7ApBVWQbUS7TrzrOsAMnpDrjuuiNUmyj3/c81ypdQ3muALWSXiBm8FozJmcDnzjCjFaI3OC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh38ij39; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh38ij39"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so46889175e9.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 01:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764754914; x=1765359714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBFclzZ4yxDhuYlk/vr9Dvv4zCnd7JgGJLgkaeVG+Z8=;
        b=nh38ij39m0AR2O2bfdlQA4P9KEXR9JYphyABYWSCeG6lq8qVA73Jm8jcwBhQfEG4DK
         ax2HJb7glhs0743uHpE7hp0eUObiDeBhv+BIjHGzz1mNZGaPDbLZmzBrfKlUwyv34Cca
         mk8RfqgCvpMMp1oKckb/09npnLaq8RigYSNmTiHUxakTyWW7ENXHRaMxrqMeNWAU+Rbg
         1AaWcKmfQrlb0b/lXMkVjf84lIlR+iJqhvwvX1HP32AGYfQgNpZpIXpEDkwf1QqHFvXh
         m60UOM+aBE6LQu39E5H3xIQLQDt2yBaWQat4QScoC4bW0rAX0HSmAY+wlpuImvlm/s2I
         /7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764754914; x=1765359714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBFclzZ4yxDhuYlk/vr9Dvv4zCnd7JgGJLgkaeVG+Z8=;
        b=StsVredvjCQPy3CpGSUPlZOtGKyZ/7gnz8jPbFA0eSW4AN8eDTTD2KqPu0mxTGiTar
         Lr0LxIb/zS1tS62vbjRyoXS9Hfwt+JUvPYct85LBw//mcILQSTQNQPS53d7wzbE1Ks/r
         hTMuovU+qd6ly+V/J6e2QwNv0SXSl+S4wsKFIPVyM3HFWhT7WCYmR6E3O4tmiFZOHxm4
         ggKO88hqgt/2Yj2RPUXVGfxBk8yrNq8oLKHS9xUFFoC0Dy4/6s2dl8uPBXswK72WzA+b
         pB4dQf4HW/Qc3a3/R042+Qnf4nQ+Bj/IDi03iKziMQsw5fyhWz93LSlRCVHYzfIjPMyr
         UoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsY5XTPfkLih2FtMwLu50DCwRh4njSoymjlpMQt00K26yMJzQkZmEVDjxakGlmp4rk/Z7k0dUa/zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLD5BDFLuZLjcJS3l10cMLD9f5EI06U0oRMIoGDaCGJqps3Wa
	AtAMa1tkMxJHWKvbGPrPRW5yRneBcGC0qt+9aGL/9kBdzUJr3FxHj7JM
X-Gm-Gg: ASbGnctvNC2LGMlgXnz9JnQu0hXxW/4tB1ZWKyrHzU0K4kx7vkzwnbISdlRsTs/eS6X
	l0wy4YGecxoLrvUpAuoDAZb1tw3MwAc90TK2afTy+XaZpu2OcJrR6tcWrvSil8IXS7GrysEhTHF
	vCl/pRV4FIvAENQk/DWEULYaEdpakpYjz1Fukv+yfNZIf+EOZjNordAswSjvmgdDkwYLxLuIndJ
	HP75SzqfouCY6YCkNjbIRqZLbVdsJk43psf8R9GwQ/EiPwRn7TdadCMM8B8xkiYsx/jMQbau1a+
	/+ZClI/rT1Enpn5EKbXAu9QIom5E7St+yk+6gBDvB7azdJmVXrluNcfKchL0s4bsvxQm5tSCmuG
	kHkUDEpe+a3Yw51zZ7mN6ZU5EQNHWBQbus2X+NY1ag1u80ucU8zvVnC3no7HTMV8BIhtPWgghAv
	t8/5IYlsWv+Aa7KPF1OWO3DhNJbjShTjRAOkx5gyuF6beEfQ==
X-Google-Smtp-Source: AGHT+IE0X/yc7t+huXM01s4RobngVl0mYbYLIe9SYwkdeFS8ZPqHCEyM8fw7wTfQafQZJyM9avrrgQ==
X-Received: by 2002:a05:600c:3b13:b0:477:952d:fc11 with SMTP id 5b1f17b1804b1-4792af1b157mr19791645e9.16.1764754913746;
        Wed, 03 Dec 2025 01:41:53 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7655:4344:c8be:eb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7a87f8sm38632815e9.12.2025.12.03.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:41:53 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a09g057: Add entries for RSCIs
Date: Wed,  3 Dec 2025 09:41:47 +0000
Message-ID: <20251203094147.6429-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the RSCI IPs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
note, as done on RZ/G3E pclk_sfr clock is dropped as its the same as pclk.
---
 drivers/clk/renesas/r9a09g057-cpg.c | 126 ++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 400d9e94f2e9..991f9a2ec12e 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -46,6 +46,9 @@ enum clk_ids {
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
+	CLK_PLLCLN_DIV64,
+	CLK_PLLCLN_DIV256,
+	CLK_PLLCLN_DIV1024,
 	CLK_PLLDTY_ACPU,
 	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
@@ -182,6 +185,9 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
+	DEF_FIXED(".pllcln_div64", CLK_PLLCLN_DIV64, CLK_PLLCLN, 1, 64),
+	DEF_FIXED(".pllcln_div256", CLK_PLLCLN_DIV256, CLK_PLLCLN, 1, 256),
+	DEF_FIXED(".pllcln_div1024", CLK_PLLCLN_DIV1024, CLK_PLLCLN, 1, 1024),
 
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
@@ -288,6 +294,106 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
 						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("rsci0_pclk",			CLK_PLLCLN_DIV16, 5, 13, 2, 29,
+						BUS_MSTOP(11, BIT(3))),
+	DEF_MOD("rsci0_tclk",			CLK_PLLCLN_DIV16, 5, 14, 2, 30,
+						BUS_MSTOP(11, BIT(3))),
+	DEF_MOD("rsci0_ps_ps3_n",		CLK_PLLCLN_DIV1024, 5, 15, 2, 31,
+						BUS_MSTOP(11, BIT(3))),
+	DEF_MOD("rsci0_ps_ps2_n",		CLK_PLLCLN_DIV256, 6, 0, 3, 0,
+						BUS_MSTOP(11, BIT(3))),
+	DEF_MOD("rsci0_ps_ps1_n",		CLK_PLLCLN_DIV64, 6, 1, 3, 1,
+						BUS_MSTOP(11, BIT(3))),
+	DEF_MOD("rsci1_pclk",			CLK_PLLCLN_DIV16, 6, 2, 3, 2,
+						BUS_MSTOP(11, BIT(4))),
+	DEF_MOD("rsci1_tclk",			CLK_PLLCLN_DIV16, 6, 3, 3, 3,
+						BUS_MSTOP(11, BIT(4))),
+	DEF_MOD("rsci1_ps_ps3_n",		CLK_PLLCLN_DIV1024, 6, 4, 3, 4,
+						BUS_MSTOP(11, BIT(4))),
+	DEF_MOD("rsci1_ps_ps2_n",		CLK_PLLCLN_DIV256, 6, 5, 3, 5,
+						BUS_MSTOP(11, BIT(4))),
+	DEF_MOD("rsci1_ps_ps1_n",		CLK_PLLCLN_DIV64, 6, 6, 3, 6,
+						BUS_MSTOP(11, BIT(4))),
+	DEF_MOD("rsci2_pclk",			CLK_PLLCLN_DIV16, 6, 7, 3, 7,
+						BUS_MSTOP(11, BIT(5))),
+	DEF_MOD("rsci2_tclk",			CLK_PLLCLN_DIV16, 6, 8, 3, 8,
+						BUS_MSTOP(11, BIT(5))),
+	DEF_MOD("rsci2_ps_ps3_n",		CLK_PLLCLN_DIV1024, 6, 9, 3, 9,
+						BUS_MSTOP(11, BIT(5))),
+	DEF_MOD("rsci2_ps_ps2_n",		CLK_PLLCLN_DIV256, 6, 10, 3, 10,
+						BUS_MSTOP(11, BIT(5))),
+	DEF_MOD("rsci2_ps_ps1_n",		CLK_PLLCLN_DIV64, 6, 11, 3, 11,
+						BUS_MSTOP(11, BIT(5))),
+	DEF_MOD("rsci3_pclk",			CLK_PLLCLN_DIV16, 6, 12, 3, 12,
+						BUS_MSTOP(11, BIT(6))),
+	DEF_MOD("rsci3_tclk",			CLK_PLLCLN_DIV16, 6, 13, 3, 13,
+						BUS_MSTOP(11, BIT(6))),
+	DEF_MOD("rsci3_ps_ps3_n",		CLK_PLLCLN_DIV1024, 6, 14, 3, 14,
+						BUS_MSTOP(11, BIT(6))),
+	DEF_MOD("rsci3_ps_ps2_n",		CLK_PLLCLN_DIV256, 6, 15, 3, 15,
+						BUS_MSTOP(11, BIT(6))),
+	DEF_MOD("rsci3_ps_ps1_n",		CLK_PLLCLN_DIV64, 7, 0, 3, 16,
+						BUS_MSTOP(11, BIT(6))),
+	DEF_MOD("rsci4_pclk",			CLK_PLLCLN_DIV16, 7, 1, 3, 17,
+						BUS_MSTOP(11, BIT(7))),
+	DEF_MOD("rsci4_tclk",			CLK_PLLCLN_DIV16, 7, 2, 3, 18,
+						BUS_MSTOP(11, BIT(7))),
+	DEF_MOD("rsci4_ps_ps3_n",		CLK_PLLCLN_DIV1024, 7, 3, 3, 19,
+						BUS_MSTOP(11, BIT(7))),
+	DEF_MOD("rsci4_ps_ps2_n",		CLK_PLLCLN_DIV256, 7, 4, 3, 20,
+						BUS_MSTOP(11, BIT(7))),
+	DEF_MOD("rsci4_ps_ps1_n",		CLK_PLLCLN_DIV64, 7, 5, 3, 21,
+						BUS_MSTOP(11, BIT(7))),
+	DEF_MOD("rsci5_pclk",			CLK_PLLCLN_DIV16, 7, 6, 3, 22,
+						BUS_MSTOP(11, BIT(8))),
+	DEF_MOD("rsci5_tclk",			CLK_PLLCLN_DIV16, 7, 7, 3, 23,
+						BUS_MSTOP(11, BIT(8))),
+	DEF_MOD("rsci5_ps_ps3_n",		CLK_PLLCLN_DIV1024, 7, 8, 3, 24,
+						BUS_MSTOP(11, BIT(8))),
+	DEF_MOD("rsci5_ps_ps2_n",		CLK_PLLCLN_DIV256, 7, 9, 3, 25,
+						BUS_MSTOP(11, BIT(8))),
+	DEF_MOD("rsci5_ps_ps1_n",		CLK_PLLCLN_DIV64, 7, 10, 3, 26,
+						BUS_MSTOP(11, BIT(8))),
+	DEF_MOD("rsci6_pclk",			CLK_PLLCLN_DIV16, 7, 11, 3, 27,
+						BUS_MSTOP(11, BIT(9))),
+	DEF_MOD("rsci6_tclk",			CLK_PLLCLN_DIV16, 7, 12, 3, 28,
+						BUS_MSTOP(11, BIT(9))),
+	DEF_MOD("rsci6_ps_ps3_n",		CLK_PLLCLN_DIV1024, 7, 13, 3, 29,
+						BUS_MSTOP(11, BIT(9))),
+	DEF_MOD("rsci6_ps_ps2_n",		CLK_PLLCLN_DIV256, 7, 14, 3, 30,
+						BUS_MSTOP(11, BIT(9))),
+	DEF_MOD("rsci6_ps_ps1_n",		CLK_PLLCLN_DIV64, 7, 15, 3, 31,
+						BUS_MSTOP(11, BIT(9))),
+	DEF_MOD("rsci7_pclk",			CLK_PLLCLN_DIV16, 8, 0, 4, 0,
+						BUS_MSTOP(11, BIT(10))),
+	DEF_MOD("rsci7_tclk",			CLK_PLLCLN_DIV16, 8, 1, 4, 1,
+						BUS_MSTOP(11, BIT(10))),
+	DEF_MOD("rsci7_ps_ps3_n",		CLK_PLLCLN_DIV1024, 8, 2, 4, 2,
+						BUS_MSTOP(11, BIT(10))),
+	DEF_MOD("rsci7_ps_ps2_n",		CLK_PLLCLN_DIV256, 8, 3, 4, 3,
+						BUS_MSTOP(11, BIT(10))),
+	DEF_MOD("rsci7_ps_ps1_n",		CLK_PLLCLN_DIV64, 8, 4, 4, 4,
+						BUS_MSTOP(11, BIT(10))),
+	DEF_MOD("rsci8_pclk",			CLK_PLLCLN_DIV16, 8, 5, 4, 5,
+						BUS_MSTOP(11, BIT(11))),
+	DEF_MOD("rsci8_tclk",			CLK_PLLCLN_DIV16, 8, 6, 4, 6,
+						BUS_MSTOP(11, BIT(11))),
+	DEF_MOD("rsci8_ps_ps3_n",		CLK_PLLCLN_DIV1024, 8, 7, 4, 7,
+						BUS_MSTOP(11, BIT(11))),
+	DEF_MOD("rsci8_ps_ps2_n",		CLK_PLLCLN_DIV256, 8, 8, 4, 8,
+						BUS_MSTOP(11, BIT(11))),
+	DEF_MOD("rsci8_ps_ps1_n",		CLK_PLLCLN_DIV64, 8, 9, 4, 9,
+						BUS_MSTOP(11, BIT(11))),
+	DEF_MOD("rsci9_pclk",			CLK_PLLCLN_DIV16, 8, 10, 4, 10,
+						BUS_MSTOP(11, BIT(12))),
+	DEF_MOD("rsci9_tclk",			CLK_PLLCLN_DIV16, 8, 11, 4, 11,
+						BUS_MSTOP(11, BIT(12))),
+	DEF_MOD("rsci9_ps_ps3_n",		CLK_PLLCLN_DIV1024, 8, 12, 4, 12,
+						BUS_MSTOP(11, BIT(12))),
+	DEF_MOD("rsci9_ps_ps2_n",		CLK_PLLCLN_DIV256, 8, 13, 4, 13,
+						BUS_MSTOP(11, BIT(12))),
+	DEF_MOD("rsci9_ps_ps1_n",		CLK_PLLCLN_DIV64, 8, 14, 4, 14,
+						BUS_MSTOP(11, BIT(12))),
 	DEF_MOD("rtc_0_clk_rtc",		CLK_PLLCM33_DIV16, 5, 3, 2, 19,
 						BUS_MSTOP(3, BIT(11) | BIT(12))),
 	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
@@ -488,6 +594,26 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
+	DEF_RST(8, 1, 3, 18),		/* RSCI0_PRESETN */
+	DEF_RST(8, 2, 3, 19),		/* RSCI0_TRESETN */
+	DEF_RST(8, 3, 3, 20),		/* RSCI1_PRESETN */
+	DEF_RST(8, 4, 3, 21),		/* RSCI1_TRESETN */
+	DEF_RST(8, 5, 3, 22),		/* RSCI2_PRESETN */
+	DEF_RST(8, 6, 3, 23),		/* RSCI2_TRESETN */
+	DEF_RST(8, 7, 3, 24),		/* RSCI3_PRESETN */
+	DEF_RST(8, 8, 3, 25),		/* RSCI3_TRESETN */
+	DEF_RST(8, 9, 3, 26),		/* RSCI4_PRESETN */
+	DEF_RST(8, 10, 3, 27),		/* RSCI4_TRESETN */
+	DEF_RST(8, 11, 3, 28),		/* RSCI5_PRESETN */
+	DEF_RST(8, 12, 3, 29),		/* RSCI5_TRESETN */
+	DEF_RST(8, 13, 3, 30),		/* RSCI6_PRESETN */
+	DEF_RST(8, 14, 3, 31),		/* RSCI6_TRESETN */
+	DEF_RST(8, 15, 4, 0),		/* RSCI7_PRESETN */
+	DEF_RST(9, 0, 4, 1),		/* RSCI7_TRESETN */
+	DEF_RST(9, 1, 4, 2),		/* RSCI8_PRESETN */
+	DEF_RST(9, 2, 4, 3),		/* RSCI8_TRESETN */
+	DEF_RST(9, 3, 4, 4),		/* RSCI9_PRESETN */
+	DEF_RST(9, 4, 4, 5),		/* RSCI9_TRESETN */
 	DEF_RST(7, 9, 3, 10),		/* RTC_0_RST_RTC */
 	DEF_RST(7, 10, 3, 11),		/* RTC_0_RST_RTC_V */
 	DEF_RST(7, 11, 3, 12),		/* RSPI_0_PRESETN */
-- 
2.52.0


Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE03B4E87
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314135; cv=none; b=nmZ4m/NAN0vsUFmg+/mK5Y5nBg6R4qm/hfYHDi5k3Mdiduavhvai1xxqDl89MhdhZizCf2xjUGsieDQz3DJl8W2KZoZ135uNoWtaEbHCZqE2hAv0Z71cyoSq5rParMTCqPi+P3IGcyLxIYSAansQJbMmf5r0mjQ3UJOfgTIES1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314135; c=relaxed/simple;
	bh=6KFZsyF5zCUsUUU8aDvJtlhiu7/4C1dLbnJSrEqU+8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnsvbZBTVZxwu2u6bpNIOyV7rsDF6MlB9Sy1khiwHxY2LeAYGnCochp6msFfH2Ajf4/zF4qV7xDoDmlChmuPwbZCB6ZhlRws2jouhNjpXEORiZpfpotFseaYbktNxw/fFtXU+2AF5CxssurfihEZkqR4dRVvP93vA0742SrhzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXuQ8ZNm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXuQ8ZNm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so4636675e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314132; x=1773918932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfQzGSA5WbRXU/h41ykwoCteraq6rjsMmPJJZqznTns=;
        b=eXuQ8ZNmT2rmBEEMbyQPCpPqDyxuZWLfiMhVZtwqugdWZKBojw5/StyNC4CZi8eyxn
         CGBnAqHfpimm0rqgraoUgEXM8r1F+o/faTI84VmUkfN/io5auAS6MAnP/K0RbdhWZE5Z
         VfFOTYyDKtAOgCwYxkcqy0qiqh3ClLbrtmrcbK+9Zvlk68MqEOLrIhN1qDAwTW+3As/k
         e61G4a5ShWu4ZIcvpdUu4YbEe7d9S3AVe1+pa22rqk2b7wzfF/C5lm2tZDV+BuMXya0j
         q0momkMqT7oE3FByaPQvVKzE5QY0PEFFGiIhm13ckWoiFp5VikmUaIIjuzbbtdOuoz+3
         cqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314132; x=1773918932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfQzGSA5WbRXU/h41ykwoCteraq6rjsMmPJJZqznTns=;
        b=gCyWyMdyPjo3qgvpgrPr3h3TEo7QZJfTL1EivoTMB4S5b6HWcQYJ38w3hrErJ83pWa
         Jf6eMiDmLg9H2SFWXFPByTTzLquCnObRCOoIlUJwW8+VyPXJTv7fhPlHPnhCUxCX5/cT
         VowFUtJzv5+e7q5lBAHyRZvzuILBgXylDzXgIxArPN+dNyq1gfiKfGZMbozbeK1MXWcw
         4bhd7oLG1RfSP5Jo1SUwxy3AOYGLT/OsVF2VhkL3oVlzu0OuAuIGXPq6kNNe5mS1c1/D
         4FAgb85Eu32sNcf98CYi1eTk8W1s3YotHHuituAAZ0CReD8DX3crzAyNpSElj/pMMaTZ
         uxlw==
X-Forwarded-Encrypted: i=1; AJvYcCVcgpdBWVdnUmBMNP0PJnBoeT1xHFHh3DvjoDfOZIGb5XOcxZxIQoncfJi89xtpocCHQTui5nUr5bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXHbdO7ihAiWaLC+91xMq8harlJN+NMsNXyjd/EirIPWZMDQtF
	lH9QCWEIvSgqPonhKHTRS3wuLhEiVVXsCAHpXeyVZxpnrIyqD8UNDsDg
X-Gm-Gg: ATEYQzwDyLXkzmbnCj29fMW6vmxIZKp9O+ZeY6zkN88ix6IDcdWVcQhvQk+cgJW2ad+
	ZTJHPEOCm/S7CLGhOCjaqgM8cR4SdRx5GX3zKuFCuppbFjr9gF5ztjegqR43TcsJoPO+WSsGtHb
	esZx4n35fIksEiG8KNMs5PGtbf249rBtkleQ0AQMhBEOULUpLcDoIHkK9coMmk98P/FYgDcB5Z6
	zu36ILB9Ni6QC3s2CKzgBSnng7dp93OnpU8T9H6pTAysZXKZwa73CNbfcgNgcpElOpDYTSNxbkw
	HxcHuP4UVItJ/tCkv/sY7nDr31mBuqVf7Fmqck5ly0L1g8CURDpiv4j3g+lZrT27TfXQhnzbLGL
	iIE57AFAtLt08dNUSuxSBS3P5wD2Ie4VwyAT47u55QD2smUVpMmXgksybRoZ03WFC1QVL/0H4VP
	2Kx50+F4nS/dY8SpPeIgEYot1ISBa5y22O4L7S8bZfbUnoTHtImoeW01SDNF4NFIOUoyM=
X-Received: by 2002:a05:600c:8710:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-4854b0d2917mr96475265e9.15.1773314130444;
        Thu, 12 Mar 2026 04:15:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm311458385e9.11.2026.03.12.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:15:29 -0700 (PDT)
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
Subject: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
Date: Thu, 12 Mar 2026 11:15:21 +0000
Message-ID: <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the PCIe controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index c3174f40fdb4..2fa5a620bbd9 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -508,6 +508,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
 						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("pcie_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,
+						BUS_MSTOP(1, BIT(13) | BIT(15))),
+	DEF_MOD("pcie_0_clk_pmu",		CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
+						BUS_MSTOP(1, BIT(13) | BIT(15))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -642,6 +646,7 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
+	DEF_RST(11, 2, 5, 3),		/* PCIE_0_ARESETN */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
-- 
2.53.0


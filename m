Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E533971E
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595066; cv=none; b=TE5pUZLEvpQpJttMIx84HsH4bt4sugG+yHSJ4srSB5OFC9+NHIi8BpCSN73dq/BjNdOdG5V0AJKP07kiLG9mO3wgvJHVU8eFr4hcpDp+F0LZk7A+rtkT6TEu/HC2WpOiFrVRIYhx75hBf83cgcW7a/INFQ02LgZgXWydVirclP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595066; c=relaxed/simple;
	bh=sd/WcWZKEqm73vDos7FpHpz5Abyv+hzHn8cogK3xUfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBVw9xNFg1w6EfdMSa1VTpqmRSPstTMonTd6xNQIGOtTBrgF3ejvV5m8m2SiBcD3Z9NWXK49AfiHxljdvu89R5i6Y3mF3QvSpQ/qE8yQNqjEJycQM8LGaUghnnuOk2VQcbxgetQ8B++IGGgy8gCTTdxbb9H/PcCO/ZxugSNBIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAWaDeWr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAWaDeWr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso21148005e9.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 08:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595063; x=1767199863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ9M96GDyiEBVAHo1l70x8EOroyg7krGoMFvHraGU8w=;
        b=VAWaDeWr1PC0KBVkYSpE9RaCO6l0a+L0X5kPrdm0hY+U80orgJhgzrBRwkcOOI4mtq
         oYJVy5WzKIlxOeBAtl93PdiH+Fy5hhOlflW8nsQmNAT+QC6eqotA3doPK4mdpe4exlk8
         thVu2OMC17L9F4qSAZ5FL9lNOd4w/XHlpCUvftlbbzt2g3TOiCeFq67GFxWqqOHxfj3f
         6fUMTxmhXutjHV0sOOjOdOYxkHAYQ0jfM9oTu38Mckh6LtSvvwkE/2Lecb7Mckuq52tD
         UBTHWUDAptiiXDD45zKxvz/7Tx2jQ1o74Bc2AMmbjIl/0p1OjHqhpZM1PDaPAvY+01Jo
         7+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595063; x=1767199863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJ9M96GDyiEBVAHo1l70x8EOroyg7krGoMFvHraGU8w=;
        b=QTs4nu72ClkhrgoLlwb7ah/eNW3jMBeOGKyVYxp++JZA+xDGz4fq4MC7b/A/69twC0
         sK6gayM87R7M0qV1kcwZMyD0VvvdIOJyfuoXdAImvrDMuJOyIG+J9HyXRYtkZmx67Nd1
         DNuouj9yEbsUaOl4RIkZnd6Ou/7qPZC5eXzrEqCCl0ADWyJkZXsnMSyZp3RLXDvXlgIV
         k7dZNMqm+GJbm79nO9G9n110hnDpQXWkfdT4HYI6d7kKKUnw4VqVWluT4dzf7hgsD3Rp
         mIz5377PH7yDZXrPW8lv0ixyW10/ErMKCi3XTtAbs5ivjZAwjLi5wMedJBM2ZhQd0dbl
         csjw==
X-Forwarded-Encrypted: i=1; AJvYcCVbbm3djEAxh+cAI5zKSYCq0Y+k1lNxBgVPfA1RCtd3mSDBH1vDH4IAsqXIviNW6x79xsaMHNVdFg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnwMSLKglEU4wLFVDSx4mK8ocnO/auvnj8P3L9dr91Tm7Sq/KK
	qKqoYW8siKR4rDPJhlPOjcVMUEDtEA87QVJLDitm0IIB3HlAWyHaygPv
X-Gm-Gg: AY/fxX5ugKSWWsVdXaY0+11PkOgkY2mSe2Bkjavk/mpGdN9KBmniD/X2Mn+BAGtLHhk
	0wHjfG6MGHIlEuqG7AxIYv2QDYIGtuDM+y8rW36Ds1Q5YfjT+pPYXC9OqcMf3NFbv2Y3R7jKlPB
	ExUkRs8D4y7JD6wFeEfTv6Q2zxvdzeXKvefJJu+6zqslvUakK1u3doMDqelrvbrvVmc5KvKnN3/
	aV6VQfnQt5Wi5W43epL6CFBWY6eWP8k9htveUft+Tg+QJCM0n/3zbK7UH/09eNEFvxHAVaU4jDn
	4rfYuumC9lxHljiH+H6n7G//plUdgvdQrNim8t9fuj+tjeSnvmbYhIUM+FTEEKQJs1Iz45O0Uyo
	ClyMB2Ap2yB477ZEzzXfrn1BnAMHjmhcA/dVbTVlvINZerHtM91xcopCkHDcYXwc50REnMMy2Ku
	L/2UKfQgjds2AoN6f10YlPFfdjmoVoMGevRmW9mmx5iYqPPI6LQyf625Ji2eCUkb8MgCqDAEOW1
	I2Ufx8nfMPI2VEblf0rQS8O
X-Google-Smtp-Source: AGHT+IE+svy3mvCXV6dqgJcZOLRQlow+GqSASBMWQjorBIAS2OCxIB7buoJKJ5BnTPTqa0C5JtouiQ==
X-Received: by 2002:a05:600c:6388:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47d19557cd2mr181203505e9.16.1766595063032;
        Wed, 24 Dec 2025 08:51:03 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm136482305e9.15.2025.12.24.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:51:02 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] clk: renesas: r9a09g056: Add entries for CANFD
Date: Wed, 24 Dec 2025 16:50:49 +0000
Message-ID: <20251224165049.3384870-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the CANFD IP.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 741df446e24e..e356ed4a3d1d 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -46,6 +46,7 @@ enum clk_ids {
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
+	CLK_PLLCLN_DIV20,
 	CLK_PLLCLN_DIV64,
 	CLK_PLLCLN_DIV256,
 	CLK_PLLCLN_DIV1024,
@@ -183,6 +184,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
+	DEF_FIXED(".pllcln_div20", CLK_PLLCLN_DIV20, CLK_PLLCLN, 1, 20),
 	DEF_FIXED(".pllcln_div64", CLK_PLLCLN_DIV64, CLK_PLLCLN, 1, 64),
 	DEF_FIXED(".pllcln_div256", CLK_PLLCLN_DIV256, CLK_PLLCLN, 1, 256),
 	DEF_FIXED(".pllcln_div1024", CLK_PLLCLN_DIV1024, CLK_PLLCLN, 1, 1024),
@@ -431,6 +433,12 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(1, BIT(7))),
 	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
 						BUS_MSTOP(1, BIT(8))),
+	DEF_MOD("canfd_0_pclk",			CLK_PLLCLN_DIV16, 9, 12, 4, 28,
+						BUS_MSTOP(10, BIT(14))),
+	DEF_MOD("canfd_0_clk_ram",		CLK_PLLCLN_DIV8, 9, 13, 4, 29,
+						BUS_MSTOP(10, BIT(14))),
+	DEF_MOD("canfd_0_clkc",			CLK_PLLCLN_DIV20, 9, 14, 4, 30,
+						BUS_MSTOP(10, BIT(14))),
 	DEF_MOD("spi_hclk",			CLK_PLLCM33_GEAR, 9, 15, 4, 31,
 						BUS_MSTOP(4, BIT(5))),
 	DEF_MOD("spi_aclk",			CLK_PLLCM33_GEAR, 10, 0, 5, 0,
@@ -599,6 +607,8 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
 	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
 	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
+	DEF_RST(10, 1, 4, 18),		/* CANFD_0_RSTP_N */
+	DEF_RST(10, 2, 4, 19),		/* CANFD_0_RSTC_N */
 	DEF_RST(10, 3, 4, 20),		/* SPI_HRESETN */
 	DEF_RST(10, 4, 4, 21),		/* SPI_ARESETN */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
-- 
2.52.0


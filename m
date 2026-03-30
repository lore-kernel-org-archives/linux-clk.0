Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD223D16E9
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877037; cv=none; b=rGcT+JCY5bw4s7VjhttERWiXDXY+eMyZ/FapAKyWMlDJ9V3FOL8Qnph6SDzDF/TXpPiP6CCcnzHYpfwDpHw5ZnbO4pvuOUBxlfj5qQf8UC3bEyBeGvx1ntlrVAM6G34egw95HpOZv3JUz7sEM1uCgW/pT0otneAcOBlOa44x+ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877037; c=relaxed/simple;
	bh=uKYG2HadVgu+Nn0FGDHnBaWtmfMTgEjZq9jI+WvrAWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jxr2R0MV7JaMYsLBmjruyeJYPghE7o+BIe0LTAg/6e38lX0aF++fYPIHfZrMDHnWmJ3TTh527NOUBy2Y08njG24nXSvSROw7KhFAx5Yc/e6EBO14bWgIDGqL0mMUNUwbdSWRNBMn2XGwzNaGG4fFIh18ZA9NAV7jr9pC5ZvKkMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSxAIgDe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSxAIgDe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd832155so677891f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877035; x=1775481835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIilPXW4gr22kd4qDMopNhMeSX89TvUkPQMO/Qu0syY=;
        b=cSxAIgDecvNtpIstvukgDvwsgT4BofhKjG8OUTZOTBSJHdua+aP5pne0++cg98O0i8
         9omi/NU1l1cPTRsCwLv0yFZ+nZ3yL9MPO6TiBRDVA8DMVoexT2HoPnI98Plbgv5TwWiB
         3BbVOlzQHPTNapTu1pR7aKoRAKNHcn08LMI2FfxyRbP1VtgC62q4Pwu5hbgEUKCZTLMu
         /4fFjC/zfntMCpiKbJXX/104bK5bt41TQ7mZ3fDQ9vNM7bSGW6SjIgueCEepXNPMVA/G
         Sr8rYb+lfZkbBz0Me26d0auDXBH/tPoInhM36rFJlHGnEf74XvXJmfTvuWo+inj/ynpM
         vDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877035; x=1775481835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MIilPXW4gr22kd4qDMopNhMeSX89TvUkPQMO/Qu0syY=;
        b=K/0uOoOAdQ1s68lUSx9DZ0wgdpzHEqvojhebZYAx/CLyjJ7AqfwNz7jJauPV8VdH+s
         MyHNzfLAEH3aKlsmp5bLBdO5fOYSQ/XH/R2iAuH/tvWctC8TdC8YxtVUGArWSQpuYGH4
         CcBP2hAxLt3IlBbYWJsUMRtRjWotdeCsBA/SJfyooF93k7hJZFN/e5RMgxuEokwAUqxI
         s/klGL44I2g/HRvkfAsBrX5Px0fHKzvW8gOrNuCcRaXrVGrVREyGrSDsphjTNdDzI/7N
         XhwD4dr4hHghPhC5HaGCQit3K/xz0fsiSPA+p/YYly7awFfQxWqaE7ptkn1lpPpEKs8s
         /Wkw==
X-Forwarded-Encrypted: i=1; AJvYcCUkWVvSfeux8VXzhYGLjlbYJjex9bQFk3hiGh/At+FvDZFbggH0I2osDxmxe77koNatGbXwnSYz1Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Yq9yJqMmdtSkE/3v7XjJuT/LH5YmbHC1eFkNQOMAcZKmHU7n
	C986+zumsvldi3WIXwet67+kMxDAs13SwRuBlifNUW7l/8w8T3GZD7ur
X-Gm-Gg: ATEYQzx7W1PnDjGjsSz4DujXMx6JeiW22YnoDM3GynPf4vfwfoBXyt/RYFg5pfcWN1I
	ebTnvOlwsoRbpKfcj3E1/MnbkgT5WhnqLKhLzQDRZOn0BC8vreTVCd9b/B6uJO0lx7C1O4urkcd
	Cq0sAHiN7qwLXqoQKHPlNj0JJyn7MfUObooUJZsZz+e7CvNvnbrAMTpuhOK3kQGY5h+0c8i/w3s
	wOkDU1u5Ar4DU2+VfpWZNU+lGswLd6++cyIjFcp19Tvsg9R5EakjSQ4eFeELmqb+8kNAuOKo+0V
	EKeXwuTJRyxeM4aKzbT+n+/ApshOrSp6PA6Ku6VJ2UBuKp+bEzVs0K2dje4+eH3o/Ei2DZyHfRM
	s6hYiT+Ej8d72N3gGzuc2uGfOSkQInI1lXWYYajDPobEyaTSeta4JBTRr7B9e70ZHov/K5x8r2p
	dtm/EYxvN+PFJHdPlIzNjmaDweQn9U1n/9d0o92rxr
X-Received: by 2002:a05:6000:186e:b0:43c:f8b4:e5c with SMTP id ffacd0b85a97d-43cf8b40f79mr10771448f8f.20.1774877034354;
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/5] clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
Date: Mon, 30 Mar 2026 14:23:41 +0100
Message-ID: <20260330132349.149391-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SCIF{1..5} clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 28d035613272..13c158bb9215 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -269,6 +269,16 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("scif1_clk_pck",	R9A08G046_SCIF1_CLK_PCK, R9A08G046_CLK_P0, 0x584, 1,
+					MSTOP(BUS_MCPU2, BIT(2))),
+	DEF_MOD("scif2_clk_pck",	R9A08G046_SCIF2_CLK_PCK, R9A08G046_CLK_P0, 0x584, 2,
+					MSTOP(BUS_MCPU2, BIT(3))),
+	DEF_MOD("scif3_clk_pck",	R9A08G046_SCIF3_CLK_PCK, R9A08G046_CLK_P0, 0x584, 3,
+					MSTOP(BUS_MCPU2, BIT(4))),
+	DEF_MOD("scif4_clk_pck",	R9A08G046_SCIF4_CLK_PCK, R9A08G046_CLK_P0, 0x584, 4,
+					MSTOP(BUS_MCPU2, BIT(5))),
+	DEF_MOD("scif5_clk_pck",	R9A08G046_SCIF5_CLK_PCK, R9A08G046_CLK_P0, 0x584, 5,
+					MSTOP(BUS_MCPU3, BIT(4))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
@@ -283,6 +293,11 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G046_SCIF1_RST_SYSTEM_N, 0x884, 1),
+	DEF_RST(R9A08G046_SCIF2_RST_SYSTEM_N, 0x884, 2),
+	DEF_RST(R9A08G046_SCIF3_RST_SYSTEM_N, 0x884, 3),
+	DEF_RST(R9A08G046_SCIF4_RST_SYSTEM_N, 0x884, 4),
+	DEF_RST(R9A08G046_SCIF5_RST_SYSTEM_N, 0x884, 5),
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
-- 
2.43.0


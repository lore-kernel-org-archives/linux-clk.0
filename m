Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5407B37756D
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677876; cv=none; b=SupCNUu0JBx5UrPhlGODpayXl5ogKOl1x1cvy+m5Jdy1DasMwSrJUy9J77DLQJNEeJHKtG6trU/KU6POHKHXaaLuva7x/uKRqvqMVKpm3E37dhk/5IaL4ZSXyX75h0Or13dWMfHA6h55aFb9zZNyAb0xR3hsVM8uGWFQqlEsWXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677876; c=relaxed/simple;
	bh=xzApL+tOXmpVuGXhCiWBafOpCmGl0cWaKQ4hIdAkSwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR9XBOiw8Sq9TDYdkfbfn4AEGGBNrUAJxTCpJN2bEpAiRibToEnJRiVzSln+nnoVTj2ipWxl5TDyYKdaUQ7Zi/iZhdIbTZCuM6mqBUtAGRyqpHQp/36mJKS+IN7/R7uH3tTaFubXzHW/nRjtBACN9E1p/MLFsMQRWap/btnQyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coz5DDJ9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coz5DDJ9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48069a48629so7481985e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677872; x=1770282672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=coz5DDJ9PUOn1JBgmMQCW5k9N71Y5elmZUAX0Lrxd8FHlplHfMV1sFTMgTgH4CC8YO
         A+fQnjhFIzeLvPFgGrpovSKz+DGCcPVK2EE3VcLTHnu15i1u0ELKabFuAq14gjHHHefT
         5svHQu80n1GM374cIYC/Clwku8tnJeMnpyZUtYB3Wb8en4zmKlUnelEFD/fKm0IcBa1W
         sqZiwvoj8cdyU5uMFGJj79HeHyC+fYnbuH4zQAsKhtd3BvKYpZwNTH0Ld9TxSZ6r9oIF
         Je2QSd1+qHiHzRrNdrVKzyz/y6+ITImCdIfM+xH5UGersr3rdYBSqoKjdFjV3mfDTVHA
         0afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677872; x=1770282672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=wMekUq8sh/veaT2yzUaCedpNdfdBxfWY9Zczye6/mijQEjlYW7/W1nlojIctMPEVsw
         KxlAVtCoBRqBpyVGKKbiMe3r9krEG0MDOieRXUoxzVI+lQ/TTqUkkE1wT4XIMn32RLdp
         YK/JBH8ebGJuxTvVgykb5d/bnWR/rYLdwPf4PABaQ7/PcuPxeJzq2eQnFS7Jx9u7j7SU
         dW89ZUdQfmIxVg3yMRozov1UDDMFkpSRPnkPBE7zWjzBpXqOHCmhOG4O8ZKNlxOL7TAr
         VT6IdJHY93mkJNresbJZ+GA98A5pDbgjL312b4J39pmJGIMyNOcetHzyh/uJ2MFPRoyI
         qP3g==
X-Forwarded-Encrypted: i=1; AJvYcCVSFO3qBdkUf9lrbzXcjOH9lGkwfg0NbvhyrhMbWzO2bt5KRdntAtjLbDKFhIGemtTPKBYZz8UolZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5p5Kin1bvUofJNoKP8Wsifl4VXf+vTDms10RLxegJF3sXKt0
	lNnu+p6EOIGKMwUrTWuWV7glUoYCZ4lqqo/QTKtfTxf3pAvFETw6GDv/
X-Gm-Gg: AZuq6aKhPMLLvqIV93vnNlgX1luNZ+PoYF25DIh2LMtrK6QRbWarCRBqkJnXaevRWlQ
	zR75qs4nJ0xONFKo3O0pNbuYUUkNMbd4W1/d5DKAaPVUgLtqlr9ReJQce2H7Pm9/qH5WIL4FBRp
	xHC16sKm06TtgwpxLdxH2vlIwPzA5NMN1AXrEKfa26A/rLeA8t2pGKY80/ofentgmkvOizt7Hgj
	2MrS+c2lebkcPkoGYvK4GVe9qFhZ5g7JmgZQsndjvtXWerriR5RVBtOdhtnFQxsPLvLApFL1SWE
	nenK7MjHJMUzSIVIW6XcQufgJhc9HBd3HDzUZ9V4Le+4rVeK8IYIQo/M/xrKkZkNmcKwEfd6TLx
	BxVCMtfTJvyG9zV3QcEIdCUbtHnYdtzgUL1RQ8G+2SOoxnzRueadFk0GnAqmQr45nSLa1angITV
	Qo4GfC3o8GclYF6rRQ
X-Received: by 2002:a05:600c:5395:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-48069c55751mr102964815e9.22.1769677872353;
        Thu, 29 Jan 2026 01:11:12 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:12 -0800 (PST)
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
Subject: [PATCH 3/9] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Thu, 29 Jan 2026 09:10:54 +0000
Message-ID: <20260129091108.95277-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add GPIO clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index e74bab2df29a..4d1b9c8c524f 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -174,6 +174,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -221,6 +222,8 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -232,6 +235,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0


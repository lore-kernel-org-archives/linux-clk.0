Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5FE3DA5D1
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965351; cv=none; b=IyNmU8FT5bPHoaax9KdydSa2+qt++O9dTSdap0wrU6a9lex1zgcX71GeGBPmGEfmpdc+1K3DYk3xe49+qoa1K31/0zCkpTFWHvEZG6LhR1AYXrnKJefs8PBAR8GRzjouB1rqL2RNdoUY5dlX0WfuyuYznqfw94uCiZW4beurx4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965351; c=relaxed/simple;
	bh=O+jmM/1DtBlYXnLwaUl3+IQL7SmnVc61m01RH3U7Lt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjzAyM+94txNRJM1gg1STDANb+XRZFDdo4Zpba6jLl7PbscDhI8+iDhtCf/Mnz/J7DrnSwWjnTnW+eGYcKbSdctVAPv5CHUt6gFt6qSPOQGn3TO+X2yun/tgevf3/2paJue2AsvXWXIGkE8nVt+LsPwSRe8tm072QolIe7Wu8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTt07ZAz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTt07ZAz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891f625344so52104215e9.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 00:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965348; x=1778570148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHHQLlXmhtLnUN5SiBk+UZqYx5arQwWhlujA9Yj/KcI=;
        b=jTt07ZAz0fNowM7wvuDiDQiBjzuJVjwCHRrQhRwp6ZRYeDp303+XQXYyOh4xzzE9oF
         p5LdhggywEFkhJQVUGKFyawdqTiZIdlLMR1B6fRk761GNX4AuaVUoNDqUI0X663alsdU
         o/jbqok6I+JsKIdMwgHTy1PxmneIIzlODJE2xuEnvJZMr0ImCG04AxzM4jSxtJTt4GLb
         nfDnfFaXBC4tz6vHsVYIAxuDU7gQuQerrAZf7ce59cILqkEiSIK/beS8Syu/zBGv8uK5
         u/igyCOyldxwgBL0eYbPBeepjXBr8Lrkgkm8Cz0c0ziMF2CFutGEMEw85x1L8SJ977a7
         HG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965348; x=1778570148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHHQLlXmhtLnUN5SiBk+UZqYx5arQwWhlujA9Yj/KcI=;
        b=Pj2iTWZV8qWI9W2jvxngy3SgzXdHxG3T67ZVeseAFauL8//fCMuPqv7xGgNvdXCf8c
         pttje5UZ3lKwGV7IrtP0yi2/BoiUiQAhPKIpXoNYR6ktgziLuV5/njdVpTBQ56vGZgEQ
         Vr+O6kpV4HDkLrZI07GJ3nC2S7FtgxHL/rKbP2SSIhYPdrYzmJyNpxBxr9Nc2jWeTbIV
         yiafZ97APpUjw39YiCuM8JEjg4Zlv2p/T+2q8Dr1qbTd1nB91+hZ8b75s2iH3/ELihNy
         Lu3IyLoVWxVbFcTSqUgViQuDs5jqfZs0QJzOzO+LIvkkLhPGA2k8jdNSgjc4YqsvAMRn
         1cjg==
X-Forwarded-Encrypted: i=1; AFNElJ/TO7QRuHTt2eF3IWbmKLgwCzgMw/FUtQ4WuypbQzkfwAR3yznI+CVu77K7QNkLHOl6R5r/4X2zmvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvyuQfreH+P953HSXNDyzXzdGkbNrsTJpTIQhxxJ12KrZs8hp
	aHHXFU/ZvAmRvtRlHz6UlHnqNS0LBryYVDQKq0DpCOpXSnP7nwK6gLlH
X-Gm-Gg: AeBDieuUe/gSow1riFXtv3aGTBJpF7Qjjlov9QIL4Jfbj6DmavcaZH16g09gNZGFI42
	wvApDvryfovuiCaIT1bzRq+W0WA+k4GbUth/+hgn5SeylXlsdWsDwlIde/I1a8hHIygzRc2FtQ0
	WePM7L/CrUs8itj3QIkxNVSQDUFMZEp76CJYjOrjoJr87CFkT9O2ofRFWoFpbaZDis/3YDoV8Cr
	ux/kYLTvUm5obcO3wkFrSLtP+2a7ncr3Y/hG8XuErvoN4t/msdtvVIMSwC0q9YsJJiPG9jZEnZG
	X6ZJI6Y4WQ9X8PY0SEmVGzxOwDBvFfig9se3X1cYkRuV3n5SAgl4oWxUGBSkjN+pUHR2P1E6UwD
	117NvA3GlPH9o+nGFrvghrngVbKDv1BrnU1TGRYLbBzQwncaeFl6TWPK6MF5L4byQ20i1JAKvii
	pZuO7zaoUJy91lk9Sni2OSoTVRcAAvDhVneQgq1uNYdv5XX7jrQfBxtSSgk+A=
X-Received: by 2002:a05:600c:4e16:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48d1425b450mr38870795e9.10.1777965348227;
        Tue, 05 May 2026 00:15:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm352005845e9.3.2026.05.05.00.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:47 -0700 (PDT)
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
Subject: [PATCH 2/3] clk: renesas: r9a08g046: Add SSIF-2 clock and reset entries
Date: Tue,  5 May 2026 08:15:38 +0100
Message-ID: <20260505071544.8965-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SSIF-2 clock and reset entries in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 3a04db4196a6..d843629ffe47 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -266,6 +266,22 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG0, BIT(0))),
 	DEF_MOD("wdt0_clk",		R9A08G046_WDT0_CLK, R9A08G046_OSCCLK, 0x548, 1,
 					MSTOP(BUS_REG0, BIT(0))),
+	DEF_MOD("ssi0_pclk2",		R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0,	0x570, 0,
+					MSTOP(BUS_MCPU1, BIT(10))),
+	DEF_MOD("ssi0_pclk_sfr",	R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,
+					MSTOP(BUS_MCPU1, BIT(10))),
+	DEF_MOD("ssi1_pclk2",		R9A08G046_SSI1_PCLK2, R9A08G046_CLK_P0, 0x570, 2,
+					MSTOP(BUS_MCPU1, BIT(11))),
+	DEF_MOD("ssi1_pclk_sfr",	R9A08G046_SSI1_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 3,
+					MSTOP(BUS_MCPU1, BIT(11))),
+	DEF_MOD("ssi2_pclk2",		R9A08G046_SSI2_PCLK2, R9A08G046_CLK_P0,	0x570, 4,
+					MSTOP(BUS_MCPU1, BIT(12))),
+	DEF_MOD("ssi2_pclk_sfr",	R9A08G046_SSI2_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 5,
+					MSTOP(BUS_MCPU1, BIT(12))),
+	DEF_MOD("ssi3_pclk2",		R9A08G046_SSI3_PCLK2, R9A08G046_CLK_P0,	0x570, 6,
+					MSTOP(BUS_MCPU1, BIT(13))),
+	DEF_MOD("ssi3_pclk_sfr",	R9A08G046_SSI3_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 7,
+					MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -353,6 +369,10 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
 	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
+	DEF_RST(R9A08G046_SSI0_RST_M2_REG, 0x870, 0),
+	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
+	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
+	DEF_RST(R9A08G046_SSI3_RST_M2_REG, 0x870, 3),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
-- 
2.43.0


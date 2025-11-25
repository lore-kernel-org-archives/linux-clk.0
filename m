Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DE833AD81
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108879; cv=none; b=atjI4ac2b5xpB4wNaMb7vX0UkAb61DibJ2v5gue/ONNhaDeQ8firzfkK90GZg4ukhZ/gOexX+2DRP8bgOxeqBCS489u0/bl/6h6iKL31WeGpVloSkBMuvSbM+D9vS9vIhGvzI9qOG9d3bMDTDBQJbHGpY8T6/pshXpB+zLf+DjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108879; c=relaxed/simple;
	bh=025uKoxgb9agv16k3xbIpHgeqVzMK0siTkQxlO+uuV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqQQhzSmaHUYFuYf2Vm7jjvGLEB8Zrhtu3EC0dJ78ozqLfjt1SQRck6Q4l+4mOL4p1N7EaKtZXS6ZCQMsXAcyjKfZhLQETVLgf+VW/NlPeTH/UIto3TKS5StVnxHZyjAPJpLIkSirM9LyXBpIgHCcMA3wRzr3Mmh00MYLy9vqKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7IfojUb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7IfojUb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3108f41fso3674485f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 14:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764108874; x=1764713674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAfcPBqPXedAJhplXHd1LAHPhzxCFkLFqsJc935i9XA=;
        b=F7IfojUbWzI2PtjpjlCeK7+g0ZEb7Ok51mKg1nPkY41JAMZmeocbAU1/f6KKO6oh7c
         K/g37FRxgNUtb92gbSoujD7m/RrIQ5sKidMITdZP5yw4cGJeYZ9oS8K2JqXKJ8+5ionr
         E+I2GO6MM8hewicgU171/eBbCDgnpVyDxuvHB8XYZZmPtSGgFsAxeV4s6QP22jD70m82
         l5bjwK4SRHJTQxeWRcyQgZTLPHpdeK2GffR75ovTyOpnSppffZR9i53ZTXBg2BuBdzBp
         FPbS+khDLMyIekqgtANWtcPpc3aX1e1tospX/tnXOR7q/DdJCSGzPUfpf4H4Iqa3uF3U
         l1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108874; x=1764713674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAfcPBqPXedAJhplXHd1LAHPhzxCFkLFqsJc935i9XA=;
        b=E0iBYqF/IwctM1PHUizwUwqsDmgxwlg9HRp5BbmG6HfYvYJZUt1qoF4s7Jto1c+Q1W
         njIXpX6RlQL8IZP268JggoSV37CST1Y/9IazQzmpCmKlFbUn40yz2c4ID5eg2vzx3wRa
         4Y+dsz2tdwLs61ynh8BjS32YHr6/J+91ShHrZcI2s9iVOOli5pililTBqHY+nvah1nIJ
         +rukXwkz9VyScGTVzpXng224Djh8GlqiaUqIWbD1y1G0ZQDAO27BYEnWoix3jbcv2ph3
         MOAiwfIg4J7/gjgoWAxS38dkzS4zqSlrBRVzxHd9Bc8lMxs9qRb3FocB8MGdPH/SjkUE
         /fdw==
X-Forwarded-Encrypted: i=1; AJvYcCX8HE1OemKzohV1xpCULsir2zk+cq9SJr16uqmAZZhD4uu/x31cVgvy/1rmN2e6+SQhq+rLXp/lDxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnWRnvbxQPJqgpa4CE5Z9Jm4TZZC6sWWkBUpDDtxGtUQijt/zC
	v1UeDJfbZTcPJRvcIc2QDrsKbo+s55BxJpWfzn24TZnhvNtXBWXzSA6s
X-Gm-Gg: ASbGncsU81BEeznT0bPLP5OkQV+9WihXpWffj/dnm3KTazIojOb1EAG5SSMbUfFRjuR
	SFoFB+WxlPvkbiDWL9XB2BLZDuUWw4TAB6RGs60Zn6UqDA1tUc/PS3DpM4WEXqM2WcmhojBiF8M
	OJ5XsZuxFk8sjCsSPnXP3dkRfz9Iw5QtPGZUPtolVFwtloeVTLUKgzNauYK/kuo2ruUr47fC3A4
	zca/pxi7lfw7pFzQ9MyVMUDWRmFILwaoYj/WWWOJvhFUtonlOGXxqXGlxIcAAx21i6z8Tnszyl5
	QEE0c9L2jDF0ibmyyZ6axz8ykT2OtKoD+lups3uyfs7+fWD/aSQJeVGQmUw1y+OO9L5fPu8ddjD
	cZzP8CyKAgMlEC5hFSi8s5irJUQphwP9lFuF58BwphrQZ5Vcj3CDVl+EQz766IlUkq+0pRy30jx
	On4Xvolv//DClApD/fQKeW/L8XHKZ4dZikfA==
X-Google-Smtp-Source: AGHT+IHeYijo6crepCkWnrnoOyYhRhPTzweFIbO0qTtkUZYTTZWSlat+fZmv0thBXenNU0jzXi2ysQ==
X-Received: by 2002:a05:6000:3102:b0:429:d565:d7df with SMTP id ffacd0b85a97d-42cc1d0ce28mr17375594f8f.42.1764108874051;
        Tue, 25 Nov 2025 14:14:34 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm37462121f8f.11.2025.11.25.14.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:14:33 -0800 (PST)
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
Subject: [PATCH 3/3] clk: renesas: r9a09g056: Add entries for the RSPIs
Date: Tue, 25 Nov 2025 22:14:20 +0000
Message-ID: <20251125221420.288809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the RSPI IPs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 1c6228b0544e..4b068199edde 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -281,6 +281,24 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
 						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 5, 2, 21,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_tclk",			CLK_PLLCLN_DIV8, 5, 6, 2, 22,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_1_pclk",			CLK_PLLCLN_DIV8, 5, 7, 2, 23,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 8, 2, 24,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_tclk",			CLK_PLLCLN_DIV8, 5, 9, 2, 25,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_2_pclk",			CLK_PLLCLN_DIV8, 5, 10, 2, 26,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 11, 2, 27,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_tclk",			CLK_PLLCLN_DIV8, 5, 12, 2, 28,
+						BUS_MSTOP(11, BIT(2))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
 	DEF_MOD("i3c_0_pclkrw",			CLK_PLLCLN_DIV16, 9, 0, 4, 16,
@@ -437,6 +455,12 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
+	DEF_RST(7, 11, 3, 12),		/* RSPI_0_PRESETN */
+	DEF_RST(7, 12, 3, 13),		/* RSPI_0_TRESETN */
+	DEF_RST(7, 13, 3, 14),		/* RSPI_1_PRESETN */
+	DEF_RST(7, 14, 3, 15),		/* RSPI_1_TRESETN */
+	DEF_RST(7, 15, 3, 16),		/* RSPI_2_PRESETN */
+	DEF_RST(8, 0, 3, 17),		/* RSPI_2_TRESETN */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
 	DEF_RST(9, 6, 4, 7),		/* I3C_0_PRESETN */
 	DEF_RST(9, 7, 4, 8),		/* I3C_0_TRESETN */
-- 
2.52.0


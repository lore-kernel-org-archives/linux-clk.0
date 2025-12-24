Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CDA3358B2
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595065; cv=none; b=kP7abBNcc49K1EQ3d35KVvU+/sqLbHZuIGCcF+7CvVsl1pLhFm97cr5EoWfxMJ0exRQ9Q4nLPsRYuMK6r/kn9TsOmn5MrcRIEBeFIdnHY/e51fWRufxHsWNLNie7hkuZ25DqwGS+Nv6fB9LDLj8l/OXdC93bhHc8f12dCr2L214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595065; c=relaxed/simple;
	bh=+lu4HJ+uRmXmXaabRsxdvbAAgzawoFOWZpxxRQKr2QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FcGvm/g5g0pFA6/fartP/u7VZ9BABdsJ524PXLbHMlxziMwrjK+Zoxfdq2tloV6Gy2NvTsG8APJ4k6eZljgH9C10gkgorFfxlYGujPJEwIGvQmk2xsp5yF90ax61Gf0/xhEQ0jgdSy9Ob7Ql3PjelvMchfZUPaXebdBgdMJOKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLME8iv7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLME8iv7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so59461745e9.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 08:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595062; x=1767199862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQRDrim4FEwMqi0R/qih6B4Ymf06QYnRyoRHwzrNN2k=;
        b=YLME8iv7B7ALiZhHrBejnGOcxU24nlb7+bE5wqGZmNEMQcqKdSDhnXpZ7hzQlXQ+4K
         Sax/m0tlDbmyQAKHCgr0IbveYw9Uj7cvPqApK+7FchNCPhxlZhvqmPKEp3/PyMKHZ0WP
         7UOpd7kE/Wm0U5Sfemu/eODcOJwL+zPJlnEE3K5ZBC7Ly8b1mPgNz8ccgmjWjc1oHp1Z
         +fSAHro0R2ZSZnpui9LmqROR84TyJ9n1urtRAIDZLM+y76CMuvYVKrg7tutQ5X46bQMK
         Co/XcZTnpLANzhx8yE+Op4JerLzhtKbgnRDZFzKuQSQDGcFaSpQ6fKq62Z4H2isHi/2O
         O5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595062; x=1767199862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AQRDrim4FEwMqi0R/qih6B4Ymf06QYnRyoRHwzrNN2k=;
        b=UqWsRGect0dkYSgETRFGWkAk0UmN4i9cL9+xdghFgu33qqPp1XDBrethnMqhz/g+J8
         zS2d1eFAEh7nDPx86uw/hZIdZfslojzXE3+EtbJqKCqf6X5/JcR2wF9hAt3R1dGZGL0V
         YF/qW2N35mIxQWZXLoTYO5n1kCAmTX5299mWK3hgV+tflnSAuzIsogyMJgMA4Erdv6NF
         TUzt1CNtNuFtvG+wLEsbTnjaWSxNxK3M5eFqTQSstvmYtD3jw84VJ7i6ECrN24rBIn7K
         75iO0GoCrgXcjW5luYTzWd0YyTb7ge76mb25mXjVPlvKoqRjKYikUmTtVd2yr+6Tb4Wi
         Pmgw==
X-Forwarded-Encrypted: i=1; AJvYcCXlG2If8tFnYwpZhS+csudf2fHpykcE4jRTJjEBh8O00Wu9q+kwoVm2JKxSidmz7QA+maz74HYNhU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlcyv0lK/thbiojguu++JfQemV4DWbuO7KDz/FXQ7De9/T9PP7
	6OPvfTa1MOyULABJtpFBVayi2M8w9tVSQk/oGZByLhxcRcx4L8k4N5jt
X-Gm-Gg: AY/fxX6C4tHYZNkqfhlJSvfxoJds4UfHPVgkJY6QpIJBZh/JJLvvAbSjHqRiRQH0C+3
	0Tf5rR7Uw/GKlvNL1+8uBbD7cNjCgvvE0NO7uJuVk85yCjtSaXEqQazw1Ju/4PmlkTsPVd+16BV
	JYtw1p0wHFhC83q/rfdNVL/UIhg2Y9kNyxihd57xdcbHTMqrxG8UxJsZsTsRFdLe3JetRs6X/L5
	4ZoJGkj1USPDUM79hwQxI6Ct/2F+qK0/62pcH3vaCy8JlH6Ki6G6NfqTh+Qio+FyPnw0kORgaEq
	bVkNtZjxsCiVTFvTBABkM2l3brbdq3uB24Pru9VrmksxXeOTy7WY0ZkhtxE93JoCRuqDPL4HZtb
	zGrU7ik0dBApFck6sf82TWWir1z9DCraB2VKG1Jv4uwul7YB2FsZFV/88PG9ba8qOolnT9JuDJ4
	nHuwUoCvGYkd9OKLGu4VfxJTLHBW40t9d/OcBlvT4ZnnopBRtDOjEMB9atMFy75zbaBe93qHYDT
	8GIYkUaMcio8kQMTnCWba5X4/z/LuUnkWU=
X-Google-Smtp-Source: AGHT+IElBaE7vx5iwb5cVpNnbKQ6T80CC1fNP8UEA2reNiPfiO8g3fVnVOVBa3a/jQ7n3pBG/K47cg==
X-Received: by 2002:a05:600c:524f:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-47d1958b73cmr182630855e9.27.1766595061971;
        Wed, 24 Dec 2025 08:51:01 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm136482305e9.15.2025.12.24.08.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:51:01 -0800 (PST)
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
Subject: [PATCH 3/4] clk: renesas: r9a09g057: Add entries for CANFD
Date: Wed, 24 Dec 2025 16:50:48 +0000
Message-ID: <20251224165049.3384870-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g057-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 991f9a2ec12e..6943cad318b5 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -46,6 +46,7 @@ enum clk_ids {
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
+	CLK_PLLCLN_DIV20,
 	CLK_PLLCLN_DIV64,
 	CLK_PLLCLN_DIV256,
 	CLK_PLLCLN_DIV1024,
@@ -185,6 +186,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
+	DEF_FIXED(".pllcln_div20", CLK_PLLCLN_DIV20, CLK_PLLCLN, 1, 20),
 	DEF_FIXED(".pllcln_div64", CLK_PLLCLN_DIV64, CLK_PLLCLN, 1, 64),
 	DEF_FIXED(".pllcln_div256", CLK_PLLCLN_DIV256, CLK_PLLCLN, 1, 256),
 	DEF_FIXED(".pllcln_div1024", CLK_PLLCLN_DIV1024, CLK_PLLCLN, 1, 1024),
@@ -440,6 +442,12 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
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
@@ -634,6 +642,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
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


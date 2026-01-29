Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86FB339705
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681817; cv=none; b=LLC7bwNVPc7dQNSLb9UoFajwmj17f5H9/SnLg2D68HJ0r87ie1E5Jb2RoQi1Z2jeTS7FQalhdTDWYUlh2tO5cVWBV08wKjkwbW8TuDyAa16Hzj8sLnQufkef9dYZ3FqyoX60oXXNun9YxUEBhFk0J/I436zLDNiP40rCQmdTrN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681817; c=relaxed/simple;
	bh=xzApL+tOXmpVuGXhCiWBafOpCmGl0cWaKQ4hIdAkSwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoUptowXhMUXVapuVgf3ISF8sPlGUD3BTMU/o7k0ecHC8iuH61Vhq/+OVkPrP8dpAKYyizEE8CynnOUrdcf5qMiHVRlz4Bgma7VqG3yc77OtT7gE4hb70Ky7Bl1pAPNyvtTft+FoxaFvMfOElpSK8RBfzmJx22R+3NWmZA3DBhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJOJyoxs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJOJyoxs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso7376975e9.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681812; x=1770286612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=aJOJyoxsaumfNQoYOMDimO87mdcv49z5hJjABdfv+Uq++8aGawjJM7Z9INklypRG3E
         Os+66IadrlTDCMWRX9m332TLqlLjSmJqmkcXMru1fNwxVWgVTvVvwnOvRHXhyUGpZRDY
         daGsw6qxp6WgJ8oKzqNDEmfg4DplNg9wuEAqBtaw/ja7DczomxICzY3EkSDnJJ0gJoYB
         GwBwG/xswV4xFobd92ED2WtxFcNTgsxnfwLJb2WVtiYpWpoOf3TxPObbdn8AddnOxlJ3
         Z3Atpskm/BNALCPg+2bBnbfkKFvhCmF0cBk6b8DVs5jmLWob3jTkC0kfKq7nLroN1tag
         XawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681812; x=1770286612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=tDps6KUIQjmZmBgM1NTCHEd/arb7U3tH+ZNUiZ/9FAz02IgUFB/TjZMHoGqgZBHtxM
         LTti9fLvkuHhMkpMtYv7srbUMbrA8ZorPKCCgK0//KNi6kPtxWWKk9sHscJ3t1T16Ehx
         VdOwYotkekddIxU8PUNufnvihHgEkiYuCyvf9RIgBgsH1tbaaUd6vENFGlygT4dB1my5
         tcBalxG81qg1DDrj3Wh2bcn8vv+GakmQQqCZxqGZHpDSRjLkd3NOjOmQswXIMnMVa/HY
         S3ZRKYdeCztXgowHHMqrI9y01fqimoVJJjblytft8k5VKfBx3P7+Sb2Ar03UncX9VLGv
         tc3A==
X-Forwarded-Encrypted: i=1; AJvYcCXD0GKvPHVGqsK0bX0nh26LddRwwhiQjJRhgsm99WyG6he+v7Kw5EHTej6/BeHetqyS84LQjZma8X4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMvzETp/iNXve6Sy0qofQmZQZFfYNrgLFpExdswFB+3teLSSts
	yE9MSMnkHnxXMt0m+VIP4YSz3CyO+kzsPxBbNcuqAQcuV0CZiEMYC5sx
X-Gm-Gg: AZuq6aIM1SgZOvWrImt08kHZPB0g8rnEw40UCGJ8QV9Oi7ItmTaZuXu+9++HRFdV3NB
	ly+GJSDYdNlN+Bw37qTfQ1Use0jPf7IW6hML7H9ihrltKtCAWEMdrAIcHKw/Xaz8swMhW4IjFTA
	tOW/76fddv6sWYX48n05B8e6Nq1P7+fpLpq02ybMgnzZwPYO9l+tRl//tUt7rJ4R4aChVZ++kZw
	1yzElZ1Le98NLDJAV+fPDm3CoB9EQ7l9oxgOwenBvMNpwASG3VODt9x+7iE3fhyZ1S+UeIpx7Am
	CRuXQH/3XOIGQZERDtTZ8+V/SKK/C/WnQF/5AAzqVIbjEPFbYvMZr9vU1YBuSvEn/XadsourZAa
	5Qmd5wLuZttLMQPTscym2Fop4DZKg5TgzZqrd5Wo4PlKm4WhrcJVIoqLtcnJrOxDyPI3i2/l6FV
	hdXEFJ7fv3M/R6RXURzVcbbOAsbWI=
X-Received: by 2002:a05:600c:458a:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-48069c0fdafmr92534445e9.4.1769681812375;
        Thu, 29 Jan 2026 02:16:52 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 3/9] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Thu, 29 Jan 2026 10:16:38 +0000
Message-ID: <e6794ded22213e2244f0d2be060df791860f7c5b.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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


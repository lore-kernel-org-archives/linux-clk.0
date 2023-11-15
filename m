Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCA72D7AA
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="L5zoAHDY"
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3DA123
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:40 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso1019773966b.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058519; x=1700663319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qoow4kLikA+1u6jbWCEh/oPcxwlTJy8Hg8XLdol66k=;
        b=L5zoAHDYLaE5H7JMegrsMLypbsiGZy6In6T6hoZJyniUi5LijhyR/dO2oisLpIltNS
         xO08fKP+h5kn1ebZ5tJS7m0ZcQmLfe4DL0HAjlLSN5lgoxoaZ6UheMGDwgXBoQwJNZ0f
         UxFa8aRfFXNkdsjyw62Af/6sM1uhM4vHvrhR3vlvguxpY/DxVUIrMtbgeJrn05OmqC5a
         iTy3BhtXEInZlCjmhXwdHMXtyJ9RTotdYV3OUvGPF63Og0kWv4LCTbwcgGQB0K8JNvxJ
         ns60/FlgR5ad8wF+3CLGvDwvzlWy2GB7t5WaswxoRHeuF0GiuAfABJI6MRROAsLNlF/q
         K7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058519; x=1700663319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qoow4kLikA+1u6jbWCEh/oPcxwlTJy8Hg8XLdol66k=;
        b=ji1eEs6FrtKwq46arFGdCcfXgs6XsxMSuFCGaWJamXuqdm3gUTd4ovbTEfBixMTtD0
         Ou1hBjPeK5fFwbeVQkI7KIXOx3KBsF5w1KSQvdTXvdPs2eAbGwz/LgsE9RsHTuxRIfI6
         mqhWam5Idsh21RQ/uq4fz4s9iMvBuMwrY1KBxxTbc3Hq8KLKj9B0eGyGP86pDjDfodI4
         Krj4QZ2/4rhPo8sqWqK878XuogoFWAhN65BdGEJ9tEG5Iba3UaHCAVpXIfTHnSisMhq4
         6NjsZ18b+VfOOZA4gsahDViXOnp5rgRCgQ9IecloShtdyDVuhDRlb5lf9MZ0otgPsJ60
         qf4Q==
X-Gm-Message-State: AOJu0YxyxZXEKajsYbc3+zcwTkYpNhK6bGb/cBFmNYFfT4peB6WhhQGA
	IAQ7KysuKpOydvFoXZ8DSl22kQ==
X-Google-Smtp-Source: AGHT+IG27julUbeRslohrR6DkKjdpij1y3db2XTxUpwRQy3NUDxkM1NFWB7ljy8nLBGFjD8zM35dPQ==
X-Received: by 2002:a17:906:1e17:b0:9d2:5cf8:e61 with SMTP id g23-20020a1709061e1700b009d25cf80e61mr8615809ejj.35.1700058519319;
        Wed, 15 Nov 2023 06:28:39 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/9] clk: renesas: r9a08g045: Add IA55 pclk and its reset
Date: Wed, 15 Nov 2023 16:27:42 +0200
Message-Id: <20231115142749.853106-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

IA55 interrupt controller is available on RZ/G3S SoC. Add IA55 pclk and
its reset.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- updated commit description

 drivers/clk/renesas/r9a08g045-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 4394cb241d99..ea3beca8b4e0 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -188,6 +188,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 
 static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("gic_gicclk",		R9A08G045_GIC600_GICCLK, R9A08G045_CLK_P1, 0x514, 0),
+	DEF_MOD("ia55_pclk",		R9A08G045_IA55_PCLK, R9A08G045_CLK_P2, 0x518, 0),
 	DEF_MOD("ia55_clk",		R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1),
 	DEF_MOD("dmac_aclk",		R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0),
 	DEF_MOD("sdhi0_imclk",		R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0),
@@ -209,6 +210,7 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GIC600_GICRESET_N, 0x814, 0),
 	DEF_RST(R9A08G045_GIC600_DBG_GICRESET_N, 0x814, 1),
+	DEF_RST(R9A08G045_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G045_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A08G045_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A08G045_SDHI2_IXRST, 0x854, 2),
@@ -220,6 +222,7 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 
 static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A08G045_IA55_PCLK,
 	MOD_CLK_BASE + R9A08G045_IA55_CLK,
 	MOD_CLK_BASE + R9A08G045_DMAC_ACLK,
 };
-- 
2.39.2


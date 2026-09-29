Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1651CF67
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679049; cv=none; b=DXvRVKwr+Q9s4Fnp3AiSR9dne05OgCxha5pYlmPMFgU2qU99W5kpHjI7BVPDPbaJm26WhD/nQkK81tO4Nz4eSlaZWuj2nApYZWCP5vI1LE1mIGJI8EuLQHXy+5XpRkXo+DEHrC3r1InwbzP8mfzTmDvOFPj+82XVY8Uv3I3Ipx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679049; c=relaxed/simple;
	bh=WFXtyizqLGIjeqJuBx4E9hrha6JrwqGU/OoHpHVWIBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhm0PR1QKaNc4T1SC5L6XgZsa0X5iRbqIpSvoBjDBdo2wIpoHx3PPPZX1JXDEdH5BK8q20tQbBJHyY+Bya2eathLtVhF2bhrg7WL8s9EGRaHneqyz2186C8gIiGOjTT3G9jJZuK2fcG4TEIpRXT/T6Tl0/XK9CgY0V3g/pxM5KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnIcDz2M; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnIcDz2M"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso2355323f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679037; x=1791283837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7SolB0St7GVMEYCNplMh8ZGWzJ6l4dcWp+uIpkdJQ8=;
        b=LnIcDz2MsNcTIn+E8xQAwO1P83V5JZMWjgK18sD8u8xS1kRHJWH19ucPOvisPSkTHd
         AZhOjaAZkBHqc4QME1yalwTEr925K09ITTWxIbZRzaVqFXZYwLH6sDeQixL0+L0PV3oI
         tvUcm98Ri4mLh6rZ8fErBUmURBNN9JkI+IFvas4Gco8KY8kynjdO/O7NHo1WeiOV55gT
         MgcbEgMb+aeJGnVTrkOko1zuhz6Ghbxg7nluuJhDAaITWcsNvMEOs2Tj59FgMvPgmmZO
         akdRqUdZESeybha8re8qhuWGNC2YvC7TjDII8Ls5uMTEe6bLe9qpm+Tct5kKY1fhdsGT
         /D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679037; x=1791283837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7SolB0St7GVMEYCNplMh8ZGWzJ6l4dcWp+uIpkdJQ8=;
        b=0WraGyp0FyIsrBkmirkUNi37rQwjLZ6dDsBux5uHhhO98fajiZPDq6bY7TkcAlv9sz
         nwYQX4eX8Ub4oA0U6Yrg9hlhJfYzyuZPMMa4d4xC3D10PW74+YdCKfVcIAE0noYi+BOd
         Ls43/8lu1q1TPDKpq8TR///7yRnlJ86TTTgWbcDG3Puy5md9PWgKn/O/V2JjJhn4I4zN
         QZ9i7QJSf1t8fyRvj6/pU8Nhh3f5+LimTY4mvZDG18lkudmBXd6LeWN0uvZ1NQfG4RC4
         19kOi2IPOUDT2IoIT6jl/RIaSPGQ34H+EMdPr4kF9e0SUD6e85mIeUQXDWKDyPA4gl/F
         O/uw==
X-Forwarded-Encrypted: i=1; AKwUvBzYgpr7Rp39BF0i8hUuXhIr+FVJzahjULbSPIonRRdKrgKmnFPzTmyjLDbCU53VjOouC4HJ1lhVWeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZiXxsSTGs2y/tby8fsooQb7H9Z31IluKf6nHN6tA77f+Jj9jL
	VLTibdcDNhMgdImmjXwCqPLj52gvdpa6qDHdA3cso3UB5ioUbCrKxPtOd8DckmFQ
X-Gm-Gg: AYBFou2mP5+sSUzrXM+gxT3qwDX0oIRvGtZMcGEnpEv6SO6v/ro920ZlXwb3FT1v6Nb
	GfSxgCQKyQhTSyGz7WvWI3mdcGBfUtFU2z4078UlXWPvUEQHQUEajLk80HHTM9bo8+7kOWSLPmx
	jK8drLIQK4KXMd52ggZBpBGFejyL9dRIEgfDCFQYjcwUHp6ad8pP7lllZIFS69EJAaC/IQPcmy9
	RnB0qmWK5ilMHwvr3OwKFyqlG45XKq3aYd6UvRYKTH4veVW74OpsO922vvNq2RUq3iJZvw36SbS
	bWLAXfc2MG5dbzzbmbY3Ir5c/Opogoy66e8WdFmOGF/AxPfCT3ErMXt9TOiPySc28aADJF4Cz3G
	0dkp98BjoBtfMXRR+VNKoariv686d9FT4Nd2WvvriTgI9iY/oqYL8jrA+P4Izp+WUP15O+Rx7DL
	I80WK0gZOZqDgsS4xKGTtpVjw8yx5SU0csYJcGSvxWhPNmW3ZipjZztQwHUNPUYE4HdlM8qsLXf
	c+nOqCqCs1RoAMVAXEU6APcNQ711LE0UHTdUdQpyEvncJlSr+f6cLY8V4ODf8mJDBJ+mYpch1YC
	5sIXCE68DS2MQNA5lg==
X-Received: by 2002:a5d:64c7:0:b0:487:27f6:a4df with SMTP id ffacd0b85a97d-488716b8a05mr30515262f8f.47.1790679036596;
        Tue, 29 Sep 2026 03:50:36 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 1/8] clk: renesas: r9a09g077: Add helper to start WDTDCR counter
Date: Tue, 29 Sep 2026 11:50:14 +0100
Message-ID: <20260929105021.542730-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCRm registers are not suitable for access through the SYSC regmap
from atomic or panic context, as regmap locking can deadlock when another
CPU holding the lock has already stopped.

Add a lockless helper to clear WDTDCRm.WDTSTOPCTRL and start the watchdog
counter using the existing SYSC register accessors.

Export the helper in the RZT2H_CPG namespace for use by the watchdog
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 35 ++++++++++++++++++++++++-----
 include/linux/clk/renesas.h         |  6 +++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 5a0e7df1eb06..90f0c373976f 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -103,10 +104,17 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZT2H_SYSC_BLOCK(x)		FIELD_GET(RZT2H_SYSC_BLOCK_MASK, x)
 #define RZT2H_SYSC_REG_OFFSET(x)	FIELD_GET(RZT2H_SYSC_OFFSET_MASK, x)
 
+/* WDT Debug Control Registers (WDTDCRm), in the block 1 SYSC region */
+#define RZT2H_WDTDCR(n)			(RZT2H_SYSC_BLOCK_MASK | (0x5100 + (n) * 4))
+#define RZT2H_WDTDCR_WDTSTOPCTRL	BIT(0)
+#define RZT2H_WDT_MAX_INSTANCES		6
+
 struct r9a09g077_sysc_reg {
 	void __iomem *base[2];
 };
 
+static struct r9a09g077_sysc_reg *r9a09g077_sysc_regs;
+
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
@@ -963,10 +971,25 @@ static bool r9a09g077_writeable_readable_sysc(struct device *dev, unsigned int r
 	}
 }
 
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index)
+{
+	struct r9a09g077_sysc_reg *sysc = r9a09g077_sysc_regs;
+	unsigned int reg, val;
+
+	/* Sanity check: ensure sysc is initialized and wdt_index is valid */
+	if (!sysc || wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+		return;
+
+	reg = RZT2H_WDTDCR(wdt_index);
+	r9a09g077_regmap_read(sysc, reg, &val);
+	val &= ~RZT2H_WDTDCR_WDTSTOPCTRL;
+	r9a09g077_regmap_write(sysc, reg, val);
+}
+EXPORT_SYMBOL_NS_GPL(rzt2h_cpg_wdtdcr_count_start, "RZT2H_CPG");
+
 static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 {
 	struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
-	struct r9a09g077_sysc_reg *sysc_reg;
 	struct regmap *regmap;
 	struct resource res;
 	int ret;
@@ -991,13 +1014,13 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	if (!regmap_cfg)
 		return -ENOMEM;
 
-	sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
-	if (!sysc_reg)
+	r9a09g077_sysc_regs = devm_kzalloc(dev, sizeof(*r9a09g077_sysc_regs), GFP_KERNEL);
+	if (!r9a09g077_sysc_regs)
 		return -ENOMEM;
 
 	/* Only allow access in the SYSC regions */
-	sysc_reg->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
-	sysc_reg->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
 
 	regmap_cfg->name = "rzt2h_sysc";
 	regmap_cfg->reg_bits = 32;
@@ -1008,7 +1031,7 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
 	regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
 
-	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
+	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, r9a09g077_sysc_regs, regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c9495558cd5c..1e171db25eb7 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -216,4 +216,10 @@ static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *li
 #define rzv2h_get_pll_pars	rzv2h_cpg_get_pll_pars
 #define rzv2h_get_pll_divs_pars	rzv2h_cpg_get_pll_divs_pars
 
+#if defined(CONFIG_CLK_R9A09G077) || defined(CONFIG_CLK_R9A09G087)
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
+#else
+static inline void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index) { }
+#endif
+
 #endif
-- 
2.55.0


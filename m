Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42474963D2
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873533; cv=none; b=jxIk4k+jNNe8gebUh3qvLk6Y8uAdFmCHy4e945Ee4EnjJrpJVP4+QPbZ79y4wTfGA0RL9dV13pSRYkhx9U9OMlV9fucERULax90QwBukvckAbNtTDI15aCsGDi9p4C2ssUGmGR5lsxaH0qbhgLEXEI7NW2hgInk1RDEkT6YpG+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873533; c=relaxed/simple;
	bh=S6VN1ivEjsnqdL0+GBtBo5w+y3FRTxaL/3RuWyOjMuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAFxyJYghz4fomknaV/iiUC69TYXQtKRtouBB++urLlObeyL6h5jKu452ye5EDdWVITRc7/m2suQiM+y0xpM1WPnS/DeqL66hjEf1Hi+/6JTArJt29cn3lfUBSw7jf0mu44UKjtvWXEj5aUalofM4jc/psUJCmmEIeaJ+zRV/QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzpN/rmo; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzpN/rmo"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1277662f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873528; x=1791478328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2gL6Rq6LC2RfmgVFHY4W3DCjCPHLR3TrZ1IA237aSw=;
        b=BzpN/rmozWoFkZGZ2Fs2WL/g89vJuFQijEkRX6CCeQ/Ks+oQwyM0j9p3EmdMO5p2kD
         bC7Mv8510fBetdnRzw7yu/zZ8U39ZNMu7AlF2zE4crcJULDm340hgJjOOM2cgrOrRE5v
         K0djdh4dN2c9aRsVrfq0WFHZmr7nza9hHNKW4neerm+qOc6fEeWCBmPfiRyJ+W92YeEu
         6CUo6Ake9N+jBVMtpgIKxsjoIPfHxYUmIzjKJ5lnCeMnXahCzQv0f/dRq2NJm01lTDzR
         0EHiBt4MHRUDVfMAX4FQUMwArueDjLZqKm6StdRZXrJjlp4KafHcvzkNjC0bl1s+Yk0Y
         XxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873528; x=1791478328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2gL6Rq6LC2RfmgVFHY4W3DCjCPHLR3TrZ1IA237aSw=;
        b=k4cGx8SLcmIJRgD1ZM+D32bpfj/dBxPuQ5nJs/u3SRjVVpowjqIu9Tai8k2V+puDII
         HQ9W307m0zEIwQSo4OiZDm7Sw89owMzc1P/ZGTpK+UEfiKqlkgX25Z4twwWPw0S5xXp/
         eLkB9SyAcDLVFg/bcG/Fx/fNqCIAG78bdQqNKo7b+WUcRE6vzEhZUGNgTQovPiZxmeLr
         oKmrSZ45eejzpmX1rlD4qmyUwbiwwpzObJWvaPDDz7f/snfC2/sxEGUGj7vz8N39JRXr
         uctrB/m+5UHyER4X8apDqhkfI4LWsP/3aNBogmJ0/AQHl7l1QQ+rsiMNSuLHLH58Zy2d
         lJFw==
X-Forwarded-Encrypted: i=1; AKwUvBzVVQR3Az+KpaTYyZTebmiWJKRoorF+EU57IObXvtwkAtOY2YYSaK5Qs812swFEZTH2+QW9ERX8S1I=@vger.kernel.org
X-Gm-Message-State: AFuF++mEY18uNm15LoDJsPW7Eq1mH/RmEvEcJ9vW+YuvQup3JEtuM9t1
	Zv92Zo7gwqJNiCaQH5GzAsfzclSV5g7QOk6EeVewEFZO70etAg1eS2gb
X-Gm-Gg: AYBFou26l4CB9KsdU0QFVh6hHfeAb0l8On/jpHyYx2adIPTZbWAjEqvjoT5F8vG3r0f
	r1G3BbMqAbCcDMu3jqYQDeiV8vD/zcuqjZFRQRqmpgdlXPHOJ1gvMsr8NbP0FR1HyMDJ3Tz31am
	aZ2+Squ2qfnatI4+aefUyXQSmBGPj2a8ZeeXcaQ9m9Hr+ZKmwRZ9gu+UFNWHFcvCVlJlcaYQGqy
	I2+okpIa/1S7qQkXcAl+hlhvRUFUjLa20baXsx8GeraTdVJbnIkfxM37Tg27LXgKKb6QJNmdDpu
	bLncMFhgis37OxSbGDJEbBhWTRgs2EYt6pWAxsNJv1tb7/LPUPpaKOyEVCwu4oT0hrVEtbp+RmV
	56+AmV0VSdfVMQ/aBMX8fbzwc+NXDM9VmlXdyesl9w8RnLsYMoxb1fWJPo+qKHdoYexbmwgXZTV
	M1hjiQ/f9j8hJEYhcPOPS3YP+7I9XpfIy7gaGNeaMAZjw7TBMdmYxOQqEnUYjWrYntepwcB+3vh
	p0X3JKXDaX2qchKj/QD3nvzK1dw9WgP0bG5C3owhDJC+iLN0G1OXyGyGChg2t+hBAnvzOfovHG4
	2Is33JEw
X-Received: by 2002:a05:600c:4e8e:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a02759b360mr3749095e9.18.1790873527643;
        Thu, 01 Oct 2026 09:52:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:07 -0700 (PDT)
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
Subject: [PATCH v8 1/7] clk: renesas: r9a09g077: Add helper to start WDTDCR counter
Date: Thu,  1 Oct 2026 17:51:55 +0100
Message-ID: <20261001165201.763882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v7->v8:
- No change

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


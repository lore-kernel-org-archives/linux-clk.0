Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1AC20FAA0
	for <linux-clk@vger.kernel.org>; Mon,  2 Sep 2024 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283463; cv=none; b=qH6nU5tRRFXfbfL9MmWRMNLtIKpGCvKDWusUUDRI/LX3UkMIuJUcEBxpincGKQjWpKQNV2uD6aftsIJe9mEhB2k7kY6xAJmdhx0gtqj043uwVT9/cDQtGDEEIHSPz1/uqIGp9I2phf7THcX5x1754tuaKbYfmsu1h71bEq/Nkb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283463; c=relaxed/simple;
	bh=cFBTXdmxf6xkp+y5d2pbAtSSMPoHp78PhBPGeBVQ5Dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mgCq56KrBPwoN7DlAjeAQ+8YBCI5YlubRLplsdnrsCvbvoBLL7WUyJPzaMuGkvXdeooy8kf+2FYbgefI9J8qViOb0gMAEbq5w7LXA0Jc+Wbf3RjySPR54TX9Prvo3psdG4sahVIH7mVjRs95ziMIZhTDKfnDdZEF5pvIbTvdOss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=imwnOHxo; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="imwnOHxo"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a843bef98so426792666b.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Sep 2024 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725283459; x=1725888259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uH2zrXZ5BzUnaRlSwJAfvqf8QT+KWHn0touYH89ZpM=;
        b=imwnOHxo7+qoTVfc9EsEMOxKCHe5/GlHAwIyyaXsvbUtvMYwcZw4BxLJuGIXTIKkzq
         AvcLudtHLQUrT5UEU6cWep/ujpd0yhM/SSlf34ByA/3JYujUtRY76O3aYB4ARRxxRRHD
         dSPsfYSYwAwDUI2TMrsvnvMKbuvqPp85k8mTIElOS8xMFy1SLBvPhRMayvv260LUFaUc
         lG92Ud8yDWG2xWqt7PrergA9fhqyuwMjiHxvKeQSxujQld5Wn5et5VanUWrEVQzdaduB
         WtsMiiEZanzNXm3oUPdit6iO+tONneVCiakJ42tRyW04sxD162kr2ovlN4OkSeHXo6nk
         HpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283459; x=1725888259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uH2zrXZ5BzUnaRlSwJAfvqf8QT+KWHn0touYH89ZpM=;
        b=njpWNB40xU0zNUuKxCw+2qZXIMoI9tAFTNYiDBe42Lzfc8uRZQwQM85rLfnTLRxXZF
         BkyCHZOvtJiNKhGm8gd6t1S4rgK6b96XCxTk8XeWPANIkUMzlQT2iQmAbdczpOc1A942
         ai+MmsPKRKrdmOhRtQrOi8wrxPLi27SHKxYuiKLiTnj2gRW4lCaBw71MoN73etkzdtG+
         y/sINtM94gFwZEDS2ZftmpgJI/vbJpnWpB1drc6HeTOR9I7WigcKMRk/b0fwbQ1455FJ
         k6k7n4uy2TAbycQLvw+WvF3Vi1oN5T5hy32Oc3/ibIaCNVJG2lE5jkAp+6B5bAs0AAju
         63oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIE41bO8MkxsKrRB++hvHX1zqETrXUsRFY1YQRzvX+RYQwMqkcu3539sIQwoZJxG0br/uFz3bjlDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxpYmRFARrB3wWWmoPKVX3n1fKbD1TpmdebazLbkgukOCQxTLs
	8MzRcQ1rp/lWHLDKDTltK6gUpvQSF7F2q5+tMP5hJ4QMaoBkwOdZjXDErzIbmBQ=
X-Google-Smtp-Source: AGHT+IG1V9dSAf07DHR62KASs9WSEqeV5d5EQuUr+viWs43Pyc9VUqW1INeHZvgwKTUjEq6tI9M0MQ==
X-Received: by 2002:a17:907:d24:b0:a86:700f:93c0 with SMTP id a640c23a62f3a-a89d879c339mr447058166b.35.1725283459432;
        Mon, 02 Sep 2024 06:24:19 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f6e0sm556060266b.77.2024.09.02.06.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:24:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 3/4] clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as IRQ safe
Date: Mon,  2 Sep 2024 16:24:01 +0300
Message-Id: <20240902132402.2628900-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If the watchdog is part of a dedicated power domain (as it may be on
RZ/G3S) the watchdog PM domain need to be powered on in the watchdog
restart handler. Currently, only the clocks are enabled in the watchdog
restart handler. To be able to also power on the PM domain we need to
call pm_runtime_resume_and_get() on the watchdog restart handler, mark
the watchdog device as IRQ safe and register the watchdog PM domain
with GENPD_FLAG_IRQ_SAFE.

Register watchdog PM domain as IRQ safe. Along with it the always-on
PM domain (parent of the watchdog domain) was marked as IRQ safe.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- changed patch title; it was "clk: renesas: rzg2l-cpg: Mark
  watchdog and always-on PM domains as IRQ safe"

Changes since RFC:
- none; this patch is new

 drivers/clk/renesas/r9a08g045-cpg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index ec0672651fe0..8e4f17c21dd7 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -259,7 +259,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 	/* Keep always-on domain on the first position for proper domains registration. */
 	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON,
 				DEF_REG_CONF(0, 0),
-				GENPD_FLAG_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
 	DEF_PD("gic",		R9A08G045_PD_GIC,
 				DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
 				GENPD_FLAG_ALWAYS_ON),
@@ -270,7 +270,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
 				GENPD_FLAG_ALWAYS_ON),
 	DEF_PD("wdt0",		R9A08G045_PD_WDT0,
-				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)), 0),
+				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)),
+				GENPD_FLAG_IRQ_SAFE),
 	DEF_PD("sdhi0",		R9A08G045_PD_SDHI0,
 				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)), 0),
 	DEF_PD("sdhi1",		R9A08G045_PD_SDHI1,
-- 
2.39.2


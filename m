Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1521F9EAE
	for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010888; cv=none; b=GZaJs5ICx4qVn3jpRRxzABFuqq+MpjKHI2fPfu2anq7tTS4KD/fC1Aq/iYN9ggEgy4orsPyzugcEB8W3oFlucolIWrE3zhbVtIsW9Sh0WoPNc+FdxXi0rcLrngQcSZE93H6k5omEDK8fue89pnsZHmAHqLyif+pcv99Z4hq8Aeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010888; c=relaxed/simple;
	bh=aZbIwEcSSt0dH39z0JtBebgmt6ej6WRax9WCOwkWn7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmvBd/UwimJuKgN3u3PaAwZTQP32hikDe8I5ALOKIfaYC1sDSQE4eA9XtCg+qzOwlA8hos5G36z+o6RISBr99a3GvCukG2wVEcYiQuHyIKRXc3YU873LC9vLYp6KEyzwqngH0NDN/n6fnFqDs20eyaPBAyeLV0az+i1+Xr2jvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Iyxk7sIj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Iyxk7sIj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4311fd48032so31048275e9.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729010884; x=1729615684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28BpXdSWTssZ0ypW72g+pbX5C7u5uJHyKQlEUMgzrGE=;
        b=Iyxk7sIjXaSAsyyoZ1RaMbriKuJ1rJ/3msj7gN2kWYB4tL2l/fC82dQKbNCq/mAozg
         vH8CuKjsqa02AuUETLA6SqDSKmnhyVELvAcXMsMvpoLSwHrBStCDvSywzrHHgXXMYhv0
         tZqgykih7RP+DVp7tMnbCfNnYOeUzemY3lItR6uAgO7NTUZ5q2nU8hBRKL/peVUaWoEX
         gu45pnsu1jlOSR5RM5ZYi8iVp8iZD1n+gMSKB1EpkIQB2oQ4irdi4hYTZNbr7Q0JY2Ds
         Mk38zUPiE19seAqepfsFax1S55k/NgdzPp0IEjAQn3Dkn+pO1l/TiDW/FtiQFFsrg8NT
         ESpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010884; x=1729615684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28BpXdSWTssZ0ypW72g+pbX5C7u5uJHyKQlEUMgzrGE=;
        b=iBySAUGBKo9fwClUvCPKXpYC5HH3AuTCnGXXrOKco606HynscjVqpc/YZAm3s9/XXK
         VWOjrIST2+GBBj6/7K9CrxvwbpyFEE5HJiuUEBgle1rvooFsRI4CJx9BmlrBsKf1Laf5
         71tbsbychdL+/kBzIlKavVCXSH5bw6DB8AiGMPNhPU+FpDF+SjY31dJowBM7s1NilpVs
         i8xpWAJffj9UMngFdZEnioxbSXXAIZbNKpq7jqqT4dH4ZdECw18zyHVRhDU3ZcsmtwMg
         VdqKS62V2tU2T3K85paVsf90maxSEWe+1iui1DQWP6lop1pRQqa6A4TP5xCmVIeoAwVI
         odQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDfH3v1c43msEyAiJChtQZliDdssHZBi2f3gxFwf0gHxUC+U632s0ZZW0VU61mQp+o4uMEd7aSx/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zUlLEIwI+xg3WlXOUNBZ93kwRCE8CE/USQvAATm9CDyFkn97
	Szk8Mvo89uF/H/ILzHtgzRo7aqdU8vbH3fb8W7SrKubOWpqTSU1fLqEEl56s7EH5vdW+PDhr+Lg
	M
X-Google-Smtp-Source: AGHT+IFV4hQGNWpr5pbDWtAVvd2BGrADLGqJrjGSGacjVgpHRTnrURCIxxyqQ9Q10icW6jWU2wR6Gw==
X-Received: by 2002:a05:600c:34cd:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-4314a35ea0amr10487485e9.25.1729010884089;
        Tue, 15 Oct 2024 09:48:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm22882045e9.26.2024.10.15.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:48:03 -0700 (PDT)
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
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 3/4] clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as IRQ safe
Date: Tue, 15 Oct 2024 19:47:31 +0300
Message-Id: <20241015164732.4085249-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

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
index a24cafcbc619..f5f454832bb5 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -267,7 +267,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 	/* Keep always-on domain on the first position for proper domains registration. */
 	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON,
 				DEF_REG_CONF(0, 0),
-				GENPD_FLAG_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
 	DEF_PD("gic",		R9A08G045_PD_GIC,
 				DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
 				GENPD_FLAG_ALWAYS_ON),
@@ -278,7 +278,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
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


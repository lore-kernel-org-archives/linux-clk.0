Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEB415B14B
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752033; cv=none; b=Cw/XhxC/BILcF1tdGRtzdJHz4bb8GuFUtCiuYM5QLSzCt2Sd7Taq5SBLGGX7au2D5JzB8bMl0gQPFtyNSuUC3ZWvKv/9WB//VepH939DVL3fq6V+Y8C4cgaaQU2c5dBw9Q8LYMO767KFe08rE1i1Oq6vhuaBKTo0T6eLir2GrLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752033; c=relaxed/simple;
	bh=TJKT/pPUusOMgixv4Q5e6XG+MpMem0x+/efc18RrB88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nhWNR1yyPbgRoknBos+hPHpRAaaaMzi9lYQDFbAWCDuIjG9D9L4ZLw1Xapv5Fbp29gd3Jof/8zgd2PN8hrJesZUZTp26yGX8bj43N3tQAHruwi5gXOb6ZRcNEnEJwKAfMVGUWw2R9LzuLyaKdofbwDWjbfDnhzHGxLisjBJQLCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DX1BPzrn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DX1BPzrn"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d8129797fcso90735871fa.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712752029; x=1713356829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BZbAtu1RktUOhtr/eXu+3740J0qR/Eht6n39nZDjco=;
        b=DX1BPzrngHnVc108nU2rPg4X+HHaSO4SzvpS+Ci8fghwfMv8ItAkDUaaialy8YnjeT
         n6K+kPhdcR5pBP1zyg/JHragxnPgRJeL3NaGanA1SK5Ph2J5PxqvsZszI56h+PAfd/OP
         pCp2hlS8VA4Mj5I7WDhN7UJBKIPAxRvERKcN4peMQv5/wRUcqXKsI0onkYhZIIzaHpYq
         9MHCLY+lpKfOg2J9T46XKMrpPKi+vEyLuCbUiMAYROXIKbnjC38FeXnEOY1GgXwdE6Gt
         4qYsSXs+KE8ik95avdIT2L2MktG7NjWyQVa1twI0LlhFRjTmdNI/ymBjj38191P94EGP
         W5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752029; x=1713356829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BZbAtu1RktUOhtr/eXu+3740J0qR/Eht6n39nZDjco=;
        b=iJ13ET5uMC80yRLnwP+eR90N4FdDZGHEthmEFw0XidaS+yLepqEMaxR2l2xkyKmXji
         IPeBaPrCTaKZwQe1cD3WREiKHaa5/61WEFEXT9ScSnYQnBnHBSJFa93PyKGt2eda5kqi
         wpw6sGqo4ww6MDOmxGrc2447QF8IJSTsE2XLTlCKyeKHfZtt73osAwyvK4AUmMua54Hq
         5CPjkrl6repWBP47EU0hvh3xK1U182/Rg99BoFCpOFgYGWJB0ehTsjDC/6dOfKZOFcEj
         iF1xFemuHj2Sy3q+2WKPICtH2LmallLkDtoo1Yopuf60YN9cd03OLhmcVTsIpLrAvddC
         nrGw==
X-Forwarded-Encrypted: i=1; AJvYcCVDyddlHILLI8yyI6nKRuuAINEXiiRe9wXDaFajfftC0tn8hLs1IzWqQIe87JSNi2JX7IvVWiXRildssOtwSFkckeSwAsYiFZGy
X-Gm-Message-State: AOJu0YyB1qdMvja8bQOiDpSUon2a+4DYot2smm2SH9h9vRWV2nm7A8/W
	8TKXYB74ldjjHFn5S9g6ZbhedP+Httwjk7Fcd0hebZq/HADevbWtHNMFzWB1o5k=
X-Google-Smtp-Source: AGHT+IEycXW0nrhq5FASqePeqckHqiK9kjSHcUnm6/pG6A586NTQNYl+wrG+AdZzDo1aZ7WWxP306Q==
X-Received: by 2002:a2e:b613:0:b0:2d7:1ce5:3e24 with SMTP id r19-20020a2eb613000000b002d71ce53e24mr1998196ljn.34.1712752029459;
        Wed, 10 Apr 2024 05:27:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b004171f151a5csm1679446wms.16.2024.04.10.05.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:27:08 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/9]  clk: renesas: rzg2l: Add support for power domains
Date: Wed, 10 Apr 2024 15:26:48 +0300
Message-Id: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds support for power domains on rzg2l driver.

RZ/G2L kind of devices support a functionality called MSTOP (module
stop/standby). According to hardware manual the module could be switch
to standby after its clocks are disabled. The reverse order of operation
should be done when enabling a module (get the module out of standby,
enable its clocks etc).

In [1] the MSTOP settings were implemented by adding code in driver
to attach the MSTOP state to the IP clocks. But it has been proposed
to implement it as power domain. The result is this series.

Along with MSTOP functionality there is also module power down
functionality (which is currently available only on RZ/G3S). This has
been also implemented through power domains.

The DT bindings were updated with power domain IDs (plain integers
that matches the DT with driver data structures). The current DT
bindings were updated with module IDs for the modules listed in tables
with name "Registers for Module Standby Mode" (see HW manual) exception
being RZ/G3S where, due to the power down functionality, the DDR,
TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due
to the following lines of code from patch 6/9.

+       /* Prepare for power down the BUSes in power down mode. */
+       if (info->pm_domain_pwrdn_mstop)
+               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);

Domain IDs were added to all SoC specific bindings.

Thank you,
Claudiu Beznea 

Changes in v3:
- collected tags
- dinamically detect if a SCIF is serial console and populate
  pd->suspend_check
- dropped patch 09/10 from v2

Changes in v2:
- addressed review comments
- dropped:
    - dt-bindings: clock: r9a09g011-cpg: Add always-on power domain IDs
    - clk: renesas: r9a07g043: Add initial support for power domains
    - clk: renesas: r9a07g044: Add initial support for power domains
    - clk: renesas: r9a09g011: Add initial support for power domains
    - clk: renesas: r9a09g011: Add initial support for power domains
    - arm64: dts: renesas: r9a07g043: Update #power-domain-cells = <1>
    - arm64: dts: renesas: r9a07g044: Update #power-domain-cells = <1>
    - arm64: dts: renesas: r9a07g054: Update #power-domain-cells = <1>
    - arm64: dts: renesas: r9a09g011: Update #power-domain-cells = <1>
  as suggested in the review process
- dropped "arm64: dts: renesas: rzg3s-smarc-som: Guard the ethernet IRQ
  GPIOs with proper flags" patch as it was integrated
- added suspend to RAM support
- collected tag

[1] https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/


Claudiu Beznea (9):
  dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
  dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
  dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells =
    <1> for RZ/G3S
  clk: renesas: rzg2l: Extend power domain support
  clk: renesas: r9a08g045: Add support for power domains
  clk: renesas: rzg2l-cpg: Add suspend/resume support for power domains
  arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  20 +-
 drivers/clk/renesas/r9a08g045-cpg.c           |  61 ++++
 drivers/clk/renesas/rzg2l-cpg.c               | 269 +++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h               |  77 +++++
 include/dt-bindings/clock/r9a07g043-cpg.h     |  52 ++++
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ++++
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ++++
 include/dt-bindings/clock/r9a08g045-cpg.h     |  70 +++++
 9 files changed, 659 insertions(+), 24 deletions(-)

-- 
2.39.2


Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC83F12DD8E
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820470; cv=none; b=Xrr+pGmNVFNnLBY11YLDMOIrdmc6cuoAZU6e+ZECqVWJZuFszfLnfvNweANUAhBqiTzSBBRGPaRuGT0BRb9IMMD5+GFRgXQ318E9b1Z9Zs2FR5TIYlCiI8x6i7t+mdTi/yJpRE8PmaxBsyy34mkwfqZHqU7puUIGVh3w3zPicFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820470; c=relaxed/simple;
	bh=X6mr7ss3hBz+KcOkyD+aKlFcN4fw3b05uNnI+q4ZcYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ivgn5RarH2JRg2okO77Rl+uo8JshJSv7HL4Oz7MxQ/bRUKAV6q7rqNI5xR/0uESLap2kfsca2nqs096mKqw7kMBAqiNgV8t4BpGdO7DAU1W+xzIYX8QCZsbNESYa/RjtSGJ/t9hKLeQkz58OG+i8i8k+0TdVPC257/1knxZ1QP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FGb6tuPu; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FGb6tuPu"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a293f2280c7so162101166b.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2024 06:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820465; x=1710425265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qvoqgbf8BgmpB/WA74qzufv4GkITZwzS6+LGmIQY3Q=;
        b=FGb6tuPupwuScfJUpsAclHLb6UlcXo5srLgd4RT5EWMttHM0wm2zpc5YYsqYvfi1Nt
         NS0VZl8Zx6i0FRrmMHp0bpMDa8tEwR1H7h8VjPe8u3dHKQ65z9DM24FzJvL/TDAuxXiT
         /OkrPt7O63MOz452hviSp9BAQVz65eN5kIuHjlU+/b6LsVBF8KeiAiwpI68sMOWJcGPV
         2rr4QZsPYIhiZcDlSD+3/NV6gnWnhb7HYsrI7+2efduWYcBFduATMfvBT8ScxLUSPOKW
         /YxRMxPk3Sa7QMPYDil01STQfwBV3a9z65TYLnCx9ndnIFUhZo5outFmh3xh4GgRCVpr
         Zx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820465; x=1710425265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qvoqgbf8BgmpB/WA74qzufv4GkITZwzS6+LGmIQY3Q=;
        b=BbRRqcch6rErBPFgturKqB8AlZWU6BOk614WukLWAA07aP4ar0MtAJxPq+7FAqPHX8
         B5Rvlw0dWN+WjcbjjxJ0RtYWih26CZp38y5ulcfHP9iWTosfFUzNWnE2SmoHNFGHpGju
         7/cCF9XunT6VHa9ny2TSDMgOtF8N7TI7f6cVIKAjWYNVDRGYYQO3FMOyAclOxYebl0nN
         KYYrrY8vPrsXW+lcSSEH+d/fNLDrxEEbAn4qNd1APwireoO9xGicoCH6XT7LPzYd5lj+
         4qCKbxD1gj8Kzca2HM5HIbIurQPJQVX3Ivd1OiY4hQwqa/3bU59QY2npoDpedBxQl4d5
         QI2w==
X-Forwarded-Encrypted: i=1; AJvYcCVElA6Bfv+QOW4NNJUuOqx7lpLgmTCz73wUeaGWSZ85avcwqTZDQ0xiYAKtr75OlSBhnZxwU6qQwwBesNK3MNU1auwJG48RA7G8
X-Gm-Message-State: AOJu0YwOZLavmAjQZJVB+6ckDlU3KuRnhx0UyU/dHiYycg5XmZJ4o68j
	0xLeHYSVXSqRGaxlba73laPt9HwRtCm51PfU7tFI6sTaaUXRE3FOTyIxQ9EL2zk=
X-Google-Smtp-Source: AGHT+IGe9ehohUZqONm1c72a7RNSuywN/LKsDYfSndJQuoACdSv5VuHGXxdcyjhAOzi7I1PAms9HYA==
X-Received: by 2002:a17:906:138d:b0:a45:abec:cff4 with SMTP id f13-20020a170906138d00b00a45abeccff4mr5234619ejc.32.1709820465129;
        Thu, 07 Mar 2024 06:07:45 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/10] clk: renesas: rzg2l: Add support for power domains
Date: Thu,  7 Mar 2024 16:07:18 +0200
Message-Id: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
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
to the following lines of code from patch 7/17.

+       /* Prepare for power down the BUSes in power down mode. */
+       if (info->pm_domain_pwrdn_mstop)
+               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);

Domain IDs were added to all SoC specific bindings.

Thank you,
Claudiu Beznea 

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

Claudiu Beznea (10):
  dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
  dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
  dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells =
    <1> for RZ/G3S
  clk: renesas: rzg2l: Extend power domain support
  clk: renesas: r9a08g045: Add support for power domains
  clk: renesas: rzg2l-cpg: Add suspend/resume support for power domains
  clk: renesas: r9a08g045: Add the RZG2L_PD_F_CONSOLE flag to scif0 PM
    domain
  arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  20 +-
 drivers/clk/renesas/r9a08g045-cpg.c           |  61 ++++
 drivers/clk/renesas/rzg2l-cpg.c               | 267 +++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h               |  78 +++++
 include/dt-bindings/clock/r9a07g043-cpg.h     |  52 ++++
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ++++
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ++++
 include/dt-bindings/clock/r9a08g045-cpg.h     |  70 +++++
 9 files changed, 658 insertions(+), 24 deletions(-)

-- 
2.39.2


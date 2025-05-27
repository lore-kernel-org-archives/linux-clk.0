Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64222580CF
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345057; cv=none; b=XoOlHoMYGHhgGOaAv43g7t2QDMccraGdx6YSDl5uuX13M6RyAJ2EDy4Rnt2egKBS6RP2HHyg63ske+uBoEDRJzbUbbdvj0MhYafGaNgmoFUzZYhxgm2b/v3/o7TkMZcLbm6SiqHUC2GSro54Un7GYE4uMz92o7Zg1Gd/LDr577g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345057; c=relaxed/simple;
	bh=kX2Eh9Ym9GOYfkBTB1vxEmtB+C7aYdq29WBmZzhWQZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ty+v6UtWkLmDyQLCvzCBStOTHZ6jh7CuLqXsjRK6BmyyQTBnvz8xUnDtrHhH2v34EU6USsszEc1kjBCcELUUToFbKYD5ZKJD69pL5HontDE7Q3WR7p5koLSodT3A073eAADf20ErY54KCxAdKYau2EZAQiMmiPBRfD47kXp+LWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iEw5aj5A; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iEw5aj5A"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad5394be625so600908766b.2
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345052; x=1748949852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kVoUYcOxzbPiltogeWZGussQS7Z5IVUpIRjVFHU0LI=;
        b=iEw5aj5A/q3SjEdo89qPP2au/UwAWdliqNKti80SiqC38Ab07DYXTr5n/J9aUvksIK
         GLLJgD1ePvr0ihYcRKLxunn+b0k6fL8fK4y6XOxXHtXagxn9Vm858awiLYbkfxjIAypU
         K2oVAeWAEPSZyF9x5dqrOXCNXejbxnHrevFSyGjEcJjfXDXvtHdb9/8GGJZ3RgS8w1P5
         Xi4jVnhch7ZNbzdUj9GOK4tRr+atdJiopvDxHFYBxVbpOK3/6LoQlu1Mzdy33Fd4LLK8
         ICId0RHizqaYUwMEBSGxiIX4Vpwj7joxdbnJcROJzlNH7X6PTUSqZDSYztVcxxsum1Zc
         MlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345052; x=1748949852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kVoUYcOxzbPiltogeWZGussQS7Z5IVUpIRjVFHU0LI=;
        b=m+sIFO3V3AyK6dj7p6p9TOyMF3pb2B8RVutg0qoSBiFLA56hu+LBcQTI+0PBD/NYEC
         V5I6hmXKPCWtHbbGjOj4ngo48NFWrzZfQWlvS1FAIbYs+c/4Ry3vsbF6M+DPGEXWxQtJ
         8/El5828KOLGxvIfxwiVSCBzM47NeSJsLhPy2tU4P0bePIwQVmllJv4S1U/dwheE6OAU
         uN16wws3VIMgfRIqwoYDDa+ju+siCN9rUC7IlJ8teE1JT+A+XMFfvFo8xeDrcTL7OxcH
         LCd9AQx5tPqx8KuyBaJ/tnJO91ptqltKEe9O/VXFy7MzPpmvnIdCKaJEW9eM3KdHqKIR
         nWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXffXGKuN5A8jB1dtYKcwYOwaVjHdobIlSCfPg4yy6dhiFc0FiIrntb4+x1wOi5107eHleHa7eHyq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu6Njxi98Ug9Mke5cTfXOr/NVVmKTsMODAXnc9mAkTjKH/wmLs
	XYSdgZmeX1GDxpYaAOMgKeSNv5iVuorMgEIwb916lTIO/jHnIuROYrVgt43IIwTF4JM=
X-Gm-Gg: ASbGncuQtBT/KCquvVqh3Tj/36cNaK36VGDOKyThYPnWcpBFD4aUfFF27cdgacGJhGK
	iVWvv4scHIN3BKCqhMbSDWjBlGRH6iUYqH2LqXE7NiEYw3mhoHf0xBAHD8UN3YAk47WVXwJrXDx
	NcQmAj+FTC6fyKa/MmQiUg3ZbtNk21Iji/u4J4a9gLHBtTa4191H7atBBEOL/naaXFcDryTib3e
	kTu/yF6Gu1w19gZ1cBgzkrNyv0e2cPfMRlZ30F9F3UQOJurmoJD5KBH9fs9RhwHchPnY6cArBYC
	epBYPt5uKgHncsqqUNZcHTGnjhRGM2aZkW7OS5sV2qJe5Mm23by+RDB2l4GRIJ35Bp/7mjVHYBW
	N2KVn
X-Google-Smtp-Source: AGHT+IEh7bL1C9zhg7TyiVxrqSxz2JfNSGq7QmRva77FZ5phIBsi6cQskmdVZx7jjLkWeOtjayanpg==
X-Received: by 2002:a17:906:8f11:b0:ad8:8b77:ab62 with SMTP id a640c23a62f3a-ad88b77ac17mr231032766b.36.1748345051730;
        Tue, 27 May 2025 04:24:11 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:11 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/8] clk: renesas: rzg2l-cpg: Drop PM domain abstraction for MSTOP
Date: Tue, 27 May 2025 14:23:55 +0300
Message-ID: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the PM domain abstraction for MSTOP to comply with the
requirements received from the hardware team regarding the configuration
sequence b/w the MSTOP and CLKON bits of individual modules.

The initial MSTOP support for RZ/G3S was proposed here:
https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/

There are no DT users of this abstraction yet.

Please share your thoughts.

Thank you,
Claudiu Beznea

Changes in v3:
- s/for_each_mstp_clk/for_each_mod_clock/g
- in rzg2l_mod_clock_module_set_state() update the register only of
  !atomic_read() is true, in case the module is switched to normal
  state
- move the update of shared_mstop_clks[] arrays before the priv->clks[]
  is populated; with this the logic is simplified
- do not add clock to its own shared_mstop_clks[] array in case it
  doesn't share the mstop with any other clock; kept it for case
  where the mstop is shared with other clocks; the following is the
  output of cat /sys/kernel/debug/mstop on RZ/G3S:

root@smarc-rzg3s:~# cat /sys/kernel/debug/mstop 
                           MSTOP     
                     clk   -------------------------
clk_name             cnt   cnt   off   val    shared
--------             ----- ----- ----- ------ ------
gic_gicclk           1     1     0xb60 0x0   
ia55_clk             2     2     0xb70 0x0    ia55_pclk ia55_clk
ia55_pclk            2     2     0xb70 0x0    ia55_pclk ia55_clk
dmac_aclk            2     1     0xb80 0x0   
dmac_pclk            1     1     0xb80 0x0   
wdt0_pclk            0     0     0xb7c 0x1    wdt0_pclk wdt0_clk
wdt0_clk             0     0     0xb7c 0x1    wdt0_pclk wdt0_clk
sdhi0_imclk          1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
sdhi0_imclk2         2     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
sdhi0_clk_hs         1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
sdhi0_aclk           1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
sdhi1_imclk          1     4     0xb6c 0x0    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
sdhi1_imclk2         2     4     0xb6c 0x0    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
sdhi1_clk_hs         1     4     0xb6c 0x0    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
sdhi1_aclk           1     4     0xb6c 0x0    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
sdhi2_imclk          0     0     0xb6c 0x800  sdhi2_imclk sdhi2_imclk2 sdhi2_clk_hs sdhi2_aclk
sdhi2_imclk2         0     0     0xb6c 0x800  sdhi2_imclk sdhi2_imclk2 sdhi2_clk_hs sdhi2_aclk
sdhi2_clk_hs         0     0     0xb6c 0x800  sdhi2_imclk sdhi2_imclk2 sdhi2_clk_hs sdhi2_aclk
sdhi2_aclk           0     0     0xb6c 0x800  sdhi2_imclk sdhi2_imclk2 sdhi2_clk_hs sdhi2_aclk
ssi0_pclk2           0     0     0xb64 0x400  ssi0_pclk2 ssi0_sfr
ssi0_sfr             0     0     0xb64 0x400  ssi0_pclk2 ssi0_sfr
ssi1_pclk2           0     0     0xb64 0x800  ssi1_pclk2 ssi1_sfr
ssi1_sfr             0     0     0xb64 0x800  ssi1_pclk2 ssi1_sfr
ssi2_pclk2           0     0     0xb64 0x1000 ssi2_pclk2 ssi2_sfr
ssi2_sfr             0     0     0xb64 0x1000 ssi2_pclk2 ssi2_sfr
ssi3_pclk2           0     0     0xb64 0x2000 ssi3_pclk2 ssi3_sfr
ssi3_sfr             0     0     0xb64 0x2000 ssi3_pclk2 ssi3_sfr
usb0_host            0     0     0xb6c 0x20  
usb1_host            0     0     0xb6c 0x80  
usb0_func            0     0     0xb6c 0x40  
usb_pclk             0     0     0xb6c 0x10  
eth0_axi             1     1     0xb6c 0x0   
eth1_axi             1     1     0xb6c 0x0   
i2c0_pclk            0     0     0xb68 0x400 
i2c1_pclk            0     0     0xb68 0x800 
i2c2_pclk            0     0     0xb68 0x1000
i2c3_pclk            0     0     0xb68 0x2000
scif0_clk_pck        2     1     0xb68 0x0   
scif1_clk_pck        0     0     0xb68 0x4   
scif2_clk_pck        0     0     0xb68 0x8   
scif3_clk_pck        0     0     0xb68 0x10  
scif4_clk_pck        0     0     0xb68 0x20  
scif5_clk_pck        0     0     0xb90 0x10  
adc_adclk            0     0     0xb68 0x4000 adc_adclk adc_pclk
adc_pclk             0     0     0xb68 0x4000 adc_adclk adc_pclk
tsu_pclk             0     0     0xb68 0x8000
vbat_bclk            3     1     0xb90 0x0   

Changes in v2:
- updated the title and description for patches 1/8, 2/8 along
  with their content
- added patch 3/8
- collected tags
- drop duplicated mstop lists in patch 4/8
- detailed changelog for each patch can be found in the individual
  patch

Claudiu Beznea (8):
  clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
  clk: renesas: rzg2l-cpg: Move pointers after hw member
  clk: renesas: rzg2l-cpg: Add macro to loop through module clocks
  clk: renesas: rzg2l-cpg: Add support for MSTOP in clock enable/disable
    API
  clk: renesas: r9a08g045: Drop power domain instantiation
  clk: renesas: rzg2l-cpg: Drop MSTOP based power domain support
  dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
  Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update
    #power-domain-cells = <1> for RZ/G3S"

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 drivers/clk/renesas/r9a07g043-cpg.c           | 132 ++---
 drivers/clk/renesas/r9a07g044-cpg.c           | 168 +++---
 drivers/clk/renesas/r9a08g045-cpg.c           | 227 ++++----
 drivers/clk/renesas/r9a09g011-cpg.c           | 116 ++---
 drivers/clk/renesas/rzg2l-cpg.c               | 487 ++++++++++--------
 drivers/clk/renesas/rzg2l-cpg.h               |  66 +--
 include/dt-bindings/clock/r9a07g043-cpg.h     |  53 --
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a08g045-cpg.h     |  71 ---
 11 files changed, 597 insertions(+), 857 deletions(-)

-- 
2.43.0


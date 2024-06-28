Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA61C0048
	for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2024 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584725; cv=none; b=NIcPWc2PEL2odif8gx7HXJ0N4fhvUT4MyiQMwC88fPRlgl+mw9vUzAcAxGBmrGcM4Kd6M4SbbglZoEd6g3VSzvGBZmKhLHcOXQkqvElp0p3uT9xKRyhFAQi/MEsUR7DLmoAViX4Ad8KWxHi5Gt+kMa68H8bQxWMNNmaAfpf42Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584725; c=relaxed/simple;
	bh=WbzvwoOkqld9mMueF889ByDSs9x5qP+LrEiC2PTWNAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W5V0KYbqx9IJk/gRABfD6TaAQWKKknKD9mYBfJup7h4BHFGd7tLHk4F+hMLLHuwbApjxCGNzdt1rf+gnzEF0r3POWzpv3mN3ZAMYSFDEAgLSLVQa2Sp5UTiCrtZXU3yUpuNb00GGaSkTe9+amLWqc7QJLMnaGGKLrOqnDdrFH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vMBHjPt7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vMBHjPt7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-36742cc9c12so435907f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2024 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719584721; x=1720189521; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wc4W/nnUZPvJSFnr3oqmM9v2zpK+FhEQbUMqeT0qCRw=;
        b=vMBHjPt7HHnO1CJYhJ7ofuBxi/xI1HPXGp6Od47G4iW58kdmvapWTDnkgdk/4+JlwF
         fW2J0599wblo1w4vMQtkt1B1C4yIGBQ7NSyK9LieEHlz/HFNQu0TMYLEbryUj7GBrEwX
         MMu8tlah9GMNvWQ9qxuiptu/KQ7vBL0tOjRdBpFrkJzmtlHbVH92qHofJ1ua4hNbc1Eg
         AqYId/LqKx9bCUY/Dc//9qZRThQTTPyuNaUoItR3FtjW/PT5CSXmvgoy4dcS0eTRC0j/
         nEkmCCAJCIhDxcojnDjt9T8mfA08ePWLDG8mY8lSgcCPL7+bdZXU8FaHldHjJCfQt/g9
         Ge6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584721; x=1720189521;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wc4W/nnUZPvJSFnr3oqmM9v2zpK+FhEQbUMqeT0qCRw=;
        b=VKwdXwg5uL/jlgJzHB9Ux3eqn+iN5b1jCcfR6BtvVR+gKkkIu0oN80AIQbSIq93DV7
         fSn9jf1OHlE1pHOJZ6GmMu6+SpsLl1zXbzL/7JX9LQxA24d6j1/JLanlOSjdeWe8DOCo
         JGAy/oTJadz8/Z1rn/WD0309jFincOLHIB2E7BwNsiJvDT0ro7sirn0tCV1SyT3Vc8CM
         ejoL574Q6TqnZsW8w4YBCD42Gi3zIEX3T33jtdCEnT7vC2PKq4NJaPiZR6RMQejbrvkK
         KlpE7JiTC7Pl8Pc/F0TiP0QfrTT2RwSB9Vh7BuTrlPtIIW5/J6CXCMzvPaP1pyJgtHdE
         W41Q==
X-Gm-Message-State: AOJu0YymeNV7WLmnWNMcwO4h371zMoosdcs4ku8fSKh6Ex87e3Iu1ZVw
	CliTsR+dkdgISSQj2oddmYac2mwA1gEbp366MAp2PzcowEEbPB2sypPW/CTMkOc=
X-Google-Smtp-Source: AGHT+IET4FDNLdQFfZXi/Skee7y4f9QTaiC7MXrennb0SpwFOx9I6+py5FrnjC7GFRgLsPNApO51+A==
X-Received: by 2002:a5d:4343:0:b0:364:8568:f843 with SMTP id ffacd0b85a97d-366e964789cmr10741684f8f.59.1719584720645;
        Fri, 28 Jun 2024 07:25:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e1345sm2451201f8f.54.2024.06.28.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:25:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.11
Date: Fri, 28 Jun 2024 16:25:19 +0200
Message-ID: <1j34oxxhyo.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here is the Amlogic clock update for v6.11
The biggest part is the introduction of a new SoC support (C3), the rest
is regular house keeping as described below.

Please pull
Cheers

Jerome

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.11-1

for you to fetch changes up to befe87380e21f0d37633273e1068c9318f8135ff:

  clk: meson: add missing MODULE_DESCRIPTION() macros (2024-06-14 09:29:41 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.11

* Minor S4 clock fixes
* DT bindings Yaml conversion of the AXG audio controller
* C3 clock controllers support
* Flag added to skip init of already enabled PLLs and avoid relocking
* A1 DT bindings updates for system pll support
* Add missing MODULE_DESCRIPTION where necessary.

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format

Dmitry Rokosov (3):
      clk: meson: add 'NOINIT_ENABLED' flag to eliminate init for enabled PLL
      dt-bindings: clock: meson: a1: pll: introduce new syspll bindings
      dt-bindings: clock: meson: a1: peripherals: support sys_pll input

Jerome Brunet (4):
      Merge branch 'v6.11/bindings' into v6.11/drivers
      Merge branch 'v6.11/bindings' into v6.11/drivers
      Merge branch 'v6.11/bindings' into v6.11/drivers
      clk: meson: add missing MODULE_DESCRIPTION() macros

Xianwei Zhao (7):
      clk: meson: s4: fix fixed_pll_dco clock
      clk: meson: s4: fix pwm_j_div parent clock
      dt-bindings: clock: add Amlogic C3 PLL clock controller
      dt-bindings: clock: add Amlogic C3 SCMI clock controller support
      dt-bindings: clock: add Amlogic C3 peripherals clock controller
      clk: meson: c3: add support for the C3 SoC PLL clock
      clk: meson: c3: add c3 clock peripherals controller driver

 .../clock/amlogic,a1-peripherals-clkc.yaml         |    9 +-
 .../bindings/clock/amlogic,a1-pll-clkc.yaml        |    9 +-
 .../bindings/clock/amlogic,axg-audio-clkc.txt      |   59 -
 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  201 ++
 .../clock/amlogic,c3-peripherals-clkc.yaml         |  120 +
 .../bindings/clock/amlogic,c3-pll-clkc.yaml        |   59 +
 drivers/clk/meson/Kconfig                          |   27 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a1-peripherals.c                 |    3 +-
 drivers/clk/meson/a1-pll.c                         |    3 +-
 drivers/clk/meson/axg-aoclk.c                      |    3 +-
 drivers/clk/meson/axg.c                            |    3 +-
 drivers/clk/meson/c3-peripherals.c                 | 2366 ++++++++++++++++++++
 drivers/clk/meson/c3-pll.c                         |  747 ++++++
 drivers/clk/meson/clk-pll.c                        |   40 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/g12a-aoclk.c                     |    3 +-
 drivers/clk/meson/g12a.c                           |    3 +-
 drivers/clk/meson/gxbb-aoclk.c                     |    2 +
 drivers/clk/meson/gxbb.c                           |    3 +-
 drivers/clk/meson/meson-aoclk.c                    |    2 +
 drivers/clk/meson/meson-clkc-utils.c               |    1 +
 drivers/clk/meson/meson-eeclk.c                    |    2 +
 drivers/clk/meson/s4-peripherals.c                 |    5 +-
 drivers/clk/meson/s4-pll.c                         |    8 +-
 .../clock/amlogic,a1-peripherals-clkc.h            |    1 +
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h    |    1 +
 .../clock/amlogic,c3-peripherals-clkc.h            |  212 ++
 include/dt-bindings/clock/amlogic,c3-pll-clkc.h    |   40 +
 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h   |   27 +
 30 files changed, 3873 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/c3-peripherals.c
 create mode 100644 drivers/clk/meson/c3-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,c3-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h
 

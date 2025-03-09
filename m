Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBD1C5D78
	for <linux-clk@vger.kernel.org>; Sun,  9 Mar 2025 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741542714; cv=none; b=IRZCYEfYzXltJAWLO8YYuUaTfK+37F5KWJM/fusp41Uqd9kmiQnRI1UyjZ3P/GDi2QGZ58hsg42Eg0IUDSrtsUIMzdWLrknBy9u/BMyekbhQgZfiE5YFF3bsedg+tTm/2DrCk6aY0o++bXYWP7ozeUqiy++X0gjywGaYO4tPu6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741542714; c=relaxed/simple;
	bh=wqzDb0QwjxRa7XVwLas9r4QBvnQeBCYaIII+SwsSoao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLaBsYfrCAHULizm9L+pcHDR8fe96K5sUOLfdWJVt7XsrTdxx5UgpSYYvz5x95WhO1fSM9YQ44z81TpPu/ZdzCHayqUwFrfC5vREu1KlohUtKZlcJur7jwzVDRY+cy2pje5a9YFcPnhZwCEZgatiiIA+StTNqisc8NA1zegMaLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h3TQGOOI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h3TQGOOI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso214099f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 09 Mar 2025 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741542711; x=1742147511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ag3e+knRyg8hgi6gCn3CC6P74JcStlCkhKaiz35snmc=;
        b=h3TQGOOI1zhU8maqRCYUmp9vaDw46f5IS+zcDmbqR4UjgZzDSXKhF5iOw+7DCmwos/
         5QHYylak0iCwcWYweKuBrMobEOMesce5evlKGak7tSraJnAakCHP3M4rncVhUh4cFg6F
         9MsbmKNgqkXP2FAggMcUV+7KHnzkVuu4VmCbONJawMfQPjBMdGW4lcdPdsc/ad1a47ib
         7fwSJ1a4/FgBaXRkp6dquN2EK/K9Jb4YIUe5EbKb+yuw2ugE9Ge0ZvxilC6FdJlQKwLq
         hdOajDBzOuQMVkLPgpd1Er0uTKhp+m/tb8bdF0HMloqQXo0Y7KaWVT5qHVJroEmlkCZD
         i4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542711; x=1742147511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag3e+knRyg8hgi6gCn3CC6P74JcStlCkhKaiz35snmc=;
        b=pmpoP6BbP98zKgdJOgxpkP1xi/fG1LX3V41C/UJfs2jxEyK18O2V2/n3f9tjtPX9rW
         nlHAqSN6qTkpO7N3LhRlOocu/PgC4FB5ugm1EkCBkNpwbRPU/NVNxMmc7x4O7eySrRFb
         IlUc8d8/fGOOSwWN15Yd+4nfsKe2MnBKmnM7FGbzJZSE/AmtcitHc+jzFf4nmcqbozxR
         jAq0N0uUBkouakXPio72lRDHMfI4A7xrhrDCTwIddOOjovjpfmkB1LY/mvi0dXrluc7x
         zuYjn2o/+xVScY6kJ0idNj2GqWkIXXTV8PllxhQUKIrzjL/4kj7u/G2nptGAiIK0zBN2
         L0xA==
X-Forwarded-Encrypted: i=1; AJvYcCXb81hrmBe5u2vOKOR8NICJ+Va/Zm9PpfVnEy/WyL6odzSSC2XvZALnnC8GTRCE720M/gEhthO5KtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+LiR6L8i2wQP8xtO/l7RwP2HCw/BcvYjrHRvvMuGhotfo45tt
	FLKl0uDAe+JuKCQ/tHmE0nvQ9hvWUPoFDvO8Kr3DP00I+dPc8kZ5MXjwcosK7HU=
X-Gm-Gg: ASbGncuWDalxtcVwg/vrn1/6Bak513QGqibLVaAXzYJJT+hS6TWbTh6lTUUYXPxcVlk
	JJbt5QakWZD5qBD9I7KzbhtXjCJThSf5cRR/X+PVm9G9jys7E5X7Ug3WgdPMq+N0/w/pZ//8r5z
	cSq9uuwsnzNPrRljKAUgj9NbiXBG9OmnvfnYJgOIUcPi4s9ge+wEOhqiP9LZhlfz0r6hCFWOEZs
	E7ehQP7eTfIhXH14IuCEdGhmRQzRg0XXhWdUD1brFSK+3p7I5ojpyjHJb1YCJTWxZTUEOHpHmG7
	SyoKb2YCWXAbq4BV88Rh4TreirhxZvT31MFRUjbigr2xagO7mnSLQhogOL+wk3dP6t4pUw==
X-Google-Smtp-Source: AGHT+IFa08ql7h89Y752Zvu7Rau8znLYoWC3F6Ls9EZuW63PkjYBwc7RN80jzLbibjKC9dFckabhWw==
X-Received: by 2002:a05:6000:4021:b0:390:d8ec:1779 with SMTP id ffacd0b85a97d-3913bbd20d1mr1460637f8f.12.1741542711124;
        Sun, 09 Mar 2025 10:51:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceeb34904sm39156975e9.30.2025.03.09.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:51:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.15
Date: Sun,  9 Mar 2025 18:51:47 +0100
Message-ID: <20250309175147.6672-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

New clk drivers for Samsung SoC.  This pull includes drivers which you
commented later and pointed out few issues.  Pointed issues are in all Samsung
clk drivers and the ones here just copy existing patterns:

1. Headers: I fixed it for new and existing drivers and this pull request
includes the fixes.
2. device_get_match_data(): I still wait for contributors response. If they do
not respond, I will fix it for next cycle.
3. refdata and platform_driver_probe: I tried fixing it, but incomplete and
need to investigate more.

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.15

for you to fetch changes up to 017bbc922a09630579ff7b5b314fb186b8c0efcf:

  clk: samsung: Drop unused clk.h and of.h headers (2025-03-07 16:01:22 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.15

1. Exynos990: Add support for the PERIS clock controller in existing
   driver.
2. Exynos2200: Add new driver for several clock controllers (Alive,
   CMGP, HSI, PERIC/PERIS, TOP, UFS and VFS).
3. Exynos7870: Add new driver for several clock controllers (Alive,
   MIF, DISP AUD, FSYS, G3D, ISP, MFC and PERI).
4. Correct undefined behavior / runtime array bounds check of flexible
   array member (last 'hws' element in 'struct clk_hw_onecell_data').
   The code was logically correct for normal case, but not for the
   clang/GCC runtime bounds checking of flexible array member.
5. Few cleanups: spelling, header inclusions.

----------------------------------------------------------------
Colin Ian King (1):
      clk: samsung: Fix spelling mistake "stablization" -> "stabilization"

Igor Belwon (2):
      dt-bindings: clock: exynos990: Add CMU_PERIS block
      clk: samsung: exynos990: Add CMU_PERIS block

Ivaylo Ivanov (3):
      dt-bindings: clock: add Exynos2200 SoC
      clk: samsung: clk-pll: add support for pll_4311
      clk: samsung: introduce Exynos2200 clock driver

Kaustabh Chakraborty (2):
      dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

Krzysztof Kozlowski (3):
      Merge branch 'for-v6.15/samsung-clk-dt-bindings' into next/clk
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

Will McVicker (1):
      clk: samsung: Fix UBSAN panic in samsung_clk_init()

 .../bindings/clock/samsung,exynos2200-cmu.yaml     |  247 ++
 .../bindings/clock/samsung,exynos7870-cmu.yaml     |  227 ++
 .../bindings/clock/samsung,exynos990-clock.yaml    |   19 +
 drivers/clk/samsung/Makefile                       |    2 +
 drivers/clk/samsung/clk-cpu.c                      |    2 +-
 drivers/clk/samsung/clk-exynos-audss.c             |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    1 +
 drivers/clk/samsung/clk-exynos2200.c               | 3928 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynos3250.c               |    4 +-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    2 +-
 drivers/clk/samsung/clk-exynos5-subcmu.c           |    1 +
 drivers/clk/samsung/clk-exynos5250.c               |    1 +
 drivers/clk/samsung/clk-exynos5260.c               |    3 -
 drivers/clk/samsung/clk-exynos5410.c               |    2 -
 drivers/clk/samsung/clk-exynos5420.c               |    1 +
 drivers/clk/samsung/clk-exynos5433.c               |    4 +-
 drivers/clk/samsung/clk-exynos7.c                  |    1 -
 drivers/clk/samsung/clk-exynos7870.c               | 1829 +++++++++
 drivers/clk/samsung/clk-exynos7885.c               |    2 +-
 drivers/clk/samsung/clk-exynos850.c                |    2 +-
 drivers/clk/samsung/clk-exynos8895.c               |    2 +-
 drivers/clk/samsung/clk-exynos990.c                |  182 +-
 drivers/clk/samsung/clk-exynosautov9.c             |    2 +-
 drivers/clk/samsung/clk-exynosautov920.c           |    2 +-
 drivers/clk/samsung/clk-fsd.c                      |    2 +-
 drivers/clk/samsung/clk-gs101.c                    |    2 +-
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 drivers/clk/samsung/clk-s3c64xx.c                  |    1 -
 drivers/clk/samsung/clk-s5pv210-audss.c            |    1 +
 drivers/clk/samsung/clk-s5pv210.c                  |    1 -
 drivers/clk/samsung/clk.c                          |    4 +-
 drivers/clk/samsung/clk.h                          |    1 +
 include/dt-bindings/clock/samsung,exynos2200-cmu.h |  431 +++
 include/dt-bindings/clock/samsung,exynos7870-cmu.h |  324 ++
 include/dt-bindings/clock/samsung,exynos990.h      |   21 +
 37 files changed, 7231 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 drivers/clk/samsung/clk-exynos7870.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200-cmu.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos7870-cmu.h

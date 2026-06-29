Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28529339872
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772496; cv=none; b=b8wVb29Rvy2MfWqcIj4S5Uvs8Ut8+9EV1+UXT68W+Ivmg1H8LPFTVfHcFMJfQfN1TWdPAkT5Uw9O7EthhBpPkwA3H0RV28mU6XK7W9Js8Kx+dHSHAIiIVoxiMNFFdATjAJyd6u/cVKfy5ufq6I54MG9i6VVMDmF4N4qRg2kLd2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772496; c=relaxed/simple;
	bh=jJ08Fn0Uc46gWgpLi2PKI5d1oQWbQ9DTSjn5uXEEA9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYvbjqETQS1IcckEYxvtttsCawIpyCQBgpkaqchrTJ6FE737jrhi8qwINmXpNOiOpKlKu+JWuJpj8/KXik8SFGTBIzQFPMj8qR1WyUKm0zkGqGSvu/XsT8zDDtcoJDuZ59b2LrS4Lxo/M5zlEtNh04B7r+k7mx+kIWEIxN20c94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgemsYmc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UenImfq1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgemsYmc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UenImfq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782772494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5SDqWBjerot0ZJ+DYpJkRrWDyFgONHbCcXBCbMJM9s4=;
	b=UgemsYmc/5xcFnRxFu9wbIEVTtQ3ml1dMSU77jxuYj++d12qa6LQzZOdXedilSlGeBIrqY
	D2KuF0efWPrSZtzZwgx8dw3NgtUankMGWNm/baH3j6CHSnL5QR7RhPukSFzS9lvultuDCT
	qnZ4sNwQKGxY5+Nk2LpaKzK0rfy1eXg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-cJyOHpoyNOeeWhxtPjjmBg-1; Mon, 29 Jun 2026 18:34:52 -0400
X-MC-Unique: cJyOHpoyNOeeWhxtPjjmBg-1
X-Mimecast-MFC-AGG-ID: cJyOHpoyNOeeWhxtPjjmBg_1782772492
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e97889ac8aso70411156d6.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782772492; x=1783377292; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5SDqWBjerot0ZJ+DYpJkRrWDyFgONHbCcXBCbMJM9s4=;
        b=UenImfq1YTyOYfN+r5SEV4javYdDMdFt6Qk9qnuraffwWzvKtaaYKiLpqEXeu8bpoD
         alxJgOsZfLkRApM/lWY5x3t1cCodsUY0Q1Giiux8ifVUBToZcUxk3Wz85xNdtM1T0USl
         KSWfGl5FJNw6MnuxI9yLJ5L319h63I8Db+IqmqGZiRhIDJpSypnyFbwZtxMnClSbReF1
         r13/G78bh3aaw7OIfAIn0JC4Z/DzEGWAqdA/YKSXUQnSNGEF5ilWH8NbHbEIMzP/jSFA
         RWhWvU904YuoievHNehhfTbk733O2uDPMizXDtBi1DtkMvWfDNJIuvePEfM+VYs7qD9J
         IUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782772492; x=1783377292;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SDqWBjerot0ZJ+DYpJkRrWDyFgONHbCcXBCbMJM9s4=;
        b=LwuOkXXiRdpqPkFO3VkbHC39nbWETca9cC0GKYC+T0yWpLZlZgA+cVhGyEX9FGYtN7
         sxLbLj3rKxfkebdCXzaMJ/K+d/vkad3g2McVSrXm2zZo5RlbU3ufOEs2ZVFHFA9I2vmT
         zOdt9laGMgoINhWn2jqJFrEFL8i/tRwGsbylxWh/nfMupLoV1rEjtIUjgpgdzAhO3mQ5
         kyM7yrj+Dt1PXaLVvlGLvZeVQiqSYC5GDK4tgulJMqRYR8s7cCi2IUhzFQ2LgCnFjo4M
         ESRDGDj4yd97gM7cgeQMYl4oc1IPEuC6ohbrVG+vMtM+dIahG2LImEaic07ualuCClMM
         aYJg==
X-Gm-Message-State: AOJu0YxQ2svo1SrnnxdXmNJx5vOX0SSwMZfIDwXsDBmf0vDioSJ1S5RE
	qjc9v0djk1j8R1xApSsY+Pd7CFVamjULcBS/w7N9+Ft+7rBjtbPotD5tl/aHEktudlRsaxfM0lt
	H/QqwoB1E7GtslOYGzGpwq5l/CzS6Y4/QOEebnJL2F3/qsAOFtDgODt/5GsMcDw==
X-Gm-Gg: AfdE7cn0pJqrlf2zT41+QjRD1aP6XL03WicovlvhePb/yIxZfl+9YCAjDTBYKkP6wiL
	MC1rIoRQ+kIfPIJFaZVoUQWY+SfiwMBH+oTPYiAoKVDriklLevkaMWOQTfVg2ieJ1+5fDcQQDVR
	+T50jE/fb9T8R7TterNZD/vNHwJCujG/Km7YLJnVeAzn9PsyLXZVbb9vE27Wao8f3G2fUQSX/fn
	KBP6KZ/7WKsqCnZ3xbUMxS4nLUFDcmCWH+sdACASHBGeQqexbKwqR2s1Of0l+VneEIjlUDc5t5o
	vIgxchyTcd5wrTCpzup5vlDAItydYJoYIoGyuzJQF1WYpgpCDl9qxgEG6VKnv/tTiCtljZ/9V0J
	WTpHhaw==
X-Received: by 2002:a05:6214:498b:b0:8ca:268b:13b2 with SMTP id 6a1803df08f44-8f1bc67d58dmr20916106d6.32.1782772492124;
        Mon, 29 Jun 2026 15:34:52 -0700 (PDT)
X-Received: by 2002:a05:6214:498b:b0:8ca:268b:13b2 with SMTP id 6a1803df08f44-8f1bc67d58dmr20915616d6.32.1782772491602;
        Mon, 29 Jun 2026 15:34:51 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a367a183sm8978886d6.22.2026.06.29.15.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:34:50 -0700 (PDT)
Date: Mon, 29 Jun 2026 18:34:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: various improvements and fixes
Message-ID: <akLzCVzbMbUsgDda@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Stephen,

Here's various improvements and fixes that weren't picked up during the
last merge window that I feel are ready. Let me know if you'd like me to
drop anything and I can send you a v2. Details from the 19 contributors are
below in the signed tag.


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-misc-for-v7.3

for you to fetch changes up to e3a9ad35af677ecdff0aed12891f9360d1a493bd:

  pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop() (2026-06-29 17:53:17 -0400)

----------------------------------------------------------------
clk: various improvements and fixes

Here's various improvements and fixes for the clk subsystem that was posted prior
to the opening of the last merge window.

- Add spread spectrum clock (SSC) support to the clk framework, including a new
  assigned-clock-sscs devicetree property and clk_hw_set_spread_spectrum()
  API with KUnit tests (Peng Fan)
- Add SCMI clock OEM extensions for the i.MX95 clock driver and introduce a
  common SCMI clock header (Peng Fan)
- Add clock, reset, and devicetree bindings for the ESWIN EIC7700 HSP clock and
  reset generator (Xuyang Dong)
- Add clk_determine_rate_noop() helper for clock drivers that can do any rate,
  and convert existing open-coded implementations across hisilicon, imx, qcom,
  renesas, rp1, samsung, scpi, sprd, mediatek phy, and mediatek pmdomain
  drivers (Brian Masney)
- Add kernel-doc documentation for struct clk_core and the core clock flags,
  and wire up clk identifiers into the documentation build (Brian Masney)
- Fix clk_divider_bestdiv() returning the minimum rate instead of the maximum
  rate for large rate requests, with KUnit tests (Lad Prabhakar)
- Fix Nuvoton MA35D1 PLL frequency calculation including ignored div_u64
  return values, incorrect PLL_CTL1_FRAC bit field width, and broken
  determine_rate logic (Joey Lu)
- Support unique clock names for multi-socket Tegra platforms (Jon Hunter)
- Allow COMPILE_TEST builds for HiSilicon clock drivers (Rosen Penev)
- Various fixes and cleanups from Akari Tsuyukusa, Alexander A. Klimov,
  Brian Masney, David Carlier, David Laight, Min zhang, Myeonghun Pak,
  Pavel Löbl, Randy Dunlap, Rob Herring, Rosen Penev, Uwe Kleine-König,
  William Theesfeld, Xuyang Dong, and Yu-Chun Lin

Signed-off-by: Brian Masney <bmasney@redhat.com>

----------------------------------------------------------------
Akari Tsuyukusa (1):
      clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen

Alexander A. Klimov (1):
      clk: moxart: remove unused variables, fix refcount leak

Brian Masney (19):
      clk: add kernel docs for the core flags
      clk: add kernel docs for struct clk_core
      docs: clk: include some identifiers to keep documentation up to date
      clk: test: convert constants to use HZ_PER_MHZ
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: add clk_determine_rate_noop()
      clk: hisilicon: hi3660-stub: use clk_determine_rate_noop()
      clk: imx: scu: use clk_determine_rate_noop()
      clk: qcom: rpm: use clk_determine_rate_noop()
      clk: qcom: rpmh: use clk_determine_rate_noop()
      clk: qcom: smd-rpm: use clk_determine_rate_noop()
      clk: renesas: rzg2l-cpg: use clk_determine_rate_noop()
      clk: rp1: use clk_determine_rate_noop()
      clk: samsung: acpm: use clk_determine_rate_noop()
      clk: scpi: use clk_determine_rate_noop()
      clk: sprd: use clk_determine_rate_noop()
      phy: mediatek: phy-mtk-hdmi-mt2701: use clk_determine_rate_noop()
      pmdomain: mediatek: airoha: use clk_determine_rate_noop()
      pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop()

David Carlier (1):
      clk: canaan: Clear rate fields before reprogramming dividers

David Laight (1):
      drivers/clk/clk_test: Use strscpy() to copy the test description

Joey Lu (3):
      clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
      clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
      clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic

Jon Hunter (1):
      clk: tegra: Support unique names for multi-socket platforms

Lad Prabhakar (2):
      clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX handling
      clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests

Min zhang (1):
      clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller

Myeonghun Pak (1):
      clk: versaclock7: Fix APLL clock leak on probe failure

Pavel Löbl (1):
      clk: clocking-wizard: fix integer overflow in rate calculation

Peng Fan (6):
      dt-bindings: clock: Add spread spectrum definition
      clk: Introduce clk_hw_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: Add KUnit tests for assigned-clock-sscs
      clk: scmi: Introduce common header for SCMI clock interface
      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver

Randy Dunlap (1):
      clk: add missing function short descriptions for kernel-doc

Rob Herring (Arm) (1):
      clk: at91: Read "reg" with helper

Rosen Penev (3):
      clk: kirkwood: use kzalloc_flex
      clk: stm32: add missing bitfield.h header
      clk: hisilicon: allow COMPILE_TEST builds

Uwe Kleine-König (The Capable Hub) (4):
      clk: clk-lmk04832: Simplify device abstraction
      clk: Use named initializers for platform_device_id arrays
      clk: si5341: Drop unused i2c driver_data
      clk: Use named initializers for arrays of i2c_device_data

William Theesfeld (1):
      clk: zynq: handle kasprintf() failure in periph_clk registration

Xuyang Dong (4):
      clk: eswin: Add CLK_IGNORE_UNUSED to NoC clock
      dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
      clk: eswin: Add eic7700 HSP clock driver
      reset: eswin: Add eic7700 HSP reset driver

Yu-Chun Lin (1):
      clk: bcm: kona: Stop defaulting to parent index 0 on error

 .../bindings/clock/eswin,eic7700-hspcrg.yaml       |  63 ++++
 Documentation/driver-api/clk.rst                   |  58 +---
 MAINTAINERS                                        |   5 +-
 drivers/clk/.kunitconfig                           |   1 +
 drivers/clk/Kconfig                                |   8 +
 drivers/clk/Makefile                               |  15 +-
 drivers/clk/at91/dt-compat.c                       |   5 +-
 drivers/clk/bcm/clk-kona.c                         |   3 +-
 drivers/clk/clk-bd718x7.c                          |  12 +-
 drivers/clk/clk-cdce706.c                          |   2 +-
 drivers/clk/clk-cdce925.c                          |   8 +-
 drivers/clk/clk-conf.c                             |  76 +++++
 drivers/clk/clk-cs2000-cp.c                        |   4 +-
 drivers/clk/clk-divider.c                          |  25 +-
 drivers/clk/clk-divider_test.c                     | 153 +++++++++
 drivers/clk/clk-k230.c                             |   4 +
 drivers/clk/clk-lmk04832.c                         |  27 +-
 drivers/clk/clk-max77686.c                         |   8 +-
 drivers/clk/clk-moxart.c                           |  14 -
 drivers/clk/clk-renesas-pcie.c                     |   6 +-
 drivers/clk/clk-rp1.c                              |   8 +-
 drivers/clk/clk-s2mps11.c                          |  12 +-
 drivers/clk/clk-scmi-oem.c                         | 108 +++++++
 drivers/clk/clk-scmi.c                             |  44 +--
 drivers/clk/clk-scmi.h                             |  51 +++
 drivers/clk/clk-scpi.c                             |  14 +-
 drivers/clk/clk-si514.c                            |   2 +-
 drivers/clk/clk-si521xx.c                          |   6 +-
 drivers/clk/clk-si5341.c                           |  10 +-
 drivers/clk/clk-si5351.c                           |   8 +-
 drivers/clk/clk-si544.c                            |   6 +-
 drivers/clk/clk-si570.c                            |   8 +-
 drivers/clk/clk-versaclock5.c                      |  16 +-
 drivers/clk/clk-versaclock7.c                      |   6 +-
 drivers/clk/clk.c                                  | 112 ++++++-
 drivers/clk/clk_test.c                             | 214 ++++++++++++-
 drivers/clk/eswin/Kconfig                          |  13 +
 drivers/clk/eswin/Makefile                         |   1 +
 drivers/clk/eswin/clk-eic7700-hsp.c                | 345 +++++++++++++++++++++
 drivers/clk/eswin/clk-eic7700.c                    |   3 +-
 drivers/clk/hisilicon/Kconfig                      |  14 +
 drivers/clk/hisilicon/clk-hi3660-stub.c            |  12 +-
 drivers/clk/hisilicon/reset.c                      |   2 +-
 drivers/clk/imx/clk-scu.c                          |  24 +-
 drivers/clk/kunit_clk_assigned_rates.h             |  10 +
 .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
 ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
 .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
 drivers/clk/kunit_clk_assigned_sscs_multiple.dtso  |  20 ++
 .../kunit_clk_assigned_sscs_multiple_consumer.dtso |  24 ++
 drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +
 .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++
 drivers/clk/kunit_clk_assigned_sscs_one.dtso       |  16 +
 .../clk/kunit_clk_assigned_sscs_one_consumer.dtso  |  20 ++
 drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +
 .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++
 drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 +
 .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +
 drivers/clk/mediatek/Kconfig                       |   1 +
 drivers/clk/mvebu/kirkwood.c                       |  21 +-
 drivers/clk/nuvoton/clk-ma35d1-pll.c               |  42 +--
 drivers/clk/qcom/clk-rpm.c                         |  15 +-
 drivers/clk/qcom/clk-rpmh.c                        |   8 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |  13 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |   8 +-
 drivers/clk/samsung/clk-acpm.c                     |  18 +-
 drivers/clk/sprd/pll.c                             |   8 +-
 drivers/clk/stm32/clk-stm32mp21.c                  |   1 +
 drivers/clk/stm32/clk-stm32mp25.c                  |   1 +
 drivers/clk/tegra/clk-bpmp.c                       |  10 +-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c         |   4 +-
 drivers/clk/zynq/clkc.c                            |   8 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c         |   8 +-
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c    |   8 +-
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       |  23 +-
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-eic7700-hsp.c                  | 113 +++++++
 include/dt-bindings/clock/clock.h                  |  14 +
 include/dt-bindings/clock/eswin,eic7700-hspcrg.h   |  33 ++
 include/dt-bindings/reset/eswin,eic7700-hspcrg.h   |  21 ++
 include/linux/clk-provider.h                       |  78 ++++-
 83 files changed, 1812 insertions(+), 398 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 create mode 100644 drivers/clk/clk-divider_test.c
 create mode 100644 drivers/clk/clk-scmi-oem.c
 create mode 100644 drivers/clk/clk-scmi.h
 create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_multiple.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_multiple_consumer.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_null.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_one.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_one_consumer.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_without.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_zero.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso
 create mode 100644 drivers/reset/reset-eic7700-hsp.c
 create mode 100644 include/dt-bindings/clock/clock.h
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h


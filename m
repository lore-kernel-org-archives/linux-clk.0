Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD643B6BFE
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327875; cv=none; b=MSJe+ewe5xOncCRHEeDSGbt5ON0OkeULcTJW/toT284pGj30U7nIruR+29Kd2UcxoyjRZRNpArX5A9RNWfwbFIVo4vN/Mdoo4oVUcn63MQhVBjhGr8U9jlemaJAC7++8UUnxWrelo94n2w3KtYb+icjFKDVX3gMovt+TfpBQZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327875; c=relaxed/simple;
	bh=RwUphGzbViQ9qL7gq7J5Xch/bPwQ+4prHGHwSo8IUiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVcssS29m7/kNbtTmisVAyuhRd/yGyGZkvEtXEGi9OK8Xu6Yy4lsWvPwwkHTvFkuZ6DbLVwALTqtKhOvImE3Qopr8dzRbKs/H24cgxOyYHDQxeu7QvU2PvH2+X4fRmuUneAE1fBFAFuQRp4OcoRO9Ntry9fb8KTv3u6Ul0U3Ps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SwNk7r8y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AK1dDzMi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SwNk7r8y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AK1dDzMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773327873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5yubfebbZtWGWMyXAz+IUlEnaVFuppBxaYt4/00Rob0=;
	b=SwNk7r8yPNTa88XwyhFN3KAgAq7SdVayRiJu5pCBCkIm33siYJw5issKFL5/6JxYHM79gx
	A6M8/EcovTMDga6WJtaWurytg6oH4nlNxGuBCS0UVr4XJFRR4au2+VC0BW7JCE+I36L+t7
	fX2riQrSstgGZQ8HG5IQRwMD5NgUdZ4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-tsYk6r5ZM6CNlkWAF0J61A-1; Thu, 12 Mar 2026 11:04:27 -0400
X-MC-Unique: tsYk6r5ZM6CNlkWAF0J61A-1
X-Mimecast-MFC-AGG-ID: tsYk6r5ZM6CNlkWAF0J61A_1773327866
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d742bb4003so4868878a34.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773327866; x=1773932666; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5yubfebbZtWGWMyXAz+IUlEnaVFuppBxaYt4/00Rob0=;
        b=AK1dDzMihntgnqSoBvZPdkt0C+ENWuESULWb+Xg20UgRN/HU7/UyqKz18KKj63oVlq
         i86uRC13ub1N+jLx+QfwnahlLkpKfqUe1OpsuZ4UrJD+sJni8qhny22jkuyp+ZvlDQRS
         aUQnmYxiD+sPzyl8VDZ+ARydXsaNp722O+Ds8zlmPM4kURd80iOh1HUfYh+sZZgmOv3o
         n3kXoKOKMynH5MdniOe2DwVsW2xB2RTTjRe0zkRHkIrCUOxEnu5Pvd8EQv08wh1URBs5
         SZDG2j1+3UlI5MtL+ZuFVjwS2/yMJjicn1d7iyA9NXDpZoK8/OOPTv3HzWtx6KCyiJQg
         k5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773327866; x=1773932666;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yubfebbZtWGWMyXAz+IUlEnaVFuppBxaYt4/00Rob0=;
        b=pQfAWNBIIjDo06BJCDZmn9ekPU1yb3WX19pvMkpRMKXXhyck6BjYP11C9cCjyL3BD+
         jwpDiIKjumqvVji9xHXN48lpxJVnEQJdRfkc1R53AtRFDQn3e2/d3wVlhtjF/UTKrpmx
         fQuEYJZKsDm3YZGyHTEtqyyqzt+aybKhalrV2sh6AlJP8kUgvxFF4Ir0PbBleH6uJ602
         0sRNIAGwE4sMKPCRXgA4sNYZ33YYUFNhFQqKvx8NdDRicbA9ZPfVC9MPix45jXU6bOcF
         0PA8ENndPN/X71IssHg8THnSdeZnEePfFmv6DeTdsp+owdVpHe75Iug+qfBw2kWU/cka
         YTgQ==
X-Gm-Message-State: AOJu0Yxssai3XoeH4UsIIO5OT6XaHETOEemFkH5ldFP64ENSDPWC9TCt
	P8gvwDHGfB3T2aloghweNfs9AarzPMlZx3KEGVSIix86aMF8vrJZzMcIBIlt/EdvW2GlE6fPlq5
	cmVIJRcQOzYw9lvp2hdMzprCxkTOcWZT/CpX1Dhj5J/uaX21FCgsVmgX70BNxKw==
X-Gm-Gg: ATEYQzzlavLwitjzCeJTnRZD/GALxpJki7nU1ibtxa6AgRdvN+E8jSeQ23bejMeW09F
	twyAixuAvhVNfnzzHVIYDytvGUhVDV8A3soJwyZRBWJbyz0ROGmy+woH98T5oK54MU6x3QYwYJE
	Ok0+mn6q85MBFGq0NAFipD0GfjWp4Rd8KWcoeP/OwMSjdX2xzsvSv/uy3Ly12/pdcko+y2wCJjS
	BMiO6DYUmWzokEKVJWji6rwjebWQq48UqcRcWsODc3nPz9c3KYxxmix/IlhUkcgZKsdpZQOImw9
	xh4a10BBc2dWEKkyNgWVCEye32DkqmBd0mRNCx8EuhFf2J0jZA+UBFmKSGKY+sqB2EQ/I9qNok6
	zircVVNkA4M46jrMyzAZGKW1/SJrDdg9glRAmNJxMFcn2okmpD3+VwH1W
X-Received: by 2002:a05:6830:82fa:b0:7cf:d189:2a8b with SMTP id 46e09a7af769-7d76a6299d4mr4075502a34.2.1773327865588;
        Thu, 12 Mar 2026 08:04:25 -0700 (PDT)
X-Received: by 2002:a05:6830:82fa:b0:7cf:d189:2a8b with SMTP id 46e09a7af769-7d76a6299d4mr4075408a34.2.1773327864586;
        Thu, 12 Mar 2026 08:04:24 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d17023sm36581046d6.49.2026.03.12.08.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:04:23 -0700 (PDT)
Date: Thu, 12 Mar 2026 11:04:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Chen-Yu Tsai <wenst@chromium.org>, Felix Gu <ustc.gu@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Maxime Ripard <mripard@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [GIT PULL] clk: round one of improvements for v7.1
Message-ID: <abLV9vjYxXsKciHW@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Stephen,

Here's a pull for some fixes and improvements for the clk subsystem
that's been posted over the last month. Details are in the signed git
tag. I didn't include any new drivers, or changes where it looks like
there is a submaintainer that typically sends you a pull separately.


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-for-stephen-round-1-v7.1

for you to fetch changes up to 5e31ef47fa888c9ce117a85bff6a7df26cb2c337:

  clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver (2026-03-12 09:45:03 -0400)

----------------------------------------------------------------
Improvements to the clk core

- Add support for clk spread spectrum, which reduces electromagnetic
  interference (EMI) by modulating the clk frequency a small amount to
  spread the energy across a wider bandwidth. The SCMI clk driver uses
  this new functionality. (Peng Fan)

- Introduced the CLK_ROUNDING_NOOP flag, which is for the case where the
  determine_rate op is an empty function. This typically occurs when
  rounding is managed by firmware or the clock is capable of any rate.
  Nine clk drivers were updated to use this new flag: rp1, scpi,
  hisilicon/hi3660-stub, imx/clk-scu, qcom/clk-rpm, qcom/clk-rpmh,
  qcom/clk-smd-rpm, samsung/clk-acpm, sprd/pll. (Brian Masney)

- Added kernel docs for all members of struct clk_core. (Brian Masney)

- Simplify clk_is_match() and improve readability. (Geert Uytterhoeven)

Remove deprecated APIs (all Brian Masney)

- Converts clk-composite from round_rate() to determine_rate().

- Removes the round_rate() clk op.

- Removes the deprecated functions divider_round_rate(),
  divider_round_rate_parent(), and divider_ro_round_rate_parent() since
  these are just wrappers for the corresponding determine_rate variant.

KUnit Tests

- Add tests for clk lookup by name. (Chen-Yu Tsai)

- Introduced kunit tests for spread spectrum. (Peng Fan)

- Minor cleanup to use HZ_PER_MHZ. (Brian Masney)

Driver-specific updates not listed above

- The SCMI driver gained support for OEM extensions. (Peng Fan)

- Dropped the baikal-t1 SoC that will not be finalized / supported.
  (Andy Shevchenko)

- Minor bug fixes / cleanups to various drivers across the clk tree:
  aspeed/ast2700 (Felix Gu), x86/lpss-atom (Andy Shevchenko),
  hisilicon/reset (Shawn Guo), hisilicon (J. Neuschäfer), xgene (Geert
  Uytterhoeven), mvebu/armada-37xx-periph (Ben Dooks), imx/scu (Brian
  Masney).

----------------------------------------------------------------
Andy Shevchenko (4):
      clk: baikal-t1: Remove not-going-to-be-supported code for Baikal SoC
      clk: x86: lpss-atom: Use predefined constants from units.h
      clk: x86: lpss-atom: Use temporary variable for struct device
      clk: x86: lpss-atom: Read frequency from the property

Ben Dooks (1):
      clk: mvebu: armada-37xx-periph: fix __iomem casts in structure init

Brian Masney (19):
      clk: test: remove references to clk_ops.round_rate
      clk: composite: convert from round_rate() to determine_rate()
      clk: remove round_rate() clk ops
      clk: divider: remove divider_ro_round_rate_parent()
      clk: divider: remove divider_round_rate() and divider_round_rate_parent()
      clk: add kernel docs for struct clk_core
      clk: test: convert constants to use HZ_PER_MHZ
      clk: add new flag CLK_ROUNDING_NOOP
      clk: test: add test suite for CLK_ROUNDING_NOOP flag
      clk: rp1: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: scpi: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: hisilicon: hi3660-stub: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: imx: scu: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: rpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: rpmh: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: qcom: smd-rpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: samsung: acpm: drop determine_rate op and use CLK_ROUNDING_NOOP flag
      clk: sprd: drop determine_rate op and use CLK_ROUNDING_NOOP flag

Chen-Yu Tsai (1):
      clk: tests: Add tests for clk lookup by name

Felix Gu (1):
      clk: aspeed: ast2700: Add missing NULL pointer check for devm_kasprintf()

Geert Uytterhoeven (2):
      clk: Simplify clk_is_match()
      clk: xgene: Fix mapping leak in xgene_pllclk_init()

J. Neuschäfer (1):
      clk: hisilicon: Improve deallocation in error path

Peng Fan (6):
      dt-bindings: clock: Add spread spectrum definition
      clk: Introduce clk_hw_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: Add KUnit tests for assigned-clock-sscs
      clk: scmi: Introduce common header for SCMI clock interface
      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver

Shawn Guo (1):
      clk: hisilicon: reset: Use kzalloc instead of kmalloc

 .../bindings/clock/baikal,bt1-ccu-div.yaml         | 196 -------
 .../bindings/clock/baikal,bt1-ccu-pll.yaml         | 131 -----
 Documentation/driver-api/clk.rst                   |   9 +-
 drivers/clk/Kconfig                                |   1 -
 drivers/clk/Makefile                               |   9 +-
 drivers/clk/aspeed/clk-ast2700.c                   |   2 +
 drivers/clk/baikal-t1/Kconfig                      |  52 --
 drivers/clk/baikal-t1/Makefile                     |   4 -
 drivers/clk/baikal-t1/ccu-div.c                    | 653 ---------------------
 drivers/clk/baikal-t1/ccu-div.h                    | 121 ----
 drivers/clk/baikal-t1/ccu-pll.c                    | 560 ------------------
 drivers/clk/baikal-t1/ccu-pll.h                    |  72 ---
 drivers/clk/baikal-t1/ccu-rst.c                    | 217 -------
 drivers/clk/baikal-t1/ccu-rst.h                    |  67 ---
 drivers/clk/baikal-t1/clk-ccu-div.c                | 520 ----------------
 drivers/clk/baikal-t1/clk-ccu-pll.c                | 277 ---------
 drivers/clk/clk-composite.c                        |  38 +-
 drivers/clk/clk-conf.c                             |  76 +++
 drivers/clk/clk-divider.c                          |  44 --
 drivers/clk/clk-rp1.c                              |  11 +-
 drivers/clk/clk-scmi-oem.c                         | 108 ++++
 drivers/clk/clk-scmi.c                             |  44 +-
 drivers/clk/clk-scmi.h                             |  51 ++
 drivers/clk/clk-scpi.c                             |  14 +-
 drivers/clk/clk-xgene.c                            |   2 +
 drivers/clk/clk.c                                  | 177 +++++-
 drivers/clk/clk.h                                  |   4 +
 drivers/clk/clk_test.c                             | 297 +++++++++-
 drivers/clk/hisilicon/clk-hi3660-stub.c            |  14 +-
 drivers/clk/hisilicon/clk.c                        |   4 +-
 drivers/clk/hisilicon/reset.c                      |   2 +-
 drivers/clk/imx/clk-scu.c                          |  23 +-
 drivers/clk/kunit_clk_assigned_rates.h             |  10 +
 drivers/clk/kunit_clk_assigned_rates_multiple.dtso |   6 +
 ...kunit_clk_assigned_rates_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_one.dtso      |   3 +
 .../clk/kunit_clk_assigned_rates_one_consumer.dtso |   3 +
 .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
 ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
 .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
 drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +
 .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 +
 drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +
 .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 +
 drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 +
 .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +
 drivers/clk/mvebu/armada-37xx-periph.c             |  16 +-
 drivers/clk/qcom/clk-rpm.c                         |  16 +-
 drivers/clk/qcom/clk-rpmh.c                        |   8 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |  15 +-
 drivers/clk/samsung/clk-acpm.c                     |  14 +-
 drivers/clk/sprd/pll.c                             |   7 -
 drivers/clk/sprd/pll.h                             |   2 +-
 drivers/clk/x86/clk-lpss-atom.c                    |  22 +-
 include/dt-bindings/clock/bt1-ccu.h                |  48 --
 include/dt-bindings/clock/clock.h                  |  14 +
 include/linux/clk-provider.h                       |  79 ++-
 58 files changed, 943 insertions(+), 3242 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
 delete mode 100644 drivers/clk/baikal-t1/Kconfig
 delete mode 100644 drivers/clk/baikal-t1/Makefile
 delete mode 100644 drivers/clk/baikal-t1/ccu-div.c
 delete mode 100644 drivers/clk/baikal-t1/ccu-div.h
 delete mode 100644 drivers/clk/baikal-t1/ccu-pll.c
 delete mode 100644 drivers/clk/baikal-t1/ccu-pll.h
 delete mode 100644 drivers/clk/baikal-t1/ccu-rst.c
 delete mode 100644 drivers/clk/baikal-t1/ccu-rst.h
 delete mode 100644 drivers/clk/baikal-t1/clk-ccu-div.c
 delete mode 100644 drivers/clk/baikal-t1/clk-ccu-pll.c
 create mode 100644 drivers/clk/clk-scmi-oem.c
 create mode 100644 drivers/clk/clk-scmi.h
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_null.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_without.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_zero.dtso
 create mode 100644 drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso
 delete mode 100644 include/dt-bindings/clock/bt1-ccu.h
 create mode 100644 include/dt-bindings/clock/clock.h


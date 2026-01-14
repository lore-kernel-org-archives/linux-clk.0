Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2522D46A1;
	Wed, 14 Jan 2026 01:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355050; cv=none; b=TjeaTJEU1vgXGX7UtbsmDkf0LEopqi9Gdyby2Tz+lf6+4lLSAOIxX/w59/k6Joq+adyJHmHV6pwatgHrWCrauGwe+08m/Kwk8z3i/R1FSDKvC9C9WBBJdYdDndrN3RjrgZYdalU5bvdCW+krnpRHRZ4f8nGq9WafYJ7x7EN4JtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355050; c=relaxed/simple;
	bh=br6SlDAJpEfYlSo4/e4UQA5Gugs9tD9bDNd4cdF+wF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e917lSr1/Fvb2/fG1Tg13jdws3BIHk8mKEN4DwKT7zWz2bgNspwXbFBpeB5EjZcpcK4b697rDe2iz7QJxrLm8CX/IBn1QalAQoLozKWYLRW76dll1ZdByeJHTvgzvzgx+xMk8OfpCpKuAR0bjDYmUBQxDL7SyQduFSwypYnMJyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E7692340FEC;
	Wed, 14 Jan 2026 01:44:05 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Guodong Xu <guodong@riscstar.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v6.20
Date: Wed, 14 Jan 2026 09:43:33 +0800
Message-ID: <20260114092742-GYC7933267@gentoo.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


Hi Stephen,

   Please pull SpacemiT's clock changes for v6.20, This PR basically adds
support for SpacemiT new K3 SoC, while doing this I've created an immutable
tag (spacemit-clkrst-v6.20-3) for reset driver in case it also needs to be
merged during same merge window, otherwise everything is normal.

Yixun Lan


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.20-1

for you to fetch changes up to e371a77255b837f5d64c9d2520f87e41ea5350b9:

  clk: spacemit: k3: add the clock tree (2026-01-09 10:48:17 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.20

- Fix driver to build as module
- Refactor to extract common code
- Add clock support for new K3 SoC

----------------------------------------------------------------
Inochi Amaoto (2):
      clk: spacemit: Respect Kconfig setting when building modules
      clk: spacemit: Hide common clock driver from user controller

Yixun Lan (13):
      clk: spacemit: prepare common ccu header
      reset: spacemit: fix auxiliary device id
      Merge tags 'spacemit-clkrst-v6.20-1' and 'spacemit-clkrst-v6.20-2' into spacemit-clkrst-v6.20
      Merge tag 'spacemit-clkrst-v6.20-1' into spacemit-clk-for-6.20
      clk: spacemit: extract common ccu functions
      clk: spacemit: add platform SoC prefix to reset name
      Merge tag 'spacemit-clkrst-v6.20-2' into spacemit-clk-for-6.20
      dt-bindings: soc: spacemit: k3: add clock support
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: extract common header
      Merge tag 'spacemit-clkrst-v6.20-3' into spacemit-clk-for-6.20
      clk: spacemit: k3: add the clock tree

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   14 +-
 drivers/clk/spacemit/Kconfig                       |   20 +-
 drivers/clk/spacemit/Makefile                      |   12 +-
 drivers/clk/spacemit/ccu-k1.c                      |  192 +--
 drivers/clk/spacemit/ccu-k3.c                      | 1487 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.c                  |  177 +++
 drivers/clk/spacemit/ccu_common.h                  |   11 +
 drivers/clk/spacemit/ccu_ddn.c                     |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   21 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  119 ++
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 drivers/reset/reset-spacemit.c                     |    2 +-
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 +++++
 include/soc/spacemit/ccu.h                         |   21 +
 include/soc/spacemit/k1-syscon.h                   |   12 +-
 include/soc/spacemit/k3-syscon.h                   |  273 ++++
 18 files changed, 2609 insertions(+), 221 deletions(-)
 create mode 100644 drivers/clk/spacemit/ccu-k3.c
 create mode 100644 drivers/clk/spacemit/ccu_common.c
 create mode 100644 include/dt-bindings/clock/spacemit,k3-clocks.h
 create mode 100644 include/soc/spacemit/ccu.h
 create mode 100644 include/soc/spacemit/k3-syscon.h

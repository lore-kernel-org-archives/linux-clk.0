Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E113D24C
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730880031; cv=none; b=IeJtKQHDPmgraiDAp7EfCBQQK64t1Mg63SIZIRNB3ZUZb4Bd9j58ReHTiQSB/H0ROi8tEfU11gwNHkrN6CCOBLyxu0VH64q4bTSo5AmOpBgjltKfZco4/WpSLT8DBC3q4b+Oi1gHGiv3+q7h8ABqHsq8a4CSPuPUdUF9jmOk4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730880031; c=relaxed/simple;
	bh=ZIc9yg3Xu2fol2W0chfqUTKp2WjB2DX6CLZVH4UCj98=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e/ciXpaURybsRwED6RE/riXeF2fSHNGdZXRvgjrxJBDB8yEAQ8uMe/1VpUAKcvlYXMwH/qX/jhAloY1MGDL0U2xELVhwB9K+VN4HeYygnRvSDYv7wJS33g1NH3VxfZmNHW0xbFP5nc1+WOyH6mqwHsG+lAKb6oC2Y2+DLT2CTnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:aed7:437f:20a9:d72d])
	by andre.telenet-ops.be with cmsmtp
	id ZL0H2D00S3NwldE01L0Hjt; Wed, 06 Nov 2024 09:00:18 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8axJ-006M8G-SQ;
	Wed, 06 Nov 2024 09:00:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8axd-005gpa-Bb;
	Wed, 06 Nov 2024 09:00:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL v2] clk: renesas: Updates for v6.13 (take two)
Date: Wed,  6 Nov 2024 09:00:12 +0100
Message-Id: <cover.1730879827.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 92850bed9d4d334ee502a035ed5750285faccbea:

  clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks (2024-10-14 10:04:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.13-tag2

for you to fetch changes up to 3b42450ce1771c7b11d8f3563f4bbfe9b8d26611:

  clk: renesas: vbattb: Add VBATTB clock driver (2024-11-06 08:52:45 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.13 (take two)

  - Add RTC power domain and Battery Backup Function (VBATTB) clock
    support for the RZ/G3S SoC,
  - Add the devm_clk_hw_register_gate_parent_hw() helper,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding updates for the RZ/G3S SoC, which are
shared by the clock driver and DT source files.

Changes compared to v1:
  - Drop "linux/clk-provider.h" from one-line description.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: rzg2l: Fix FOUTPOSTDIV clk

Claudiu Beznea (8):
      dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC
      clk: renesas: rzg2l-cpg: Move PM domain power on in rzg2l_cpg_pd_setup()
      clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
      clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as IRQ safe
      clk: renesas: r9a08g045: Add power domain for RTC
      dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
      clk: Add devm_clk_hw_register_gate_parent_hw()
      clk: renesas: vbattb: Add VBATTB clock driver

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag2' into renesas-clk-for-v6.13
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag3' into renesas-clk-for-v6.13

 .../bindings/clock/renesas,r9a08g045-vbattb.yaml   |  84 +++++++++
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/clk-vbattb.c                   | 205 +++++++++++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c                |  54 +++---
 drivers/clk/renesas/rzg2l-cpg.c                    |  52 +++---
 drivers/clk/renesas/rzg2l-cpg.h                    |  10 +-
 include/dt-bindings/clock/r9a08g045-cpg.h          |   1 +
 .../dt-bindings/clock/renesas,r9a08g045-vbattb.h   |  13 ++
 include/linux/clk-provider.h                       |  18 ++
 10 files changed, 380 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

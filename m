Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7885A25B0B8;
	Thu, 16 Jul 2026 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196256; cv=none; b=T5PC95nZg59bJgg9tvEQJuh5awGXczZsyAiD6jx6r2+qFLWx6sGycUqzao0DNi1nC3WzQb1WK4fnsDSiuyRQZt3ZSnwETKjHINhu+hh1MDwzna84z7GUfOWtxmPs2qDnBvw3F8Er9pSnfE+OVcKpofafVnUs3wxAG8geGoaW4KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196256; c=relaxed/simple;
	bh=1iJVcRAClwn4Uv+8h3Or9E90rYJW0QzhW4c+NhPKWOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qo+DMB0XaChdWMpk9I8AixBtDeSL/AFU2zIaQuRS+TW46UkFsmu9Bi3CImnZtql4WOsI34dkDFvvsEkbBRfSRzPOTOKtDjI18JO8c5MY4DmwgJrMFse9ik9cBXYWEOQFZFX30QuNp8vO8iTnOkBwZx4cyebQQK1jwGHceCnAhQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0A11F000E9;
	Thu, 16 Jul 2026 10:04:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.3
Date: Thu, 16 Jul 2026 12:04:10 +0200
Message-ID: <cover.1784195202.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.3-tag1

for you to fetch changes up to 2df26b8663b6f315d0e9364927c8503280fe3dd3:

  clk: r9a08g045: Add clocks and resets for CAN-FD (2026-07-13 13:58:01 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v7.3

  - Add RTC and display clocks on RZ/T2H and RZ/N2H,
  - Add audio and display clocks and resets on RZ/G3E,
  - Add SDHI, GPU, and USB2.0 clocks and resets on RZ/G3L,
  - Update the maintainer for the VersaClock 7 driver,
  - Add CAN-FD clocks and resets for RZ/G3S.
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definition updates for the RZ/T2H and
RZ/N2H SoCs, which are shared by the clock subsystem and DT source
files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (4):
      clk: renesas: r9a08g046: Add clock and reset entries for SDHI
      clk: renesas: r9a08g046: Add clock and reset entries for GE3D
      clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
      dt-bindings: clock: renesas,versaclock7: Update maintainer

Claudiu Beznea (1):
      clk: r9a08g045: Add clocks and resets for CAN-FD

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag7' into renesas-clk-for-v7.3

John Madieu (2):
      dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
      clk: renesas: r9a09g047: Add audio clock and reset support

Lad Prabhakar (7):
      dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
      dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC clock ID
      clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
      clk: renesas: r9a09g077: Add RTC clocks
      clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
      clk: renesas: rzv2h-cpg: Extract PLL calculation helpers into shared library
      clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H display pipeline

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add LVDS clocks and resets

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |   6 +
 .../bindings/clock/renesas,versaclock7.yaml        |   2 +-
 MAINTAINERS                                        |   6 +-
 drivers/clk/renesas/Kconfig                        |   6 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r9a08g045-cpg.c                |   9 +
 drivers/clk/renesas/r9a08g046-cpg.c                | 130 +++++++
 drivers/clk/renesas/r9a09g047-cpg.c                | 123 ++++++-
 drivers/clk/renesas/r9a09g077-cpg.c                | 375 ++++++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c                | 217 ++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c                    | 203 -----------
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   2 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   2 +
 include/linux/clk/renesas.h                        |  34 +-
 15 files changed, 913 insertions(+), 223 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9848C3FA;
	Fri,  2 Oct 2026 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940551; cv=none; b=GpKu6nurqUC1X60AziyYah3Uqt3P5CxKZ7RLXvVUVkA9h3jAd34tPlDZMh6iXeEZ6bZZTfgr7mrfF0bZg9rrRE8zou581eRHOzoNFOIV64SsHSuBEs7Pymb67YXhJeQXaMlrBFF4U6eziNRzD7DTDxPpeSykO24HxS3c9rK4dfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940551; c=relaxed/simple;
	bh=ZFYMzloq62K7y3ocCDsQk+gkSwB+I0tJQ6lvLdIFCZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f66hUvRGgl1DWDXrn2mnybME8n2Hlp1QLixdYS8aDedc6JOlmJZH2g+ziWpWFFJVs4q4u8kisnjn+er6JqbjA8IgjEiCc4327iVlZd/DoAPdgQaMR8QnjQ2paPEiT94xX/EZBUVvqizp45vTnAg62kar/SkyJYrMaX1cWBSpG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387EF1F00898;
	Fri,  2 Oct 2026 11:29:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.4 (take two)
Date: Fri,  2 Oct 2026 13:29:05 +0200
Message-ID: <cover.1790939760.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Stephen, Brian, Jérome,

The following changes since commit 8d90c0eeef104553d6b9137becd7f58b468aaa0b:

  clk: renesas: r9a09g077: Register SYSC regmap (2026-09-14 09:47:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.4-tag2

for you to fetch changes up to 21cbd7ec29930f8e7e156e18b81736f099f03849:

  clk: renesas: r8a78000: Add SGASYNCD8_PERW_BUS (2026-09-28 13:44:05 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v7.4 (take two)

  - Add GPU clocks on R-Car V4H,
  - Add initial support for RZ/G2M v3.0,
  - Add CANFD, thermal (TSU), and ADC1 clocks and resets on RZ/G3L,
  - Add I2C parent clock support on R-Car X5H,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions and updates for the
RZ/G2M v3.0 SoC, which are shared by the clock subsystem and DT source
files.

Thanks for pulling!

----------------------------------------------------------------
Ayman Chaudhry (2):
      dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
      clk: renesas: Add support for RZ/G2M v3.0

Biju Das (3):
      clk: renesas: r9a08g046: Propagate clk rate for ETH TX mux clocks
      clk: renesas: r9a08g046: Add CANFD clocks and resets
      clk: renesas: r9a08g046: Add TSU and ADC1 clocks and resets

Geert Uytterhoeven (2):
      Merge tag 'renesas-r8a774a3-dt-binding-defs-tag1' into renesas-clk-for-v7.4
      clk: renesas: rzg2l: Fix internal clock names

Kuninori Morimoto (2):
      clk: renesas: rcar-gen4: Tidy up DEF_GEN4_Z()
      clk: renesas: r8a779g0: Add ZG clocks

Wolfram Sang (1):
      clk: renesas: r8a78000: Add SGASYNCD8_PERW_BUS

 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a774a3-cpg-mssr.c            | 168 +++++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |   6 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c            |   4 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |   4 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |   8 +-
 drivers/clk/renesas/r8a78000-cpg.c                 |   3 +
 drivers/clk/renesas/r9a07g043-cpg.c                |  12 +-
 drivers/clk/renesas/r9a07g044-cpg.c                |  12 +-
 drivers/clk/renesas/r9a08g045-cpg.c                |   6 +-
 drivers/clk/renesas/r9a08g046-cpg.c                |  25 ++-
 drivers/clk/renesas/rcar-gen4-cpg.c                |  25 ++-
 drivers/clk/renesas/rcar-gen4-cpg.h                |  14 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 .../dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h  |  59 ++++++++
 17 files changed, 316 insertions(+), 43 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a774a3-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226803F5BFC;
	Fri, 18 Sep 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724284; cv=none; b=uc5Uov4BQubiLuf0tYiCPTJFEk7HYPM2wGCTLYFRzd+vVwej056As8QnU9dXn05EqseQZmGXZDlrOI/AeWIWbZ0YucUno9mJSnBjfNhXBBBCY6jMeg4BvgXFabRrl7NV+yt2V7OM3zb+vI9kFGMuvDzy/y8Lj/73dgGXjFM4zDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724284; c=relaxed/simple;
	bh=dLRgCHYBYt6zAVgzesW0L9ayGOHX0Es+F9XcsZwOjdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nHSh7sue4IhE4/SCblwdZNOeBjmRt74VvfHg4jQU6roslXqufqX0xkeaN/kcB1QZiJZnp53LsoBpeW6mZj146vNfXsGNA3njCZ0fKXTE6ud66IysVdFpowg9GlS167w95aYHeLZFy/PXhfHxR5lzTzLqm22slUlpXAbHyBgu0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523281F000FF;
	Fri, 18 Sep 2026 09:38:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.4
Date: Fri, 18 Sep 2026 11:37:46 +0200
Message-ID: <cover.1789723268.git.geert+renesas@glider.be>
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.4-tag1

for you to fetch changes up to 8d90c0eeef104553d6b9137becd7f58b468aaa0b:

  clk: renesas: r9a09g077: Register SYSC regmap (2026-09-14 09:47:33 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v7.4

  - Add display and PCIe clocks and resets on RZ/G3L,
  - Make sure clk_init_data is fully initialized,
  - Convert RZ/V2H to the clk_hw-based provider API,
  - Add syscon regmap support for the System Controller (SYSC) on RZ/T2H
    and RZ/N2H,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (10):
      clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
      clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
      clk: renesas: rzg2l: Rename cpg_core_clk::flag to core_flags
      clk: renesas: rzg2l: Add support for divider flags
      clk: renesas: rzg2l: Add support for LVDS fixed-factor divider with 4:7 duty cycle
      clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
      clk: renesas: r9a08g046: Sort macro definitions alphabetically
      clk: renesas: r9a08g046: Add MIPI DSI and LCDC clock/reset entries
      clk: renesas: r9a08g046: Add clock and reset entries for LVDS
      clk: renesas: r9a08g046: Add PCIe clocks and reset

Geert Uytterhoeven (2):
      clk: renesas: Make sure clk_init_data is fully initialized
      clk: renesas: rcar-gen3: Use FIELD_GET()

Jerome Brunet (1):
      clk: renesas: Clean-up simple provider misuse of the consumer API

John Madieu (2):
      clk: renesas: rzv2h: Drop duplicated parent lookup in fixed_mod_status_clk_register()
      clk: renesas: rzv2h: Convert to clk_hw based provider API

Lad Prabhakar (1):
      clk: renesas: r9a09g077: Register SYSC regmap

 drivers/clk/renesas/Kconfig            |   2 +
 drivers/clk/renesas/r9a06g032-clocks.c |   2 +-
 drivers/clk/renesas/r9a08g046-cpg.c    |  92 +++++-
 drivers/clk/renesas/r9a09g077-cpg.c    | 142 +++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c    |  15 +-
 drivers/clk/renesas/rcar-gen3-cpg.h    |   3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.h |   1 +
 drivers/clk/renesas/rzg2l-cpg.c        | 554 ++++++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h        |  51 ++-
 drivers/clk/renesas/rzv2h-cpg.c        | 164 +++++-----
 11 files changed, 898 insertions(+), 131 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF864087B
	for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2024 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712919342; cv=none; b=CYjhWRnvqVYsQjC6HNKP+mrdrlFYUKQ4TvlhnYfIZ7eOmhPqqXe/naBWRgukWnoOwozicNpS/I7H7zpZ/PWHcH8Bxtx/txVhmLPkg3Maf4epkgK1zTHjU71ycf3MK97PXz1YG64qR30WStoctylIDlxer0TODpTZowzEkwuqu94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712919342; c=relaxed/simple;
	bh=YuH4h9erC2nTi9bT7VhvVDdFgqYUBaHXIa5SsSRXy9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bHLvuNhCQN09DXkOR3CLd/Wil84CDMf3TIC6yc2+dpjLShfX42orOenk5fIiHTAwLjR8eynSszJ8SOLHAVKEaLr4i8DwmdID+WT5R3A/yU8VSC5rqYkjeREkOS+fAhW7lpEizgCUZ94FfoLUY7yEGYnttRWCcgeKrX1cm36Wf3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4VGCwx3FPHz4x4Ll
	for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2024 12:49:05 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by albert.telenet-ops.be with bizsmtp
	id AAox2C00A0SSLxL06AoxGo; Fri, 12 Apr 2024 12:48:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESF-00GpBl-ON;
	Fri, 12 Apr 2024 12:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDjJ-004eRO-1j;
	Fri, 12 Apr 2024 12:01:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.10
Date: Fri, 12 Apr 2024 12:01:54 +0200
Message-Id: <cover.1712915721.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.10-tag1

for you to fetch changes up to c0516eb4cf04ac61b6fe1f86cc15b2f5f024ee78:

  clk: renesas: r8a779h0: Add timer clocks (2024-04-08 11:12:32 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.10

  - Add thermal, serial (SCIF), and timer (CMT/TMU) clocks on R-Car V4M,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: clock: r9a07g043-cpg: Annotate RZ/G2UL-only core clocks
      clk: renesas: r8a779h0: Add thermal clock
      clk: renesas: r8a779h0: Add SCIF clocks

Paul Barker (2):
      clk: renesas: r9a07g043: Mark mod_clks and resets arrays as const
      clk: renesas: r9a07g044: Mark resets array as const

Thanh Quan (1):
      clk: renesas: r8a779h0: Add timer clocks

 drivers/clk/renesas/r8a779h0-cpg-mssr.c   | 14 ++++++++++++++
 drivers/clk/renesas/r9a07g043-cpg.c       |  4 ++--
 drivers/clk/renesas/r9a07g044-cpg.c       |  2 +-
 include/dt-bindings/clock/r9a07g043-cpg.h |  6 +++---
 4 files changed, 20 insertions(+), 6 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

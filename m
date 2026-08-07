Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABBE343D85;
	Fri,  7 Aug 2026 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090807; cv=none; b=q9CeI/Jo1lJ/jfEkZXPRBJbxg3uu2kqLEDedgnZ4aUMNhuTYzaINNPAT0kd00J9lzC99sW9QzIIdmmvnmlAfKwEZwyMoHGDaRKpHOq1yrO+i9rcwiRmisWWtKr/U1kWcJt82hQ4YUJQZXNwbvd7rkgpTypaffo0tX4rnLRLElgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090807; c=relaxed/simple;
	bh=XvXENDu/xGCRP45/ovc+feIcWAm0Mf6b84FHxt/pDKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9FsZJ79yBPyCInKc8Tmu900L+1x+IQQ1x4NA3hcgyaWA0iiSAoCfG8a0g4Z0eiNoQCg1uq0/OoqeBYrnVsOMaNqaOdI2SQyjq7/8ctKzgI8rQC0+zYoHMjD9e1CttaQmQ8vNoFERgrIEl+qB9pk9tOpOxIn9ugg2+CmgDfOnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205F31F000E9;
	Fri,  7 Aug 2026 08:20:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.3 (take two)
Date: Fri,  7 Aug 2026 10:19:54 +0200
Message-ID: <cover.1786090463.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 2df26b8663b6f315d0e9364927c8503280fe3dd3:

  clk: r9a08g045: Add clocks and resets for CAN-FD (2026-07-13 13:58:01 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.3-tag2

for you to fetch changes up to 0fb9083a6e56f688aeeccfc7ef7eeba586e57dc6:

  clk: renesas: Add R-Car X5H CPG driver (2026-08-06 10:00:14 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v7.3 (take two)

  - Add initial support for the R-Car X5H (R8A78000) SoC.

Notes:
  - This is based on my previous PR for v7.3, which you haven't pulled
    yet, and on v7.2-rc2 (for <linux/device-id/of.h>), which
    clk/clk-next is already based on,
  - This includes DT bindings and binding definitions for the R-Car X5H
    SoC, which are shared by the clock subsystem and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag2' into renesas-clk-for-v7.3
      clk: renesas: Add R-Car X5H CPG driver

 .../bindings/clock/renesas,r8a78000-cpg.yaml       |  55 +++++++
 drivers/clk/renesas/Kconfig                        |   4 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a78000-cpg.c                 | 166 +++++++++++++++++++++
 include/dt-bindings/clock/renesas,r8a78000-cpg.h   |  14 ++
 5 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
 create mode 100644 drivers/clk/renesas/r8a78000-cpg.c
 create mode 100644 include/dt-bindings/clock/renesas,r8a78000-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

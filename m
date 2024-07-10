Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A6192B61
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617057; cv=none; b=Eu5If83FvNu8Uhzs/TMolpS95Ds4JEy7XdsoUGCqHTDyK5jhilsvoZSEVlm18UY4fqzqYxMdZk/P6i9Npwzt5kb2URDY32vs3I4/rzwIufTqiolYLODROCJ9gIOsHb/HbtFsZOgpQ267NRk6k+WkmlgEeTjXY7ge9E5SkCbMI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617057; c=relaxed/simple;
	bh=HLh/yn22aSDMr5VgxIVhK70/SBQGcxEryNkctjaaV2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XKQysVwjlznCDh9vgFIYZseN5iQl4xw5fCdXsrJOUF9pecf2WSOjWvRb500TswOYQWtTcq/ynaGKgGDDxevQY0HDYFt+5OeASDGqSajEAzUQpQhBfl8CMfIlStE52fO9Q1PIOTIfnsj3414lJhqrDJZb1qre/ps86rjH4x+w0ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by laurent.telenet-ops.be with bizsmtp
	id lpAp2C00B4znMfS01pApEw; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5f-001cT3-PC;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQBa-Ac;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/14] clk: renesas: rcar-gen4: Fractional PLL improvements
Date: Wed, 10 Jul 2024 15:10:34 +0200
Message-Id: <cover.1720616233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Currently, almost all PLLs on R-Car Gen4 SoCs are modelled as fixed
divider clocks, based on the state of the mode pins.  The only exception
is PLL2 on R-Car V4H, which uses a custom clock driver to support High
Performance mode on the Cortex-A76 CPU cores.

However, the boot loader stack may have changed the actual PLL
configuration from the default, leading to incorrect clock frequencies.
A typical sympton is a CPU core running much slower than reported by
Linux.

This patch series enhances PLL support on R-Car Gen4 support by
obtaining the actual PLL configuration from the hardware.  As these PLLs
can be configured for fractional multiplication, an old patch to add
support fractional multiplication is revived, too.  Of course some
cleanups are included, too.

Note that struct rcar_gen4_cpg_pll_config still contains the default
multipliers and dividers for PLL1/2/3/4/6, while they are no longer
used. Probably they should be removed, too.  Or do you think we should
retain them for documentation purposes>

Thanks for your comments!

Geert Uytterhoeven (14):
  clk: renesas: rcar-gen4: Removed unused SSMODE_* definitions
  clk: renesas: rcar-gen4: Clarify custom PLL clock support
  clk: renesas: rcar-gen4: Use FIELD_GET()
  clk: renesas: rcar-gen4: Use defines for common CPG registers
  clk: renesas: rcar-gen4: Add support for fractional multiplication
  clk: renesas: rcar-gen4: Add support for variable fractional PLLs
  clk: renesas: rcar-gen4: Add support for fixed variable PLLs
  clk: renesas: rcar-gen4: Add support for fractional 9.24 PLLs
  clk: renesas: r8a779a0: Use defines for PLL control registers
  clk: renesas: r8a779f0: Model PLL1/2/3/6 as fractional PLLs
  clk: renesas: r8a779g0: Model PLL1/3/4/6 as fractional PLLs
  clk: renesas: r8a779h0: Model PLL1/2/3/4/6 as fractional PLLs
  clk: renesas: rcar-gen4: Remove unused variable PLL2 clock type
  clk: renesas: rcar-gen4: Remove unused fixed PLL clock types

 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  25 +--
 drivers/clk/renesas/r8a779f0-cpg-mssr.c |  18 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  26 +--
 drivers/clk/renesas/r8a779h0-cpg-mssr.c |  22 +--
 drivers/clk/renesas/rcar-gen4-cpg.c     | 209 ++++++++++++++++--------
 drivers/clk/renesas/rcar-gen4-cpg.h     |  28 +++-
 6 files changed, 209 insertions(+), 119 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

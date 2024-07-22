Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6A16D312
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649564; cv=none; b=O0jgUS90pHDO7ntVLcx0EihVvAhP/8rt4X2PD/vRUQOd4sPQdUheXo8Od2f+EGkVjek5m1DuGnG5SDwrGjXC1JVKAKePp2mX6zaMDLZBqMEfvT3taO9BRqpjrDHWahKARHatqGaAZk7CYSqH3iVnaXGJM69ZZDNT8ClFp3XYvcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649564; c=relaxed/simple;
	bh=kUKb0P/kAOE7X/86n/cs1pl3V+fDiAJiredd6AqrnCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SWa9KN75alMko44axH+krQ9F0sKmzLhowXMEacSkpCP4ZMlAPFWzF1rSBxKZaFGPsUs2/kVZstoNLcyjDs0VkIMfnQE6NtsKEmrVlLZqJtwQZBAJeBS0RZqvt4xrN4J9piEtMVuhGFNM7903Ey0gAEkrHRMdIaRUJ3lv4cAt7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS2lpLz4x0K8
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by michel.telenet-ops.be with bizsmtp
	id qbqc2C00G1wvoRx06bqcKi; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAE-3X;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020hT-Gk;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/15] clk: renesas: rcar-gen4: Fractional PLL improvements
Date: Mon, 22 Jul 2024 13:50:20 +0200
Message-Id: <cover.1721648548.git.geert+renesas@glider.be>
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

Changes compared to v1:
  - Add Reviewed-by,
  - Sort register definitions by register offset,
  - Use mul_u64_u32_shr() and div64_ul() helpers,
  - New patch "PATCH v2 15/15] clk: renesas: rcar-gen4: Remove unused
    default PLL2/3/4/6 configs".

I plan to queue this series in renesas-clk-for-v6.12.

Thanks for your comments!

Geert Uytterhoeven (15):
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
  clk: renesas: rcar-gen4: Remove unused default PLL2/3/4/6 configs

 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  35 ++--
 drivers/clk/renesas/r8a779f0-cpg-mssr.c |  28 ++--
 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  36 ++--
 drivers/clk/renesas/r8a779h0-cpg-mssr.c |  32 ++--
 drivers/clk/renesas/rcar-gen4-cpg.c     | 210 ++++++++++++++++--------
 drivers/clk/renesas/rcar-gen4-cpg.h     |  36 ++--
 6 files changed, 230 insertions(+), 147 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

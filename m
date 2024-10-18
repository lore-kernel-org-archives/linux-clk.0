Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A71FD530
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253137; cv=none; b=rhdYkK0zj1UP9vKgvDCZ7P96TQ7E3RDd94EW6StxKa7WJcOGauAf6bGLb3En8MS6QRCidEM8YTI06UJslY5Ah/1zg/KP/wUMDNMfrOw2EQtPwRvwme/na0p4pDF9NpOxwSu+BUZ5St3IlKnZxa6mNdzOPn2y8iWU4XdTwxZHycc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253137; c=relaxed/simple;
	bh=7JjOUiCSqgJvFc6pQg2PRv1CsaHBlGgfHboNtfXau3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LcoU1L7A7n7tnJuD+nGAaf/gryGa3C0hI6ZoaQm0lcCWeYnOp7rItd6ZHMhUgeWOpEu4fufgTF+1V27zfLbDHsm+27AIXFink8vH3FLXh47oshcxCF/S8y3Pxv7UtwuTMp2w34EGzrKDfdRWT9iBvgp3xusoEJh6cu/NLuTl/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by albert.telenet-ops.be with cmsmtp
	id Ro5T2D00C1MdCM206o5Tin; Fri, 18 Oct 2024 14:05:27 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1ljE-003zSO-8e;
	Fri, 18 Oct 2024 14:05:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1ljT-005st3-8C;
	Fri, 18 Oct 2024 14:05:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.13
Date: Fri, 18 Oct 2024 14:05:26 +0200
Message-Id: <cover.1729252443.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.13-tag1

for you to fetch changes up to 92850bed9d4d334ee502a035ed5750285faccbea:

  clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks (2024-10-14 10:04:31 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.13

  - Add Cortex-A55 core clocks and Interrupt Control Unit (ICU) clock
    and reset on RZ/V2H(P),
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (1):
      clk: renesas: r9a09g057: Add clock and reset entries for ICU

Geert Uytterhoeven (1):
      clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks

Lad Prabhakar (1):
      clk: renesas: r9a09g057: Add CA55 core clocks

Marek Vasut (1):
      clk: renesas: Remove duplicate and trailing empty lines

 drivers/clk/renesas/clk-r8a73a4.c       |  1 -
 drivers/clk/renesas/clk-r8a7778.c       |  1 -
 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  1 -
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 10 ++++------
 drivers/clk/renesas/r9a09g011-cpg.c     |  1 -
 drivers/clk/renesas/r9a09g057-cpg.c     | 18 ++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.c      |  1 -
 drivers/clk/renesas/rcar-gen3-cpg.c     |  1 -
 drivers/clk/renesas/renesas-cpg-mssr.c  |  2 --
 drivers/clk/renesas/rzv2h-cpg.h         |  5 +++++
 10 files changed, 27 insertions(+), 14 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

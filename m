Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346752139B5
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800584; cv=none; b=nt/sW0e6ITGxX0imxO805uXbNoxjHrAiSzr1Jr0J7L8RyWP3JRFmd9px9PzwWCwhr3+6wMfCzW/oZ6YEG6SVOmFrBogmcylfjIMOTQAaXZQdDswbbF6JZycVFSu/sPsJ2XKQGxNSlNyEZ+b6+AqAxBhXHafECm+hd001CT2E93M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800584; c=relaxed/simple;
	bh=wwBPgYgJpsysDOOHAceqds6SrtJITj352XK9iGFMfwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGVQ1IvRbFxJQOXMg049tCxvjpHXFTbMPzWxxtq7xGyZV0zu6Nfk9Zv688hemtY65zUA75xMUSTCjwLCpGpb535MTnrDy2l8Dlp13zHT6Fs2B7Bg5HF0546ikigWs2n1a8pjV0Mimq0TjKiFFwL7W8lYTV5ptVeZkWcumN3lBj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by baptiste.telenet-ops.be with cmsmtp
	id n2P12E00T3X0DE5012P1Dm; Fri, 09 May 2025 16:23:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOcn-000000012O0-3xC9;
	Fri, 09 May 2025 16:23:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOcv-00000003AED-29br;
	Fri, 09 May 2025 16:23:01 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:59 +0200
Message-ID: <cover.1746798912.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 93f2878136262e6efcc6320bc31ada62fb0afd20:

  clk: renesas: r9a09g057: Add clock and reset entries for USB2 (2025-04-22 11:38:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.16-tag2

for you to fetch changes up to 28548f3f7994dd214ad4f4ba5763cd06333404a0:

  clk: renesas: r9a09g047: Add XSPI clock/reset (2025-05-08 20:17:55 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.16 (take two)

  - Add Expanded Serial Peripheral Interface (xSPI) clocks and resets on
    RZ/G3E,
  - Miscellaneous improvements.

Note that this includes a DT binding definition update for the RZ/G3E
SoC, which are shared by the clock driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      dt-bindings: clock: renesas,r9a09g047-cpg: Add XSPI and GBETH PTP core clocks
      clk: renesas: r9a09g047: Add support for xspi mux and divider
      clk: renesas: r9a09g047: Add XSPI clock/reset

Geert Uytterhoeven (2):
      clk: renesas: Use str_on_off() helper
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag3' into renesas-clk-for-v6.16

 drivers/clk/renesas/r9a09g047-cpg.c               | 39 ++++++++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c            |  3 +-
 drivers/clk/renesas/rzg2l-cpg.c                   |  3 +-
 drivers/clk/renesas/rzv2h-cpg.h                   |  7 ++++
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h |  3 ++
 5 files changed, 52 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

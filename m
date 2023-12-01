Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640291B4
	for <linux-clk@vger.kernel.org>; Fri,  1 Dec 2023 04:41:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7f2e:4977:a943:cc87])
	by baptiste.telenet-ops.be with bizsmtp
	id H0hh2B00i0rKVV8010hhV3; Fri, 01 Dec 2023 13:41:41 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92pe-00ARdM-Sy;
	Fri, 01 Dec 2023 13:41:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92px-00CVO6-IL;
	Fri, 01 Dec 2023 13:41:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.8
Date: Fri,  1 Dec 2023 13:41:40 +0100
Message-Id: <cover.1701434100.git.geert+renesas@glider.be>
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

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.8-tag1

for you to fetch changes up to 5f9e29b9159a41fcf6733c3b59fa46a90ce3ae20:

  clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset() (2023-11-27 11:09:53 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.8

  - Add EtherNet TSN and PCIe clocks on the R-Car V4H SoC,
  - Reuse reset functionality in the RZ/G2L clock driver.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset()

Niklas Söderlund (1):
      clk: renesas: r8a779g0: Add EtherTSN clock

Yoshihiro Shimoda (1):
      clk: renesas: r8a779g0: Add PCIe clocks

 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  3 +++
 drivers/clk/renesas/rzg2l-cpg.c         | 38 +++++++++++++--------------------
 2 files changed, 18 insertions(+), 23 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Maxime Coquelin <maxime.coquelin@st.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Olivier Bideau <olivier.bideau@st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@stlinux.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/3] ST PLL improvement
Date: Thu,  9 Jul 2015 13:57:37 +0200
Message-Id: <1436443060-12866-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset adds:
 * Enable/Disable support for Clockgen PLLs.
 * A new a9 pll for stih418 platform.
 * PLL rate change implementation for DVFS


Gabriel Fernandez (3):
  drivers: clk: st: Support for enable/disable in Clockgen PLLs
  drivers: clk: st: PLL rate change implementation for DVFS
  drivers: clk: st: Correct the pll-type for A9 for stih418

 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |   1 +
 drivers/clk/st/clkgen-mux.c                        |   3 +
 drivers/clk/st/clkgen-pll.c                        | 470 ++++++++++++++++++++-
 drivers/clk/st/clkgen.h                            |   2 +
 4 files changed, 468 insertions(+), 8 deletions(-)

-- 
1.9.1


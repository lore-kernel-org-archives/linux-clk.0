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
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@stlinux.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/9] clk: ST clock fixes
Date: Tue, 23 Jun 2015 16:09:18 +0200
Message-Id: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This first patch-set contains various clock fixes for ST SoC.

Gabriel Fernandez (7):
  drivers: clk: st: Incorrect clocks status
  drivers: clk: st: Incorrect register offset used for lock_status
  drivers: clk: st: Remove unused code
  drivers: clk: st: Fix FSYN channel values
  drivers: clk: st: Fix mux bit-setting for Cortex A9 clocks
  drivers: clk: st: Rename st_pll3200c32_407_c0_x into
    st_pll3200c32_cx_x
  ARM: STi: DT: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x

Giuseppe Cavallaro (1):
  drivers: clk: st: Fix flexgen lock init

Pankaj Dev (1):
  drivers: clk: st: Add CLK_GET_RATE_NOCACHE flag to clocks

 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |  4 ++--
 arch/arm/boot/dts/stih407-clock.dtsi               |  4 ++--
 arch/arm/boot/dts/stih410-clock.dtsi               |  4 ++--
 arch/arm/boot/dts/stih418-clock.dtsi               |  4 ++--
 drivers/clk/st/clk-flexgen.c                       |  4 +++-
 drivers/clk/st/clkgen-fsyn.c                       | 20 +++++++----------
 drivers/clk/st/clkgen-mux.c                        | 25 +++++++++++++---------
 drivers/clk/st/clkgen-pll.c                        | 14 ++++++------
 8 files changed, 41 insertions(+), 38 deletions(-)

-- 
1.9.1


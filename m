Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>,
	"Thierry Reding" <thierry.reding@gmail.com>, Alexandre Courbot
	<gnurou@gmail.com>, "Rob Herring" <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "Rhyland Klein" <rklein@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/6] Add missing Tegra210 clocks
Date: Tue, 28 Feb 2017 16:37:16 +0200
Message-ID: <1488292648-16876-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

This series adds a number of clocks which were missing from the Tegra210
clock definition. It applies on top of the 'Tegra210 clock bug fixes' series
posted earlier.

Change log:

v3: fixed compiler warnings

v2: fixed a few useless lines moving around


Peter De Schrijver (6):
  clk: tegra: add cec clock
  clk: tegra: define Tegra210 DMIC sync clocks
  clk: tegra: fix constness for periph clks
  clk: tegra: define Tegra210 DMIC clocks
  clk: tegra: add super clk mux/div
  clk: tegra: add aclk

 drivers/clk/tegra/clk-id.h                      | 10 +++
 drivers/clk/tegra/clk-periph.c                  |  4 +-
 drivers/clk/tegra/clk-super.c                   | 87 +++++++++++++++++++++++--
 drivers/clk/tegra/clk-tegra-audio.c             | 85 +++++++++++++++++-------
 drivers/clk/tegra/clk-tegra-periph.c            | 22 +++++++
 drivers/clk/tegra/clk-tegra114.c                |  1 +
 drivers/clk/tegra/clk-tegra124.c                |  1 +
 drivers/clk/tegra/clk-tegra210.c                | 20 ++++++
 drivers/clk/tegra/clk-tegra30.c                 |  1 +
 drivers/clk/tegra/clk.h                         | 11 +++-
 include/dt-bindings/clock/tegra114-car.h        |  2 +-
 include/dt-bindings/clock/tegra124-car-common.h |  2 +-
 include/dt-bindings/clock/tegra210-car.h        | 13 +++-
 include/dt-bindings/clock/tegra30-car.h         |  2 +-
 14 files changed, 223 insertions(+), 38 deletions(-)

-- 
1.9.1

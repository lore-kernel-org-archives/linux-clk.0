Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Adriana Reus <adi.reus@gmail.com>
Subject: [PATCH v3 00/10] clk: implement clock rate protection mechanism
Date: Mon, 12 Jun 2017 21:44:28 +0200
Message-Id: <20170612194438.12298-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This Patchset is related the RFC [0] and the discussion around
CLK_SET_RATE_GATE available here [1]

This patchset is based on clk-next.

The goal of this patchset is to provide a way for consumers to inform the
system that they depend on the rate of the clock source and can't tolerate
other consumers changing the rate or causing glitches.

With this series there is 3 use-case:
 - the provider is not protected: nothing changes
 - the provider is protected by only 1 consumer (and only once), then only
   this consumer will be able to alter the rate of the clock, as it is the
   only one depending on it.
 - If the provider is protected more than once, or by the provider itself,
   the rate is basically locked and protected against reparenting.

The last patch provide the same functionnality for providers themself,
fixing CLK_SET_RATE_GATE flag (enforce clock gating along the tree)

qcom, at91 and ux500 are the heaviest users of this flag. If anybody having
one these platform could try this series, it would help build confidence
that the platform relying on CLK_SET_RATE_GATE (even if broken) don't get
any regression.

Changes since RFC:
 - s/clk_protect/clk_rate_protect
 - Request rework around core_nolock function
 - Add clk_set_rate_protect
 - Reword clk_rate_protect and clk_unprotect documentation
 - Add few comments to explain the code
 - Add 2 last patches to fix users of CLK_SET_RATE_GATE

Changes since v1:
 - Add patch 4: Check if the rate would actually change before continuing, a
   possibly in clk_set_rate.

Changes since v2: [2]
 - Fix issues reported by Adriana Reus (Thanks !)
 - Dropped patch "clk: move CLK_SET_RATE_GATE protection from prepare
   to enable". This was broken as the protect count, like the prepare_count
   should only be accessed under the prepare_lock.
 - No change around bail-out code. Mike wanted to ponder a bit more on it.
 - Patch 1 still included, could not find the clk-next-protect Mike was
   referring to.

This was tested with the audio use case mentioned in [1]

[0]: https://lkml.kernel.org/r/20170321183330.26722-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/148942423440.82235.17188153691656009029@resonance
[2]: https://lkml.kernel.org/r/20170521215958.19743-1-jbrunet@baylibre.com


Jerome Brunet (10):
  clk: take the prepare lock out of clk_core_set_parent
  clk: add clk_core_set_phase_nolock function
  clk: rework calls to round and determine rate callbacks
  clk: use round rate to bail out early in set_rate
  clk: add support for clock protection
  clk: add clk_set_rate_protect
  clk: rollback set_rate_range changes on failure
  clk: cosmetic changes to clk_summary debugfs entry
  clk: fix incorrect usage of ENOSYS
  clk: fix CLK_SET_RATE_GATE with clock rate protection

 drivers/clk/clk.c            | 428 ++++++++++++++++++++++++++++++++++++-------
 include/linux/clk-provider.h |   1 +
 include/linux/clk.h          |  43 +++++
 3 files changed, 402 insertions(+), 70 deletions(-)

-- 
2.9.4

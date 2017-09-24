Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v4 00/10] clk: implement clock rate protection mechanism
Date: Sun, 24 Sep 2017 22:00:20 +0200
Message-Id: <20170924200030.6227-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This Patchset is related the RFC [0] and the discussion around
CLK_SET_RATE_GATE available here [1]

This patchset introduce clock protection to the CCF core. This can then
be used for:

* Provide a way for a consumer to claim exclusivity over the rate control
  of a provider. Some clock consumers require that a clock rate must not
  deviate from its selected frequency. There can be several reasons for
  this, not least of which is that some hardware may not be able to
  handle or recover from a glitch caused by changing the clock rate while
  the hardware is in operation. For such HW, The ability to get exclusive
  control of a clock's rate, and release that exclusivity, could be seen
  as a fundamental clock rate control primitive. The exclusivity is not
  preemptible, so when claimed more than once, is rate is effectively
  locked.

* Provide a similar functionality to providers themselves, fixing
  CLK_SET_RATE_GATE flag (enforce clock gating along the tree). While
  there might still be a few platforms relying the broken implementation,
  tests done has shown this change to be pretty safe.


Changes since v3: [3]
 - Reorder patches following Stephen comments
 - Add before/after examples to the cosmetic change
 - Remove loops around protection where possible
 - Rename the API from "protect" to "exclusive" which decribe what the
   code better

Changes since v2: [2]
 - Fix issues reported by Adriana Reus (Thanks !)
 - Dropped patch "clk: move CLK_SET_RATE_GATE protection from prepare
   to enable". This was broken as the protect count, like the prepare_count
   should only be accessed under the prepare_lock.

Changes since v1: [1]
 - Check if the rate would actually change before continuing, and bail-out
   early if not.

Changes since RFC: [0]
 - s/clk_protect/clk_rate_protect
 - Request rework around core_nolock function
 - Add clk_set_rate_protect
 - Reword clk_rate_protect and clk_unprotect documentation
 - Add few comments to explain the code
 - Add fixes for CLK_SET_RATE_GATE

This was tested with the audio use case mentioned in [1]

[0]: https://lkml.kernel.org/r/20170321183330.26722-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/148942423440.82235.17188153691656009029@resonance
[2]: https://lkml.kernel.org/r/20170521215958.19743-1-jbrunet@baylibre.com
[3]: https://lkml.kernel.org/r/20170612194438.12298-1-jbrunet@baylibre.com

Jerome Brunet (10):
  clk: fix incorrect usage of ENOSYS
  clk: take the prepare lock out of clk_core_set_parent
  clk: add clk_core_set_phase_nolock function
  clk: rework calls to round and determine rate callbacks
  clk: use round rate to bail out early in set_rate
  clk: add clock protection mechanism to clk core
  clk: cosmetic changes to clk_summary debugfs entry
  clk: fix CLK_SET_RATE_GATE with clock rate protection
  clk: add clk_rate_exclusive api
  clk: fix set_rate_range when current rate is out of range

 drivers/clk/clk.c            | 505 +++++++++++++++++++++++++++++++++++++------
 include/linux/clk-provider.h |   1 +
 include/linux/clk.h          |  57 +++++
 3 files changed, 492 insertions(+), 71 deletions(-)

-- 
2.13.5

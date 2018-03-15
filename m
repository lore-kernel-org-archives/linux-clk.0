Return-Path: <sudeep.holla@arm.com>
Date: Thu, 15 Mar 2018 11:18:56 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Subject: [GIT PULL] versatile clock misc updates for 4.17
Message-ID: <20180315111856.GA27430@e107155-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Michael,

These couple of changes are on the list for a while and I have not got
any response from you guys. So thought of sending the pull request
instead.

Regards,
Sudeep

--

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/versatile-clk-4.17

for you to fetch changes up to e772c23d70e2e991409cf0e68be77f4126fc578a:

  clk: versatile: Remove WARNs in ->round_rate() (2018-03-15 10:45:50 +0000)

----------------------------------------------------------------
versatile clock updates for v4.17

1. Get rid of warnings triggerred when an unachievable clock rate as
   clk_round_rate() can be used to get the closest achievable clock

2. Add minimum and maximum rate boundaries for vexpress oscillator clock
   using clk_hw_set_rate_range provider API.

----------------------------------------------------------------
Brian Starkey (1):
      clk: versatile: Remove WARNs in ->round_rate()

Sudeep Holla (1):
      clk: versatile: add min/max rate boundaries for vexpress osc clock

 drivers/clk/versatile/clk-vexpress-osc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

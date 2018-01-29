Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34562 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbeA2SCI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jan 2018 13:02:08 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 0/6] clk: renesas: r8a779[56]: Add Z and Z2 clock support
Date: Mon, 29 Jan 2018 19:01:48 +0100
Message-Id: <20180129180154.29626-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

this patch-set adds Z and Z2 clock support.

These are dependencies for supporting CPUFreq. The remainder of that
work is being posted separately and can be found at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq-v5

Based on v4.15-rc1

Changes since v4:
* Correct off-by one error in usage of __ffs

Changes since v3:
* Rebase
* Divide parent clock by 2 to give correct rate (again)                         * Take care not to overflow multiplication on 32 but platforms
* Use __ffs as FIELD_{GET,PREP} don't not work with non-constant masks
* Use correct mask in cpg_z_clk_recalc_rate()

Changes since v2:
* Rebase
* Address review of v2 as noted in patch changelogs

Takeshi Kihara (6):
  clk: renesas: rcar-gen3: Add Z clock divider support
  clk: renesas: rcar-gen3: Add Z2 clock divider support
  clk: renesas: r8a7795: Add Z clock
  clk: renesas: r8a7795: Add Z2 clock
  clk: renesas: r8a7796: Add Z clock
  clk: renesas: r8a7796: Add Z2 clock

 drivers/clk/renesas/r8a7795-cpg-mssr.c |   2 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c |   2 +
 drivers/clk/renesas/rcar-gen3-cpg.c    | 143 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h    |   2 +
 4 files changed, 149 insertions(+)

Results of testing this on an H3 ES2.0 / Salvator-XS are as below.
Testing has shown equivalent results on an M3W ES1.0 / Salvator-X.
Testing has also shown equivalent results on an H3 ES1.0 / Salvator-X
with the following restrictions due to lack of physical access:
1. No little CPUs are brought up and thus scaling the frequency of
   those CPUs was not tested
2. No Suspend-to-RAM

The results for H3 ES2.0 / Salvator-XS:

On Boot
-------

Z clock is half of pll0 and corresponds to CPU frequency.
Z2 clock is half pll2. This is as expected.

# cd /sys/devices/system/cpu/
# grep -E -w "pll[02]|z|z2" /sys/kernel/debug/clk/clk_summary
       .pll2                              0            0  2396160000          0 0  
          z2                              0            0  1198080000          0 0  
       .pll0                              0            0  2995200000          0 0  
          z                               0            0  1497600000          0 0  
# grep . cpu*/cpufreq/*cur*
cpu0/cpufreq/cpuinfo_cur_freq:1497600
cpu0/cpufreq/scaling_cur_freq:1497600
cpu1/cpufreq/cpuinfo_cur_freq:1497600
cpu1/cpufreq/scaling_cur_freq:1497600
cpu2/cpufreq/cpuinfo_cur_freq:1497600
cpu2/cpufreq/scaling_cur_freq:1497600
cpu3/cpufreq/cpuinfo_cur_freq:1497600
cpu3/cpufreq/scaling_cur_freq:1497600
cpu4/cpufreq/cpuinfo_cur_freq:1198080
cpu4/cpufreq/scaling_cur_freq:1198080
cpu5/cpufreq/cpuinfo_cur_freq:1198080
cpu5/cpufreq/scaling_cur_freq:1198080
cpu6/cpufreq/cpuinfo_cur_freq:1198080
cpu6/cpufreq/scaling_cur_freq:1198080
cpu7/cpufreq/cpuinfo_cur_freq:1198080
cpu7/cpufreq/scaling_cur_freq:1198080

BIG CPU Freq scaled to 500000 and little CPU Freq scaled to 800000
------------------------------------------------------------------

Z and Z2 clocks corresponds to new CPU frequencies.
PLL0 and PLL2 are unchanged.
This is the expected result.

# echo 500000 > cpu0/cpufreq/scaling_max_freq
# echo 800000 > cpu4/cpufreq/scaling_max_freq
# grep -E -w "pll[02]|z|z2" /sys/kernel/debug/clk/clk_summary
       .pll2                              0            0  2396160000          0 0  
          z2                              0            0   786240000          0 0  
       .pll0                              0            0  2995200000          0 0  
          z                               0            0   468000000          0 0  
# grep . cpu*/cpufreq/*cur*
cpu0/cpufreq/cpuinfo_cur_freq:468000
cpu0/cpufreq/scaling_cur_freq:468000
cpu1/cpufreq/cpuinfo_cur_freq:468000
cpu1/cpufreq/scaling_cur_freq:468000
cpu2/cpufreq/cpuinfo_cur_freq:468000
cpu2/cpufreq/scaling_cur_freq:468000
cpu3/cpufreq/cpuinfo_cur_freq:468000
cpu3/cpufreq/scaling_cur_freq:468000
cpu4/cpufreq/cpuinfo_cur_freq:786240
cpu4/cpufreq/scaling_cur_freq:786240
cpu5/cpufreq/cpuinfo_cur_freq:786240
cpu5/cpufreq/scaling_cur_freq:786240
cpu6/cpufreq/cpuinfo_cur_freq:786240
cpu6/cpufreq/scaling_cur_freq:786240
cpu7/cpufreq/cpuinfo_cur_freq:786240
cpu7/cpufreq/scaling_cur_freq:786240


After Resume from Suspend-to-RAM
--------------------------------

Clocks and CPU freqiencies are restored to their values before
suspend. This is the expected result.

# grep -E -w "pll[02]|z|z2" /sys/kernel/debug/clk/clk_summary
       .pll2                              0            0  2396160000          0 0  
          z2                              0            0   786240000          0 0  
       .pll0                              0            0  2995200000          0 0  
          z                               0            0   468000000          0 0  
# grep . cpu*/cpufreq/*cur*
cpu0/cpufreq/cpuinfo_cur_freq:468000
cpu0/cpufreq/scaling_cur_freq:500000
cpu1/cpufreq/cpuinfo_cur_freq:468000
cpu1/cpufreq/scaling_cur_freq:500000
cpu2/cpufreq/cpuinfo_cur_freq:468000
cpu2/cpufreq/scaling_cur_freq:500000
cpu3/cpufreq/cpuinfo_cur_freq:468000
cpu3/cpufreq/scaling_cur_freq:500000
cpu4/cpufreq/cpuinfo_cur_freq:786240
cpu4/cpufreq/scaling_cur_freq:800000
cpu5/cpufreq/cpuinfo_cur_freq:786240
cpu5/cpufreq/scaling_cur_freq:800000
cpu6/cpufreq/cpuinfo_cur_freq:786240
cpu6/cpufreq/scaling_cur_freq:800000
cpu7/cpufreq/cpuinfo_cur_freq:786240
cpu7/cpufreq/scaling_cur_freq:800000



-- 
2.11.0


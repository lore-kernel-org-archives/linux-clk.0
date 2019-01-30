Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026E6C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF2D520989
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="g6lRNJss"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfA3Jku (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:40:50 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38516 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfA3Jkt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 04:40:49 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E247625B74E;
        Wed, 30 Jan 2019 20:40:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548841245; bh=O4ljVLBzivUUT1kcsnJEnlfttWX/e3zOHiiYsBU6WaE=;
        h=From:To:Cc:Subject:Date:From;
        b=g6lRNJssxP5lVd1W199olHoZfApMHPnPg/F4j9E5DI6o79dPeR7RpFZl1ZXCBYrO5
         qyks5t/jPZYBav8KnfAicBg5lN7gFLC4kW/rGU5WtsB/UJVlkhDEs36iNL1wTLtiIG
         pFufgy57U11utjSLI11R0cwNxjfSoOMlX0dSwffg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1BF8494043D; Wed, 30 Jan 2019 10:40:43 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/6] clk: renesas: r8a77990: Add Z2 clock
Date:   Wed, 30 Jan 2019 10:40:23 +0100
Message-Id: <20190130094029.9604-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this series adds the R-Car E3 (r8a77990) Z2 clock as a clock
with both a fixed and variable divisor with a parent of PLL0.

In order to do so this series:

1. Parameterise Z and Z2 clock fixed divisor in shared Gen-3 CPG
   dirver code to allow fixed divisors other than 2 - the E3 Z2
   clock has a fixed divisor of 4

2. Add a quirk to shared Gen-3 CPG to allow for an alternate location
   of the FRQCRC Z2 divider bits. This alternate location is used
   by the E3.

3. Support Z and Z2 clocks with high frequency parents.
   The parent of the E3 Z2 clock, PLL0, is 4.8GHz and thus
   when expressed in HZ must be treated as a 64bit value.

4. Actually add the E3 Z2 clock

As a follow-up, as per reading the documentation, the RZ/G2E (r8a7745)
Z2 is updated to be a variable rather than fixed clock.

Changes since v1
----------------
* Define Z2 as a variable rather than fixed clock


Testing Overview
----------------

This patchset has not been tested on RZ/G2E.

This patchset has been tested on Ebisu-4D/E3 with
"[PATCH/RFT] arm64: dts: renesas: r8a77990: Add OPPs table for cpu devices"
applied on top of renesas-devel-20190128-v5.0-rc4. This allowed CPUFreq
to be successfully exercised, showing scaling of the Z2 clock as per the
results below.

This patchset was also tested for regressions Salvator-X/M3-W ES1.0.
As per the results below CPUFreq was used to show that with these
patches applied Z and Z2 clocks still scale as expected.


Patches List by Author
----------------------

Simon Horman (3):
  clk: renesas: rcar-gen3: Support Z and Z2 clocks with high frequency
    parents
  [RFT] clk: renesas: rcar-gen3: Support r8a7745 Z2 clock divider
  [RFT] clk: renesas: r8a7745: Implement Z2 as a variable clock

Takeshi Kihara (3):
  clk: renesas: rcar-gen3: Parameterise Z and Z2 clock fixed divisor
  clk: renesas: rcar-gen3: Support r8a77990 Z2 clock divider
  clk: renesas: r8a77990: Add Z2 clock

 drivers/clk/renesas/r8a7745-cpg-mssr.c  |  2 +-
 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  4 ++--
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  5 +++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  5 +++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  1 +
 drivers/clk/renesas/rcar-gen3-cpg.c     | 38 +++++++++++++++++++++++++--------
 drivers/clk/renesas/rcar-gen3-cpg.h     |  4 ++++
 8 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.11.0


Ebisu-4D/E3 Test Results
------------------------

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
performance
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
800000 1000000 1200000 
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z2/clk_rate:1200000000
# echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:975000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:975000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1000000
/sys/kernel/debug/clk/z2/clk_rate:975000000
# echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:787500
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:787500
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:800000
/sys/kernel/debug/clk/z2/clk_rate:787500000
# echo 1200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z2/clk_rate:1200000000


Salvator-X/M3-W ES1 Test Results
--------------------------------

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
performance
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
500000 1000000 1500000 
# cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_available_frequencies
800000 1000000 1200000 
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1499999
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1500000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1499999
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1500000
/sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu5/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z/clk_rate:1499999940
/sys/kernel/debug/clk/z2/clk_rate:1199999952
# echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:984374
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:984374
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu5/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z/clk_rate:984374961
/sys/kernel/debug/clk/z2/clk_rate:1199999952
# echo 1000000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:984374
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:984374
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq:974999
/sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq:974999
/sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_cur_freq:974999
/sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu5/cpufreq/cpuinfo_cur_freq:974999
/sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq:1000000
/sys/kernel/debug/clk/z/clk_rate:984374961
/sys/kernel/debug/clk/z2/clk_rate:974999961
# echo 500000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# echo 800000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:468749
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:500000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:468749
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:500000
/sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq:787499
/sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq:787499
/sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_cur_freq:787499
/sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu5/cpufreq/cpuinfo_cur_freq:787499
/sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq:800000
/sys/kernel/debug/clk/z/clk_rate:468749981
/sys/kernel/debug/clk/z2/clk_rate:787499969
# echo 1500000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# echo 1200000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z/clk_rate /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1499999
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1500000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1499999
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1500000
/sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu5/cpufreq/cpuinfo_cur_freq:1199999
/sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z/clk_rate:1499999940
/sys/kernel/debug/clk/z2/clk_rate:1199999952

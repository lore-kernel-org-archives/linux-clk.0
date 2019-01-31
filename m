Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D1CC169C4
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18B65218AF
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="q24NTZrL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfAaJk1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 04:40:27 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59163 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfAaJk1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Jan 2019 04:40:27 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CADD025B82E;
        Thu, 31 Jan 2019 20:40:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548927625; bh=ZAkEB8WJ4sKnPg9dfuptA0/2TP8l1z/+rVpmGXQ7c+g=;
        h=From:To:Cc:Subject:Date:From;
        b=q24NTZrLumOG2U3RN6MtD1um4hHg8CQTAO6ZmVoYc72GnWde4GYiB8xtsuMR2KWiy
         PfhQ1/zqeR8juhsvzfvRWrn1zMoh32Qg8kMHPqLd6xb2tUs93wOYBffT0OESQ7Z4P3
         6kK4HhRzDnZqQqWWuyNKsRw6AyHZvcK05xZbjB6s=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DBAD1940600; Thu, 31 Jan 2019 10:40:22 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 0/5] clk: renesas: r8a77990: Add Z2 clock
Date:   Thu, 31 Jan 2019 10:40:16 +0100
Message-Id: <20190131094021.3092-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this series adds the R-Car E3 (r8a77990) Z2 clock as a clock
with both a fixed and variable divisor with a parent of PLL0.

In order to do so this series:

1. Parameterise Z and Z2 clock fixed divisor in shared Gen-3 CPG
   driver code to allow fixed divisors other than 2 - the E3 Z2
   clock has a fixed divisor of 4

2. Parameterise offset of Z and Z2 clock controll bits -
   the offsets on E3 differ to other R-Car Gen 3 SoCs

3. Support Z and Z2 clocks with high frequency parents.
   The parent of the E3 Z2 clock, PLL0, is 4.8GHz and thus
   when expressed in HZ must be treated as a 64bit value.

4. Actually add the E3 Z2 clock

As a follow-up, as per reading the documentation, the RZ/G2E (r8a774c0)
Z2 clock is added.

Changes since v2
----------------
* Parameterise control bit offset rather than using a quirk
* Revised RZ/G2E patch - I was confused and updating the file for
  the wrong part number


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
  clk: renesas: rcar-gen3: Parameterise Z and Z2 clock offset
  clk: renesas: rcar-gen3: Support Z and Z2 clocks with high frequency
    parents
  [RFT] clk: renesas: r8a774c0: Add Z2 clock

Takeshi Kihara (2):
  clk: renesas: rcar-gen3: Parameterise Z and Z2 clock fixed divisor
  clk: renesas: r8a77990: Add Z2 clock

 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  4 ++--
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  5 +++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  5 +++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  1 +
 drivers/clk/renesas/rcar-gen3-cpg.c     | 26 ++++++++++++--------------
 drivers/clk/renesas/rcar-gen3-cpg.h     |  4 ++++
 8 files changed, 27 insertions(+), 21 deletions(-)

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

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182CFC433EB
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 12:03:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB563619C2
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 12:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCZMC6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 08:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCZMCX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 08:02:23 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A81C0613BA
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 05:02:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by michel.telenet-ops.be with bizsmtp
        id l02F2400653vE1T0602FZe; Fri, 26 Mar 2021 13:02:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAM-00AXLR-Ly; Fri, 26 Mar 2021 13:02:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAM-006cQH-7n; Fri, 26 Mar 2021 13:02:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] clk: renesas: rcar-gen3: Add support for CPU core clock boost modes
Date:   Fri, 26 Mar 2021 13:00:53 +0100
Message-Id: <20210326120100.1577596-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

This patch series improves the accuracy of the CPU clock rate on R-Car
Gen3 SoCs, and adds support for CPU boost modes (marked "turbo-mode" in
the operating points table in DT).
As usual, it is preceded by a few small cleanups.

The easiest way to test this is by enabling
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE, and writing the requested clock
rate to /sys/devices/system/cpu/cpufreq/policy$n/scaling_setspeed
(n=0 for the first cluster, n=2 or 4 for the second cluster).
Note that you need to do

    echo 1 > /sys/devices/system/cpu/cpufreq/boost

before you can enable boost modes.

The PLL rates and CPU clock rates and voltages can be monitored in
/sys/kernel/debug/{clk/{z,z2,.pll[024]}/clk_rate,reg*/dvfs/cpu*/*uV}.
The DVFS voltage measured by the on-board max9611 can be monitored
remotely using iio-monitor.

This series has been tested on Salvator-(X)S (with R-Car H3 ES1.0, H3
ES2.0, M3-W, and M3-N) and Ebisu-4D (R-Car E3).

As boost modes may be unstable without increasing the CPU core voltage,
this series depends on "[PATCH 0/2] arm64: dts: renesas: Add cpu-supply
properties for DVFS"[1].  Hence I think it is better to postpone this to
v5.14.

Thanks for your comments!

[1] https://lore.kernel.org/r/20210326105009.1574424-1-geert+renesas@glider.be

Geert Uytterhoeven (7):
  clk: renesas: rcar-gen3: Update Z clock rate formula in comments
  clk: renesas: rcar-gen3: Make cpg_z_clk.mask u32
  clk: renesas: rcar-gen3: Remove superfluous masking in
    cpg_z_clk_set_rate()
  clk: renesas: rcar-gen3: Grammar s/dependent of/dependent on/
  clk: renesas: rcar-gen3: Increase Z clock accuracy
  clk: renesas: rcar-gen3: Add custom clock for PLLs
  clk: renesas: rcar-gen3: Add boost support to Z clocks

 drivers/clk/renesas/rcar-gen3-cpg.c | 183 +++++++++++++++++++++++-----
 1 file changed, 154 insertions(+), 29 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

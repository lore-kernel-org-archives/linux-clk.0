Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB436C10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C016214DA
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzC/KeKL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388529AbfDRLMR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:12:17 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56251 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388375AbfDRLMQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 07:12:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id o25so2289968wmf.5;
        Thu, 18 Apr 2019 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yn6Id06pDDX/+u4mQsjGgX3TBS/5u8W5OOwPhGIgFdM=;
        b=YzC/KeKLwg1AvhqgZhhkiOqcltq302IQ+VApzqyw0eOEPk5APvnJA/j5KieEP8o3KI
         eTPk0c6OAs0aOZdW0oSkdHf+G0AVGVm5OPTnT3mGtX5vL84GFTej6GchpcBh3T5Bw3KT
         aOEFnjdtvDSUJAaMhBVZ/62JDXWpnAP2fUUC4fc/51fjjZhs0HMxs8+KH4YVl6cGm/N+
         Tr6BNr8nRWYa7ub9I8X/fIUnFCDftPtPIAl0SlBiaJR2r6ExpX+Y/t36rKviqlQWNaNc
         TesH5sNsjEMKj3vljaWiLDCWFju2ZEhO57X20hYZ9RnEj/jtgukPJ2YpjaPXZRsdm7Qg
         Q98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yn6Id06pDDX/+u4mQsjGgX3TBS/5u8W5OOwPhGIgFdM=;
        b=aCQ3Dp8fNPQHCTQBfVDjl8pTOnvMcYHyGopXNFa4pFq1+dl8pUpne8Mhs659ktmuv3
         lqZtAjdH9r3G/X4rW93GbsOk9Lei2NeHtebzeFK8+SfdL+BlbazmMWm0eQMU2Ef458bG
         v+RKtpSqqGOZj1raAvPl6TEJuHcP5HpwsMR1Grpf9iPzMYQEmwofsubwyu6thqUvMXJf
         75g1q+WOC5AzvwdD9ZRoREpBu/Wl0zyu90bDMAS5fLZ2OK/GsLUwXlGSxskvdICMjPkO
         f3fwTJUjfT8Ua5hSUbgqKZ8HWjtv8WhsyaR5mhmd9cJQkL8rqb7oVrYUwoMCcwmtZgKV
         0xOQ==
X-Gm-Message-State: APjAAAXC1IkrN6y1b/la8PWZ+Hm1vGioLPZCsy5KJ54aN1j5ZGeZBJ6M
        E61u/0oEXpEIQ8ow/WKEEE/5Lk4sGZY=
X-Google-Smtp-Source: APXvYqw8WChf9BG5BreV5SUSIsaLZMXms31bwzlET9t+fOAgDmvooHPOEV5Pq0+Fu4l/eNjOVzO6Fg==
X-Received: by 2002:a1c:c101:: with SMTP id r1mr2526596wmf.123.1555585933878;
        Thu, 18 Apr 2019 04:12:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id z63sm2005594wme.30.2019.04.18.04.12.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 04:12:13 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH RFT V3 0/8] clk: make register endianness a run-time property
Date:   Thu, 18 Apr 2019 13:12:03 +0200
Message-Id: <20190418111211.10474-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the endianness for register accesses of basic clocks if fixed
based on the architecture (BE for PowerPC, LE for everyone else). This
is inconvenient for architectures that support both.

To avoid adding more rules to the #ifdef, this patchset adds new flags
to the basic clocks to tag the registers as BE then converts the only
big endian machine PowerPC to use it.

While not used by PowerPC, also add big endian support to clk-fractional-
divider and clk-multiplier, to cover all basic clocks.
Technically clk-multiplier isn't one as it doesn't provide any
registration functions and none of its users set the basic clock flag,
but nevertheless it and its flags are defined clk-provider.h. So I think
it's close enough to a basic clock to still count.

That way we can drop the special casing for PowerPC, and allow other big
endian platforms/drivers to make use of the basic clocks.

In addition, we can now drop clk_readl and clk_writel, and replace them
with normal readl and writel accessors everywhere.

Still RFT because I don't have a PowerPC device to test, and especially
not a 512x one. I did compile test it though!

I looked really hard, and this is the only place I could find where a
PowerPC platform (indirectly) used the clk accessors.

None of the regular drivers in clk/ were selected in any of the powerpc
defconfigs, and this was the only platform code that registered basic
clocks.

Changelog:

V2 -> V3:
 * fix passed arguments to clk_div_readl found by kbuild
 * drop unneeded else in generic read accessors
 * fix a >80 chars line issue in the powerpc patch

V1 -> V2:
 * switch from global flag to per-clock flag
 * also added fractional divider and multiplier clocks, to make all
   basic or quasi basic clocks support big endian
 * reordered the basic clock patches in alphabetical order
 * drop clk_{readl,writel} instead of adding BE variants and use
   common accessors directly
 * dropped the RFC, as I got comments (yay). More always welcome of
   course :-)

Jonas Gorski (8):
  clk: divider: add explicit big endian support
  clk: fractional-divider: add explicit big endian support
  clk: gate: add explicit big endian support
  clk: multiplier: add explicit big endian support
  clk: mux: add explicit big endian support
  powerpc/512x: mark clocks as big endian
  clk: core: remove powerpc special handling
  clk: core: replace clk_{readl,writel} with {readl,writel}

 arch/powerpc/platforms/512x/clock-commonclk.c |  9 +++--
 drivers/clk/clk-divider.c                     | 26 +++++++++++---
 drivers/clk/clk-fractional-divider.c          | 22 ++++++++++--
 drivers/clk/clk-gate.c                        | 22 ++++++++++--
 drivers/clk/clk-multiplier.c                  | 22 ++++++++++--
 drivers/clk/clk-mux.c                         | 22 ++++++++++--
 drivers/clk/clk-xgene.c                       |  6 ++--
 drivers/clk/hisilicon/clk-hisi-phase.c        |  4 +--
 drivers/clk/imx/clk-divider-gate.c            | 20 +++++------
 drivers/clk/imx/clk-sccg-pll.c                | 12 +++----
 drivers/clk/nxp/clk-lpc18xx-ccu.c             |  6 ++--
 drivers/clk/nxp/clk-lpc18xx-cgu.c             | 24 ++++++-------
 drivers/clk/rockchip/clk-ddr.c                |  2 +-
 drivers/clk/rockchip/clk-half-divider.c       |  6 ++--
 drivers/clk/tegra/clk-tegra124.c              |  4 +--
 drivers/clk/tegra/clk-tegra210.c              |  6 ++--
 drivers/clk/zynq/clkc.c                       |  6 ++--
 drivers/clk/zynq/pll.c                        | 18 +++++-----
 include/linux/clk-provider.h                  | 51 +++++++++++----------------
 19 files changed, 181 insertions(+), 107 deletions(-)

-- 
2.13.2


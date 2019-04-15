Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49A6C10F0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8BD920684
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuFcyNpZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfDOKKw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:10:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52362 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbfDOKKw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Apr 2019 06:10:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id a184so19871680wma.2;
        Mon, 15 Apr 2019 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HOeHBVmwBdLK7v5lpV0asvyijnYp9oCdYtsI2CXEVhY=;
        b=TuFcyNpZZzp6qjWGR5KXwBzZ5uJA9tW54UpEm8rKHvQxlj1ghGBvI511SeuoaO104L
         z+sSShYKnJedS27J2rt0XNJVGm8JcVZwvuuOe43X1xRjs7AaAKuSloGGF1by7NYKpwvo
         Aump2gRxa7CYGQX+CdUHjuIq1URe1z+QLRZQQ3YfZkxsisVooPhjnLSgS8tfd64KqCcy
         prLiFCkn++e8dMZmvqtTX9BVZ9N6Z/dla8b0MKkr0veFshtsytUwMusZzt77uB5YNbuo
         LZw9/aM7Ob2jfrndVZBTm+66yge6ySbF0/QK8tYO+11WS1T/5bYFEBjq085jhHjGJPTz
         uVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HOeHBVmwBdLK7v5lpV0asvyijnYp9oCdYtsI2CXEVhY=;
        b=l/8NKPoq61hBpRGrw6i9u65Bu0Za0yVLTQLox8YRbmkeIVKWPI1yyv15at2zb/ddhJ
         eAb/MivrOnfHWgSFwkCnwOXEbolu8BVSN+YtMd8a5oW025A5qqqfaLm/bRPeWBrMQug3
         EE65qMfL6oKHgUQl5MQmH5Deomv6HJsDPiqYEfpS9j3Yk6mOnPyni3/NV/mr5l1HmAYy
         7RpVUxyXKcPHLn9fIZPCN3qAIua0zYtQmw+Ap0TXESSxgEgSUWDr06k58BGCyj/qZcSE
         nkiY6tn4uTjd6kfmatp/TPt/7VqhbIjuYw1zBbbRV3l8BjVamhzQjvp4kD5Y53WI+YLL
         XdbQ==
X-Gm-Message-State: APjAAAU2OLbm2BBt07+Emumgg2kZTc7DkDpDzZ2oakRKIG5mNWjGN7Xx
        FtS89LiyCgbbEvOISP8BAlYL82OD
X-Google-Smtp-Source: APXvYqwn7fEol0munSBw3WIb56yCpVZr/XyS1Mrs1mFAkVJWDmLh5Q8A8CU9p4yAipbxlARQQHwN3A==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr22094278wmc.76.1555323049972;
        Mon, 15 Apr 2019 03:10:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm11592214wrp.9.2019.04.15.03.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 03:10:49 -0700 (PDT)
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
Subject: [PATCH RFT V2 0/8] clk: make register endianness a run-time property
Date:   Mon, 15 Apr 2019 12:10:38 +0200
Message-Id: <20190415101046.5872-1-jonas.gorski@gmail.com>
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

 arch/powerpc/platforms/512x/clock-commonclk.c | 11 +++---
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
 19 files changed, 182 insertions(+), 108 deletions(-)

-- 
2.13.2


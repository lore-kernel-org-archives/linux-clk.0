Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:34896 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755772AbeASPSb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jan 2018 10:18:31 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] Use of_clk_get_parent_count() instead of open coding
Date: Fri, 19 Jan 2018 16:18:18 +0100
Message-Id: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

	Hi all,

This patch series replaces open-coded versions of
of_clk_get_parent_count() by calls to the helper function.

These patches are independent, so they can be applied where appropriate.
Thanks!

Geert Uytterhoeven (3):
  pinctrl: sunxi: Use of_clk_get_parent_count() instead of open coding
  soc: rockchip: power-domain: Use of_clk_get_parent_count() instead of
    open coding
  soc/tegra: pmc: Use of_clk_get_parent_count() instead of open coding

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 3 ++-
 drivers/soc/rockchip/pm_domains.c     | 3 ++-
 drivers/soc/tegra/pmc.c               | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
